Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D17357169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:27:51 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so12008202qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 03:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tgcejIMTu2TnokF9K6zuMKjGwvDiti/8KDeIh0G73YY=;
	b=hTSr8S/f3ioq3H7avKpO4ig6XmEhVPKHeoTQvlDY9okNKuIUXnu80k48hiPBqvRjTe
	HAhrKsYVjznw+4ELgjlp+lIAnxhgEZzO032COYUGaCLXArcVkI9lvx9fIVhuLnOTSw8N
	mfgj80lZtx1bOI4qOXBrnYMo6zpm235iMLspFbQXOXLgiwGJ6I44pRDpapkVF7hA0Jqq
	vTO/D1dM8cpZE6lSFn2yscX+TTV3kLSAoejNdG6jzqd6WvjJ8llk6MOCY+6U46klkTYx
	+o0A3/mALlEegdkUAlDmbdz0MMaTA/PF0fJlHVxGseMb65JsjtKGduupvN8Ml+WvtEug
	gr5w==
X-Gm-Message-State: ALoCoQkOnK76jFVgnqVbWIKjvCbT/4nBraWYusPSowRh+1+2vClmIcR4IQIP+m9O5slfk6c2ET7m
X-Received: by 10.55.20.10 with SMTP id e10mr27147555qkh.36.1430303272225;
	Wed, 29 Apr 2015 03:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 29 Apr 2015 03:27:31 -0700 (PDT)
In-Reply-To: <CAMKF1srJC56ZTmBEsUx9SnfM8v2T82BOdAQ_RfiMbvdU2dgNng@mail.gmail.com>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
	<20150428213007.GC2322@jama>
	<1430257073.5364.1.camel@bottazzini-ThinkPad-T430>
	<1430257333.13022.247.camel@linuxfoundation.org>
	<CAMKF1srJC56ZTmBEsUx9SnfM8v2T82BOdAQ_RfiMbvdU2dgNng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Apr 2015 11:27:31 +0100
Message-ID: <CAJTo0La3+gyaoj+xpt2B8NxqodJ992X7oCS2d6s6mLXUwNXHeg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Wed, 29 Apr 2015 10:27:52 -0000
Content-Type: multipart/alternative; boundary=001a1137de3276612d0514da6e76

--001a1137de3276612d0514da6e76
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 23:13, Khem Raj <raj.khem@gmail.com> wrote:

> I was wondering if there was a script or may be bitbake option to warn
> about this case whole Metadata wide
>
IIRC the "git" patch method will warn when patches are already applied, so
doing a world patch with that set might get close.

Ross

--001a1137de3276612d0514da6e76
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2015 at 23:13, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">I was wondering if th=
ere was a script or may be bitbake option to warn about this case whole Met=
adata wide</p></blockquote><div>IIRC the &quot;git&quot; patch method will =
warn when patches are already applied, so doing a world patch with that set=
 might get close.</div><div><br></div><div>Ross</div></div></div></div>

--001a1137de3276612d0514da6e76--
