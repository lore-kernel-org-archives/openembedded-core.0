Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F49360556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 16:46:15 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z60so14009683qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qjt45mUYAY4zVVevLkfjMBLnsqKnPmSyfvtE3XIhKVA=;
	b=eOxWkaQhSZhN1WLfFxXcZzJ/kNHqNneXdAmExCrwi2ncNS7G95K8ZSsaNSRT10RqCe
	hmKDmAtkL1pEtmQ+a06vU/dDVrDaMxqIq/k6k9n7gS62ACLh2mvTnz2z0stPsB3ZY52B
	t9Ntcctdo4LEGqMHA+C3YTqpGQ6v7Xv1guLVx7/QkmViVfGm+Ok425a0ZX/qm3r7pa+o
	ngNcJuoX1DSL3T1S84WErU6GSPE0LcijMxt1+YEug/hMDOyiXy1kvAYL7MpVW1MvS0dr
	agofmT6LMQBKuMZX723LhaagraRptZ2jKZC/lL1ubk80TvSv5Yuv75eVXq6wcu9eTge0
	SneQ==
X-Gm-Message-State: ALoCoQlN+wsIPhday+i2tX8kEbBBA1F4Sa0uKVeisOamSPIammpaLinTJ/KiXxW5Q/K0nZ6gTpKg
X-Received: by 10.140.49.5 with SMTP id p5mr25222378qga.15.1423845976969; Fri,
	13 Feb 2015 08:46:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 08:45:56 -0800 (PST)
In-Reply-To: <cover.1423699454.git.alejandro.hernandez@linux.intel.com>
References: <cover.1423699454.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 16:45:56 +0000
Message-ID: <CAJTo0Lbx5RQk1C4wzs_qOWBLzyQ+LeASmoc-qFdLprRkB3khJA@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Fri, 13 Feb 2015 16:46:20 -0000
Content-Type: multipart/alternative; boundary=001a11351944ac6279050efaf91a

--001a11351944ac6279050efaf91a
Content-Type: text/plain; charset=UTF-8

On 12 February 2015 at 00:22, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> I tested build locally on my machine, on a Minnowboard MAX build
> and on the Autobuilder using archs qemux86, qemux86-64, qemuarm,
> qemuppc, qemumips.
>
> Also ran some personal python programs to test runtime behavior
> everything seemed to work fine.
>
> Many changes, some were already fixed upstream, others were rebased.
>

There were some small changes to Python since you branched, can you rebase
to the current master and re-send?

Cheers,
Ross

--001a11351944ac6279050efaf91a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2015 at 00:22, Alejandro Hernandez <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">aleja=
ndro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":l41" class=3D"a3s" style=3D"overflow:hidden">I te=
sted build locally on my machine, on a Minnowboard MAX build<br>
and on the Autobuilder using archs qemux86, qemux86-64, qemuarm,<br>
qemuppc, qemumips.<br>
<br>
Also ran some personal <span class=3D"il">python</span> programs to test ru=
ntime behavior<br>
everything seemed to work fine.<br>
<br>
Many changes, some were already fixed upstream, others were rebased.</div><=
/blockquote></div><br>There were some small changes to Python since you bra=
nched, can you rebase to the current master and re-send?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11351944ac6279050efaf91a--
