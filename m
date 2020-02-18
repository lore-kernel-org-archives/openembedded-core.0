Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id 925F9613E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:43:59 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id 59so7683456uap.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 08:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=/cu/W1XGJfkd2PnVSt5Wj9ms+pFkqZKvHZCJEWk79zA=;
	b=b7Jvginpyfp4FbKiFI9TB1t/eE4BprsrrO1Aa0Ekqz79+oal+e0a7lDhTP76g2T5/w
	vxR6bXLgjr9yLOit5TDD6NLSnMuoLaIdSjc9B/5PwCDr1btMghpSWHurjgU4hAohnAJ8
	Fvi3OZBZG8aUSGkT6lDABRbj2WC4mG89jps2FRir8swSB1Hn3dLmg7oSQg7MPAJj2g23
	K4Z4tPtAYKcJPJSVFDMzThS43731jjkT1eYcVABs8dO0cZ39a8sYZJdVRsCQ+yMhT0OH
	QqD4z547qfbWhyoPLScJgIChSqZFt06fQsEp7xJPlfZ7j80lSYbQ5TAlWvTmWo/ycTnZ
	Ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/cu/W1XGJfkd2PnVSt5Wj9ms+pFkqZKvHZCJEWk79zA=;
	b=i2H+nedZuuR9ycICtlQCF7bwmp2y9g4DCS4TUIP26RPHceSZFuLNsmpIfr2VHjefN1
	lxOhL5kkhCh6idUoD3L0+PrrQf+EM9FEK+qpdRsRlEZLJad3uTmQRFa4Tvp4Y9b827NJ
	wePk5RPj7MNid6IxgI7E+LWTXsVRWwWPSKgDWF8hO1M+MaX0WD/b4McuuRA3t/g2dWIk
	FZXkAkAWmV4MTDBaaw5t/MNIQ5wVbQBFcFfWeBscL5uSY9epeDzk4V9x2cn7V3Lj2Jty
	jwbWaBb+JgbxUsGEmqFZRkL+ydupqqHfadJ7hI1S/6vOuoFIANyX18+C3xBjje4XyQwU
	6Xqg==
X-Gm-Message-State: APjAAAUkK+csyJqOiGVqUo8PWQyGiugscXREsExjnruWol9yw+xD3Dv1
	mXgTzmddx0UCB4ZmEhvECpUZZukCv8RDyFhkkms3vQ==
X-Google-Smtp-Source: APXvYqxVYFBK7dPWhRcfrH6T1+am885R+yegAS7jhEecjMCdBfzgBNypPX17wkrOg8dA5dWTweGZXil9RTACh+Clf0U=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr11221066uaq.100.1582044240463; 
	Tue, 18 Feb 2020 08:44:00 -0800 (PST)
MIME-Version: 1.0
References: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
In-Reply-To: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2020 17:44:24 +0100
Message-ID: <CANNYZj8GBXxLdM-TQ6TukuLMGPu167ZqL9f-nNmG21rrkMNJ_Q@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW07'20
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
X-List-Received-Date: Tue, 18 Feb 2020 16:44:00 -0000
Content-Type: multipart/alternative; boundary="000000000000f8cb95059edc6003"

--000000000000f8cb95059edc6003
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2020 at 17:10, <sjolley.yp.pm@gmail.com> wrote:

>
>    - With the git infrastructure issue updated, we now have centos8
>    workers added to the autobuilder.
>
> What are the current plans for centos 7?

Alex

--000000000000f8cb95059edc6003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Feb 2020 at 17:10, &lt;<a href=
=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><d=
iv class=3D"gmail-m_-3817875072500115690WordSection1"><ul style=3D"margin-t=
op:0in" type=3D"disc"><li style=3D"color:black;margin-top:0in;margin-bottom=
:0.0001pt;vertical-align:baseline"><span style=3D"font-family:Arial,sans-se=
rif">With the git infrastructure issue updated, we now have centos8 workers=
 added to the autobuilder.</span></li></ul></div></div></blockquote><div>Wh=
at are the current plans for centos 7?=C2=A0<br></div><div><br></div><div>A=
lex</div></div></div>

--000000000000f8cb95059edc6003--
