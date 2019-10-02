Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A49C7C873
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:08:18 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id w195so12544754vsw.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tlS+s6AgpR+6gk9kNeQu688Js5a156VSgo86pFkqAG0=;
	b=kkXLEc+cSvMMF/o4ouz7PPaIRUuLa3w1QQrlup84NNfpZXmrL8UIMcwAJ2+qRlDq0W
	D1H50jagVdwqQN0yVC/qxEE4LTi5t3QnaCUkGVUhLW+7eBlriFONPiuHfGtdpJ0lOdi3
	KhhBA7yJneypzHIapdMNu/gezFyYywuysjGGi+O7G/GzH0qrrdjjJeTVE4Wz3ADPGnx0
	ZUX1fR5vomv3p95ZsCz77DbCxqhyh7mC4DzayIxVd1NP024Kl7yOsl4ok+YTkYkzDN66
	heiNnLOfE0XYdy8A6J0ifXsrs6gUVBA92g8EBijU51Bpe3Q7r3ydLd9QM1ibHrk7HU/0
	vK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tlS+s6AgpR+6gk9kNeQu688Js5a156VSgo86pFkqAG0=;
	b=atwe+ncqzPZ2AmRgcdQp9fQ+WOx4NrJ4KC8ZE96T2bXW07zcNGRML9zTz7cGoKo/G6
	vX/YCiuL5Muvt8C8x9GKLPWLWGDpucHCVDC3CWg9HsO4QF5VQBQKJsxWFENzN2lugGTA
	2BLMUBPtbOsjn0SELxMOIfPgxK/fhiQE3I2zDN+WfZe9z/27dZj/XbzddIpu8HjxbbAY
	Vqp1z2FDOlt/aet4V0mB851vXL/Rnbiiis/rZKpoLlQ2qHLaXZGndpDHHxbLQ1vU4QTY
	vk9VKbMcuSNGyWDJurUgjRfHDMTIQe1R57w8ooFU7nOjqNf3tI8djTX2pcLVrSf9a8FU
	xCRw==
X-Gm-Message-State: APjAAAXtKUeI78nU2BJImDzhdjAOOjEwc91yWUphSW+ACwNKK/SpIQ5c
	VA0fv8QFg0QBIMgQUGbqthLIFFPIALuZp8KIsyIvNA==
X-Google-Smtp-Source: APXvYqwpBGGAtma2kccfpVI1SXmdewfANO2zK1A2BJaNr0h67UAMRhqX/RsLhgVjt35oEC+H/zks3mfjpOhpE63g5hc=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr2612891vss.94.1570039699534; 
	Wed, 02 Oct 2019 11:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
	<20191002175152.GA14877@localhost>
In-Reply-To: <20191002175152.GA14877@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Oct 2019 20:08:08 +0200
Message-ID: <CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 18:08:19 -0000
Content-Type: multipart/alternative; boundary="00000000000092f62a0593f15a53"

--00000000000092f62a0593f15a53
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2019 at 19:51, Adrian Bunk <bunk@stusta.de> wrote:

> Works for me without your patch:
>

I am not sure what this may mean; but for me the patch definitely solves
the problem.

Alex

--00000000000092f62a0593f15a53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 2 Oct 2019 at 19:51, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Works for me without your patch:<br></blockquote><br></div><div class=
=3D"gmail_quote">I am not sure what this may mean; but for me the patch def=
initely solves the problem.</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">Alex<br></div></div>

--00000000000092f62a0593f15a53--
