Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 868A273217
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 20:42:25 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so68645691igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 13:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=n69fWSq3WStMrDcDToqg3o+NLHyJZjUZbu2x2MCflBI=;
	b=A8oIKREaz69t3Feq9nQYCUSSgC5xa5Nd0wZFOnwvHVV0NICIqmEvm4eL60N7AjWkMu
	BhAuZl6KczEIcoM45nGAhmDRhYtJtNaAgyjvNhTbC0xsc6T43+iEAcbP7VZ8VHCiUqgi
	yxbjgcgubon7kfk5bvl6ieUCyweJYkccTuuCap7VxHQzONkGd0lesqesoly7TvTxX53y
	WAI8zREyYY8tpW8w5P3i02pZR93DhRKJ5ssaVCaW8cmg/Ea07+MSly0PObl34pO8V0j6
	+JXpABS1xtYLWXctBSh5lH6/ESbHuvTEDfR7p7b9NfSFs8Uly2g7n46V2N/+98kaJQI1
	WyOw==
X-Gm-Message-State: ALoCoQnjzAUSrbq4wDA1izz3Gvr0adrCZveLXHd0HXaQBCttKHMvPygiGVra4z0embLoaIbbeKf7
MIME-Version: 1.0
X-Received: by 10.50.59.148 with SMTP id z20mr13032291igq.77.1437943346070;
	Sun, 26 Jul 2015 13:42:26 -0700 (PDT)
Received: by 10.107.48.206 with HTTP; Sun, 26 Jul 2015 13:42:26 -0700 (PDT)
In-Reply-To: <55B53F00.8050902@gmail.com>
References: <1437927299.821.198.camel@linuxfoundation.org>
	<55B53F00.8050902@gmail.com>
Date: Sun, 26 Jul 2015 21:42:26 +0100
Message-ID: <CAPhnLPBEh0UbVLp9D_ABwRgmy2OkY01UTPQvap7ZSD3-d_tF1w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: akuster808 <akuster808@gmail.com>
Cc: "Witt, Randy E" <randy.e.witt@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 26 Jul 2015 20:42:27 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2015 at 21:11, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 07/26/2015 09:14 AM, Richard Purdie wrote:
>>
>> Over the weekend I've tried to establish where we're at with the various
>> branches. I've run builds of master, fido and dizzy. I have fixed
>> various things:
>>
>> * dizzy gcc5 backports
>> * mysterious updated-rc.d license file missing failure
>> * linux-yocto 4.1 perf issues
>>
>> Despite these, sadly the builds were not very successful :(.
>>
>> Master - Last build showed 4 failures:
>> ======================================
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/402/steps/BuildImages/logs/stdio
>> nativesdk-update-rc.d missing, fix pushed
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/400/steps/BuildImages_1/logs/stdio
>> meta-intel linux-yocto issue (fix pending merging)
>> nativesdk-update-rc.d missing, fix pushed
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/413/steps/Running%20Sanity%20Tests/logs/stdio
>> mips sanity test failure, unknown cause
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/96/steps/Running%20oe-selftest/logs/stdio
>> 3 failures from runqemu issues (Paul working on this)
>> 2 failures from meta-intel linux-yocto issues (fix pending merging)
>>
>> Fido - Last build showed 5 failures:
>> ====================================
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/409/steps/Running%20Sanity%20Tests/logs/stdio
>> qemuarm kernel panic during sanity tests
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/394/steps/BuildImages/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/68/steps/BuildImages/logs/stdio
>> looks like
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ba07a69f3dc8fb798e372130bf665d059fed9d42,
>> backport needed?
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/94/steps/Running%20oe-selftest/logs/stdio
>> "Only one copy of bitbake should be run against a build directory" -
>> Bitbake shutdown race. Fix in master but risky backport, torn on this.
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/405/steps/Running%20Sanity%20Tests/logs/stdio
>> xorg/vnc systemd issue - Ross has open bug for master
>>
>> Dizzy - Last Build showed ? failures:
>> =====================================
>>
>> Managed to push most gcc5 fixes to the branch which has things building
>> much better than the first time.
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/97/steps/Running%20oe-selftest/logs/stdio
>> two different selftest sanity failures
>
>
> Why does the log show 1.8+snapshot? I would have expected 1.7+.
>
>
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
>> Systemd login prompt failure issue (Ross also has open bug for this in
>> master)
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
>> GPLv3 check failing?
>
>
> Was this run for 1.7.2 ? I don't see any license changes in the 1.7.3
> patches.
>

No, the check was not run. My guess is that it was broken in 1.7.2.

> I am  confused by the logs. It references
> "TERMINFO_DIRS=/opt/poky/1.8+snapshot" and other places is references
> 'master'. is this representative of Dizzy?

We use the buildtools tarball on the builders. That is probably where
that is coming from.

>
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
>> mips64 sanity test failed - do we support this on dizzy?
>
>
> Don't think so. It was not tested in the previews point releases either.
>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
>> arm64 build failed - do we support this on dizzy? (machine doesn't exist
>> so no?)
>
>
> Arm64 is not support in Dizzy.
>
> - Armin
>>
>>
>> grub-efi gcc5 issue:
>> http://errors.yoctoproject.org/Errors/Details/13781/
>>
>> [build is still ongoing so this is not a complete list]
>>
>> So all things considered we're not in a good way for the point releases
>> or M2 :(.
>>
>> With regard to master-next, my experimental SDK toolchain fixes are
>> causing issues on armeabi and x32. Whenever I add in Chris' recipetool
>> changes, the selftest gives odd results too :(. Build is also ongoing.
>>
>> Cheers,
>>
>> Richard
>>
>>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

