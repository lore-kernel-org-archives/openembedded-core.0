Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 88D0D60589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:03:52 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id a10so6981429ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nP6E4Klm+BOfK8EZVZvhpy5YDHu3Y8e/gvS/zKc2cLo=;
	b=bXrRFW2i7Xg3K3cYmcPA75OfDuk3K5rmqtvO0Rio9ATXOVSE9IQPDDxYUGn50GeIfc
	A6ZgsttVfzBiGBmmHNpJ5HMOgPpNGbg6/nIa7JEOhyOwMwtsS6054UM85hPg3+0u0cs/
	OCn0zb4q9DyOeVxMUnBzshBxwAxH3gwngmvHRrk1ctvi1KOJ4EOYxXYQZVHqoymqi1RH
	faBU+OgrOOSm4eLffKXZdub1I8AAkQF04X1h8YPEmKvM+TpVWmYFc641g73Z6mOKKmGE
	ywPmDATm0uMGcrAttajkldRLiQ7Hm0ePqhJIeHHsRoWYpW8GH3aeaAjHE0X4cKvq+C1D
	KSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=nP6E4Klm+BOfK8EZVZvhpy5YDHu3Y8e/gvS/zKc2cLo=;
	b=lfnepfeEd7VMTv7swa12GHQV+TYPvkfaKHMhPJXnhPpT1Lo+zR9fyMP8f26k8XK3RG
	I+ERQu+1fLwZw6RCB2Ejz3c0NGYe4OcvnKwcpnALvSnpq+mXRrW1d4sGZX3fNpGU5dL0
	3iT4QFykbBvDT9bkCTv3aRbESBLuUGHXGZQZXJL1x3l5HoUpRz2iIvFM4DVBFy8ZXQ7i
	0CBaUFDzLgwdVB8F92MQ3P2F8QjK7ZC8RkWc7+tOzZaNvuAwg5pmTz5fbz0wcCN9EMf8
	p8aFIgYIWX51L/2NCBqQ2pK0yyhBtNsoBAGHRH0+RDML70HNIKxUmOWfi1LLKP7hhhpM
	39pg==
X-Gm-Message-State: ABUngvdN7eU+qdNVzQ+bI3wCEWUbYQYWokB00iSPsi/4Mt0GyYLBryJNcxAX4FYe8NioNcT162PbxkcEtIWDBA==
X-Received: by 10.202.226.1 with SMTP id z1mr8342366oig.115.1479135830230;
	Mon, 14 Nov 2016 07:03:50 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.29.137 with HTTP; Mon, 14 Nov 2016 07:03:29 -0800 (PST)
In-Reply-To: <8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
	<8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Nov 2016 08:03:29 -0700
X-Google-Sender-Auth: znHKf9lGq6WbZ2SJIZFXhjvR0_4
Message-ID: <CABcZANn7+CW65pS-fV8d=0ju9v5YjAY64=b3=qZLnZ8C+uz+hg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] sanity.bbclass: fix check_connectivity() for BB_NO_NETWORK = "0"
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
X-List-Received-Date: Mon, 14 Nov 2016 15:03:53 -0000
Content-Type: multipart/alternative; boundary=001a11409568c0728b05414425cb

--001a11409568c0728b05414425cb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The old code:
> network_enabled =3D not d.getVar('BB_NO_NETWORK', True)
>
> It is True only when BB_NO_NETWORK is not set (None),
> but BB_NO_NETWORK =3D "0" should also be True while "1" means no network,
> "0" means need network in a normal case.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 7e383f9..c5e3809 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -363,15 +363,19 @@ def check_connectivity(d):
>      test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").spli=
t()
>      retval =3D ""
>
> +    bbn =3D d.getVar('BB_NO_NETWORK', True)
> +    if bbn not in (None, '0', '1'):
> +        return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"' % bb=
n
>

Does this mirror the same logic used in bitbake? What=E2=80=99s the behavio=
r if
it=E2=80=99s set, but to the empty string?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11409568c0728b05414425cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 14, 2016 at 7:34 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
67f" class=3D"a3s aXjCH m158634c1f9be4f74">The old code:<br>
network_enabled =3D not d.getVar(&#39;BB_NO_NETWORK&#39;, True)<br>
<br>
It is True only when BB_NO_NETWORK is not set (None),<br>
but BB_NO_NETWORK =3D &quot;0&quot; should also be True while &quot;1&quot;=
 means no network,<br>
&quot;0&quot; means need network in a normal case.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 14 +++++++++-----<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 7e383f9..c5e3809 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -363,15 +363,19 @@ def check_connectivity(d):<br>
=C2=A0 =C2=A0 =C2=A0test_uris =3D (d.getVar(&#39;CONNECTIVITY_CHECK_<wbr>UR=
IS&#39;, True) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0retval =3D &quot;&quot;<br>
<br>
+=C2=A0 =C2=A0 bbn =3D d.getVar(&#39;BB_NO_NETWORK&#39;, True)<br>
+=C2=A0 =C2=A0 if bbn not in (None, &#39;0&#39;, &#39;1&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;BB_NO_NETWORK should be &quot;0&qu=
ot; or &quot;1&quot;, but it is &quot;%s&quot;&#39; % bbn</div></blockquote=
></div><br>Does this mirror the same logic used in bitbake? What=E2=80=99s =
the behavior if it=E2=80=99s set, but to the empty string?<br>-- <br><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher Lar=
son<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZ=
aurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</d=
iv>
</div></div>

--001a11409568c0728b05414425cb--
