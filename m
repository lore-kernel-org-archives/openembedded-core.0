Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD12601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:08:45 +0000 (UTC)
Received: by qceb3 with SMTP id b3so21360068qce.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=01lM6UXTho1A2X6PC8bL49rUhh1bXIPOLaPoQYUrpus=;
	b=KP2z43TalPC2ZGCdZ258hSP65B9LqmlYVFc6piWm1jlkXxBq4KFP01r6SNQpjYfQmo
	16gMx5cUvUuN8+2vg6+UuKWHaFL7Qe2ynZqER93akaZquh2q1Kj1odtT0bf+z8O28r1V
	bqtOOFo6+Bd8KhrXaVfzcUWUHUz1ByOCyhN37j1OnyrOk7ldnL/5iyFCP5gAq1E1vtDR
	1o4GsBr+Itwa78Nbui6+7XDWY1OVDrg/+Bt4KWxCYjIc/3ZiB15kFm28BOZts8+90RLO
	kC1xM3Ts85IbS6zVqd5Axwif1ETLgpxPpw0O3DkTW+hi6H4xTTSwFRtAOAXY2eChX/aW
	T2ZQ==
X-Gm-Message-State: ALoCoQl8r6BNjNN/83OFQRY3TwWTOnu8yImCTB1G8VOHH+VHyDqM/BYlYm2xfx3F3WVJUE1lDCm2
X-Received: by 10.55.20.10 with SMTP id e10mr71661097qkh.36.1432127326314;
	Wed, 20 May 2015 06:08:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 06:08:25 -0700 (PDT)
In-Reply-To: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 14:08:25 +0100
Message-ID: <CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Wed, 20 May 2015 13:08:48 -0000
Content-Type: multipart/alternative; boundary=001a1137de328efc9e05168320ce

--001a1137de328efc9e05168320ce
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 12:49, Florian Boor <florian.boor@kernelconcepts.de>
wrote:

> -PR = "r3"
> +PR = "r4"
>

No need to bump PR.

Personally I think that the fix here is to stop PN-dev depending on PN,
instead of creating an empty PN package to confuse people.

Ross

--001a1137de328efc9e05168320ce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 12:49, Florian Boor <span dir=3D"ltr">&lt;<a href=3D"mail=
to:florian.boor@kernelconcepts.de" target=3D"_blank">florian.boor@kernelcon=
cepts.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":b4l" class=3D"a3s" style=3D"overflow:hidden">-PR =3D &quot;r3&quot;<br=
>
+PR =3D &quot;r4&quot;</div></blockquote></div><br>No need to bump PR.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Personally=
 I think that the fix here is to stop PN-dev depending on PN, instead of cr=
eating an empty PN package to confuse people.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137de328efc9e05168320ce--
