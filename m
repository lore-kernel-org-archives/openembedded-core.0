Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA9370FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 10:30:45 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hq12so5204533vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 02:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LB8ERHaBz5IqgVsDGs8sZfBiK832ZLj6EbFNDBVoXiw=;
	b=skR87BeqVyYNTHiN83BjZsMgvMuHQQIFzYioZlEdS8fazanO3bHAhjXp4+EeJakMWI
	0cG/fqDwd/w+M4dXVNcayAFZLKbrEnsVsoZrgltxm/prp6fu8g8HTaBlntJWvq/UMAFh
	wRtvoGQP13wu5zw3jPGNSzmmM24EED9CilOElZ9EbK9NgnaI3pla+LewHiCoMuB/4ksN
	+F1MCTqnGyh+lE1ddCt4obSUKMuE2DqbMkNkfzGUAUzsrrLjIA0Us9gDm4N4D3quQOtS
	3jKVycticoJzWqW5QGVZL2PCmSOL6F7dtJELuZJsNl+ASwqz5V+HY64VILBItooloJ+u
	4mrw==
MIME-Version: 1.0
X-Received: by 10.52.231.165 with SMTP id th5mr15907600vdc.48.1418639446221;
	Mon, 15 Dec 2014 02:30:46 -0800 (PST)
Received: by 10.52.237.165 with HTTP; Mon, 15 Dec 2014 02:30:46 -0800 (PST)
In-Reply-To: <1417610456-788-2-git-send-email-schnitzeltony@googlemail.com>
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
	<1417610456-788-2-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 15 Dec 2014 11:30:46 +0100
Message-ID: <CALbNGRSohh=7AeS23W1tYZhDD4Qy5B0U8GF9NtOr3te=SKPsNA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH][V2 2/3] gettext-native: build libintl so that other native recipes can use them
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
X-List-Received-Date: Mon, 15 Dec 2014 10:30:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2014 at 1:40 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> I have a native recipe around which directly compiles/links against libin=
tl.
> Gettext contains this code (usually supplied by glibc) as fallback. In na=
tive
> case this code is used by default because we don't have glibc there. This=
 patch
> changes static linking into dynamic linking making libintl code shareable=
.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-core/gettext/gettext_0.18.3.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes=
-core/gettext/gettext_0.18.3.2.bb
> index 65d4103..98838d7 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> @@ -39,6 +39,9 @@ EXTRA_OECONF +=3D "--without-lispdir \
>                   --with-included-libunistring \
>                  "
>
> +# we have no glib intl
> +EXTRA_OECONF_append_class-native =3D "--with-included-gettext --enable-s=
hared"
> +
>  acpaths =3D '-I ${S}/gettext-runtime/m4 \
>             -I ${S}/gettext-tools/m4'
>
> --
> 1.8.3.1
>
ping

