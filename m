Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB1F0616F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:55:04 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id y2so5776148qvu.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zp8zd2qlv+GBsj2HTB6sdVUEWDwsmk4Fj2OJEE73Ads=;
	b=UptQYA3xHj6oFxMnmdoF2U37b/LUez/AvoDRgwpZm1DRzAq9cz/Qeu6hiKjaDvlPiP
	BbDWkCMFz1j1/l1Yy7WkaH1lteG8p1LK4f+SCf2ZcdwbWOI+4duu4jQQQ4O3lpoNO9Ql
	bS71eQFJjUrMVKTgeIqauZ/MeGLCFkZ0QIocG8tVtNv3d6M6gBHnpJaP9WJvuoC88soW
	iFl1+K+iR/Oa4WGS9jh1jwhCVlrExNsSmarcN8HxrkPt2SKLvjeToZ+ZBVtgCpEgxm4N
	GDITI1pa7sQhTJHmHxV1Gruw++kPzmUW90hMJg+6iq0Y110btGesyms9ENq72Q2pfKix
	CCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zp8zd2qlv+GBsj2HTB6sdVUEWDwsmk4Fj2OJEE73Ads=;
	b=sNCUPp1rwZ46NezjiNiI4tKW7+QJEKujuNvFdgmaq3SIrtWpU2VSzn4CwI8XjYKPai
	sa7XZKhoVmO8vE8rCwffgvNrR1jClWJJwzdfp9boBuGAqOaGrTJ/xca39rc8Ptw9HuI7
	PYAaQaqolbXNPRSrvlv/9PUk4Do39PfoEzeeiUhc9X0GNPhtDKR5Ojullkg15b25KEY0
	mWv+brwmoFXrFtnFHlhK6lrSzy59Esx6ITbv7/YlDd3zCY3m+uKUYVI2jGJ6Eoh4iobN
	/MnAZ/nO8eYMlhDdJaeuvoEbNnhtA/ATyK1aS2Pf29GfdOG6HqBvW1+fYK9E64n4yMAY
	15SQ==
X-Gm-Message-State: APjAAAX5sVVl3EjQPRX6pMXMyibkUiRxbpsCkBJMjREyFXLbrQ+P8iMU
	IU70hjWOQ5BZxXVLxS2TMJBJWrFlV2mSps/HUXI=
X-Google-Smtp-Source: APXvYqy9wg2XFQySe5eqakH/3KuLwNnquQGFiF46mRlkEFnqXltMPZ94F4rwFxVnHiuHQhYjRlDcwXgiDBp52kJzln8=
X-Received: by 2002:ad4:55e8:: with SMTP id bu8mr51574289qvb.61.1582642505420; 
	Tue, 25 Feb 2020 06:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20200220234829.12306-1-schnitzeltony@gmail.com>
	<20200220234829.12306-2-schnitzeltony@gmail.com>
In-Reply-To: <20200220234829.12306-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2020 06:54:39 -0800
Message-ID: <CAMKF1soeWNE-VZ6rtO=5fdHG2bopaVTQH9mj4hAQ0aJH_bnhGg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2][master-next] webkitgtk: enable gobject-introspection for armv7ve - it builds without issues
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
X-List-Received-Date: Tue, 25 Feb 2020 14:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 3:49 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Maybe armv7a can be re-enabled either but due to limited resources there =
is no
> chance for me to test.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.26.4.bb
> index fa109446d1..a1dba73c51 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> @@ -127,7 +127,6 @@ ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>  # qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>  # Segmentation fault
>  GI_DATA_ENABLED_armv7a =3D "False"
> -GI_DATA_ENABLED_armv7ve =3D "False"

Introspection is now hanging forever in qemu-arm when building with musl.
Perhaps just turn them into

GI_DATA_ENABLED_armv7a_libc-musl =3D "False"  please

>
>  # Can't be built with ccache
>  CCACHE_DISABLE =3D "1"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

