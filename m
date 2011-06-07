Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QU0UE-0007G9-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 19:54:42 +0200
Received: by wwb17 with SMTP id 17so4374283wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=aqmTYxGmieNvmTUVrpHrkoJjVK/gQe5CojsEMbLOkcY=;
	b=qSpVr/katWEzyCMI6ecKG+yCXSe7rFwQRVgEgh6W9AdWeNnbc5saPh1iFO8f8osxYY
	jYmKc/OFUpPxf4EOad+Br1qVA2B7Mpo/DUSc3gJK/b3n98DjH7SrINQtiTvsdotOFm2s
	pVAEcYFC32T5+3vjI/fQ6FNXn2wOKic0dSPlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=IC9iLHt3mR+5fT74/wzEJa8Q3eeiPzb3kRw+33CAW0VBckwQWzLUl0l/aOsKQ8koVg
	VNEMVr8p/xk82KiY8fshh6jbCMxLwRZ4ViuexaIccnO5ZpDpuypexrhsynso2kaJRARl
	CcYioQDUF0Dkov0hl9E+a0rAr0lKebgyJUUzk=
Received: by 10.216.67.72 with SMTP id i50mr6571861wed.29.1307469085100; Tue,
	07 Jun 2011 10:51:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 7 Jun 2011 10:50:55 -0700 (PDT)
In-Reply-To: <46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
References: <cover.1307438945.git.kai.kang@windriver.com>
	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2011 10:50:55 -0700
Message-ID: <BANLkTimSHyuZ38S_bDA=9VSzKhESxxu88g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Tue, 07 Jun 2011 17:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2011 at 2:42 AM, Kang Kai <kai.kang@windriver.com> wrote:
> From: Kang Kai <kai.kang@windriver.com>
>
> Migrate configurability from oe, try to shrink minimal image size
>
> Update to get eglibc configuration options from DISTRO_FEATURES and enabl=
e them. All
> the options are enabled by default.
>
> Uncomment the line in conf/local.extended.conf to define DISTRO_FEATURES,=
 so put
> what options you want to enable there.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/default-distrovars.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A08 ++-
> =C2=A0.../eglibc-2.13-fix-macro-RTLD_DEBUG.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 20 ++++++
> =C2=A0meta/recipes-core/eglibc/eglibc-options.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 62 ++++++++++++++++++++
> =C2=A0meta/recipes-core/eglibc/eglibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++
> =C2=A0meta/recipes-core/eglibc/eglibc_2.13.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A05 files changed, 98 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13=
-fix-macro-RTLD_DEBUG.patch
> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 4b68a0a..16ac681 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
> =C2=A0ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
> =C2=A0LOCALE_UTF8_ONLY ?=3D "0"
>
> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci"
> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-ipv6 libc-backtra=
ce libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-=
crypt \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-crypt-ufc libc-db=
-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-getlogin libc-idn=
 libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-c=
ode \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-memusage libc-nis=
 libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrp=
c \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-utmp libc-utmpx l=
ibc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glib=
c \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-posix-wchar-io"
>

libc-ipv6 should be merged with existing ipv6 DISTRO_FEATURE we do not
need two keywords for same feature
we also need documentation on these features and probably mention in
local.conf.sample or may be a new file
for adavanced configuration

> =C2=A0IMAGE_FEATURES ?=3D ""
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-R=
TLD_DEBUG.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macr=
o-RTLD_DEBUG.patch
> new file mode 100644
> index 0000000..dffc648
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEB=
UG.patch
> @@ -0,0 +1,20 @@
> +When disable OPTION_EGLIBC_RTLD_DEBUG, compilation fails.
> +Created on Jun 1, 2011 by Kang Kai <kai.kang@windriver.com>
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +Index: libc/elf/dl-lookup.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc/elf/dl-lookup.c =C2=A0 =C2=A0 =C2=A0 (revision 13356)
> ++++ libc/elf/dl-lookup.c =C2=A0 =C2=A0 =C2=A0 (working copy)
> +@@ -423,7 +423,9 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ha=
sh table. =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__builtin_e=
xpect (tab->size, 0))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if __OPTION_EGLIBC_RT=
LD_DEBUG
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
ssert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
_rtld_lock_unlock_recursive (tab->lock);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
oto success;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-c=
ore/eglibc/eglibc-options.inc
> new file mode 100644
> index 0000000..9214a0c
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-options.inc
> @@ -0,0 +1,62 @@
> +def eglibc_cfg(feature, features, tokens, cnf):
> + =C2=A0 =C2=A0 =C2=A0 if type(tokens) =3D=3D type(""):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens =3D [tokens]
> + =C2=A0 =C2=A0 =C2=A0 if type(features) =3D=3D type([]) and feature in f=
eatures:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnf.extend([token + ' =
=3D y' for token in tokens])
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for token in tokens:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cnf.extend([token + ' =3D n'])
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if token =3D=3D 'OPTION_EGLIBC_NSSWITCH':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXE=
D_CONFIG =3D ${S}/nss/nsswitch.conf"])
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXE=
D_FUNCTIONS =3D ${S}/nss/fixed-nsswitch.functions"])
> +
> +# Map distro features to eglibc options settings
> +def features_to_eglibc_settings(d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cnf =3D ([])
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0distro_features =3D (bb.data.getVar('DISTRO_=
FEATURES', d, True) or '').split()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-ipv6', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-backtrace', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-big-macros', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-bsd', =C2=A0 =C2=A0 =C2=A0d=
istro_features, 'OPTION_EGLIBC_BSD', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-cxx-tests', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-catgets', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-charsets', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-crypt', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-crypt-ufc', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-db-aliases', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-envz', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-fcvt', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_FCVT', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-fmtmsg', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-fstab', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-ftraverse', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-getlogin', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-idn', =C2=A0 =C2=A0 =C2=A0d=
istro_features, 'OPTION_EGLIBC_IDN', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-inet', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_INET', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-inet-anl', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-libm', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_LIBM', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-libm-big', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-locales', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-locale-code', =C2=A0 =C2=A0=
 =C2=A0distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-memusage', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-nis', =C2=A0 =C2=A0 =C2=A0d=
istro_features, 'OPTION_EGLIBC_NIS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-nsswitch', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-rcmd', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_RCMD', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-rtld-debug', =C2=A0 =C2=A0 =
=C2=A0distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-spawn', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-streams', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-sunrpc', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-utmp', =C2=A0 =C2=A0 =C2=A0=
distro_features, 'OPTION_EGLIBC_UTMP', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-utmpx', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-wordexp', =C2=A0 =C2=A0 =C2=
=A0distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-posix-clang-wchar', =C2=A0 =
=C2=A0 =C2=A0distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-posix-regexp', =C2=A0 =C2=
=A0 =C2=A0distro_features, 'OPTION_POSIX_REGEXP', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-posix-regexp-glibc', =C2=A0=
 =C2=A0 =C2=A0distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0eglibc_cfg('libc-posix-wchar-io', =C2=A0 =C2=
=A0 =C2=A0distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# try to fix disable charsets/locales/locale=
-code compile fail
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if 'libc-charsets' in distro_features and 'l=
ibc-locales' in distro_features and 'libc-locale-code' in distro_features:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_NO_GCO=
NV', '0', d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_NO_GCO=
NV', '1', d)
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return "\n".join(cnf)
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/egli=
bc/eglibc.inc
> index 46ffa82..616f1af 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -28,6 +28,7 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate l=
inux-libc-headers"
> =C2=A0PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> =C2=A0PROVIDES +=3D "virtual/libintl virtual/libiconv"
> =C2=A0inherit autotools
> +require eglibc-options.inc
>
> =C2=A0LEAD_SONAME =3D "libc.so"
>
> @@ -43,3 +44,8 @@ EXTRA_OEMAKE +=3D ${EGLIBCPARALLELISM}
> =C2=A0PARALLEL_MAKE =3D ""
>
> =C2=A0PACKAGES =3D "glibc catchsegv sln nscd ldd localedef glibc-utils gl=
ibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db =
glibc-pcprofile"
> +
> +OE_FEATURES =3D "${@features_to_eglibc_settings(d)}"
> +do_configure_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 echo '${OE_FEATURES}' > ${B}/option-groups.config
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/=
eglibc/eglibc_2.13.bb
> index 398da69..894eb88 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV =3D "13356"
>
> =C2=A0DEPENDS +=3D "gperf-native"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> -PR =3D "r0"
> +PR =3D "r1"
> =C2=A0PR_append =3D "+svnr${SRCPV}"
>
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_13"
> @@ -16,7 +16,9 @@ SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=
=3D${EGLIBC_BRANCH};proto=3Dhttp
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://stack-protector-test.patc=
h \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://eglibc-2.13-fix-macro-RTLD_DE=
BUG.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3D98a1128c4b58120182cbea3=
b1752d8b9 \
> =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D393a5ca445f6965873eca0259a17f83=
3 \
> =C2=A0 =C2=A0 =C2=A0 file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a1=
3b2332ec1c785f5d83a \
> --
> 1.7.5.1.300.gc565c
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


