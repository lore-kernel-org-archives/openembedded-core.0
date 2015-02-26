Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id D01E271637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 23:10:24 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z60so11401444qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 15:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xr4GNTHpvUC7d3Tf2a+4fDowyz9VK8O4KvE+8KtD+UU=;
	b=iIKHEBWctuJDJ/WFrx8VPP6ffQh8GZBXrcU+Wr+/QnQOYdKfJ3VIZ7E2x6Pk1qdoMF
	U5NilOIS1eyhkd3MxxyBgWykVGYFg4iaGQORTi/JLt9nQR05pdrkl0rRwKHSNrXm7bPk
	kJLqwUJqgKxD6oJOF4270E37OEgKomABr2q/BF1WCqRMUxWgkL9lCYapA5bDkDb/GKrL
	HGgNhZIkKRS3k0QW4pS2DRrsy48j8BlxWu72M8rnqIWAvG4eTNhLiySHEg0zJLEymerP
	v2ZcyBN0CFs4JY5Z2sS/AXcoDWeR/h27X4F+g/8d/Pe8az47IsLGAWXUrXVungRc7LWs
	x4cg==
X-Gm-Message-State: ALoCoQkF7AuyVIxHHHRuT8RJAO96OSElUd2RwKN9Cdc+sFbdSzNFCW6JTjp4tHvbeot24b1IBYYG
X-Received: by 10.140.233.79 with SMTP id e76mr23672968qhc.100.1424992225912; 
	Thu, 26 Feb 2015 15:10:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 15:10:05 -0800 (PST)
In-Reply-To: <3098634.xUVi2ZDfg6@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F443500@irsmsx105.ger.corp.intel.com>
	<CAJTo0Lao_XRie0O_Kb+Cw6-Zh-q+d--XJti6ogbu=WeUqmQhmw@mail.gmail.com>
	<3098634.xUVi2ZDfg6@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 23:10:05 +0000
Message-ID: <CAJTo0LbWjNyXSqSnsjWn3q2o31cRTDornXcDUwLX=H=a5r=9OA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Thu, 26 Feb 2015 23:10:26 -0000
Content-Type: multipart/alternative; boundary=001a113535066f199e051005db6b

--001a113535066f199e051005db6b
Content-Type: text/plain; charset=UTF-8

On 26 February 2015 at 22:35, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Genuine question, which I should have asked last time those files were
> touched
> - how do those tests relate to oe-selftest tests?
>

Looks like they're unrelated.  As they're standard unittest modules it
should be fairly simple to teach oe-selftest to load them all, right?

(AR taken to file a bug)

Ross

--001a113535066f199e051005db6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2015 at 22:35, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1vm" class=3D"a3s" style=3D"overflow:hidden">Genuine question, whic=
h I should have asked last time those files were touched<br>
- how do those tests relate to oe-selftest tests?</div></blockquote></div><=
br>Looks like they&#39;re unrelated.=C2=A0 As they&#39;re standard unittest=
 modules it should be fairly simple to teach oe-selftest to load them all, =
right?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>(AR taken to file a bug)</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a113535066f199e051005db6b--
