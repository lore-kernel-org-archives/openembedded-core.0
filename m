Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C55960167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 18:14:38 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id x3so11361086qcv.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 10:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EMSWD/Z+yLu1Sg6PmZu1jCag6IOarlvN/zZ28WlUaSs=;
	b=Qd1uiHZ+p2I9X27YIL53/+DTyG1lEQJS1WVBqLMiul35sguqAwAUWV4BfsE4E6qveo
	1eCRCoq0DFuSY0gx/R4vpKQxkZOlSCm8n9w2N8B/TyGZh3j/U9xjG+LkfLaYyIdY0/Q8
	h10jQNbP67Lzyi0KPf++WoXkky/+PH19p0xp1vG0PKZF0tbMUfwrAtY7O1jq7RMywYcR
	OCXxqLgukdVwNafPMYxQsadx/w3AeNzg9soTVmmAk9N35goM2Bas6WGopNoS2UcvvPms
	S+hWYHaURwQRM5FPSvc25yDbiuw+x1M/sGujQMo7hfjyM7Tsx6MYJ8LqVDKFUiiKKgar
	tdSw==
X-Gm-Message-State: ALoCoQkUf/zN7HmocC4hWThuZLPoAh/vh84p9BZx/yatLg1ejoZtaA/tObsWkVWsto8cT1wTT1zT
X-Received: by 10.229.176.198 with SMTP id bf6mr4984878qcb.12.1415902477676;
	Thu, 13 Nov 2014 10:14:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 13 Nov 2014 10:14:17 -0800 (PST)
In-Reply-To: <1415346729-16760-2-git-send-email-schnitzeltony@googlemail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-2-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 18:14:17 +0000
Message-ID: <CAJTo0Lbs=jzjEvpw64X5iJ9DqG5BV8Sgc9-A80Nf2mM8q=CF_w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] midori: update to 0.5.8
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
X-List-Received-Date: Thu, 13 Nov 2014 18:14:39 -0000
Content-Type: multipart/alternative; boundary=001a11c3057e3816570507c17cde

--001a11c3057e3816570507c17cde
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 7 November 2014 07:52, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> +SRC_URI =3D "
> http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
>

ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://www.midori-browser.org/downloads/midori_0.5.8_all_.tar.bz2:
2014-11-13 18:07:07 ERROR 404: Not Found.

+S =3D "${WORKDIR}"
>

This is... worrying.  If the tarball doesn't extract into a folder, please
use the subdir parameter in SRC_URI to put it into one.

Ross

--001a11c3057e3816570507c17cde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Andreas,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 7 November 2014 07:52, Andre=
as M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@google=
mail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><div id=3D":11m" class=3D"" style=3D"overflow:hidde=
n">+SRC_URI =3D &quot;<a href=3D"http://www.midori-browser.org/downloads/${=
BPN}_${PV}_all_.tar.bz2" target=3D"_blank">http://www.midori-browser.org/do=
wnloads/${BPN}_${PV}_all_.tar.bz2</a> \<br>
</div></blockquote><div><br></div><div>ERROR: Fetcher failure: Fetch comman=
d failed with exit code 8, output:</div><div><a href=3D"http://www.midori-b=
rowser.org/downloads/midori_0.5.8_all_.tar.bz2">http://www.midori-browser.o=
rg/downloads/midori_0.5.8_all_.tar.bz2</a>:</div><div>2014-11-13 18:07:07 E=
RROR 404: Not Found.=C2=A0</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"=
:11m" class=3D"" style=3D"overflow:hidden">
+S =3D &quot;${WORKDIR}&quot;</div></blockquote></div><br>This is... worryi=
ng.=C2=A0 If the tarball doesn&#39;t extract into a folder, please use the =
subdir parameter in SRC_URI to put it into one.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c3057e3816570507c17cde--
