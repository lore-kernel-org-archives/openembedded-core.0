Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 905CE70A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 11:30:36 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id u7so7973893qaz.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 03:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UPEWPL8hfR4dgOjtIjQHKk7+j3Y7dCEuUNQtae5VXBI=;
	b=C1uiBPg4RzHvBFXwTB2s7qcS/6s1VO3nWvoqtCLV2ABjTMcnICK0iDzeWzP22Bz/75
	XRhoT02ebnvpJCiuxGpk6oDM+eW3Vw2CQKAWYuJrahe8ADpV4gEFELXzHtb9zcxXmJSY
	wP83zYMVYVvT3BFDzfLlQm4PbaRjN7ZY04Amgr88YeRL3h+dgpbAnUnNi6ynkoBhum7g
	F46DtSqloiex3U3DzF2eQ9F38fRHF231YVbvkb5FVcElVmzboMggnP8K35Vzn1dzMCxp
	cnh/ocdiLQPIWC4kzNmqElXHIfRlYcN+y6f7Wvp668epiB0PefyenvFNB/urwsipVD2R
	PFkQ==
X-Gm-Message-State: ALoCoQkkFkuZPHGHvckxUK6fBPAI7LzNGFHuqxg6fzRVaVne51dC4Q5NonF4HDKDUxzszkTE6ARV
X-Received: by 10.140.94.246 with SMTP id g109mr30458947qge.77.1415014236932; 
	Mon, 03 Nov 2014 03:30:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 03:30:16 -0800 (PST)
In-Reply-To: <A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 11:30:16 +0000
Message-ID: <CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 11:30:40 -0000
Content-Type: multipart/alternative; boundary=001a113a81d6f21fec0506f2acea

--001a113a81d6f21fec0506f2acea
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> wrote:

> > Last night I was looking at my "post-1.7" tag and the number of aarch64
> patches there.   Kai, did you continue work on that staging branch for all
> of the aarch64 patches that were being posted?
>
> What does that have to do with this patch?


Kai was collecting patches that were sent to oe-core, and this may have
been one of them.

Ross

--001a113a81d6f21fec0506f2acea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 11:27, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt=
; Last night I was looking at my &quot;post-1.7&quot; tag and the number of=
 aarch64 patches there.=C2=A0 =C2=A0Kai, did you continue work on that stag=
ing branch for all of the aarch64 patches that were being posted?<br>
<br>
</span>What does that have to do with this patch?</blockquote></div><br>Kai=
 was collecting patches that were sent to oe-core, and this may have been o=
ne of them.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a113a81d6f21fec0506f2acea--
