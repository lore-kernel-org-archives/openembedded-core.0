Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 945A677AA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:33:13 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id u75so21620000qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ld6m7eeW1o3ReH19tL19eU8PAswtBNixMDmhN7QfiBA=;
	b=TPK8WWddt+yU5NkWioJwT2/WuBkaUDS3CLwCvhyJP0FRQYRXWJHrmEym53VXKUgsaQ
	WwT4Ls+VgrUZyqZto1Sv6QRfYArx1gzmBaDNat+1LjgdquVrN9by/s9O5wZiqyW4CO67
	O+9vkuCqcswLqoqltPc5yVG5DyjE6jzl7rpxfdmmjL/ug+VMm9QZisAT9GQxKcBSEC/r
	up4+IKY2cBrW7gGn73T5a3TywrEYzAWAPJIwZGcvfvrDmxo+U4Fv+NC0UAXw+4YA9IDq
	m2li1423VErF08Np28vnNIt9jBwWSs3x7CCbKf9MmX3g9NzSGh+ZOzY1TqgMH0Q2NDyI
	nSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ld6m7eeW1o3ReH19tL19eU8PAswtBNixMDmhN7QfiBA=;
	b=UhohYw0zmIb3UdAIbqMTpvmAXnMBzbWfrLgC3ZYKY40x/UNmkdoWBrd3CBRomSmsre
	Lz7GpwosZ942Z6nTuYQp6S4HiwHZhn4X6OS8brNkwY4vTSF4maCyiASck5Gqg7VMP2mB
	emGX9BOEYjGDIWv8k/buuTMkwfXdFrlxeo1F6Uh42g5OKSFAFxHbLufbusVG4SD3e3CB
	S4ORX2CU0Ss29RdiqkgzQvm1+ndJhgnYjfS8Rug0PgFbuJN+R2KdidK8I4sbYgTAAOZ5
	UN+9HSzjUQ7tjrzArpTdgZ3Swku4+Dh/heWUkp42F6MUTzIuIK3Mzei/8/GX+2TWZpj9
	uvIQ==
X-Gm-Message-State: AN3rC/6QJAqctszz2T4HeXFHBi/MPOy6Mznptye3nirSKZ6AfzMEoXv7
	DhEWyNySSkkgtLJULVU4mNicYml86egW
X-Received: by 10.55.17.224 with SMTP id 93mr23214545qkr.244.1493044394773;
	Mon, 24 Apr 2017 07:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 07:32:54 -0700 (PDT)
In-Reply-To: <CALxi_JE_6qJVza0p825Ooe3YgZn89af3Cuxbpp0g=TydJtgOpA@mail.gmail.com>
References: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
	<CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
	<CALxi_JE_6qJVza0p825Ooe3YgZn89af3Cuxbpp0g=TydJtgOpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 15:32:54 +0100
Message-ID: <CAJTo0LbgWj0uz8XrB5ofGOCs6FTtACE4g4vbXxVSrGu-yN6pQw@mail.gmail.com>
To: david bensoussan <minipada@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 14:33:13 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccc8e9c8054dea7c3b

--001a1135cbccc8e9c8054dea7c3b
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 15:29, david bensoussan <minipada@gmail.com> wrote:

> I'm going to make some tests if it's possible and if performance is good
> doing so. If not, from what I understand, the PR will probably be refused?
>

For oe-core, yes.  There are other layers, such as meta-oe, but I'd
actually suggest as you'll be shipping binaries in the layer that you write
your own layer and publish it.

Ross

--001a1135cbccc8e9c8054dea7c3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 15:29, david bensoussan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:minipada@gmail.com" target=3D"_blank">minipada@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;m g=
oing to make some tests if it&#39;s possible and if performance is good doi=
ng so. If not, from what I understand, the PR will probably be refused?</di=
v><div></div></blockquote></div><br>For oe-core, yes.=C2=A0 There are other=
 layers, such as meta-oe, but I&#39;d actually suggest as you&#39;ll be shi=
pping binaries in the layer that you write your own layer and publish it.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a1135cbccc8e9c8054dea7c3b--
