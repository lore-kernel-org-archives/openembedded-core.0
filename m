Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7440460C16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 10:25:01 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id m20so2739485qcx.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 02:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7xsZv9aCPnVj98deg77O4et37RVcf4XtqKvM28sp4uc=;
	b=YniwKLQWdoA4xMJV2L2v02hEzAX8DPVws4BRxzHNeYXLFEBhj70Zg+gIBd2ZggkNXR
	bMaWKEQmTCeagSO2j6aenYOnF2z9QlOcDYOS+3tw6K4xlopJpF5HrGl5glPCCdXH8ad8
	tTBxdrSYG02x2N9YqNwJIADOC1e1d6kHRPMIoFBFUciJgtn59VnpNbpMEj+2ZGtA6aPz
	2joL+gbywnTtvhPN4uTuoxVALJ6mPpTeTyQrBKazNeBgOH7PHWTmyLfB3oqIuyzhoAH+
	yR3qkhi4E09bgMiXS9wv9dESzQcORLDbymzYtlte4zSQN/WyYaAVPSNgf1sAbPKembA7
	xOKg==
X-Gm-Message-State: ALoCoQk2EI/7uVhUQp6c2/oMfouOmEHwIqMUs1j0BEsErikySD9tBbYeJ05FzmgJrBiHBXf0Jqf4
X-Received: by 10.224.147.75 with SMTP id k11mr1468013qav.22.1389695101998;
	Tue, 14 Jan 2014 02:25:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Tue, 14 Jan 2014 02:24:41 -0800 (PST)
In-Reply-To: <52D4657B.1030602@linux.intel.com>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
	<1389376488-22286-2-git-send-email-ross.burton@intel.com>
	<52D4635F.6030304@linux.intel.com>
	<52D4657B.1030602@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jan 2014 10:24:41 +0000
Message-ID: <CAJTo0LZBmrKDntNFojVzSPkcCuHfUmF1j13JnOptw+==dRb17g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2014 10:25:02 -0000
Content-Type: text/plain; charset=UTF-8

On 13 January 2014 22:15, Saul Wold <sgw@linux.intel.com> wrote:
>> This seems to cause a problem:
>> ERROR: Logfile of failure stored in:
>>
>> DESTDIR=/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/cmake/2.8.12.1-r0/image
>> install
>> | make: *** No rule to make target `install'.  Stop.
>> | ERROR: oe_runmake failed
>> | WARNING:
>
> Oops, sorry spoke to soon, needed to have a clean WORKDIR, I was building in
> a pre existing tmp.
>
> Sorry for the noise.

Yes, this change means existing work directories need to be wiped,
just as the matching automake change did.  Not sure if it would be
possible to handle this migration sanely, maybe by checking for and
deleting the cmake cache in $S?

Ross

