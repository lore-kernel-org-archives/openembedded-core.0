Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C86357453F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 16:54:47 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s10-v6so18006120plp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 09:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Cb2SBpjEAHhBPmIZbYOMLmbEfbaePORtJXoUFM/1GUY=;
	b=Oq8em/mnaUa18Z7ObptuKI4SXOAMyeFDM2TsSEmZbL8SwP4f13m4lLip3clDXjHtNw
	kh2EQqT/AepHRybL06duUmzjmZU33tmZGqva9k5oUMcm+jhZlUtbBCBH5A3VU+qXipQ7
	zGmA+3kmKOnjTpw6FLicF+UuH7VEuBAiY3cVzJ9fMum8fjspAv2hGCpRmG281TdMTlTB
	jRhiM30yN4C1DXIG1il5jU9uVFFVmQwu4yHU9EDtAyKxLdU9n8W1iQSQDDcoxTQxhYiM
	sbVedUfYOWju82i/F9vacKGH1L8gyLlnJT/lz80BYIkbzwrOv2Q38aNYBTLcb7OBIp5d
	EAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Cb2SBpjEAHhBPmIZbYOMLmbEfbaePORtJXoUFM/1GUY=;
	b=HfK9zwiZO0Y3OUH/i6hAOPIvnV3SgyBLqY6S9Yx80Cy/VmB4Qodb3NF8D3akWIN2iU
	3CHc9YfbbPUU9BSvlh67UtCh7k4vg14P/O2HJ7HMssXnuE2E9jrpBUyyyGudXnrwmQuY
	ea2Zu2DDosGZ4lRf10ADiGAvFTUfn21ZGfUvmhJESW2CSxsL+68BBoxdS6mmqPv6FdEZ
	nWtEsvjPhfdwaw1je/pyqpl3VCxXvrkFN+9Opgz/VjAmZ/tt4djsJR8Gars0JNFx5i+n
	jtZZLL+9OkpFpsqm5YIwN/FFI72VrFtY6Lc8/QFwD4/la+YLFfCMQQTfh7Sgal2YaIu9
	MOhg==
X-Gm-Message-State: AElRT7GFltDsd4Eohd1lrYid0se1qqrojWRRXVAWKYSy5faSpnNKaL2S
	F4yNYi2Tle+w8T8R2UxdcX0QYHTDC5wtZQ2iRVM=
X-Google-Smtp-Source: AIpwx48wME+qA2hYqR6zPlfH2nE2XdL3jpqzGvnAQ/b54yw2cH2/nY9nr8mGX5zBYN3b8QdVqraaWRpzXLbPoJsPDiQ=
X-Received: by 10.99.96.147 with SMTP id u141mr15504693pgb.227.1522947288948; 
	Thu, 05 Apr 2018 09:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.172.5 with HTTP; Thu, 5 Apr 2018 09:54:18 -0700 (PDT)
In-Reply-To: <20180405110858.3903-1-git@andred.net>
References: <20180405110858.3903-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Apr 2018 09:54:18 -0700
Message-ID: <CAMKF1som8fcp388J7c2wZbd9RVx0U0J6A6Obdga5YJLBuL4TEg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: DEPENDS on libidn2 (not libidn)
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
X-List-Received-Date: Thu, 05 Apr 2018 16:54:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 5, 2018 at 4:08 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> Since v7.51.0, libidn2 is the only available option, libidn
> support was dropped.
> The configure option was renamed as of v7.53.0
>
> Therefore, curl unconditionally tries to build against libidn2,
> which in particular is a problem for curl-native, as that might
> or might not build against the build-machine's libidn2 now,
> which furthermore causes problems when trying to share sstate
> between multiple build machines.
>
> We therefore see the following in the config log:
>     ...
>     checking whether to build with libidn2... (assumed) yes
>     ...
>     checking for libidn2 options with pkg-config... no
>     configure: IDN_LIBS: "-lidn2"
>     configure: IDN_LDFLAGS: ""
>     configure: IDN_CPPFLAGS: ""
>     configure: IDN_DIR: ""
>     checking if idn2_lookup_ul can be linked... yes
>     checking idn2.h usability... yes
>     checking idn2.h presence... yes
>     checking for idn2.h... yes
>     ...
>       IDN support:      enabled (libidn2)
>     ...
> even though this recipe tries to disable that.
>
> While libidn2 isn't available in OE, this change at least:
> * prevents curl-native to silently build against libidn2 if
>   that is installed on build machine, even if not requested
> * alerts people who use the PACKAGECONFIG option that it's
>   not actually doing what they intend to do
>

this is ok.

> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  meta/recipes-support/curl/curl_7.58.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-supp=
ort/curl/curl_7.58.0.bb
> index 5535a5609b..d2d0180268 100644
> --- a/meta/recipes-support/curl/curl_7.58.0.bb
> +++ b/meta/recipes-support/curl/curl_7.58.0.bb
> @@ -34,7 +34,7 @@ PACKAGECONFIG[imap] =3D "--enable-imap,--disable-imap,"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,"
>  PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,"
> -PACKAGECONFIG[libidn] =3D "--with-libidn,--without-libidn,libidn"
> +PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-libidn2,libidn2"
>  PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
>  PACKAGECONFIG[pop3] =3D "--enable-pop3,--disable-pop3,"
>  PACKAGECONFIG[proxy] =3D "--enable-proxy,--disable-proxy,"
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

