Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2571F7F2F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 11:40:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p74so2085354wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gdKxrRuT8060cNfV718s6kihIK84zV6CO4At44i16j4=;
	b=eYn508s6cn3o+Dk/vBazWGjRfVORNLdLyS6Av6TNCAKP/sbVoLsq0k1e+bhtnrUSvJ
	QTZAOLLy4rnNGZAD1HpBGoPJUCTCwFVcVDxaFEqPqZg6HOPx4Jg/5SY4+0g5EbiBiJX7
	DNeZY8Xtl/b/j8odeqPocapg1LYYJuuIs6Rbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gdKxrRuT8060cNfV718s6kihIK84zV6CO4At44i16j4=;
	b=EgJeyl2d6EGZMHiZXeHIV056p4wwz37Q6nHx4BBaO90x4+8eJzADwZL948HHyflnT/
	6pjgGGUrSZIGry5vm4NB2mNah4qw1R0dmoppgjYZz6X+gm1a5ulmppzpRTfoodgyLqif
	yzZ6pn+jmYk0QjuRgBCocuQpqZEurb7zzvNFu15veTFQ2QNXF5pLYe0DfpS58H70I6ux
	ek4NLs2ac5bL6QclOZnOmdt/Vc+LQeuxjQMHpGUBOw+s27qoSsJdjvhDd9FaB7gU7JXs
	3evn5Up1aM1ckGy0eiqx8oO3kBeKVPoUhexLrwj9liMr/7QA6bsQuwqWMGahXKaaxguF
	C7hw==
X-Gm-Message-State: APjAAAXZaskKivkWQBmbJodWHVtcym4T/3kR87A8A4CGu/9FnHzp61li
	1GPa3x43S4R4jFnfGkgDYvZn1RNCNYQQ4A==
X-Google-Smtp-Source: APXvYqxwrr63IN+u8+Kk+J5Xl8T37KyvFanY+cXY4QjaLlTI/qF/RCW6P3rp6YkgdeAmcZOgqb2muQ==
X-Received: by 2002:a05:600c:2189:: with SMTP id
	e9mr3793206wme.56.1565264429620; 
	Thu, 08 Aug 2019 04:40:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q124sm2642738wma.33.2019.08.08.04.40.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 04:40:28 -0700 (PDT)
Message-ID: <5bc5b603d9ecdf2223ed37ec857f968165ced728.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Aug 2019 12:40:26 +0100
In-Reply-To: <3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Thu, 08 Aug 2019 11:40:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 10:18 +0000, Jacob Kroon wrote:
> Hi,
> 
> On 8/2/19 5:53 PM, Richard Purdie wrote:
> > This has been talked about in a lot of the project meetings but I
> > wanted to ensure its on the mailing list too.
> > 
> > master-next (and hopefully soon, master) now contain patches which
> > enable "hash equivalency" support in runqueue in bitbake. That
> > doesn't
> > sound so interesting until I explain what this means.
> > 
> <snip>
> > I think this should be a "big deal" for many developers, reducing
> > unneded rebuilds and hence speeding up development.
> > 
> > As with any new feature, there are likely going to be some some
> > teething issues but I'm very opitmistic about some of the benefits
> > this
> > should bring!
> > 
> 
> Very exciting see this feature being worked on! I have high hopes it
> is
> gonna reduce my build times.
> 
> I just updated to latest bitbake/oe-core master and started an
> incremental build of my distro with hash equivalency enabled, and ran
> into one problem:
> 
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Unable to install
> packages.
> <snip>
> Collected errors:
>   * Solver encountered 2 problem(s):
>   * Problem 1/2:
>   *   - nothing provides eudev needed by <snip>
> <snip>
>   * Problem 2/2:
>   *   - nothing provides udev needed by <snip>
> <snip>
> 
> Checking the build log I see:
> 
> ...
> NOTE: Task
> /home/jkroon/Projects/<snip>/build/../openembedded-core/meta/recipes-
> core/glib-2.0/glib-2.0_2.60.6.bb:do_populate_sysroot
> unihash changed to
> b88f1b01421cd7501b290888b783b057b92a7fb7a20f37fd08a56f2eaf8c56ed
> NOTE: Setscene task
> /home/jkroon/Projects/<snip>/build/../openembedded-core/meta/recipes-
> core/udev/eudev_3.2.8.bb:do_populate_sysroot
> now valid and being rerun
> ...
> NOTE: Setscene tasks completed
> 
> NOTE: Task
> /home/jkroon/Projects/<snip>/build/../openembedded-core/meta/recipes-
> core/udev/eudev_3.2.8.bb:do_package_qa
> unihash changed to
> 607d4eb7859bf6c725add7592a2c8bd64464afb259264281cbf2a3ad4e17e8d2
> ...
> NOTE: Task
> /home/jkroon/Projects/<snip>/build/../openembedded-core/meta/recipes-
> core/glib-2.0/glib-2.0_2.60.6.bb:do_package_qa
> unihash changed to
> 89413c6afc25b390471f0cebb6193a226e20a744ac86b473c0b11f7432b5165a
> ...
> NOTE: Setscene tasks completed
> 
> ...
> 
> Checking for built ipk packages I see:
> 
> [jkroon@manatarms-greyskull <snip>]$ find
> /tmp/ramdisk/<snip>/deploy/ipk/|grep eudev
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dbg_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dev_3.2.8-r0_i686.ipk
> 
> If I then do:
> 
> bitbake -c cleansstate eudev
> bitbake eudev
> 
> then I get:
> 
> [jkroon@manatarms-greyskull <snip>]$ find
> /tmp/ramdisk/<snip>/deploy/ipk/|grep eudev
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dev_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dbg_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-hwdb_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-src_3.2.8-r0_i686.ipk
> 
> and then I can complete building the image.
> 
> I did not have hash equivalency enabled in the beginning, I've just
> recently enabled it, without wiping tmp-build/ or sstate in between.

That sounds like some kind of rebuild problem with eudev rather than a
problem with the new runqueue code. It looks like eudev rebuilt but
only produces some subset of the packages it should have done.

If you still had the logs for eudev it would be have been interesting
to see if the install/package logs looked correct.

FWIW, enabling this on an existing build should work fine, it may just
take an initial rebuild of a given recipe for it to have something
compare against so it wouldn't work quite as effectively until after a
few builds where things have rebuilt.

Cheers,

Richard


