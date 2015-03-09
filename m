Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 75D967393A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:07:04 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so29524931qgf.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6TcX03fmJScOwdHbm8d8pAusg+L6Kn8FNIbmZBMo338=;
	b=eAEsYTLNB9Ay29z39bk4gjeAPpCsoBWzbvrBgRl9eVp5M1SiGieLIk41fvBMhMvaMb
	Vh3Lz0fn5Qh/RWrNakbfdbSI64uN0zjw8YkI+1Pz3wXay+8ZhPEu8W3+j021DfSEhsTE
	+mJtXBtFjfpA+4KT3dRjAngEuDCed+MMZ6JkrF5YrA8tHz7LembLupEOZk5iGZrB9ZF/
	SlDOPWZC/dcBk/6GGYecx6AnvcYqIRHa+c+5J+OZ6etpxs9BNuyOMHTEoPnESLPBCwks
	+zIxmXze3gb1nEmCOsQXItzCfo3YNCViPIPIg3m0ZGXc2W/rHJigztDqE2wSLZ6K6v2H
	yz2w==
X-Gm-Message-State: ALoCoQlnRa+joJwH/VKFFqRVRRWlfUBIv5n6eeVRDJ6PX0K6opHAaGvSCoqT2PEJJgAnX5ZUyWtr
X-Received: by 10.229.28.9 with SMTP id k9mr26661126qcc.11.1425917225636; Mon,
	09 Mar 2015 09:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 09:06:45 -0700 (PDT)
In-Reply-To: <C089D3E9-4157-4FCA-B39D-7A3FF80B97D2@gmail.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
	<a27ea935811250778c8d581dbe107a7151b2ac5f.1425885208.git.liezhi.yang@windriver.com>
	<C089D3E9-4157-4FCA-B39D-7A3FF80B97D2@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 16:06:45 +0000
Message-ID: <CAJTo0LZQFif9FAnFA0XAwQWPL2pnYD+Wg7PTC1i34hnzswg=pQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] net-tools: fix SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 16:07:05 -0000
Content-Type: multipart/alternative; boundary=001a1133ba9ab6af430510dd392e

--001a1133ba9ab6af430510dd392e
Content-Type: text/plain; charset=UTF-8

On 9 March 2015 at 16:03, Khem Raj <raj.khem@gmail.com> wrote:

> it would be nicer to use
> http://archive.debian.org/debian/pool/main/n/net-tools/ instead of
> snapshot.debian.org through out this series
>

Apart from that 1.6.0-25.diff.gz isn't in
http://archive.debian.org/debian/pool/main/n/net-tools/.

Ross

--001a1133ba9ab6af430510dd392e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2015 at 16:03, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><div id=3D":7fb" class=3D"" style=3D"overflow:hidde=
n">it would be nicer to use <a href=3D"http://archive.debian.org/debian/poo=
l/main/n/net-tools/" target=3D"_blank">http://archive.debian.org/debian/poo=
l/main/n/net-tools/</a> instead of <a href=3D"http://snapshot.debian.org" t=
arget=3D"_blank">snapshot.debian.org</a> through out this series</div></blo=
ckquote></div><br>Apart from that 1.6.0-25.diff.gz isn&#39;t in=C2=A0<a hre=
f=3D"http://archive.debian.org/debian/pool/main/n/net-tools/">http://archiv=
e.debian.org/debian/pool/main/n/net-tools/</a>.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133ba9ab6af430510dd392e--
