Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 576EB73002;
	Mon,  1 May 2017 12:27:27 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id c15so12235385ith.0;
	Mon, 01 May 2017 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+dBbU2tlu0ftlmm8DxydolS9lQLM7lveZxeNAzrHAPU=;
	b=uOei7JSpdboO151XTpPPdVdaI5T5WdIJ0PWcuzzA/onP7wI9jQF8uXL1+V/+FtM7Eq
	sFN34jGNVHtV7DrzxMwpTf5QxzPz1HyNwzmJAfSHP6r9XewZsy8Slpn5AoXHt1BwHE7E
	pMQl8gxmMPmbHfv6RMzClwJ+l91q/+kXdT9VwFQaXQxhn5hddRLBnKCKSFDNVbShzrNx
	deevRc4bSz201kvRgoO7deu9IljciIW6IRT7FX4n6jlcqXIj4Fm/EDi1nKYPtcLWmhB4
	BEnvJ3LUpKgsYfAsokIMI1ho5OK8/yZ+cbl9euZBkHz8qSOwjJkk/yskdgyLu2b0zwrL
	B8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+dBbU2tlu0ftlmm8DxydolS9lQLM7lveZxeNAzrHAPU=;
	b=hf8KeKOcFiRHs+tSlv5v1FBrS3xypQKIBpqCRecXjDHLm00nyF4/gRaQOI/eKkTxN0
	7hL/HFfzQ0ENvUxtZOiMJs171e6Dhf6D3/GBRf2bzQXpr8AuLJqEoBOKoO8acKIoN7S5
	S200cDwudatGSM4SPJHxUagig47UxnRLNKKj8/S74AfKgb1pRJnO2X9nR2GsQciuVdOC
	totJypiFgUICI9LDWtnCLfGMHd/LW58lWuje8A/5WxJY2xJx9eFZyPoPQo35MTZ+/oUx
	om4doUYAIcSkfYns1RktnjYHrsrjryuxLclljJ6CQj7J0Zi2jc9A06L5WshnV8MHBEiW
	wLig==
X-Gm-Message-State: AN3rC/5AOYP5WztihSCM8H7zklx16BbUnNNt5qEw/fFYcWq5gbmcVXG6
	qNtdkqqhWd4jFjiIsw6GgSRPBYn4pQ==
X-Received: by 10.36.152.196 with SMTP id n187mr22509415itd.28.1493641649141; 
	Mon, 01 May 2017 05:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.193 with HTTP; Mon, 1 May 2017 05:27:28 -0700 (PDT)
In-Reply-To: <CAK18fxHA0p6x7pwU_WAnpv7bvOCX6XXFP-QWLkAJhxQfVuKczQ@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
	<CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
	<CAK18fxHA0p6x7pwU_WAnpv7bvOCX6XXFP-QWLkAJhxQfVuKczQ@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Mon, 1 May 2017 21:27:28 +0900
Message-ID: <CACrLJgCLGakUOX64VgG2oGjHF2v9WAZaR3b3Lk_E3_=w3LHF4A@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [Openembedded-architecture] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 12:27:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c05e9a2eb40a6054e758b25

--94eb2c05e9a2eb40a6054e758b25
Content-Type: text/plain; charset=UTF-8

I can't edit the page.

@Martin, Could you add me (Changhyeok Bae (chabe)) in there?

Thanks
Changhyeok

2017-05-01 21:02 GMT+09:00 Andrei Gherzan <andrei@gherzan.ro>:

> On Mon, May 1, 2017 at 12:59 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > I had to change the password on the login, but then it worked for me.
> >
> > I've added Andrea and Andrei to the list.
>
> Thanks Martin.
>
> --
> Andrei Gherzan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--94eb2c05e9a2eb40a6054e758b25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t edit the page.<div><br></div><div>@Martin, Cou=
ld you add me (Changhyeok Bae (chabe)) in there?</div><div><br></div><div>T=
hanks</div><div>Changhyeok</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">2017-05-01 21:02 GMT+09:00 Andrei Gherzan <span dir=3D=
"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@ghe=
rzan.ro</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Mon, May 1, 2017 at 12:59 PM, Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; I had to change the password on the login, but then it worked for me.<=
br>
&gt;<br>
&gt; I&#39;ve added Andrea and Andrei to the list.<br>
<br>
</span>Thanks Martin.<br>
<br>
--<br>
Andrei Gherzan<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-d=
evel@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>=
mailman/listinfo/openembedded-<wbr>devel</a><br>
</div></div></blockquote></div><br></div>

--94eb2c05e9a2eb40a6054e758b25--
