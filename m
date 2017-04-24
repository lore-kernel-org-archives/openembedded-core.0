Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0783377AA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:30:21 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so21530343qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uSss1Wxa4NXaA2WTLMK9WgdrpzJrs1OGIoOhbjPzhks=;
	b=OWqFnpthHZc8QcD9adYMRC0RLC/sR8+DVu+3OsHYqjG26DoprRjmYfshh2A7/gAeb5
	sSsmHOxlhmhTZvHEjbgQ+1F37o/0+aqOyT8rtYMn+rVIvKICrqyJkbsioGJ/XK929/iE
	n0Ot05W1ywBB6mEXU6uPATofbcNAve6T0oVqF+VGmaIbUO1dtdA4NlBwIj24kF0g9W7B
	FVzGljbNY9sViTDBLKEmIk9u3YUW+zXT77vm4DjDCfPWEmHyKqanevGUtAfxpunvPUm3
	fXdm9WgfxF/OyT6pPFyJ1LDBTVHNOJjN45x7yCWillco2PpcLUqPjySMdiiuurfOqB3i
	ZswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uSss1Wxa4NXaA2WTLMK9WgdrpzJrs1OGIoOhbjPzhks=;
	b=LrpTAVYThaqATYs69IPsFW7ycnR5jWSTSoPODwDEIXUxB6KOcfw+mGtoLalWa1wa9g
	6pt+8oDQ3gCH3RiINYtEKtg3aFrA9q7D9Krae9purQA0jkbJ9OUGyqUmXVvMB+1OCu9C
	0Gs7swxN5k6iiwyKOqXd5CDUrM6K9RUbkBlEvfCuV8gcADZvYP3mXb49z3eiOB6W7P49
	mb/n4Ghcd3x/mjCVhBqG/bl9cjVquVLboyMTO3TrLxVZ8Jvc+i+CzCp4AiHCHOVQlB2J
	qi4Xt32iOdZ4anG98pHrISbwdXVJCAExIdlzp8zASobLyBs/ttVEla2PQ9jfcCsJkLjQ
	Kq1g==
X-Gm-Message-State: AN3rC/7dAPJXIjMds04S5+CW4R1K65Zeu976XOoqoQmHadQu0HjD9oqM
	eA4RjRePWTLN02wJgTuxQmgHxH65VEtd
X-Received: by 10.55.93.193 with SMTP id r184mr23689700qkb.221.1493044223131; 
	Mon, 24 Apr 2017 07:30:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 07:30:02 -0700 (PDT)
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC0147BABB@ATNETS9912WMSX.ww300.siemens.net>
References: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0Lau-Vc_Z1d3mCSPbOp2kjc=Hk95k6SCMxLHOQRrnyMz7Q@mail.gmail.com>
	<D55698ECEC159B488D62A508E18D7FEC0147BABB@ATNETS9912WMSX.ww300.siemens.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 15:30:02 +0100
Message-ID: <CAJTo0Lbcg6PnjhC4tCd242Y+z9n+3CF=tyjR5R54BXpVULbJaw@mail.gmail.com>
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: 2.0.22 -> 2.1.8
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
X-List-Received-Date: Mon, 24 Apr 2017 14:30:22 -0000
Content-Type: multipart/alternative; boundary=001a114ed8ee8e0afa054dea722c

--001a114ed8ee8e0afa054dea722c
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 13:44, Valek, Andrej <andrej.valek@siemens.com> wrote:

> Sorry, I have missed it, there was code added under MIT license.
> Is this acceptable for oe-core?
> I could change LICENSE = "BSD" to LICENSE = "BSD & MIT" to reflect this.
>

Yes, BSD & MIT is accurate.

Ross

--001a114ed8ee8e0afa054dea722c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 13:44, Valek, Andrej <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4p5" cl=
ass=3D"a3s aXjCH m15b9ffddaa0ce753">Sorry, I have missed it, there was code=
 added under MIT license.<br>
Is this acceptable for oe-core?<br>
I could change LICENSE =3D &quot;BSD&quot; to LICENSE =3D &quot;BSD &amp; M=
IT&quot; to reflect this.<br></div></blockquote></div><br>Yes, BSD &amp; MI=
T is accurate.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a114ed8ee8e0afa054dea722c--
