Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGSR-0005bp-Cx
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:26:57 +0100
Received: from mail-gh0-f200.google.com ([209.85.160.200])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:09:58 -0800
Received: by mail-gh0-f200.google.com with SMTP id 10so9622156ghy.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=P/hN9ghsibsWjd+cu5vzopS1PJWMjzaOI0m/rZ0FI7Q=;
	b=czecrcCS+a2HmS/I8Du/ZAP5gRQjnIHU8Fj2t+IjGjuLcalcEvx3A+QXjlGr45HEW5
	X7dQVO48duHz2A0EFWDzPDDXD3LNqxkE8ojNWROXD59X/zqcrXQEQF9dFYwtL0mtx6Jy
	l+e6PiOCFNPmT3U7a+fKlW8pxfXiZT3lnCiHH32Y2/p2JQiZd/gz8Dt8cpBiT6wzGhd9
	zfb36H7GU/LFZBryjzOtvcFvVvgM52yM6B2HiwSpH7igcDKVJOh50tP+FSYM4nXUpHxv
	UHZ8HyCGPTgwpDYZVR93lA6m0PeNNHlCeKCtls/T1BfOFQcs4usCDZuvzPLdrCyVd82P
	NWHw==
X-Received: by 10.52.72.137 with SMTP id d9mr2943776vdv.105.1358770265127;
	Mon, 21 Jan 2013 04:11:05 -0800 (PST)
X-Received: by 10.52.72.137 with SMTP id d9mr2943766vdv.105.1358770265077;
	Mon, 21 Jan 2013 04:11:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 04:10:44 -0800 (PST)
In-Reply-To: <50FCBCB7.8060201@linux.intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<50FCBCB7.8060201@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 12:10:44 +0000
Message-ID: <CAJTo0LbFvUQUzbLoF23+mO90JF0jny2=UN-dPM6YdMuF2bns5g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlRl/zUfleYrsHDIXbBcSZGw6KP+1xqSED/GQRV2GrwBdgAUCjCH7VYt6MmTa+Jaf5ndYm1JZyHB8znroNzkSsDpkae8BSqV1TT8D2QzURAVFm4m2H3huG6lsOdaxnuFnyPw1LJGvwahXAImccujBGOoX2rZUpGJ0JPEP4+T/zcZj2xvQcxvNEhobe+39Vv8uUXMo47
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 12:27:06 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 03:57, Saul Wold <sgw@linux.intel.com> wrote:
> Another thing I just noticed is that many of these patches are missing
> either Signed-off-by or Upstream-Status Tags!

Yes. I meant to wipe out the uclibc patches for now to reduce the
attribution-chasing, but forgot.  I'll work on that next.

Ross


