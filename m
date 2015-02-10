Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 389096E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:38:52 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so27074552qal.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 08:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5XUR3ckEzKGo/XcfZJ8P9WhVmuC4wlINNrHTYJGkYgs=;
	b=jbeZfsF68TgLQqf5AIwIWGWcEAKVdvQqQzybR7GD6ARQr3zHfIZWm5ban0r0E0coLL
	czRj9NvAVmn/bTAd9ALZZqopq+G02YxETWInxtF684l8+KGvtU7QFgwVxQkAyfd+dw9x
	Q1IJ5zO6oG5yE1xhVTHos/Vaxc155IlLEUptVgtLCrXCxFvh6PZfHUV0Pwdn89tLh6sg
	YrdV34FjXlawEFFNopBFRsA0++xULK7OO5GcCHtFGGidQoi6J+kiN5yMn0OG6CrXW3Hc
	xNW2mlB6wZQVP5CsKfQebLhRnJoLlCP1ts7zfHQuU+PT1neFeQwDcwKPNT8dirKzQxKA
	Zcng==
X-Gm-Message-State: ALoCoQmQBUpMBTE5TdX/7I1C3diV2hsmAJex2+595MaJ35iDRG9oFaz8gguH2UsksaEXRG5Wdjf3
X-Received: by 10.224.16.207 with SMTP id p15mr22334702qaa.22.1423586333103;
	Tue, 10 Feb 2015 08:38:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 08:38:32 -0800 (PST)
In-Reply-To: <20150210162902.GC14949@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
	<CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
	<20150210162902.GC14949@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 16:38:32 +0000
Message-ID: <CAJTo0LbFdzSv3V7vwPj0hQrE70JRu=GGh=6qzJgxrXOwobKHeg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 16:38:57 -0000
Content-Type: multipart/alternative; boundary=047d7bf16620b13bd4050ebe8502

--047d7bf16620b13bd4050ebe8502
Content-Type: text/plain; charset=UTF-8

On 10 February 2015 at 16:29, Denys Dmytriyenko <denis@denix.org> wrote:

> > >> +DEPENDS_class-native = "openssl-native"
> > >
> > >
> > > That *really* shouldn't be required. :(
> >
> > I agree it is not needed and it does seem to be a fail in meta-fsl-ppc
> > which should be fixed there.
>
> ? Are you saying it's meta-fsl-ppc specific issue?


I just replicated with qemuarm and interestingly with zero tasks happening
at the same time.  I'm wondering if there's a file being written with an
old sysroot in that isn't being deleted. I'll dig quickly now.

Ross

--047d7bf16620b13bd4050ebe8502
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2015 at 16:29, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; &gt;&gt;=
 +DEPENDS_class-native =3D &quot;openssl-native&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; That *really* shouldn&#39;t be required. :(<br>
&gt;<br>
&gt; I agree it is not needed and it does seem to be a fail in meta-fsl-ppc=
<br>
&gt; which should be fixed there.<br>
<br>
</span>? Are you saying it&#39;s meta-fsl-ppc specific issue?</blockquote><=
/div><br>I just replicated with qemuarm and interestingly with zero tasks h=
appening at the same time.=C2=A0 I&#39;m wondering if there&#39;s a file be=
ing written with an old sysroot in that isn&#39;t being deleted. I&#39;ll d=
ig quickly now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--047d7bf16620b13bd4050ebe8502--
