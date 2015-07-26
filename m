Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78F2C736B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 19:54:15 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so67978294igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 12:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=kfkdyovhb/xZN4iwc8iQzNz3QJ4CwMrJuksbzMKw3qI=;
	b=aEIMU1EOaD97eVrXy3RmfOOEa2K9WUZMyww+isOotPK23cHPMcI5HUzWSbAZ5s9koW
	qybtWN3x6I0vMNTtdLK9AXT3HqkaaJQL10UA14bcw8NlwnkSI/Wmsnlm/iWL4UYcnsGh
	XUOwtsEkTmFET/3ZWI9RPPxwN9z1nY1+kzjbOHmq8J/NYHHo2zvWyoN7Z61j7XTiu80J
	ylr5nAK3j+gRcfgarXGOzMAWhb5xhspEYPm/7dkZc4neZ8QSEtzwX7g1if+Q/d4mXBmB
	N8boevBDUkzcgWnxz8FkzqHAFOJNEYC8PBc5PQxVUaCRrxoiwer/M6sAwrEDRSsljqaQ
	53ow==
X-Gm-Message-State: ALoCoQmVZeGfXrIh+ypuPLGG1BrBev5PIyC2x8YZyDtKSh3qczSOjPiioGNuWpzpw7pGh8VCkF2q
MIME-Version: 1.0
X-Received: by 10.50.225.40 with SMTP id rh8mr12600922igc.39.1437940455979;
	Sun, 26 Jul 2015 12:54:15 -0700 (PDT)
Received: by 10.107.48.206 with HTTP; Sun, 26 Jul 2015 12:54:15 -0700 (PDT)
In-Reply-To: <1437927299.821.198.camel@linuxfoundation.org>
References: <1437927299.821.198.camel@linuxfoundation.org>
Date: Sun, 26 Jul 2015 20:54:15 +0100
Message-ID: <CAPhnLPAtC=TEMAu=MvDTE3cs_OsxRvR7Duu72W8Z7H18nOL3Xw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sun, 26 Jul 2015 19:54:18 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2015 at 17:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
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
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
> Systemd login prompt failure issue (Ross also has open bug for this in
> master)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
> GPLv3 check failing?
>

This shows that we have GPLv3+ within the license.manifest which is a
problem. I'll take a look at this tomorrow as it's concerning that
GPLv3 packages are getting in.

LICENSE: GPLv3+ BSD-2-Clause
LICENSE: GPLv2 LGPLv3
LICENSE: GPLv3+

> https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
> mips64 sanity test failed - do we support this on dizzy?
>

No, I don't believe so. I'll toss a skip patch into the AB to make
sure we don't hit this again.

> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
> arm64 build failed - do we support this on dizzy? (machine doesn't exist
> so no?)

Same, don't believe this is in dizzy. Just fido and master.

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

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release

