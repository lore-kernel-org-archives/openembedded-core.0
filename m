Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6107460125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 21:00:50 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so22203374igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=pgMnYbKU1TzVa8FZEEznTpekeYAI0kld3yWg3jVVhPw=;
	b=wm4FLsozHkVWO4cciuO8nkvpzK9vao7Ks7b334jaTK97SiJeChH/pJWmXVyMSbsaP1
	5JmF/GYM0dfWIhZEe7GGUJ+Sgm6ua8Ac0FMfUpDxfAXcWiAWgHvqU81DUMW4pWQqZ65y
	a/TP/jICxnPw/F64j1NPULYqb/KL1miNicZvsu7SYM37O3LizFiQl9Ja0yeofyOtnLW9
	BmpOSkduYILtDsAXfJudAnzFWGO1IJ7y/NZvWifzaOjXY1NUF8cPbJzC2h8TyZiOfgrG
	aYnjW90a7FoYDAcB6MFOIhl2hC7dFjED6o1Hih4YXKsNJB+JqVQuDpVTJV0GikCFVDDC
	mPfA==
X-Received: by 10.50.43.170 with SMTP id x10mr6449556igl.68.1444338051037;
	Thu, 08 Oct 2015 14:00:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Thu, 8 Oct 2015 14:00:31 -0700 (PDT)
In-Reply-To: <5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 8 Oct 2015 14:00:31 -0700
X-Google-Sender-Auth: KYS9_s_On1YmszjEfNNwxAJxFog
Message-ID: <CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Thu, 08 Oct 2015 21:00:54 -0000
Content-Type: multipart/alternative; boundary=089e01176cad77c14305219e2866

--089e01176cad77c14305219e2866
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 8, 2015 at 6:16 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>  oe_runconf () {
> -       cfgscript="${S}/configure"
> +       # Use relative path for S to avoid buildpaths in files
> +       relative_s=`python -c "import os; print os.path.relpath('${S}',
> '.')"`
> +       cfgscript="$relative_s/configure"
>

Why not just use inline python here, rather than calling out to an external
python process at task execution time?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01176cad77c14305219e2866
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 8, 2015 at 6:16 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
18l" class=3D"a3s" style=3D"overflow:hidden">=C2=A0oe_runconf () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cfgscript=3D&quot;${S}/configure&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use relative path for S to avoid buildpaths i=
n files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0relative_s=3D`python -c &quot;import os; print =
os.path.relpath(&#39;${S}&#39;, &#39;.&#39;)&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfgscript=3D&quot;$relative_s/configure&quot;</=
div></blockquote></div><br>Why not just use inline python here, rather than=
 calling out to an external python process at task execution time?<br>-- <b=
r><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e01176cad77c14305219e2866--
