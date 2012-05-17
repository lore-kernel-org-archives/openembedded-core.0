Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SV5LP-0005aB-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 20:22:36 +0200
Received: by eaal1 with SMTP id l1so582112eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=7OINeoZfgsLuqjVaOBjHzivnSX5OHmeKl6IYYYGES94=;
	b=l9/fzTtbbPpz0aES1s/P9X8dhtMkGoTqgYS4CJU+kfVx0o8hufqcV47/OV25Xz3vmV
	qCnEOR3uHdbREbQIgerCwsndxUF7ierOzSjeiUaUuQulWFa5QoBGA8fFVd+7bafAsWJ2
	2eRuJOm19kui40UpIhI05DXreTYnt8AE85Aq71wvVFoGZYI1HwUfTyf/dUlGl4MH1pWT
	fYPejWjADL/W6wpgB5l7OIbR9NfWoRBi3DcOmh0hpNDyrsruJUxZuyjbiTiF0XIsSv9l
	N5gOokNv2WIoOW7M/1VaPDTIIiCngHsgGjnjNFhjxvakyFWWN/JRchi5A6ExrZUWX87s
	7cTA==
Received: by 10.14.37.69 with SMTP id x45mr1416274eea.48.1337278353071; Thu,
	17 May 2012 11:12:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 17 May 2012 11:12:02 -0700 (PDT)
In-Reply-To: <932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
References: <cover.1337246557.git.lianhao.lu@intel.com>
	<932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2012 11:12:02 -0700
Message-ID: <CAMKF1spuwjLQ3hT8J6oNcFWowynBdKfX6=-NNKD7R=oRGWMknA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] (libc-)package.bbclass: Added MLPREFIX to locale packages.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 18:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 2:25 AM, Lianhao Lu <lianhao.lu@intel.com> wrote:
> Added multilib prefix to the locale related package names/dependencies.
>
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>

Does mlprefix already has a leading '-' ?
otherwise I think adding a - would make is more readable.

> ---
> =C2=A0meta/classes/libc-package.bbclass | =C2=A0 =C2=A04 ++--
> =C2=A0meta/classes/package.bbclass =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +=
++--
> =C2=A02 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index 57b6fd9..10f5f87 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -308,10 +308,10 @@ python package_do_split_gconvs () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgname =3D d.getV=
ar('MLPREFIX') + 'locale-base-' + legitimize_package_name(name)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('ALLOW_EM=
PTY_%s' % pkgname, '1')
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('PACKAGES=
', '%s %s' % (pkgname, d.getVar('PACKAGES', True)))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides =3D ' virtua=
l-locale-%s' % legitimize_package_name(name)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rprovides =3D ' %svirt=
ual-locale-%s' % (mlprefix, legitimize_package_name(name))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D re.match("(.=
*)_(.*)", name)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rprovides +=3D ' virtual-locale-%s' % m.group(1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rprovides +=3D ' %svirtual-locale-%s' % (mlprefix, m.group(1))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('RPROVIDE=
S_%s' % pkgname, rprovides)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if use_bin =3D=3D =
"compile":
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 99836e9..6fba5b6 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -400,13 +400,14 @@ python package_do_split_locales() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0summary =3D d.getVar('SUMMARY', True) or pn
> =C2=A0 =C2=A0 =C2=A0 =C2=A0description =3D d.getVar('DESCRIPTION', True) =
or ""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 locale_section =3D d.getVar('LOCALE_SECTION',=
 True)
> + =C2=A0 =C2=A0 =C2=A0 mlprefix =3D d.getVar('MLPREFIX', True) or ""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in sorted(locales):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln =3D legitimize_=
package_name(l)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg =3D pn + '-loc=
ale-' + ln
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0packages.append(pk=
g)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('FILES_' =
+ pkg, os.path.join(datadir, 'locale', l))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar('RDEPENDS_' +=
 pkg, '%s virtual-locale-%s' % (pn, ln))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar('RPROVIDES_' =
+ pkg, '%s-locale %s-translation' % (pn, ln))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar('RDEPENDS_' +=
 pkg, '%s %svirtual-locale-%s' % (pn, mlprefix, ln))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar('RPROVIDES_' =
+ pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('SUMMARY_=
' + pkg, '%s - %s translations' % (summary, l))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar('DESCRIPT=
ION_' + pkg, '%s =C2=A0This package contains language translation files for=
 the %s locale.' % (description, l))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if locale_section:
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


