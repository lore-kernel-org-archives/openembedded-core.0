Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id E8C7973E36
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:30:40 +0000 (UTC)
Received: by qkei195 with SMTP id i195so182674121qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 03:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1LsFh3RiEHt1bckoFusM592EjGrugcGgxOSWl/WdnTQ=;
	b=W2jDNRjeAKYKCzP2bee2umOuBqMeFW7+EvER6+k929OkIMf4jjgRH+zmQ05sMwCm7m
	TAMEQtTcYhYPKUQjd3o6eLKUTgzrlv1g8DylQCDwHTrczhcC4p3ypIYv8z/4AMWieJgQ
	YeowAQI9Nd8elxYxz1wE7TzltxJIRm5uQsqNdZyqTXWUCt9m8zBYUTzaXdNc9gZvkyXH
	73pOTQF35XhNIqg5UWnhFTxNs4JaKxka/FsuZKnlVOFQSY8kk+Og6EbGAFJlVSli5P5v
	BecJziAKLjDa0tfX3UpW0hFo12MXssXYdgAjKeq8mkFRSIH3ApszzmanhYu790sJgZoL
	IPXA==
X-Gm-Message-State: ALoCoQmPtHUzK3xEqL8igPAM2OtRhCsCfDza0dEg1KFFz6sIUORQ3s4amJyGyc0+BzL3Au7MejuI
X-Received: by 10.140.231.19 with SMTP id b19mr23531645qhc.22.1436437840896;
	Thu, 09 Jul 2015 03:30:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 03:30:21 -0700 (PDT)
In-Reply-To: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 11:30:21 +0100
Message-ID: <CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 10:30:45 -0000
Content-Type: multipart/alternative; boundary=001a11c12f003fc052051a6ebf9c

--001a11c12f003fc052051a6ebf9c
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 11:24, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> What do people think? Should we be looking to make the switch back in OE as
> well?
>

I say we switch back to ffmpeg, and do it as soon as possible so we're not
making this change during M3.

Ross

--001a11c12f003fc052051a6ebf9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 11:24, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:652" class=3D"a3s" style=3D"overflow:hidden">What do people think? Should =
we be looking to make the switch back in OE as<br>
well?<br></div></blockquote></div><br>I say we switch back to ffmpeg, and d=
o it as soon as possible so we&#39;re not making this change during M3.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11c12f003fc052051a6ebf9c--
