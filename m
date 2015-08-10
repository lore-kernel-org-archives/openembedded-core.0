Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EBB6E76899
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:35:46 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so84569626qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=smaMdsu+dBA97+H62daMcRg1BDn4g8E09p4bNOC0fEQ=;
	b=LssuVTdDG5p6NQU9pxng7i3pbvCSMt3acKFhxfPs8BTBZISTU+EL4Y0eVdyL2V7a0y
	j5UUHwcC6KA2h5/rInwQoZ7a3Uz70nxrBlLuzD2gEhQgjE3ZHvP/f5cFSKSr00fiOH8p
	aVTFEDNphieYHj048oUfm8bbdhm/4gCKGdYgXLOUm9yuC16bAuJ24mICOg13/7E3Uh/7
	F4I1sKdRms/HORgtq0VJiTD7P6HMQRnz+WwkXFJLV2vXpuPpBk3+fiHiKm/qJr3KfR9e
	LDxSunl7uIuiAJ2thhUa98WdfR9MpbdH8dEcdzhrXQ9MBxFSZWXwTkB+AX6tarRgqRxu
	hKrg==
X-Gm-Message-State: ALoCoQlhlhtac1ffJWd6QAtt20MtWQ1o27mpSPwWLdgdpDb1I6cmgBM/9WFnp7WNWIuEfFrf3c4y
X-Received: by 10.140.33.164 with SMTP id j33mr30130553qgj.77.1439224546732;
	Mon, 10 Aug 2015 09:35:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:35:27 -0700 (PDT)
In-Reply-To: <20150810081845.GF6102@loska>
References: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
	<20150810081845.GF6102@loska>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:35:27 +0100
Message-ID: <CAJTo0LaNdbbS++REvbB5Gw-FQ736emDpwCH0G-hzZrxZCs9QFA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Mon, 10 Aug 2015 16:35:47 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9cdc39e9051cf79378

--001a1139bd9cdc39e9051cf79378
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 09:18, <Mikko.Rapeli@bmw.de> wrote:

> So currently patch testing and review queues are full.
>
> Should I file bugzilla tickets with links to patches like this or
> are the mailing list contributions tracked via patchwork or something?
>
> If small changes like this are not getting merged, then I don't have
> confidence
> in pushing bigger ones back upstream.
>

There's been slow acceptance of patches on master recently, mainly due to a
focus on making the autobuilder do green runs reliably.  To compound that,
I've just returned from a week off and Richard was travelling last week and
is still travelling this week.

That said, master-next is almost 50 commits ahead of master and will be
merged soon, and I've just queued this into my testing branch.  Stuff is
flowing, just slowly.

Ross

--001a1139bd9cdc39e9051cf79378
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 10 August 2015 at 09:18,  <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:Mikko.Rapeli@bmw.de" target=3D"_blank=
">Mikko.Rapeli@bmw.de</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":6e" class=3D"a3s" style=3D"overfl=
ow:hidden">So currently patch testing and review queues are full.<br>
<br>
Should I file bugzilla tickets with links to patches like this or<br>
are the mailing list contributions tracked via patchwork or something?<br>
<br>
If small changes like this are not getting merged, then I don&#39;t have co=
nfidence<br>
in pushing bigger ones back upstream.<br></div></blockquote><div><br></div>=
<div>There&#39;s been slow acceptance of patches on master recently, mainly=
 due to a focus on making the autobuilder do green runs reliably.=C2=A0 To =
compound that, I&#39;ve just returned from a week off and Richard was trave=
lling last week and is still travelling this week.</div><div><br></div><div=
>That said, master-next is almost 50 commits ahead of master and will be me=
rged soon, and I&#39;ve just queued this into my testing branch.=C2=A0 Stuf=
f is flowing, just slowly.</div><div><br></div><div>Ross</div></div><br></d=
iv></div>

--001a1139bd9cdc39e9051cf79378--
