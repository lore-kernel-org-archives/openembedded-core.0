Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
	[209.85.222.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0EF7E963
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 11:17:14 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id u18so4144077uap.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=69N4K75oZ5qddMh6ldbjnP0L3k89z2JsrhZkfamsHRc=;
	b=LaoUBCsr8gZzN2fkU1C34V1mMnxqjwHrXp5HaYI4+R/EvmYP55OIh/g1lX3S6ir4z0
	+FQ+ZNa1zGg534Aq/FEBopJ62jTP3UbEm7Ajx9mze+RmIl7TrEUxqhEIEBHhWpxnKXKc
	oLbfcgk/Hof3x4N5Q1xM0UPH0LOWKs1UlO/SUxxm7UKf1MTG5KTxwi1KAtnv4A6DGq+N
	XIIW8G1D2SqLw56IlV27OGGjzCptTayBbHmsTFBtZa8JpMjXtUjAmG+MSCJPIic0E7Gd
	OCjZUJSIE8mFtknpg/Xcme37DV6WJOYCE0MzglsfmH1A1d6vQN+QdWmuNW+ONRFl0cw8
	DJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=69N4K75oZ5qddMh6ldbjnP0L3k89z2JsrhZkfamsHRc=;
	b=OLtZCwmuFtKUrkPoHr6JhqZYcqfEaMbTpUbq5LsWmo1bclvmfjk0OyEY6oD3s0aEc5
	/XWXJJFS+T2lASTq35yl3FN/gUrfYyfyczWD0vHeI3z8+KDAkjsYVuHmrs2Pj5frXAsT
	itP0s9fxxx00zVHobGF/GR+GCZFGwlK1+OCu/pfdDBCV4Zd3OwmdTgACFzfckuEIDBJp
	N2x96TOalCq4FzWO97U29nBBqEnD7W2RfYJM/K/iR4+6tqvGlHJO9LmDZowSa2aUD4ZQ
	MaNNBkS7ATimMcYJh8nhVzFBplHtJjTsp8b5PvOKMNOiE9+0h2yiezUOj8GPyrBLUxHU
	vbNg==
X-Gm-Message-State: APjAAAWjty7ILhl+71EjYWjdB2LOxTgw8uFpFA6ZlDj5tvjRm6LmwQjD
	22kXPRWWgEn5EH19+0BsN57aDE6wY+2kmD7U8yI=
X-Google-Smtp-Source: APXvYqxhFzoezRQTaFrlXOcH7bct1z+pKoCnJmgEIxoscC82rGtcKHcw9YrW3hVPEJl8FGGRv5eMOk/Hp/1UeSa+wiw=
X-Received: by 2002:ab0:7097:: with SMTP id m23mr10443479ual.89.1568027835905; 
	Mon, 09 Sep 2019 04:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E17B@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E17B@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2019 13:17:04 +0200
Message-ID: <CANNYZj82T4xpV+QywFF8=QYU3TVNercWX2MyGce7RdyGtFWhBA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Mon, 09 Sep 2019 11:17:15 -0000
Content-Type: multipart/alternative; boundary="000000000000283a8405921cee85"

--000000000000283a8405921cee85
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sep 2019 at 13:08, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> I'd like to explain the path ${SDKTARGETSYSROOT} in this patch.
>
> As you see, ${SDKTARGETSYSROOT} for x86_64 is
> /opt/poky/2.7+snapshot/sysroots/core2-64-pokysdk-linux.
>
> I make it because config file in host-sysroot as
> /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux  will be covered by
> another ARCH.
> For example, first install SDK for x86_64, and next install SDK for x86,
> as host-sysroot is same, the same config file will be covered. In that case
> config settings for x86_64 will be inefficacy.
>
> To resolve that problem, I put config file in target-sysroot like
> /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its
> own target-sysroot, config file will not be covered.
>

I see, thanks. Can you add this information to the patch please?

Alex

--000000000000283a8405921cee85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 9 Sep 2019 at 13:08, Zheng, Ruoqi=
n &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujits=
u.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I&#39;d like to explain the path ${SDKTARG=
ETSYSROOT} in this patch.<br>
<br>
As you see, ${SDKTARGETSYSROOT} for x86_64 is /opt/poky/2.7+snapshot/sysroo=
ts/core2-64-pokysdk-linux.<br>
<br>
I make it because config file in host-sysroot as /opt/poky/2.7+snapshot/sys=
roots/x86_64-pokysdk-linux=C2=A0 will be covered by another ARCH.<br>
For example, first install SDK for x86_64, and next install SDK for x86, as=
 host-sysroot is same, the same config file will be covered. In that case c=
onfig settings for x86_64 will be inefficacy.<br>
<br>
To resolve that problem, I put config file in target-sysroot like /opt/poky=
/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its own target=
-sysroot, config file will not be covered.<br></blockquote><div><br></div><=
div>I see, thanks. Can you add this information to the patch please?</div><=
div><br></div><div>Alex<br></div></div></div>

--000000000000283a8405921cee85--
