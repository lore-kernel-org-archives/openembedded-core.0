Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1201260797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 18:59:04 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so85048263wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Cy/H/iKEMtAX/9xb6Z/iBYOBZYc5ntDhjFSy2OA2r6E=;
	b=KQvd+vu0X4UjZt8eGZqYcjLQdvtIpMEp59wgZLf1Jk0grhFlJ91clkjden8G611X4J
	ZAuYRPIA9niEysF6Ennvys8Bdb0BFtA7UjCiigkOlmze7RH53vPL728iCp1RRVFZlHVv
	5/zrbBNPZBKpRW6M3gCJ9h6snkhexXB8KQ26SyQ3NDZVkO05uJ8nPuREyovb5tmEYPY7
	eV0o5gSg16knx5ItZZJAHvIPrfguluQj1rZwjDWPHSU7bEZ95xcYIrE5O5Swjbqt62kU
	TH4m/8z6H9fNd1UMjZuFupEgNzMFDo7f0huaoDK2XJ3mCzzO5JmPRsjqyQyyJzhGGcNx
	5NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Cy/H/iKEMtAX/9xb6Z/iBYOBZYc5ntDhjFSy2OA2r6E=;
	b=cEWVWLb8BxfZ01H6tGvW6bLCIN6EQ9HRlc0NDWa4fmDTM2EqcDorfOKb637exvVoKD
	hpCOwIt2i9aMAlUp0ohnGwfmWE3dhDnvI4mc43PNcAakH1xxToCVgvhmxXXAu1InhsVd
	TfNjCP2Ty3+FlNgMco3pl7g5EF8eJRw0MyT9csUbL8M0+aqkY4un5ahFWGUesB6e2kPm
	l68j4fMx5L8943awG4B8Wze5HRaMoY0Gd13G2COIts1YmuSbI86neminvH8ltuTxhjvn
	dtMDnFMsoJIkXffK4UojD0xos9b06uex2Svi0ny+jRuz9ki8UR5SKVWfFfXKeNMl/9Wu
	MZ4g==
X-Gm-Message-State: ALoCoQnkMIEMSBML3wUjTzqISYPo8sBxTCDKaE9Cn2s+Q9XS7Atkx1zUxfmhcwMkl5eq0UmuooAx
X-Received: by 10.28.93.70 with SMTP id r67mr4047994wmb.16.1448045945178;
	Fri, 20 Nov 2015 10:59:05 -0800 (PST)
Received: from blackadder.local (94.197.120.87.threembb.co.uk. [94.197.120.87])
	by smtp.gmail.com with ESMTPSA id z1sm767939wje.35.2015.11.20.10.59.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 10:59:04 -0800 (PST)
Message-ID: <564F43EE.7000008@intel.com>
Date: Fri, 20 Nov 2015 16:01:50 +0000
From: Ross Burton <ross.burton@intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VwKbgJDTA07978hduhxhSg=dF61n6kAEM=2qHm=wwY_Q@mail.gmail.com>
In-Reply-To: <CAJ86T=VwKbgJDTA07978hduhxhSg=dF61n6kAEM=2qHm=wwY_Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] busybox fixes and cleanups + update 1.23.2 -> 1.24.1
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
X-List-Received-Date: Fri, 20 Nov 2015 18:59:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 19/11/2015 21:08, Andre McCurdy wrote:
> I'm planning to refresh these patches one more time to remove "-e"
> from EXTRA_OEMAKE.
>
> Is there anything else which needs fixing or dropping before these
> patches are suitable for merging to master?

I've not punished your patches on the autobuilder, but they look fine. 
I'll wait for a V2 before testing them.

Cheers,
Ross

