Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AE376601C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 13:49:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u6so2859296wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0X6e6lXYNnC4q3Tg2JNIh5tlEk+Z90VPF8rrmkGjo4U=;
	b=Ihc1BYWcfEm45o0lSf1beuJVJN4LiF1ftNF8OEWXzhiAaEx2x4SXyL3nwtX/HVmrsh
	mEUifnwJePoSQeSjTP+6NLjAOe1N7okcnR8U0plk6gNuhsLtUAC1iIARF8ado97wiGhF
	V+9E/Z2WhACbClry/fKRlr21LE70ENut9Qqf5+yA1Bha2g6m1eeS7PxmLSgkI5v1lHBv
	oeixOQEPxcADOLuZNfInTdno6pIvutB8b4tKKC9mQVzbe9ezFfJ/fqqSCAlKOlAdVB1v
	uhNc7uMhvEE6Dk8dRpOTnIKnfyYvQzzwlfw/XKX3Ywhvc1kZZp2tnSkMr9aOVVO1PYHM
	XQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0X6e6lXYNnC4q3Tg2JNIh5tlEk+Z90VPF8rrmkGjo4U=;
	b=jJZdSKtsshizkSewTJn2p1bwFCObUmq17A5oQlFUW+ron60CZQcyJq+mjzPE6qYGQl
	QvRgvnv3AUz8y9NELYy0nyEYMiDXw5eiCqpEhNKBEJ2bYBOMDnKrnLThTE4Y8TaazgjI
	4iEPcZZMHXu8zcMWsglbNy89/M8hGX+ORF7T7y2S+XxdefRlalpdaR6fpNR7lScsgMir
	Y5pLqzonswk837QzhduRomSIVJAkNY4GMPx/4WFLRad4O0OhmrAT5Tcr7/nX2iAImjmx
	3MaxrStl9S4DbQjZW0z1gLE0JPy8sDfbTknxWaGaaKHokGWuhwWTmhxF+Yck5bvC96lc
	fWAw==
X-Gm-Message-State: APjAAAU2dLh9tl/SAnNDd/cAMqVP059hqIabh1YZVTj5L0hzw/uM1jhU
	B++GlRAtxLYFPO6iXZ/AdA+AdOuunFdU+GIwOi5QGg==
X-Google-Smtp-Source: APXvYqzRnKzecAi2vuaaDmQG5UB43zIbcGPOK+rH8kn9ukT7GLogfcc+YMsfowCUDZzZ8Ezd5Y1HtSdRhoyEzHfAYMY=
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr27886691wrs.303.1580910578292; 
	Wed, 05 Feb 2020 05:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
	<20200205121151.27880-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200205121151.27880-2-richard.purdie@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Feb 2020 07:49:24 -0600
Message-ID: <CAJdd5GZaiH=z9K7JJvYH9BmiAf_VHyR9avzT6M4jK5LwUX3QZw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] oeqa/reproducible: Improve test output and ensure deb+ipk compared
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
X-List-Received-Date: Wed, 05 Feb 2020 13:49:38 -0000
Content-Type: multipart/alternative; boundary="00000000000070db79059dd46dbe"

--00000000000070db79059dd46dbe
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020, 6:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Adding newline characters between the packages in the failure output
> massively improves readability.
>
> Also ensure to output ipk failures when there are deb failures by
> calling self.fail() at the end, else sometimes only partial differences
> are returned.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 04dc46f38a0..f6433c9a02b 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -185,6 +185,8 @@ class ReproducibleTests(OESelftestTestCase):
>          # NOTE: The temp directories from the reproducible build are
> purposely
>          # kept after the build so it can be diffed for debugging.
>
> +        fails = []
> +
>          for c in self.package_classes:
>              with self.subTest(package_class=c):
>

It too bad subtests are broken. If we can't handle failed subtests, we can
remove this line that creates the subtest in the first place.

                 package_class = 'package_' + c
> @@ -208,8 +210,11 @@ class ReproducibleTests(OESelftestTestCase):
>                          self.copy_file(d.test, '/'.join([save_dir,
> d.test]))
>
>                  if result.missing or result.different:
> -                    self.fail("The following %s packages are missing or
> different: %s" %
> -                            (c, ' '.join(r.test for r in (result.missing
> + result.different))))
> +                    fails.append("The following %s packages are missing
> or different: %s" %
> +                            (c, '\n'.join(r.test for r in (result.missing
> + result.different))))
> +
> +        if fails:
> +            self.fail('\n'.join(fails))
>
>          # Clean up empty directories
>          if self.save_results:
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000070db79059dd46dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 5, 2020, 6:12 AM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Adding newli=
ne characters between the packages in the failure output<br>
massively improves readability.<br>
<br>
Also ensure to output ipk failures when there are deb failures by<br>
calling self.fail() at the end, else sometimes only partial differences<br>
are returned.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfound=
ation.org</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index 04dc46f38a0..f6433c9a02b 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -185,6 +185,8 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# NOTE: The temp directories from the rep=
roducible build are purposely<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# kept after the build so it can be diffe=
d for debugging.<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fails =3D []<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for c in self.package_classes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.subTest(package_c=
lass=3Dc):<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It too bad subtests are broken. If we can&#39;t handle failed sub=
tests, we can remove this line that creates the subtest in the first place.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_class=
 =3D &#39;package_&#39; + c<br>
@@ -208,8 +210,11 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.copy_file(d.test, &#39;/&#39;.join([save_dir, d.test]=
))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if result.mis=
sing or result.different:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.fail(&quot;The following %s packages are missing or different: %s&quot; %<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (c, &#39; &#39;.join(r.test for r in (result.missi=
ng + result.different))))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail=
s.append(&quot;The following %s packages are missing or different: %s&quot;=
 %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (c, &#39;\n&#39;.join(r.test for r in (result.miss=
ing + result.different))))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if fails:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;\n&#39;.join(fail=
s))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Clean up empty directories<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.save_results:<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--00000000000070db79059dd46dbe--
