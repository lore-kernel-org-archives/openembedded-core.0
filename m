Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B45260024
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:41:14 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id l89so52054521qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 04:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IB40U1iRSMhHNku2R/FLWQhRAtI7caa1pL1T/B/argc=;
	b=X8a3+WnD/bQolOl3S0FM/dBO5JWOmSpJL707G8d7QxAwoQyXqxvhefAFwgZXboFGAe
	+eFTWuO2n/MBS56Y3AO2PhB5ri7ltxMhDqi0bRJa7NusfBaUsSZyhMcvGX4GjJHlPf/V
	evT6meXu1DTRMql0EOj2UMraFBSOg8jlgy2s+cZ6cX8Fpl8IMl2CMw9Aci2w+pNEfPeU
	BL0e3wV8oBCpVIhFUAomf+slPM0BQSgg3ByJzL+C5wmNLJaaXWmOcMOr6TOn+Z8OXoYO
	FnLE8zMkYRBus3bGBF+T/+sGnKz1C5vokcYJU0TBsodqwbdCT7pz+ftRk+3OABB3cUPe
	mvfA==
X-Gm-Message-State: ALoCoQlJh0ZcJHRU5JR/ohZQ8p0Dpshg2f6Ll8Gq/MNInmLGqoXZCaH37C5roSVB6KxM5QFbOXnZ
X-Received: by 10.140.39.179 with SMTP id v48mr32088055qgv.77.1422967275528;
	Tue, 03 Feb 2015 04:41:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 04:40:55 -0800 (PST)
In-Reply-To: <54D0C0B1.1090500@kernelconcepts.de>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
	<54D0C0B1.1090500@kernelconcepts.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 12:40:55 +0000
Message-ID: <CAJTo0LZxw5LV55fi9QA6X=vgM4UrZ-LtHXqp2KuMEVmGffgNiA@mail.gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 12:41:17 -0000
Content-Type: multipart/alternative; boundary=001a11c131f6fc3eb3050e2e62f6

--001a11c131f6fc3eb3050e2e62f6
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 12:36, Florian Boor <florian.boor@kernelconcepts.de>
wrote:

> well, in this case the patch is wrong but we *must* raise a fatal error.
>

bb.error is fatal, so it's all good right?

Ross

--001a11c131f6fc3eb3050e2e62f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 12:36, Florian Boor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:florian.boor@kernelconcepts.de" target=3D"_blank">florian.boor@kerne=
lconcepts.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":3vx" class=3D"a3s" style=3D"overflow:hidden">well, in this case the p=
atch is wrong but we *must* raise a fatal error.<br></div></blockquote></di=
v><br>bb.error is fatal, so it&#39;s all good right?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c131f6fc3eb3050e2e62f6--
