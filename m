Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 003256AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:31:09 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so150564592qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 08:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4BY27Cf2KbBR8nRPtivjWTKGMsm5gllhlThK1CLj/pY=;
	b=l7ZinkOI8/imugAMZZIgy8Yw9TTIK82eB1CmsRXnOu2lmvlfjxB4WUH+rk9yIA14N4
	ScphyBdI7ioWmK3w6NpIxuIeFbV/4mT8UlyUkdOQ2qRLKFgsZMJ5ENL5/b5+7HLcGXff
	Q3RwzhA5M1CLTLR0/n14wutcUsDmp2QDwcxl/S3C6JBv8bDKqCtYo8NjgyFX53jmsa23
	krYL8UV9tgX+1AAJdXij3HdO+jjuFzvEvu9GE2N+o50GZlVvRpjmsbNZEIZW+0vrkAFa
	gRwONH236SIFZM4usfK7oHfltlk1obj3CJ1Wc0/ro4/EfPZUnR2SdTImKkXeULeC5vlF
	Yxqg==
X-Gm-Message-State: ALoCoQnqCnU8wDBkaDK+nrEcE2jMuHLOou17QZjCbkzlQhl6K1OD9iSky9kEvDFFcXjgJFwrTYHd
X-Received: by 10.55.23.84 with SMTP id i81mr126324025qkh.51.1427124669028;
	Mon, 23 Mar 2015 08:31:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 08:30:48 -0700 (PDT)
In-Reply-To: <1425057596-28243-3-git-send-email-raj.khem@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
	<1425057596-28243-3-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 17:30:48 +0200
Message-ID: <CAJTo0Lam6E9+75RYCL8bneDVysbPTUdc8iZKN7QEwb3jAK-KFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Mon, 23 Mar 2015 15:31:10 -0000
Content-Type: multipart/alternative; boundary=001a1146fe62f2b1020511f65ae7

--001a1146fe62f2b1020511f65ae7
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 27 February 2015 at 19:19, Khem Raj <raj.khem@gmail.com> wrote:

> use static storage class instead of extern for inline functions
> and remove duplicate definitions as a result
>

There's now a master-next-1.9 branch to start collecting all the patches
for when master un-freezes.  This doesn't apply anymore, can you rebase and
re-send?

Ross

--001a1146fe62f2b1020511f65ae7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 27 February 2015 at 19:19, Khem=
 Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":638" class=3D"a3s" style=3D"overflow:hidden">use static=
 storage class instead of extern for inline functions<br>
and remove duplicate definitions as a result<br></div></blockquote><div><br=
></div><div>There&#39;s now a master-next-1.9 branch to start collecting al=
l the patches for when master un-freezes.=C2=A0 This doesn&#39;t apply anym=
ore, can you rebase and re-send?</div><div><br></div><div>Ross</div></div><=
/div></div>

--001a1146fe62f2b1020511f65ae7--
