Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1134D7302A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 10:13:31 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id m27so25855485iti.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 02:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=oj+n9unlln3yVeSxWkBT2SZGMmbqCmZ7ZqMdjANH42w=;
	b=vFS/AaNta7Ol/ooecqaGD7LwZr0kxCz1RP+aceC5lgc+FjLiLnG71fuvbFw8T9Jgdm
	Y1/iLlateUOqTlTd+GAl/H0wDX7iD5n1AZnmsZ4bEdGprak/4GHvccBlVbZCM+3nmmvd
	yUhMbr2gR2YkIxLWdhJsTLkWm/dKTo/k+SpknyqD9cjhPf5MtL9oBP208ePjkNxKevqy
	V7qhMm2i+noKwWLvz2z+fI1S7tk9Aas8r82khGGepOkwypMqnvVMES5msmMOqp0TvfU8
	c1XNkLihL57b16AAT0RsCunE/XShlAdrJzw8Ox8g1Ka8+KKBbIr83LMaS8sqkgaBjuSb
	Ihsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oj+n9unlln3yVeSxWkBT2SZGMmbqCmZ7ZqMdjANH42w=;
	b=n5yXCySYJacPHhU+g/4ju+riIUFbRYwaDvYraWzhz0RGcse8pXEhw8q4iDmODLWB3c
	EgiLGsMpgTONCcEEXJGvp7gsa5XIsB4ka51Jl6G6fuiiNXvnbZex1JQoFxGyMDx26pJZ
	zi6snETY8U3qLqrByIF2W41Cm+yqS9RaBi/dmOhr9i89781zTLz3cMkalGfiH/0NArTg
	FgGizXN3wFrslkV6cb0L9ebNO+LaGjPhmbfa5l7ELz+7fchp4cuGWbhLklg34rZhY/TO
	C+2AHcC6w8e45sn1mrnj85chJBi7fCp00T9sVG0dsokW8OgD2VUNs7OXuhEM4WH86Kig
	A/kw==
X-Gm-Message-State: AMke39mCkwKUliztd4qf7ZvSM+wwUji7N6y/IsISHQfOuBkyQb3pRkELo/lUxDjSPWzb5HEG
X-Received: by 10.36.13.140 with SMTP id 134mr8650022itx.88.1488449612605;
	Thu, 02 Mar 2017 02:13:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E17A.dip0.t-ipconnect.de. [93.232.225.122])
	by smtp.gmail.com with ESMTPSA id e20sm415022itc.3.2017.03.02.02.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 02:13:31 -0800 (PST)
Message-ID: <1488449609.7785.226.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 02 Mar 2017 11:13:29 +0100
In-Reply-To: <20170301184727.GB3290@jama>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
	<1487240814.13854.449.camel@intel.com> <20170301155243.GA3290@jama>
	<1488386693.7785.172.camel@intel.com> <20170301184727.GB3290@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Thu, 02 Mar 2017 10:13:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 19:47 +0100, Martin Jansa wrote:
> Another (surprising for me) output from bitbake -D -D -D:
> 
> OE qemux86@ ~/build/oe-core $ head log.zlib.rm_work.debug3.prio.*
> ==> log.zlib.rm_work.debug3.prio.completion <==
> DEBUG: completion priorities (most important first):
> 1. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_build
> 2. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work
> 3. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_package_write_ipk
> 4. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/expat/expat_2.2.0.bb:do_package_write_ipk
> 5. ID /OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb:do_package_write_ipk
> 6. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_package_write_ipk
> 7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/make/make_4.2.1.bb:do_package_write_ipk
> 8. ID /OE/build/oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.19.8.1.bb:do_package_write_ipk
> 9. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_6.3.bb:do_package_write_ipk
> 
> ==> log.zlib.rm_work.debug3.prio.normal <==
> DEBUG: original priorities (most important first):
> 1. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_fetch
> 2. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_unpack
> 3. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_prepare_recipe_sysroot
> 4. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_patch
> 5. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_configure
> 6. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_compile
> 7. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_install
> 8. ID /OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot
> 9. ID /OE/build/oe-core/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_fetch
> 
> From these 2 I would expect the later one to be completion (to finish whole quilt-native before starting anything else
> except when all quilt-native tasks are blocked waiting for dependencies and BB_NUMBER_THREADS allows to run
> more task).

I've not fully understood what the surprise was. I suppose
log.zlib.rm_work.debug3.prio.normal was generated with
BB_SCHEDULER="speed" and log.zlib.rm_work.debug3.prio.completion with
BB_SCHEDULER="completion".

For speed, quilt-native comes first because it's the recipe that most
recipes depend on. For completion, it's not near the top because it has
none of "important" tasks. It should be the first recipe for
do_populate_sysroot. The patch from my other mail should activate
quilt-native_0.65.bb:do_rm_work and then I'd expect it also at the top
for completion.

> But I understand that this isn't the actual order of tasks as explained in bitbake comment

Exactly.

> and the later one still doesn't list rm_worl task for quilt-native which is the real
> one I'm interested in.

That's the problem with recursive rm_work.

> When I do the same with last rm_work.bbclass change reverted I get this:
> $ head -n 12 log.zlib.rm_work.revert.debug3.prio.*
> ==> log.zlib.rm_work.revert.debug3.prio.completion <==
[...]
> Here it doesn't look so good for quilt-native:rm_work, it's included in zlib dependencies (thanks to the revert), but
> with "speed" scheduler it's far, while "completion" puts it early:
[...]

Here's how it looks with the patch:

# bitbake -n -D -D -D zlib | tee log.zlib.debug3.rm_work.patched
# less log.zlib.debug3.rm_work.patched
...
DEBUG: merged task list: ['do_fetch', 'do_unpack', 'do_patch', 'do_preconfigure', 'do_prepare_recipe_sysroot', 'do_configure', 'do_configure_ptest_base', 'do_compile', 'do_compile_ptest_base', 'do_gcc_stash_builddir', 'do_install', 'do_multilib_install', 'do_extra_symlinks', 'do_install_ptest_base', 'do_stash_locale', 'do_poststash_install_cleanup', 'do_package', 'do_packagedata', 'do_package_write_ipk', 'do_package_qa', 'do_populate_sysroot', 'do_populate_lic', 'do_rm_work', 'do_rm_work_all', 'do_build']
DEBUG: original priorities (most important first):
1. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_fetch
2. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_unpack
3. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_patch
4. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_prepare_recipe_sysroot
5. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_configure
6. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_compile
7. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_install
8. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot
9. ID /work/iot-ref-kit/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_fetch
...
597. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/gettext/gettext_0.19.8.1.bb:do_populate_lic
598. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/flex/flex_2.6.2.bb:do_rm_work
599. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb:do_rm_work
600. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb:do_rm_work
601. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/glibc/glibc_2.25.bb:do_rm_work
602. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-support/popt/popt_1.16.bb:do_rm_work
603. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_rm_work
604. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb:do_rm_work
605. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_rm_work
606. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_rm_work
607. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb:do_rm_work
608. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb:do_rm_work
609. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-support/attr/acl_2.2.52.bb:do_rm_work
610. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work
611. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_rm_work
...
DEBUG: completion priorities (most important first):
1. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_build
2. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all
3. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work
4. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/flex/flex_2.6.2.bb:do_rm_work
5. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb:do_rm_work
6. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb:do_rm_work
7. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/glibc/glibc_2.25.bb:do_rm_work
8. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-support/popt/popt_1.16.bb:do_rm_work
9. ID /work/iot-ref-kit/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_rm_work
10. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb:do_rm_work
11. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_rm_work
12. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_rm_work
13. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb:do_rm_work
14. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb:do_rm_work
15. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-support/attr/acl_2.2.52.bb:do_rm_work
16. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work
17. ID /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_rm_work
18. ID virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb:do_rm_work
...

That the speed scheduler (aka "original priorities" above) only adds
quilt-native_0.65.bb:do_rm_work at the end is a bit unexpected, I
thought it added all tasks of a recipe in sequence. As a result of that,
the reordered completion priorities do not have
quilt-native_0.65.bb:do_rm_work quite as high as it would be otherwise.

I don't think it matters in practice, though.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




