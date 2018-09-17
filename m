Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id BE9D8745B7;
	Mon, 17 Sep 2018 14:07:59 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id z8-v6so15332313qto.9;
	Mon, 17 Sep 2018 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=g5X3PNJB8luSHWRAeDZTFqzb4d2JcKMrYA8jP20fvVc=;
	b=AOmDPmCUN21TAWHYOHWl95K4RG2+p9/bvpLuYsVE2KFBblEk3FfBP7mwMNDpbOlimQ
	wzb5cFSbp5ZZISwfVjndTwoFTKeJCO032MADE+f012+i+2GhF5TjcH5uIMTZUwvvd2hr
	L1effMPzYgGG5k7nhfmwYl1LN3qVyMTq903vG/4jnjts9c6ey3hTqtcMCK/CS7w9dQHz
	hiQHdjMr+rb7+5dnR1KYLiP/IiSlN6Frd6n5Kc7ddR6uNvR12Jca49zUdGe8itmp3oMO
	SKPD22IKeiPBkvyY456xFYSAf+m/SFpvP/imzrfbO523QIT2uS6sb/bL0gMX2DUh+yms
	vJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=g5X3PNJB8luSHWRAeDZTFqzb4d2JcKMrYA8jP20fvVc=;
	b=CH7m4pzlNxdfehRSesrTiqY8f1tzOgVLTePLYukTQFv6jxIGky4B257sebj+3xZwpH
	YQ3sNXqfmHAzIaLaVGE8/B38ZEalTPZl4xlEave+w3I9e/SWmLsxxdPDCkgZAwP/giv9
	bmYsBlfQs+d4BbQ13Okd/lQcUhWyVLKRuiSqEaB0OPlnNVdaCSK+zxVzZWCrqZ6CCUQN
	oNR8V9eCEcIuDutctLkhkagGBVcoEv7CB2NfTaWjMPQKAHsdsd//WWYwm1S1ZiyS/DVN
	/BV5bWdWFEFVkQok+2Pz33ybnRD2qz3yOEg1mgUHFZT/1080cpo1493yBuDrCU6ailjU
	GjyA==
X-Gm-Message-State: APzg51C4iXTSKO4PMkDqneagVBtNpUQj4i31JlYtVF/Evmig2S8Rg1nw
	uVypk23wuwiyh9kIDqkkLFXhZStO7C8HGeRHPWB8uQ==
X-Google-Smtp-Source: ANB0Vdb8OnJMw9vwfv7MpejREcs75mxAyV6QM5PraBdkHsXnf5RC6SxYqxlcI+exok4aM4iYata3dxbZpZzwpQXdH/Y=
X-Received: by 2002:a0c:c30f:: with SMTP id
	f15-v6mr18110180qvi.104.1537193280355; 
	Mon, 17 Sep 2018 07:08:00 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Mon, 17 Sep 2018 16:07:46 +0200
Message-ID: <CAGCTLNQh9pWNTZJW=OxYBKMJSBiHqYHx3DT0ed5syTf11n1_2Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][patchwork]: new patch
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
X-List-Received-Date: Mon, 17 Sep 2018 14:08:00 -0000
Content-Type: multipart/alternative; boundary="0000000000006d45c4057611b321"

--0000000000006d45c4057611b321
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Last week, I asked about how to hide the Mouse cursor in "wayland" because
I need it to be like a mobile interface.

No one answered me and later I found that it is not possible or there is no
thing ready made to do that.
so, I spent three days reading "wayland" and "weston" source code trying to
solve this problem and finally I succeeded in hiding the mouse cursor .
I wrote patch file for "bitbake" to use it.

Now, I want to sumit this patch file to patchwork
<https://patchwork.openembedded.org/> as my first open source contribution.
How to do this basically ?

Thank you,
Regards,

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000006d45c4057611b321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>Last week, I=
 asked about how to hide the Mouse cursor in &quot;wayland&quot; because I =
need it to be like a mobile interface.<br></div><div><br></div><div>No one =
answered me and later I found that it is not possible or there is no thing =
ready made to do that.</div><div>so, I spent three days reading &quot;wayla=
nd&quot; and &quot;weston&quot; source code trying to solve this problem an=
d finally I succeeded in hiding the mouse cursor .</div><div>I wrote patch =
file for &quot;bitbake&quot; to use it.</div><div><br></div><div>Now, I wan=
t to sumit this patch file to <a href=3D"https://patchwork.openembedded.org=
/">patchwork</a> as my first open source contribution. How to do this basic=
ally ?</div><div><br></div><div>Thank you,</div><div>Regards,</div><div><br=
></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></di=
v><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--0000000000006d45c4057611b321--
