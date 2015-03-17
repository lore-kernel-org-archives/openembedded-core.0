Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id ADA956013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:48:22 +0000 (UTC)
Received: by qcbkw5 with SMTP id kw5so8431641qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 06:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HUQ3ZlIaISQG6BczavFxySr+l+dQJsr23Hb1SL9pnbk=;
	b=hauOzq7DRuUtZExF3lg9cK6RSeTOOfjmNU0b7r/7C8SRVc/gByPgV/HOhd3TxvcNCj
	ByU/EpIvB0kGKlAYL9ZHy/nVVPEucjEkT781Vtinx8C4IfzmR2T+dGVfjrQCoc/nGJyd
	1sVlkCoJD3mP50/aPD2ts4/WMM7JDf/6pAJJVHlyT+QWBoML4BQRPbvppf1pw29bAiHf
	6kcY2G4Lknpv7vqyuvK3x6iOq4rRZb6zJUTaSKN8ZZ+MDf7Gpxnhul3b2JmNnYCqh0K5
	3B5Bl24SoX0vcJEniDlCJGz1YunEjINl2kurKzWLHvX3fz8zVEseIIWrXk/P6j1Z9Olu
	3p2g==
X-Gm-Message-State: ALoCoQkZXZt3D4ytyZkddlvv9vEhT8CeOew3kWXgvMRhAryFWCZNIPnIV8hZjS4d5QhxeLKTV6yx
X-Received: by 10.140.104.242 with SMTP id a105mr81495479qgf.89.1426600103360; 
	Tue, 17 Mar 2015 06:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 06:48:02 -0700 (PDT)
In-Reply-To: <55081BFD.40607@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
	<55081BFD.40607@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 15:48:02 +0200
Message-ID: <CAJTo0LYcmMzAd-q84HhmCO38XJjWmdnGPQAe+X-EqieBoUER-Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] perf: drop PR
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
X-List-Received-Date: Tue, 17 Mar 2015 13:48:24 -0000
Content-Type: multipart/alternative; boundary=001a1134f76865cf6d05117c38f7

--001a1134f76865cf6d05117c38f7
Content-Type: text/plain; charset=UTF-8

On 17 March 2015 at 14:20, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> But doesn't that mean that my bash RDEPENDS fix needs a PR
> bump ?
>

No, you don't need to bump as the PR service will bump when it rebuilds.

Ross

--001a1134f76865cf6d05117c38f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2015 at 14:20, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":fh" class=3D"a3s" style=3D"overflow:hidden">But doesn&#39;t that mean =
that my bash RDEPENDS fix needs a PR<br>
bump ?<br></div></blockquote></div><br>No, you don&#39;t need to bump as th=
e PR service will bump when it rebuilds.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a1134f76865cf6d05117c38f7--
