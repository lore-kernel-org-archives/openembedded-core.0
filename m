Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF6647749F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 20:19:03 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id u15so29764708oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zNddEO/M2hizaeXFY6hpUpIzjEiUlRqAJCGcMCi+mUI=;
	b=Qb40NdAXIO66qRQt/D8ESFwYuJC7C5hi/GXRxoIW1dGx72aGGjg2Vol9QUfMPdzAuK
	tBu8us7Lt3lsJMIxebrqTTPPoVf2dXCXlZ8C+P0fmwdcFE4c7pmy+drPaCE/hw8nHizt
	AlmGy2jqZhWa9lBOpbdkFZMyLXb085P2eYdWe5560ZSCtFLZ8bftdDjxy9nL7mqo7aTG
	fDDvP8I0pfFdve0e4Q/BJF4eU0S15Z8jaSoYDxTtsmD/iL0rxsuS5DqfOKorQlDQcB9U
	2w0g723muB7a/rLaeULnWMsnH4FcKwprvL45vnZp8PsP5wuiANb+UVUvm6cOkyW1jk8H
	+blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zNddEO/M2hizaeXFY6hpUpIzjEiUlRqAJCGcMCi+mUI=;
	b=EzpXy7elcqHMF28pytkVQ1/aiaxDeE5dMNozi6vZ2hDYiuQa9ZXiqI8q3PhjVhDUJL
	EPc/rcZppsmknwtel/LvKbusPEjpJ9letmiEmyUhJlY/pENh/l1VBYknIAvSSL3gt9hS
	1osB+H+VLv8SS5r+YPma2MK7ci+Lwa3ynfGTBoNWxkrWBhcM4sSqlFvxARgMiLBNv0li
	I/aBrQv2eLGDCl6jtNYF25YJyI2dy11ZTKpGXtROrm0jge6+I7wRT8lhXw/lvUNk7O28
	9jjrWJ0Gu/Yn4tYimP6RqWt0R/SetkRhR5xmIMg/w0po3gL0hnfMP6WvcLtyJklDv2uZ
	VZ3w==
X-Gm-Message-State: AIkVDXJAvldBfp88o031lmvRKmZwDfGwJ/gLZyEjy3gJjw2cFn7WiXeQ2QVmAmgDE2HInSJSx18lyQH0pRludw==
X-Received: by 10.202.80.203 with SMTP id e194mr3518853oib.188.1482351544746; 
	Wed, 21 Dec 2016 12:19:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.19.10 with HTTP; Wed, 21 Dec 2016 12:18:44 -0800 (PST)
In-Reply-To: <20161221191030.GF30576@denix.org>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<20161221191030.GF30576@denix.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 21 Dec 2016 13:18:44 -0700
Message-ID: <CABcZANnFNKiPLW+nPwJJOGAvoVUCOEM4Ca6C_aOxbs2rr5v4SQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-dtb.inc: use absolute upd-alt paths
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
X-List-Received-Date: Wed, 21 Dec 2016 20:19:04 -0000
Content-Type: multipart/alternative; boundary=001a113b00d841cba0054430dd1d

--001a113b00d841cba0054430dd1d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2016 at 12:10 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:

> On Thu, Nov 12, 2015 at 04:41:28PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This works around a limitation of the chkconfig update-alternatives, so
> it
> > works with all our update-alternatives providers.
>
> I know this change is old and has been in for over a year...
>
> But the side-effect of it is that it breaks NFS-boot due to absolute DTB
> symlinks. We had to implement a local workaround to switch them back to
> relative links.
>
> Is there another way to fix the original issue w/o absolute links?


I expect so. I=E2=80=99d be fine with dropping this, it was a workaround mo=
re than
anything else anyway.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113b00d841cba0054430dd1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Dec 21, 2016 at 12:10 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, N=
ov 12, 2015 at 04:41:28PM -0700, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This works around a limitation of the chkconfig update-alternatives, s=
o it<br>
&gt; works with all our update-alternatives providers.<br>
<br>
</span>I know this change is old and has been in for over a year...<br>
<br>
But the side-effect of it is that it breaks NFS-boot due to absolute DTB<br=
>
symlinks. We had to implement a local workaround to switch them back to<br>
relative links.<br>
<br>
Is there another way to fix the original issue w/o absolute links?</blockqu=
ote></div><br>I expect so. I=E2=80=99d be fine with dropping this, it was a=
 workaround more than anything else anyway.<br>-- <br><div class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Christopher L=
arson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZ=
aurus<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113b00d841cba0054430dd1d--
