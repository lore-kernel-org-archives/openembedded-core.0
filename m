Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECB8780F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:32:05 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id k192so9825322ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qiLkM/LUDbkeiC7kBkAog5VCmgYkK/XnELL8vuaecRY=;
	b=WqlAEFdOfDESIYMLFHtIXDZ5964Sk6+fO+jBmTdG16N3gzabBpdfHZS8pY+TCAjL33
	ogUQxxWxsiknRKS9zufhspC7WZF92PreSCXKBBnGKjs9LU7CTl8v1e4X3OGelqN83k8b
	RL2g6z3OjsepgoO5AdE5V98UP5yufF285ZCSwvbHKV4fjzPZecJDavaOgUvYGR9Ngujy
	c3++swr8fcDYf8u9uCdur18JsHoCTkifvT4z+fpz8cYFquoXwauGXlTPgJdS9NdEhOH6
	6FZ0pjAhuZtllIx930rGX3RencCCReC37DssmMOKw6m6myJ1CbeNv3EC6zMgVkSX6mzJ
	o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qiLkM/LUDbkeiC7kBkAog5VCmgYkK/XnELL8vuaecRY=;
	b=KaZVEYaFJ/gb6oJekyfKokLjBIryAn004+fwV4+a5kehqbLyl3ED1ukervivjNgx6i
	w0MCzZRSf5RXuBM2UulksabZrrxXh6gy/U3Zg8cFXBPVYdo8X+KP4P89p0zrYbSCaF0M
	bwdSWQxHH4/ayfl1a4Mwwu4LRPbS9AbdQ6NBboOiEV+QFUlhR2C0g+2/zp661uUSlzBf
	RaJzlZoF6lAQWbMpPnXJW/YDPU6EJhRLHD3syFqhnBT70c3P6PtnqxVjUZ4NemK9EXDJ
	icWuPFC/WRy2azX28Lv6PaJeTZFtTi0kKfZjmxBOJ1LzcOIbiZN68Fq+xdjL+omgvrdu
	msnQ==
X-Gm-Message-State: AIVw113+V1ZAIFUu2vvZ1/eiL1Had5MG/pikdPaymgKL/hqENgb7Gdjs
	ID7UXETY0WphR/LRPw8Dhje0mzcPYXZZ
X-Received: by 10.36.40.196 with SMTP id h187mr7567635ith.43.1499851926416;
	Wed, 12 Jul 2017 02:32:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 02:31:45 -0700 (PDT)
In-Reply-To: <CAHiDW_EiNh8toWOwZ6qkqxYsXatyVUygG0dkibYzxw0O+TEQ=Q@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
	<CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
	<CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
	<CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
	<CAHiDW_EiNh8toWOwZ6qkqxYsXatyVUygG0dkibYzxw0O+TEQ=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 10:31:45 +0100
Message-ID: <CAJTo0LbWpSrghRZZnTb6i2aVUE3Y6ZQEgHGSw+DSCuf4s5mWCw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Wed, 12 Jul 2017 09:32:05 -0000
Content-Type: multipart/alternative; boundary="001a1143f65a4a4bd305541b7d06"

--001a1143f65a4a4bd305541b7d06
Content-Type: text/plain; charset="UTF-8"

On 12 July 2017 at 08:24, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I think I'll just send a patch to mesa-gl recipe to not install the
> header. If someone wants to solve this properly with the upstreams, be my
> guest.
>

Sounds like the best fix considering the alternatives, to be honest.

Ross

--001a1143f65a4a4bd305541b7d06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2017 at 08:24, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail=
_extra">I think I&#39;ll just send a patch to mesa-gl recipe to not install=
 the header. If someone wants to solve this properly with the upstreams, be=
 my guest.=C2=A0</div><span class=3D"HOEnZb"><font color=3D"#888888"><div c=
lass=3D"gmail_extra"></div></font></span></blockquote></div><br>Sounds like=
 the best fix considering the alternatives, to be honest.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143f65a4a4bd305541b7d06--
