Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id F165465CED
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 22:58:03 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id o8so4858419qcw.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Nov 2014 14:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HNzHu9G+5LweNCFPid8KCZiNJxm8nMGCYd+rRe620Mk=;
	b=V6EJGC1A7BNKghQm0drjrP4WGzsf8BSxxi877mgNEIqveMbv8Kzx5v2QvwCglePz3s
	O9L1faVRLPQfrVGZ+2rpN1dkEkArcmM95ZXexdDDTKGhK0V2QbjzYtyMOSAmr0ZmF4zi
	IeUfW+Wa6G/w9JzlgaCckIny+RXB+kOZQtN4vOlGuDGVe0a7kw8Ot3YquI11j/K5JVP0
	K84mksVnw3+JJIFxJR91lG2H+Ww21HLF1ZQhhd3WE2ML3dDLch+/xNrAM8FySK4tll4V
	8xkd9Lgx+Wdm26uzUAMHbcdPEoXZjlA3XE0Hoy0Mmzes2JdXgus5ev1XFRXYR/5UNg4Q
	qQjQ==
X-Gm-Message-State: ALoCoQnd8xNqQMm9hUsqxjMkHr17StrAaD/Re//to6OTSeFnz1VGUsLsyTHgDjq2jaKwvVWoNMxX
X-Received: by 10.224.156.136 with SMTP id x8mr10938592qaw.22.1415573884502;
	Sun, 09 Nov 2014 14:58:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sun, 9 Nov 2014 14:57:43 -0800 (PST)
In-Reply-To: <20141107223001.GG9512@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
	<20141107205445.GF9512@denix.org> <20141107223001.GG9512@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 9 Nov 2014 22:57:43 +0000
Message-ID: <CAJTo0LZp6R41rh8bHMu26HYGwEHa_cNyYmi5ZYsXEE8GfBaLSw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Sun, 09 Nov 2014 22:58:15 -0000
Content-Type: multipart/alternative; boundary=089e012947e08a426d050774fa0a

--089e012947e08a426d050774fa0a
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 22:30, Denys Dmytriyenko <denis@denix.org> wrote:

> I've just sent an RFC patch to allow building mkimage for the target. I'd
> like
> to collect feedback for it first, but feel free to squash it with the
> previous
> patch, if it's accepted (or commit separately - your choice). The update to
> 2014.10 will follow shortly, I just want this version to get through
> first, as
> it has been in limbo for a few months...
>

Thanks Denys, confirming that his works for me too.

Ross

--089e012947e08a426d050774fa0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 22:30, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vk" class=3D"a3s" s=
tyle=3D"overflow:hidden">I&#39;ve just sent an RFC patch to allow building =
mkimage for the target. I&#39;d like<br>
to collect feedback for it first, but feel free to squash it with the previ=
ous<br>
patch, if it&#39;s accepted (or commit separately - your choice). The updat=
e to<br>
2014.10 will follow shortly, I just want this version to get through first,=
 as<br>
it has been in limbo for a few months...</div></blockquote></div><br>Thanks=
 Denys, confirming that his works for me too.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e012947e08a426d050774fa0a--
