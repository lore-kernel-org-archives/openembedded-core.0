Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id A908160169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:38:26 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id c9so7567056qcz.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 09:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5z1bXn8GbV7cK+V3UbYcv3LL0ZG/SAH8jxRn2+04m74=;
	b=jR8V17i0EagWEejj2NpTK1ckGDGBPct2VbsieCJEoTRm4fDzTeUTr4c62MPFVAfDku
	mzhZ+jXUznS/nl9ZqeVu5ets1O1wawEP+D4vT6IM4wq7gtZR8ZbwYUHGk6kT3CR+TWOa
	ERwuzD857wXHWflEnUHELIIJ8aBU3JWgEe0pi6BF8Tx5XVmmzeIaTTsbEDcRo6uptM7c
	hOb62EFFzA+kz6mMbtMN1ioXeGmOw4XQB2jgiimZJclfUQCrWMkp7BUWogOAakcoYlMz
	Cv2VSXC9nC7lXegeFT2/LtgAKjON2Nla0h1prj5C2UyD5pV+cn4D7GyRlnOB4Bha8RuJ
	E/8A==
X-Gm-Message-State: ALoCoQkRFLLQgxCCFO0HXZ8i7eolI64N+ZnYnM4pEmcg1kmEnCsOYuI2BwG6i/ynuRodBJHJuMl7
X-Received: by 10.224.24.132 with SMTP id v4mr10486194qab.17.1423157907785;
	Thu, 05 Feb 2015 09:38:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 5 Feb 2015 09:38:07 -0800 (PST)
In-Reply-To: <1423155741-7715-1-git-send-email-mac@mcrowe.com>
References: <1423155741-7715-1-git-send-email-mac@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Feb 2015 17:38:07 +0000
Message-ID: <CAJTo0LZpT+RGH7zzMs56UVBh1im3YkQvovxWJtW5ZL8Gdzex0A@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Thu, 05 Feb 2015 17:38:34 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e8da58e050e5ac5db

--001a11c2b49e8da58e050e5ac5db
Content-Type: text/plain; charset=UTF-8

On 5 February 2015 at 17:02, Mike Crowe <mac@mcrowe.com> wrote:

> ${bindir} and ${base_bindir} may be the same. If they are don't try and
> move files onto themselves.
>

Funnily enough I did the same fix last week but didn't send it to the list
yet as I needed to rewrite the message.

Can you update this to change both versions of sed?

Ross

--001a11c2b49e8da58e050e5ac5db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 5=
 February 2015 at 17:02, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":6j6" class=3D"a3s" style=3D"over=
flow:hidden">${bindir} and ${base_bindir} may be the same. If they are don&=
#39;t try and<br>
move files onto themselves.</div></blockquote></div><br>Funnily enough I di=
d the same fix last week but didn&#39;t send it to the list yet as I needed=
 to rewrite the message.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Can you update this to change both versions of sed?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a11c2b49e8da58e050e5ac5db--
