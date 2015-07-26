Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 604FF73217
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 20:11:58 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so39722313pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rzFXmcsPEIpU4o+W9/qALWWPg6W/bBtY98sOcBUgrYc=;
	b=Sr2OHwlSdIfDpUctsKa1N1I8Rs2CjunltUCuOWc/RUeLKfeoUb8V2SaM8SEASDzYBQ
	bUC3m3EJc6DI+vDxPnk1fJ2RDRutmZ7DBfeIo57iLOP8hSTRzMGWHsXyadRLBZHO8HDQ
	1aVk6DYhLAPXQJJ+bvQk/U3LwOC41b771kJ2dw5QvPEJcRbuJPzSDgOQosu4Jf+7FI1d
	qGut3s91oARO5U1bQg/wGC76ye9WObXsag86xRi1lkX/xnHtGh4HAhsKLoiMVX4ebNxb
	9HSkT2yKEzEQ63P3BtRVpfTC7Kc9kLfxtOQhc+ikHwV8xA9CnF/CgRb3M/Redkgm3NOX
	fSsw==
X-Received: by 10.70.128.226 with SMTP id nr2mr60174204pdb.139.1437941518279; 
	Sun, 26 Jul 2015 13:11:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:ad78:98ae:ed56:228c?
	([2601:202:4000:1239:ad78:98ae:ed56:228c])
	by smtp.googlemail.com with ESMTPSA id
	pe3sm25485577pdb.55.2015.07.26.13.11.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Jul 2015 13:11:57 -0700 (PDT)
Message-ID: <55B53F00.8050902@gmail.com>
Date: Sun, 26 Jul 2015 13:11:44 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1437927299.821.198.camel@linuxfoundation.org>
In-Reply-To: <1437927299.821.198.camel@linuxfoundation.org>
Cc: "Witt, Randy E" <randy.e.witt@intel.com>
Subject: Re: Weekend build status (master, fido, dizzy and -next)
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
X-List-Received-Date: Sun, 26 Jul 2015 20:12:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2015 09:14 AM, Richard Purdie wrote:
> Over the weekend I've tried to establish where we're at with the various
> branches. I've run builds of master, fido and dizzy. I have fixed
> various things:
>
> * dizzy gcc5 backports
> * mysterious updated-rc.d license file missing failure
> * linux-yocto 4.1 perf issues
>
> Despite these, sadly the builds were not very successful :(.
>
> Master - Last build showed 4 failures:
> ======================================
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/402/steps/BuildImages/logs/stdio
> nativesdk-update-rc.d missing, fix pushed
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages_1/logs/stdio
> meta-intel linux-yocto issue (fix pending merging)
> nativesdk-update-rc.d missing, fix pushed
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/413/steps/Running%20Sanity%20Tests/logs/stdio
> mips sanity test failure, unknown cause
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/96/steps/Running%20oe-selftest/logs/stdio
> 3 failures from runqemu issues (Paul working on this)
> 2 failures from meta-intel linux-yocto issues (fix pending merging)
>
> Fido - Last build showed 5 failures:
> ====================================
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/409/steps/Running%20Sanity%20Tests/logs/stdio
> qemuarm kernel panic during sanity tests
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/394/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/68/steps/BuildImages/logs/stdio
> looks like http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ba07a69f3dc8fb798e372130bf665d059fed9d42, backport needed?
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/94/steps/Running%20oe-selftest/logs/stdio
> "Only one copy of bitbake should be run against a build directory" -
> Bitbake shutdown race. Fix in master but risky backport, torn on this.
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/405/steps/Running%20Sanity%20Tests/logs/stdio
> xorg/vnc systemd issue - Ross has open bug for master
>
> Dizzy - Last Build showed ? failures:
> =====================================
>
> Managed to push most gcc5 fixes to the branch which has things building
> much better than the first time.
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/97/steps/Running%20oe-selftest/logs/stdio
> two different selftest sanity failures

Why does the log show 1.8+snapshot? I would have expected 1.7+.


>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
> Systemd login prompt failure issue (Ross also has open bug for this in
> master)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
> GPLv3 check failing?

Was this run for 1.7.2 ? I don't see any license changes in the 1.7.3 
patches.

I am  confused by the logs. It references 
"TERMINFO_DIRS=/opt/poky/1.8+snapshot" and other places is references 
'master'. is this representative of Dizzy?

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
> mips64 sanity test failed - do we support this on dizzy?

Don't think so. It was not tested in the previews point releases either.

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
> arm64 build failed - do we support this on dizzy? (machine doesn't exist
> so no?)

Arm64 is not support in Dizzy.

- Armin
>
> grub-efi gcc5 issue:
> http://errors.yoctoproject.org/Errors/Details/13781/
>
> [build is still ongoing so this is not a complete list]
>
> So all things considered we're not in a good way for the point releases
> or M2 :(.
>
> With regard to master-next, my experimental SDK toolchain fixes are
> causing issues on armeabi and x32. Whenever I add in Chris' recipetool
> changes, the selftest gives odd results too :(. Build is also ongoing.
>
> Cheers,
>
> Richard
>
>

