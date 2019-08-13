Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECA56C1C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:03:30 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id c4so15150734uad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HOT677LQT/PgUxshy/0mFm78/O/CANpysTrwWC6bwRQ=;
	b=u+Fz4JsKOm6IiKV6P1CI/M65J1cjla2ZPIf8kzeadLndIMbVuJ65R95SCZtyWngkTl
	5k8CM+JQ1uzHBSNfSpswmRT8S0vFUV/Uxr83z/+Iv+9pPxXQBj8cl8v2Hs5bwGU2TeCG
	+VWf65HEkSQqZfciFRteBiIngZdNFWoXHFCBa472zbayYCnyzKmUXQe+4X+43noWlmfX
	JuNW9QHRvvID66FTuxTX3Jy1fNYw8VKDoH6qITMKqWY/wNdrBCpuqd5xzgt29VMoHyvC
	pVJryBX7zs+JMR11kVN+jXi20/gvnCS+4IKCD/dym9WLEk7MSACWrUl5kNn3Cgn8lInD
	gijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HOT677LQT/PgUxshy/0mFm78/O/CANpysTrwWC6bwRQ=;
	b=jUDf7+q5GSUlNt1Z+kmPlL4GM5W/KEuDovlkD2OEqEo/AtDpG8z+T/7Ff7NGf4aedt
	izAA0TNS8JrUlGBGRs89rlDMJwpDXCn/7E833DjidTh+/PeRRg3hVxMdYOAbYfFnorGv
	BiWWpQ7M47lfRAt+QqFZLHkFb3rEi1uLBMBnI6qaIRb/+t2SJww70kz/wgq9LJkPbZBP
	G6ofgcMTHdPVpK0vzGPnHMbEIal/DJ3k7dF2XtS+OiHhDQQFvKjx8JW4oQUxpwi+H5h4
	fqfcL6DXA8knYeNp1RI1a6+2QZza7oVkm8Q79MVMcSS04ESjvXLklPP5wx3IliQtTbz/
	LnGw==
X-Gm-Message-State: APjAAAU7amMGW+gRfpX2Dx/R207GNFX0JtctcV0ePov826M0AJBbhXXx
	K9Y5AxZeORYYBJwURnw88k6koGnMnhb4zC2kkwfgPw==
X-Google-Smtp-Source: APXvYqwCSAlsZOC9+gDT4w0c6YA1rKu+RLIbKaX+YuA1QbebgcK96x5TxkP2DT8ZzRPFzEnZixgOunuKruKHILiiG78=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr7215321uak.71.1565726611155;
	Tue, 13 Aug 2019 13:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190813195239.30048-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj8iGTPsJ9jJL70o9xfs2JKAikWrxtbmoBB_xQ-ZLMkzqw@mail.gmail.com>
In-Reply-To: <CANNYZj8iGTPsJ9jJL70o9xfs2JKAikWrxtbmoBB_xQ-ZLMkzqw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2019 22:03:20 +0200
Message-ID: <CANNYZj8-efyfDTjsO-o10PEVDYvuFBx9DAM2+Uk12jM6vhhUTQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xrandr: update to 1.5.1
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
X-List-Received-Date: Tue, 13 Aug 2019 20:03:30 -0000
Content-Type: multipart/alternative; boundary="000000000000792d680590052283"

--000000000000792d680590052283
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019 at 22:01, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 13 Aug 2019 at 21:53, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
>
>> SRC_URI was moved from xorg-app-common.inc, since it has hardcoded file
>> extension (tar.bz2), but upstream stopped publishing tar.bz2 archives
>> for newer versions of the packages.
>>
>
> Should this be rather fixed in the common include though? I took a brief
> look here:
> https://www.x.org/releases/individual/app/
> and it seems like we can switch to xz for everything or almost everything
> without much pain.
>

Nevermind; only xrandr provides .tar.xz. I have confused that with gz :)

Alex

--000000000000792d680590052283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 13 Aug 2019 at 22:01, Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 13 Aug 2019 =
at 21:53, Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kr=
avchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">SRC_URI was=
 moved from xorg-app-common.inc, since it has hardcoded file<br>
extension (tar.bz2), but upstream stopped publishing tar.bz2 archives<br>
for newer versions of the packages.<br></blockquote><div><br></div><div>Sho=
uld this be rather fixed in the common include though? I took a brief look =
here:</div><div><a href=3D"https://www.x.org/releases/individual/app/" targ=
et=3D"_blank">https://www.x.org/releases/individual/app/</a></div><div>and =
it seems like we can switch to xz for everything or almost everything witho=
ut much pain.</div></div></div></blockquote><div><br></div><div>Nevermind; =
only xrandr provides .tar.xz. I have confused that with gz :)</div><div><br=
></div><div>Alex<br></div></div></div>

--000000000000792d680590052283--
