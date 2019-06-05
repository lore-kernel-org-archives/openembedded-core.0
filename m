Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB9776C135
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 10:09:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r21so202989otq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3S9DAAzU9e/SbdZEGJ9ys5sWf0lnVXODynIzqoiVqi8=;
	b=DX625gEKdMVSXPfETBqyTyQiX8qws+zimNU6oSTPU9HAbO5cUMc/dm2khklAPqAn75
	cLmC+Mf8xvaltU7XNMArVwEZd1B0PXfKfsrGK/sycS1UjoFGL2J8f44cYpFlY+gMRGKv
	GedY+pknBf47QQru/mi5fEl61bkXw8IX/vTD+qfiaQW7aPo4QDAa2VHFFxRDvGoZj1+i
	CSdGhEpp318iU3Twvqp0jVt/ys3f7T8PHCxmwhbl/tCpOXBDGuR3E3Mjy3LFxeVtxriZ
	TYfNVkB25gyuvdiesx0waX//+mTMa9KB+SGJEkdd2HrJQzMzno7EUsoCyQuxi6h2znnF
	VBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3S9DAAzU9e/SbdZEGJ9ys5sWf0lnVXODynIzqoiVqi8=;
	b=muD9r3ltPDrHpzgia1hGXEw33q2xgpPMvZ3moF3YlsDayrY2SDJHfMai53f1R9NYoq
	uSD2N+VPq3doGFreHC+KXVCU9gQLfc4VZuqagON0mEc4jzWjqMrDMh0JU0sXWlyYQJ9y
	39gOb4VJNsyoQgYR9ppo6Bpzg97OK8UiaSL7IhdC/HyopD2MRhwYlKKzgOv1Pkz091+b
	f2NmHjKqc7/tg5DEOLVSieWhpzYECuDivAnPsEI5AwKme7tm1GTeUR8S6bBK8jU1iYJu
	GOPmS9MOK35jdBHbXUQXoy3B9+2XQ3BbZeYxZaSRDwowHXQx/GmDMoV6wvlbiNXD1Nxx
	vwAw==
X-Gm-Message-State: APjAAAWxrMs1csZAWn5TlCfnpE+M0zgY4WJP6xcXihI4dNuIgFUHj18C
	ck83BkO6E2o69VNScD8cKM9qCEMTYfKyEvVihgY=
X-Google-Smtp-Source: APXvYqyJwt0CDupMaK+pOc55/aLptPgj2ApPZ+7SZ8cLGPeNAZiKGiUIdC9kb6xOTxIAv9xLejFwXyuvCfsmuuQv/zs=
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr3927025otf.61.1559729377856; 
	Wed, 05 Jun 2019 03:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <1558750911-37622-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1558750911-37622-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jun 2019 12:09:26 +0200
Message-ID: <CANNYZj8usRkGAYvmtOeNyDoNYLOMaDa95G=LVziKOB1RYFwErg@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] createrepo-c: Fix build QA error for nativesdk-createrepo-c.
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
X-List-Received-Date: Wed, 05 Jun 2019 10:09:36 -0000
Content-Type: multipart/alternative; boundary="00000000000083537a058a90cbc0"

--00000000000083537a058a90cbc0
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2019 at 10:21, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> "QA Issue: nativesdk-createrepo-c rdepends on nativesdk-python3-dev
> [dev-deps]"
>
> +INSANE_SKIP_${PN} += "dev-deps"
>  BBCLASSEXTEND = "native nativesdk"
>

This does not fix the issue, but merely silences it.You need to look into
the actual problem.

Alex

--00000000000083537a058a90cbc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 5 Jun 2019 at 10:21, Lei Maohui &=
lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&quot;QA Issue: nativesdk-createrepo-c rdepends on n=
ativesdk-python3-dev [dev-deps]&quot;<br>
<br>
+INSANE_SKIP_${PN} +=3D &quot;dev-deps&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
</blockquote><div><br></div><div>This does not fix the issue, but merely si=
lences it.You need to look into the actual problem.</div><div><br></div><di=
v>Alex<br></div></div></div>

--00000000000083537a058a90cbc0--
