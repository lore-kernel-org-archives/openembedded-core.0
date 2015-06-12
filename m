Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9C92D7422B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:11:23 +0000 (UTC)
Received: by qgf75 with SMTP id 75so10322290qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qhq/VWQ7M9Jy3Z2neH7Ix6G7f4PYb3Q3zUS1uIsf53w=;
	b=Safb4j9d74Kt7TU0IU4vM2QAEpLwL4U9Xdd4tCkfjj8F9omrw0EBr1IqLoaO0R4Ycg
	M9rQmjEsOxEfWVNi5iI+rsJy3cPkZbVEAyc7Ng1vTDvgV0RAntBLGT8TGaEC9OY9lbLJ
	cAaffHr65/NnHY4QNA5231qqA425rW4ConyAG4sjNNKZG2Ns8j+QiqFXDurJI/3KsvPp
	YcrnSlXoruYq14cZLLGEwbtTjg8KGHEdkFIcaFht0QW5lOVwOEg704660B1yTm1fxrmp
	N+LP8Le3SkM7Ak66gucTfpndyHit2ww3PxjK2S+GLECrwFHQmVMdvzpf/L2S5e5HVy6A
	akew==
X-Gm-Message-State: ALoCoQkwA5q8hjWaXYKEAZ17HiuqqPOc1oAXqkrj1Ejuix9WLxiT1U0j/bFqGGH0SXZ2fT6VyXt6
X-Received: by 10.140.89.104 with SMTP id u95mr17518633qgd.15.1434107484475;
	Fri, 12 Jun 2015 04:11:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 12 Jun 2015 04:11:04 -0700 (PDT)
In-Reply-To: <1557617.mLfaxnFia7@peggleto-mobl.ger.corp.intel.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
	<7189f3ea9eb20d08f73abf3af4715a43f73740c0.1433842738.git.liezhi.yang@windriver.com>
	<557A4FDF.7060304@windriver.com>
	<1557617.mLfaxnFia7@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 12:11:04 +0100
Message-ID: <CAJTo0LZ1eNH8KScAf=3bJbGGVFV=OCU5GXodPp8=LMVc34pAJQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/12] libav: 9.18 -> 11.4
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
X-List-Received-Date: Fri, 12 Jun 2015 11:11:25 -0000
Content-Type: multipart/alternative; boundary=001a11c135f62ea7150518502b96

--001a11c135f62ea7150518502b96
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 09:40, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> I didn't talk to Richard about it but I think there may have been some
> discussion on this list about the possibility of 9->10->11 breaking API
> compatibility with applications. Did you do testing with recipes in meta-
> oe/meta-multimedia that depend upon libav?
>

Yes, that's exactly why I didn't merge it into MUT: more research needed as
this upgrade was proposed by Kai a few weeks back and there was a
discussion there.

I wasn't rejecting the upgrade, just needed a good look and didn't get
around to it yet.  The big question is upgrade path: does everything in
oe-core still build, and is there a sufficient amount of recipes outside of
oe-core using libav 9 that we should keep it around?

Ross

--001a11c135f62ea7150518502b96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 09:40, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2xq" class=3D"a3s" style=3D"overflow:hidden">I didn&#39;t talk to Rich=
ard about it but I think there may have been some<br>
discussion on this list about the possibility of 9-&gt;10-&gt;11 breaking A=
PI<br>
compatibility with applications. Did you do testing with recipes in meta-<b=
r>
oe/meta-multimedia that depend upon libav?</div></blockquote></div><br>Yes,=
 that&#39;s exactly why I didn&#39;t merge it into MUT: more research neede=
d as this upgrade was proposed by Kai a few weeks back and there was a disc=
ussion there.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">I wasn&#39;t rejecting the upgrade, just needed a good look and did=
n&#39;t get around to it yet.=C2=A0 The big question is upgrade path: does =
everything in oe-core still build, and is there a sufficient amount of reci=
pes outside of oe-core using libav 9 that we should keep it around?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11c135f62ea7150518502b96--
