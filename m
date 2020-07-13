Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.443.1594657856466101590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 09:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGGlsSOQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id m16so4531791pls.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ELHZ+y0izXDWiDPiMQb75MMsQezZG7MCVnPGODoDfPo=;
        b=HGGlsSOQ0srqTtNrFGuJ3nUfKMapLU1STgxh0+ewpFlPJrC2hESsh042J6bkreT7+P
         5D1RLw0fqPrMyc8983qAZJF/zNnLHGcpd6BMbSFBgOI3YL5xGVuE3yyytLzLHMC77ogA
         puZsJlpNyGTb4N/I69jgi4WSPC4kGucujbgjg91dzFk0310mW0qjXoZ60+zbHh7rwsEn
         ZSEU1uqSIu+5djIKkoBpj9XxWHnWiQmJjAEw7O51YQYhC4D3hgvBUQvgI/ySbxq80jH4
         G4lerHxJgztYbVRnvClMKsAY1apVvyYohPSuwe5OOHKCCreHFbkMOHp2qu275uKFVwAO
         aouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ELHZ+y0izXDWiDPiMQb75MMsQezZG7MCVnPGODoDfPo=;
        b=E2Tx/i/lyCcuOg1naDnJ5dRD2kdhhJbCCRSN2u2qTyqXsPaVXGUp8Rf5xuBtgfICzA
         wTPgKfSiR3WplntMyp8BpqFeaC0XKyEr7NyS8RjE0W54N3hauzI8nPwVFhjG+yFOZ48P
         dDlVTNIrAI6gMmT+Or39aQsfy4dAfjFmPwykg2r7a3cNgQIP+NaI4kM/BdGkSo9GOdg3
         jNCx0sbGFy9L3f5a2aePtmt/rQlh982y3DBerkR3fL5yvG7LdnmSpLKVxrb6jvu/vHLK
         6gUJY0TdjvKsYkbYHaJigfqRdFQZxRkHJJE6X0VNfxgm9vBpRZ+WqLlOD7AMokJumAEB
         m6kw==
X-Gm-Message-State: AOAM531bb01xQ3sqoJ5ML12J/TxqgfCGgaHqQprqryauB63AHe0n7wov
	pTJUtvpFFOb2TXochBcwKpGGb21lzrA=
X-Google-Smtp-Source: ABdhPJzfo3AoZqu0SzW2wwHnevqGmpVbNL7uYdGBBNH0sgoeAvOPP+6XO3GPFI7vxFMfwU3qkq4sRA==
X-Received: by 2002:a17:90a:ea8c:: with SMTP id h12mr158168pjz.151.1594657855343;
        Mon, 13 Jul 2020 09:30:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5886:34b9:1392:15a2? ([2601:646:9200:4e0:5886:34b9:1392:15a2])
        by smtp.gmail.com with ESMTPSA id fh12sm106413pjb.5.2020.07.13.09.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 09:30:54 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Changqing Li <changqing.li@windriver.com>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
 <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
 <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
 <100548f6-240a-4ba1-0aeb-bc301d066c52@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <db248f93-870a-bff8-4959-29faa8fa7c28@gmail.com>
Date: Mon, 13 Jul 2020 09:30:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <100548f6-240a-4ba1-0aeb-bc301d066c52@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/12/20 11:03 PM, Changqing Li wrote:
> Hi, Martin
> 
> Thanks for tell me the problem.  Maybe I don't understand you 
> correctly,  but I don't met your problem, below is what I tried,
> 
> if I am wrong, please tell me how I can reproduce your problem, thanks.
> 
> 

since gtk+3 or perhaps even gdk-pixbuf is not allarch package being 
added as runtime dependency here would mean that any package thats 
inheriting this class and allarch class will have the issue Martin is 
seeing, one way to fix is to call it abi safe using 
SIGGEN_EXCLUDERECIPES_ABISAFE but since its a class, I dont think you 
can easily call that out in layer.conf.

> Here is what I tried:
> 
> bitbake adwaita-icon-themewithout my patch, and then build 
> adwaita-icon-theme with my patch, and then run below command:
> 
> bitbake-diffsigs 
> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fddfeacee59d81fa799ce6c965217ffe76a0141885093a 
> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f9af928e108e9764627201dcfd9db43efc8a455b181b
> NOTE: Starting bitbake server...
> runtaskdeps changed:
> ['autoconf/autoconf_2.69.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb 
> automake/automake_1.16.2.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/automake/automake_1.16.2.bb', 
> +gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot, 
> 'gnome/adwaita-icon-theme_3.36.1.bb:do_fetch 
> gnu-config/gnu-config_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb', 
> +gtk+/gtk+3_3.24.21.bb:do_populate_sysroot, 
> 'gtk+/gtk+3_3.24.21.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb 
> hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot 
> librsvg/librsvg_2.40.20.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb 
> libtool/libtool-native_2.4.6.bb:do_populate_sysroot 
> pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb 
> pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pseudo/pseudo_git.bb']
> Number of task dependencies changed
> Dependency on task gtk+/gtk+3_3.24.21.bb:do_populate_sysroot was added 
> with hash 60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd
> Dependency on task gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot 
> was added with hash 
> 17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41eca11f
> 
> 
> On 7/11/20 12:37 AM, Martin Jansa wrote:
>> With this change now in master and dunfell there is signature issue in 
>> allarch adwaita-icon-theme now runtime depending on TUNE_PKGARCH 
>> gdk-pixbuf as shown by sstate-diff-machines.sh/bitbake-diffsigs 
>> <http://sstate-diff-machines.sh/bitbake-diffsigs>:
>>
>> bitbake-diffsigs 
>> tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-theme/*do_prepare_recipe_sysroot*
>> NOTE: Starting bitbake server...
>> NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP: 
>> 127.0.0.1, PORT: 33511, PID: 36423
>> Hash for dependent task 
>> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from 
>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to 
>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
>> Unable to find matching sigdata for 
>> openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot 
>> with hashes 
>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 or 
>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
>>
>> On Wed, Jul 1, 2020 at 3:39 AM Changqing Li 
>> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>>
>>
>>     On 6/30/20 6:01 PM, Richard Purdie wrote:
>>     > On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
>>     >> From: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     >>
>>     >> fix error:
>>     >> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
>>     >> /var/tmp/rpm-tmp.mdYxY6: line 12:
>>     /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
>>     >> query-loaders: No such file or directory
>>     >> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961
>>     >> status 7f00
>>     >> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
>>     >> failed, exit status 127
>>     >>
>>     >> when install adwaita-icon-theme, which inherit gtk-icon-cache
>>     >> on target, above error reported,  fix by add needeed packages
>>     >> in RDEPENDS
>>     >>
>>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     >> ---
>>     >>   meta/classes/gtk-icon-cache.bbclass | 2 ++
>>     >>   1 file changed, 2 insertions(+)
>>     >>
>>     >> diff --git a/meta/classes/gtk-icon-cache.bbclass
>>     b/meta/classes/gtk-
>>     >> icon-cache.bbclass
>>     >> index 91cb4ad409..7f218ce7ae 100644
>>     >> --- a/meta/classes/gtk-icon-cache.bbclass
>>     >> +++ b/meta/classes/gtk-icon-cache.bbclass
>>     >> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme',
>>     '']['${BPN}' ==
>>     >> 'hicolor-icon-theme']} gtk
>>     >>
>>     >>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>>     >>
>>     >> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
>>     >> +
>>     >>   gtk_icon_cache_postinst() {
>>     >>   if [ "x$D" != "x" ]; then
>>     >>      $INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG}
>>     >> \
>>     > This isn't quite right since the postinst may be added to a package
>>     > other than ${PN}.
>>     >
>>     > You need to add the RDEPENDS to the code:
>>     >
>>     >          rdepends = ' ' + d.getVar('MLPREFIX', False) +
>>     "hicolor-icon-theme"
>>     >          d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>>     >
>>     > later in that class.
>>     >
>>     > Cheers,
>>     >
>>     > Richard
>>     Thanks, I will correct it.
>>     >
>>
> 
> 
> 
