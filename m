Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Scj17-0004nO-N2
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:09:13 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 12:58:42 -0700
Received: by lbbgh12 with SMTP id gh12so720080lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 12:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ZHpSINUKfPF5f4MUAimYBEqDBkUlnsT4cSeQsZZz4Ac=;
	b=Aca1iAWrsK6/6tjADeGzWhfp4LEiOPXJbxBoPpxRf5gn+RH+t/NyHhFkpcCWoHluJS
	vbxE7gfDKF0WIdx0njzKysAvtpo4zqY9SnSKjIgOqb0Ys+OEIbc9MrC12doWFDYoFPwf
	LVLnXe9120KZSsl6dT6piCCZKhXXs4ayMDs9uTYUszzCOQk7PCM1I+k/XLC7rY4mcRDk
	s819H72b/vh2VTwlhCF87RyLTTxo6LKwPUGVdtNYuegkqumQeAtIylelNz22QjZnl/fm
	SDy/VsxoOKMtSyMcpuJfv0gMqGvQDjzkXGeCNdkrmyfDqE3VpL7OOJ/1+YGhdsQvi4N7
	LJPA==
MIME-Version: 1.0
Received: by 10.112.49.68 with SMTP id s4mr2042068lbn.27.1339099119761; Thu,
	07 Jun 2012 12:58:39 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Thu, 7 Jun 2012 12:58:39 -0700 (PDT)
In-Reply-To: <73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
References: <cover.1338990374.git.tom.zanussi@intel.com>
	<73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
Date: Thu, 7 Jun 2012 12:58:39 -0700
Message-ID: <CAPhnLPCmYzp8Cwz42HdZ9t-s04pLSGFqaxRhsgThuQ=0ZEjF-w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm4v6rsrLYAWu0y5WNreu4gp7t5ADaTf73mPC8S/PRuaezuCm+XfG8aWAcoqT12IOJNnTB6
Subject: Re: [PATCH 1/2] gnupg: add libusb to DEPENDS
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
X-List-Received-Date: Thu, 07 Jun 2012 20:09:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 6:53 AM,  <tom.zanussi@intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> gnupg apparently depends on libusb:
>
> | error: Failed dependencies:
> | =A0 =A0 =A0 =A0libusb-0.1-4 >=3D 0.1.3 is needed by gnupg-2.0.18-r1.cor=
e2
>
> So add libusb to gnupg DEPENDS.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> =A0meta/recipes-support/gnupg/gnupg_2.0.19.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.0.19.bb
> index 1d19fe3..9a0f160 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> @@ -4,8 +4,8 @@ LICENSE =3D "GPLv3 & LGPLv3"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be89=
67949 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LIB;md5=3D6a6a8e02=
0838b23406c81b19c1d46df6"
>
> -DEPENDS =3D "pth libassuan libksba zlib bzip2 readline libgcrypt"
> -PR =3D "r0"
> +DEPENDS =3D "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"

I'm seeing an additional DEPENDS needed here, curl:

| ksutil.c:43:23: fatal error: curl/curl.h: No such file or directory
| compilation terminated.
| make[2]: *** [gpg2keys_finger-ksutil.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| In file included from gpgkeys_finger.c:46:0:
| ksutil.h:35:ERROR: Function failed: do_compile (see
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/buil=
d/tmp/work/x86_64-poky-linux/gnupg-2.0.19-r2/temp/log.do_compile.11537
for further information)
| 23: fatal error: curl/curl.h: No such file or directory
| compilation terminated.
| make[2]: *** [gpg2keys_finger-gpgkeys_finger.o] Error 1
| gpgkeys_hkp.c: In function 'srv_replace':
| gpgkeys_hkp.c:510:7: warning: variable 'srvcount' set but not used
[-Wunused-but-set-variable]
| make[2]: Leaving directory
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/bui=
ld/tmp/work/x86_64-poky-linux/gnupg-2.0.19-r2/gnupg-2.0.19/keyserver'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/bui=
ld/tmp/work/x86_64-poky-linux/gnupg-2.0.19-r2/gnupg-2.0.19'
| make: *** [all] Error 2
| ERROR: oe_runmake failed

> +PR =3D "r1"
>
> =A0inherit autotools gettext
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


