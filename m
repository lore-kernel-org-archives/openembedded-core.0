Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6F76AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 04:02:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 3so3252757pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 20:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zLFoIUbc8cDQ3JE/rbKHuR992qq54xYMkBCzO+3hdSU=;
	b=BcGNoJoNMPYwrtLH7f3bSChvmI200By+nO0mp2HAnm5+ABWXhqIlaM2BCYFWcpRzdn
	LGyvuD3fvdA4x0rA0c7t3zdv3llNSc2Rbxn/XbT9WCU9vtPr/oVD8cKaTop37XScquw2
	pPtJUB7QNXuWoIOvOum+7orL0c2c2OkZc4R3K8pfP3I59mXUmbs/6ca6JNW1TMd8qdHA
	0Z88xyFi/na3Nh3Dw9qM2HWPVJpMIx/em4UZpw4PlsylzLtFMlt1Ejg91b2oGpoeZOC0
	CdeMUfKwMEVAou+M1Z4xiJTXO4OlNzzRFYmonB1/kap+Yark+B5dVQ29VXAORRGGYhMI
	tn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zLFoIUbc8cDQ3JE/rbKHuR992qq54xYMkBCzO+3hdSU=;
	b=SspEcqbKBrSzH4mOMSSufYXv2C1YEheaqT6AJ9e44OgVhVzMVn6nABP27KnsvsxJWg
	AgOeymfgv3socDRYu2RJYHGztpekdwhSGq/oaiDR3Kp8wr4hPJOMVgOKUEeJBjHQnHIX
	uM8/2vzK1/NIMjL7RcNc9x/mzyl1wbLwnZZ/G1ssN062jbjFvkPVXd6qoeGj23GnL4aX
	sbl7tJGvdui82PmT4mRYw0kmXzj5voEFwpNFDgQbJj2oAXKMj6n+FU114VysBe32Kd7i
	WIBMN28ENItvy4/oxuceU3K95obIH4bue/rCHF1hAJXq9FWM4uGMie6OWJgEWEug3Hct
	2mYA==
X-Gm-Message-State: AKaTC02GpqV5ztGD9RMa5KOEWxJyNJC3v0pm6rvSom1lPcSNRHoFN58+goPw/Ji5tGuTpA==
X-Received: by 10.84.206.37 with SMTP id f34mr80094206ple.35.1480564943672;
	Wed, 30 Nov 2016 20:02:23 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y6sm24214025pge.16.2016.11.30.20.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 20:02:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1480549817-16636-1-git-send-email-obi@opendreambox.org>
Date: Wed, 30 Nov 2016 20:02:21 -0800
Message-Id: <15B74A76-F494-49BC-9BB6-6D0479495860@gmail.com>
References: <1480549817-16636-1-git-send-email-obi@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libc-package.bbclass: split binary localedata even more if asked to
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
X-List-Received-Date: Thu, 01 Dec 2016 04:02:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2016, at 3:50 PM, Andreas Oberritter <obi@opendreambox.org> =
wrote:
>=20
> If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
> glibc-binary-localedata-XX-YY to be a meta package depending on
> glibc-binary-localedata-XX-YY-lc-address and so on. This enables
> saving quite some space if someone doesn't need LC_COLLATE for
> example.
>=20
> Some regex code was removed from output_locale_binary_rdepends,
> because legitimize_package_name already converts to lowercase.
>=20

This looks ok. May be add some documentation around=20
GLIBC_SPLIT_LC_PACKAGES in extended local.conf sample.
I am worried about dependency changes, may be comparing old and new
would help.

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> meta/classes/libc-package.bbclass | 39 =
+++++++++++++++++++++++++--------------
> 1 file changed, 25 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
> index 2dc90c4..071978b 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -9,6 +9,8 @@
>=20
> GLIBC_INTERNAL_USE_BINARY_LOCALE ?=3D "ondevice"
>=20
> +GLIBC_SPLIT_LC_PACKAGES ?=3D "0"
> +
> python __anonymous () {
>     enabled =3D d.getVar("ENABLE_BINARY_LOCALE_GENERATION", True)
>=20
> @@ -219,13 +221,12 @@ python package_do_split_gconvs () {
>         (locale, encoding, locale))
>=20
>     def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
> -        m =3D re.match("(.*)\.(.*)", name)
> -        if m:
> -            libc_name =3D "%s.%s" % (m.group(1), m.group(2).lower())
> -        else:
> -            libc_name =3D name
> -        d.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('%s-binary-localedata-%s' \
> -            % (mlprefix+bpn, libc_name)))
> +        dep =3D legitimize_package_name('%s-binary-localedata-%s' % =
(bpn, name))
> +        lcsplit =3D d.getVar('GLIBC_SPLIT_LC_PACKAGES', True)
> +        if lcsplit and int(lcsplit):
> +            d.appendVar('PACKAGES', ' ' + dep)
> +            d.setVar('ALLOW_EMPTY_%s' % dep, '1')
> +        d.setVar('RDEPENDS_%s' % pkgname, mlprefix + dep)
>=20
>     commands =3D {}
>=20
> @@ -337,6 +338,11 @@ python package_do_split_gconvs () {
>             else:
>                 output_locale('%s.%s' % (base, charset), base, =
charset)
>=20
> +    def metapkg_hook(file, pkg, pattern, format, basename):
> +        name =3D basename.split('/', 1)[0]
> +        metapkg =3D legitimize_package_name('%s-binary-localedata-%s' =
% (mlprefix+bpn, name))
> +        d.appendVar('RDEPENDS_%s' % metapkg, ' ' + pkg)
> +
>     if use_bin =3D=3D "compile":
>         makefile =3D base_path_join(d.getVar("WORKDIR", True), =
"locale-tree", "Makefile")
>         m =3D open(makefile, "w")
> @@ -350,13 +356,18 @@ python package_do_split_gconvs () {
>         bb.build.exec_func("oe_runmake", d)
>         bb.note("collecting binary locales from locale tree")
>         bb.build.exec_func("do_collect_bins_from_locale_tree", d)
> -        do_split_packages(d, binary_locales_dir, file_regex=3D'(.*)', =
\
> -            output_pattern=3Dbpn+'-binary-localedata-%s', \
> -            description=3D'binary locale definition for %s', =
extra_depends=3D'', allow_dirs=3DTrue)
> -    elif use_bin =3D=3D "precompiled":
> -        do_split_packages(d, binary_locales_dir, file_regex=3D'(.*)', =
\
> -            output_pattern=3Dbpn+'-binary-localedata-%s', \
> -            description=3D'binary locale definition for %s', =
extra_depends=3D'', allow_dirs=3DTrue)
> +
> +    if use_bin in ('compile', 'precompiled'):
> +        lcsplit =3D d.getVar('GLIBC_SPLIT_LC_PACKAGES', True)
> +        if lcsplit and int(lcsplit):
> +            do_split_packages(d, binary_locales_dir, =
file_regex=3D'^(.*/LC_\w+)', \
> +                output_pattern=3Dbpn+'-binary-localedata-%s', \
> +                description=3D'binary locale definition for %s', =
recursive=3DTrue,
> +                hook=3Dmetapkg_hook, extra_depends=3D'', =
allow_dirs=3DTrue, match_path=3DTrue)
> +        else:
> +            do_split_packages(d, binary_locales_dir, =
file_regex=3D'(.*)', \
> +                output_pattern=3Dbpn+'-binary-localedata-%s', \
> +                description=3D'binary locale definition for %s', =
extra_depends=3D'', allow_dirs=3DTrue)
>     else:
>         bb.note("generation of binary locales disabled. this may break =
i18n!")
>=20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


