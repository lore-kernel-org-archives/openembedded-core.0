Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4677B706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:07:26 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z60so25344586qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 09:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y+INIX9wkTUfckm6QZ/5HD1iQsI5lYVeTEDBoYtbD2g=;
	b=KTnE6pmosZdn59mlDEBbEGFZnwnLoxlXck9zEpi3FmULPHOZVS/RJaU3irXUc7G45Z
	tcOghkEg5l3RKSOddMoc7oDEQIYpsDJPHdfIiASoejLCB03mpVVPVfUc4p4s61TEn5qW
	oh79A0jQlOcUTBo9EaTY8npVd6DeYsHxj0UArlCnsGNMbJZDXwOxGRcZyvFLOyJGEmUd
	E/wA35/A+x4/FUbYJ2Co8XdL8Zp7i3Uw5qCvei9cuO4vEn6XCWquuvKvf2SdHwRYai7x
	sa+mwDg+I0FX85rMsFCf4q2G29TzRBLY+pVopRilsSEIBgL4MPXlqnNRlnbUWv0QlCX8
	MMKA==
X-Gm-Message-State: ALoCoQmo1bXhnHccLzRZ/L6AwPkFT+w5LNoRGD59Q1IveR7qdwDyNuBTw5FENclNgiuM2gTbwO2u
X-Received: by 10.140.43.199 with SMTP id e65mr26008726qga.34.1424711247491;
	Mon, 23 Feb 2015 09:07:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Feb 2015 09:07:07 -0800 (PST)
In-Reply-To: <CABcZANnh5dpJNzbtYFbVLdMRLrGtGf1t5C2_3LYyEZEa=Jp7=Q@mail.gmail.com>
References: <1424702651-9454-1-git-send-email-ross.burton@intel.com>
	<CABcZANnh5dpJNzbtYFbVLdMRLrGtGf1t5C2_3LYyEZEa=Jp7=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Feb 2015 17:07:07 +0000
Message-ID: <CAJTo0LbuO5TvpYDqy4Y6t7b5BKXehh+Dbniifs6Mo9dxDZRpwQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: clean up and clarify hostname logic
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
X-List-Received-Date: Mon, 23 Feb 2015 17:07:29 -0000
Content-Type: multipart/alternative; boundary=001a113a9baad09066050fc46f6f

--001a113a9baad09066050fc46f6f
Content-Type: text/plain; charset=UTF-8

On 23 February 2015 at 16:25, Christopher Larson <clarson@kergoth.com>
wrote:

> Question, why use a magic value at all? Why not just set hostname =
> "${MACHINE}"?
>

Because that would be sensible? V2 incoming.

Ross

--001a113a9baad09066050fc46f6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2015 at 16:25, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_e=
xtra">Question, why use a magic value at all? Why not just set hostname =3D=
 &quot;${MACHINE}&quot;?<div class=3D"yj6qo ajU"><div id=3D":ae" class=3D"a=
jR" tabindex=3D"0"></div></div></div></blockquote></div><br>Because that wo=
uld be sensible? V2 incoming.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113a9baad09066050fc46f6f--
