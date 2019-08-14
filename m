Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 26E056C4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 12:43:37 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id 34so4999765uar.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TZzgAUf+H05RAXoc7o4qpQvb2KHTt3OjJHDLRZasH80=;
	b=hd5Mq299kTpb1EXj1iz1aUACp7B6NLZOupkZT7UjIiXNP2LSvpkRQ+50jKNhD/EhMg
	KCEIJtqXNfG66ojd3Nqd8/g8AAXPD1Pl/LKWEP3xwCUtFnmJOYZOsfGEWJSyIApBOUp4
	FpoURFozY9pCMITtt1Vps5G2zKv1n6WxuYs9DraV6x1UgOmFlX9UwMxhCyJlKlZ3BUEB
	MLbqlRO1B1PMxrHfT7S1Bap3fBBpduEOx8TP3HXbdrDUbLSycCx2IDLMN0lFIipN1SRe
	myCAHXAzZ/mVNttrWoF6cgStflmp36eGr0sC3K40JyZ8LAzGYLb5WwD6OlxacQSiko81
	u60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TZzgAUf+H05RAXoc7o4qpQvb2KHTt3OjJHDLRZasH80=;
	b=rGiz0HQKMlGDLrSi/nLOaYyQaho5JafRFgNPPcOOPPiOjPYqUSy5USGto5WKCneg1+
	FxpLTg2vvUpbPya2ANCyUNE0b3ceaZBopYXuzlpCVD8HNkIqMv3FnBQogXJXUa5+kDA8
	H8MU54bxGuqaMb/31o/Dsli+9Os5uZcLwBjFSDYuk1LSnSCly4G94lDkKXcUkdnI9sF6
	AZrLgWAwq4uUIo60/x+51vRf1mCLZeK5vBnncq52J3fANHEYm0qSE3q0I7LBkaEe3jAh
	HDLK7X5JHVxgir/pi2/nome5yCmWJLndl/KTza8pNsJiLXMIGhX6qyBBPXJHOQ0kdXmy
	LOng==
X-Gm-Message-State: APjAAAU8zaAchUHwExZUgFx2eM1EwjpPNqP3R7nt3/xNkVTDy5N8r+bc
	C7hYJDi+kbiKKukjc6G2eY5r2P7YhDcAy9f3aZ0=
X-Google-Smtp-Source: APXvYqzDj2B4049visRyP9aPe66zje1QFWrhuq/bnezL+Qd7a+AluJwN5o1KJPkIRntIb0zKS3yAG9Suh1dGvvrR9tw=
X-Received: by 2002:ab0:30ae:: with SMTP id b14mr1404368uam.22.1565786618938; 
	Wed, 14 Aug 2019 05:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
In-Reply-To: <CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 14:43:27 +0200
Message-ID: <CANNYZj8W67SPznR4QWHgd1BJG7nWYqniPdhEYu47TeVnXjd90A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 12:43:38 -0000
Content-Type: multipart/alternative; boundary="0000000000003747d20590131bed"

--0000000000003747d20590131bed
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 14:08, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

>
> This might sound slightly crazy but can you try commenting out this
>> line in runqueue.py:
>>
>> logger.debug(2, "Holding off tasks %s" %
>> pprint.pformat(self.holdoff_tasks))
>>
>> ?
>>
>
> Even crazier is the outcome: it helped! The whole thing completed after
> 15m49secons (with much of the time going to the empty task spin), that's
> some 3 minutes slower, but certainly it's usable again.
>
> I have not enabled the hash server at any point.
>

I need to clarify: this was with current master
(18b8e2e10494d3b0e18743a1bf9e99038da4229c), not master-next.

Alex

--0000000000003747d20590131bed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug 2019 at 14:08, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
This might sound slightly crazy but can you try commenting out this<br>
line in runqueue.py:<br>
<br>
logger.debug(2, &quot;Holding off tasks %s&quot; % pprint.pformat(self.hold=
off_tasks))<br>
<br>
?<br></blockquote><div><br></div><div>Even crazier is the outcome: it helpe=
d! The whole thing completed after 15m49secons (with much of the time going=
 to the empty task spin), that&#39;s some 3 minutes slower, but certainly i=
t&#39;s usable again.</div><div><br></div><div>I have not enabled the hash =
server at any point.</div></div></div></blockquote><div><br></div><div>I ne=
ed to clarify: this was with current master (18b8e2e10494d3b0e18743a1bf9e99=
038da4229c), not master-next.</div><div><br></div><div>Alex<br> </div></div=
></div>

--0000000000003747d20590131bed--
