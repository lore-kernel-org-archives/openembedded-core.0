Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 231E07848D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 10:59:12 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id d16so23339820itj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C7KStK+tzbOsVJVaLaIuPdP9N5QLRgoknV36cWovoNY=;
	b=0baQe2xBeXtB8gKgWbr2r4efXkfAJdLwaabh42QIvo3Ux8hVxDxuAEgu7yp8+7Z1bt
	n/hFa8VaskBBvXOBIIWhaLZ3LiKbw52/Yrr8TNiqwy2KVDrqBXxEvn2ybLBncuDd1+uG
	18yE7DXMWan0DpOWWDO3R3rLUp8HLCTh03ZnLwvM15e3EyMYV2ckIEeIF8kj2Aum2+Dp
	3GiBjCKWrFXaIIsiyAHnZhMW+ipL0rVvrtGa8LNSuUNw5patsCFkhgCelXTDwjb8pam8
	ODSG4UIXUK6c5ZtOc9kGEvDFd5bAdseOgzPoToqXq6bGKLqt2hTazRpFKcVkv0iOYow0
	ZPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C7KStK+tzbOsVJVaLaIuPdP9N5QLRgoknV36cWovoNY=;
	b=plhv9rXo8+UHaJYBHDxyvxMRmgw4xV/KxPi+FuOE4PGru5u7K4Nxw6uJFJ5oO9VMNp
	NCrdCOwYiIbWLQoMt3XQ+yGZJgKUf2olksQLcz1nniN+KklHbNmji1nFy76gx16xHCB6
	hFIUxdBtE5ppxevd+niikG/0hrQpMX7I//GI40VErj+FYTlqKhKSyxatcAAJ7jETV5HD
	vRnfg3VOiCoP7wN83LU2nFkeYiqTkqQ2PIXFuNJ7vKBKl1F1+gTs/nkPAhCx04KgwN10
	6VKDq37/cIPhfFAzs+rSi7rh79lm0nftXDcIH4URH53B8V1+/AKavOQm2k0FS8sG6B35
	e5Cw==
X-Gm-Message-State: AKGB3mK12WqqwBHWdy7iuH9auXDGPo1otrVoeKaaxux8t7BO2U4gEJFO
	a4W/XT0wIeHhf7b/OH8IH6afLVjW90PxCMIKIX68aQ==
X-Google-Smtp-Source: ACJfBovfgnZyJ9HYQ6GfUrjyIr24mhiPcpW4UKEupOKYKsA/nWRthvfM6MyE6A/P9vk2yfdvrtY+RfRzGt+0aoZXyt4=
X-Received: by 10.107.180.18 with SMTP id d18mr4670691iof.52.1513076354049;
	Tue, 12 Dec 2017 02:59:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 02:58:53 -0800 (PST)
In-Reply-To: <cde7f929023e7d027409f771c6376765@agner.ch>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
	<1513006338.9676.5.camel@gmail.com> <1513006625.9676.9.camel@gmail.com>
	<CAJTo0LbVUE-Z84U59edVmmHu34kvNTZv+urwJAHpgBrXA96p=w@mail.gmail.com>
	<CAP9ODKoD9daGh83bwhLLzEW_7r+i65pH7hm4NwymD_+2LU6bMA@mail.gmail.com>
	<cde7f929023e7d027409f771c6376765@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 10:58:53 +0000
Message-ID: <CAJTo0LZ0S0HkiyyoDQpFqhEdN-wbTRpqSDCwXuS1DA7zopJAmQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 10:59:13 -0000
Content-Type: multipart/alternative; boundary="94eb2c06f0fc9a06090560228ad4"

--94eb2c06f0fc9a06090560228ad4
Content-Type: text/plain; charset="UTF-8"

On 12 December 2017 at 07:48, Stefan Agner <stefan@agner.ch> wrote:

> On 2017-12-11 18:15, Otavio Salvador wrote:
> > On Mon, Dec 11, 2017 at 3:09 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >> On 11 December 2017 at 15:37, Joshua Watt <jpewhacker@gmail.com> wrote:
> >>>
> >>> Vanilla waf only supports --prefix, --libdir, and --bindir. Anything
> else
> >>> is a result of loading the gnu_dirs tool, which not all projects are
> >>> required to do.
> >>>
> >>>
> >>> Sorry, hit send too soo: waf (at least version 2.0) also errors out on
> >>> unknown options. I think the three I listed are the only ones we can do
> >>> generically. There might be some way to easily adding the rest if you
> know
> >>> waf is loading gnu_dirs
> >>
> >>
> >> One option would be for waf.bbclass to check if WAF_USES_GNU_DIRS is set
> >> (defaulting to 0) and pass the full set of path options automatically.
> >
> > Possible. But passing the standard ones solve 99% of the issues.
> >
>
> I am with Otavio here. Also, adding the standard ones and adding the
> additional GNU_DIRS would best be done in two independent patches
> anyway. For now I'd rather prefer to only add the standard ones.
>

Fine by me.  Will there be a v2 adding --bindir?

Ross

--94eb2c06f0fc9a06090560228ad4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 December 2017 at 07:48, Stefan Agner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2017-12-11 18:15, O=
tavio Salvador wrote:<br>
&gt; On Mon, Dec 11, 2017 at 3:09 PM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt; On 11 December 2017 at 15:37, Joshua Watt &lt;<a href=3D"mailto:jp=
ewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Vanilla waf only supports --prefix, --libdir, and --bindir. An=
ything else<br>
&gt;&gt;&gt; is a result of loading the gnu_dirs tool, which not all projec=
ts are<br>
&gt;&gt;&gt; required to do.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sorry, hit send too soo: waf (at least version 2.0) also error=
s out on<br>
&gt;&gt;&gt; unknown options. I think the three I listed are the only ones =
we can do<br>
&gt;&gt;&gt; generically. There might be some way to easily adding the rest=
 if you know<br>
&gt;&gt;&gt; waf is loading gnu_dirs<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; One option would be for waf.bbclass to check if WAF_USES_GNU_DIRS =
is set<br>
&gt;&gt; (defaulting to 0) and pass the full set of path options automatica=
lly.<br>
&gt;<br>
&gt; Possible. But passing the standard ones solve 99% of the issues.<br>
&gt;<br>
<br>
</span>I am with Otavio here. Also, adding the standard ones and adding the=
<br>
additional GNU_DIRS would best be done in two independent patches<br>
anyway. For now I&#39;d rather prefer to only add the standard ones.<br></b=
lockquote><div><br></div><div>Fine by me.=C2=A0 Will there be a v2 adding -=
-bindir?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c06f0fc9a06090560228ad4--
