Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC7279493;
	Thu, 13 Sep 2018 08:33:02 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id 93-v6so2755502qks.3;
	Thu, 13 Sep 2018 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Pz0UJvJADy81iw9lrvdPv9iSAG2KCN+T7JPqUwcdvls=;
	b=bGSoXAZh0vC5uqjOzoDWTz7+jlje01xcQfiz7+G5YioaNr5bSk8h8RRpUfKeY+xaSo
	WEzp9X+Q1T6TnI1Y7NN9h7+7fLzAX973+CNQAbgvlNDsorMVvGcA8hC4a1ab0kPHdeas
	yRrqGtHLjCMyi5gb9sCnUMPLgiJQ1Pp7GM9r1Yns9X2Y/vvqfBfY1Pt6VrBgTie6YhsK
	r5upsbSof6tmWajO57hWNDwwmdck30iWbVK8R91GLH6zEAdim1i0DcTjE+e0cqUuz+j9
	r7T4yA6g+yhJMyg5CgOl2+RvZxL0WqbaPFv7F2gZyslcFaiYtm1VhUMbimqnjV5WDnNz
	9eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Pz0UJvJADy81iw9lrvdPv9iSAG2KCN+T7JPqUwcdvls=;
	b=F2EnbqPiKnjeRXxKSG0nqhYyMCk/frikPHWv3DFHlmo+YvVOfyNZBPRNpHKcBKi5Gw
	zdFwmT7oaEY3zK8era3VilzodfACfUIP+nLlTRlNa4mOrJAQSIVl+sIioAw/2dw8zY1B
	mmGCP4vjjM5jhQqMKOcSypC7lVekUowDDyEBQ0QalxXBMrAWBcgEBP5P3TMdc0Afgh36
	L0lxdTeHPPH1i4oWG6U6P63hte6tV1LtlEIw87zRWB1JHuS3Ycs8RaCIlCzsYDtNOPih
	ybRyuHaAvD/BXJfw4+obv5QbzoRAxXsx6vLod1dxs08pcTjjEV0rOfgmPCYiIhyL18O3
	QM6w==
X-Gm-Message-State: APzg51BVEIePgmMSzLY6BfQjf4P1EZk6W1zdcZg6Kh+3EVar9KixmUog
	2Zah1poyX6Bc8chXsghcxDZCmoWDtwgKHo5LinHXpA==
X-Google-Smtp-Source: ANB0VdZu9aOnt2njgQqJ5nmezeTgZYAquKAWDS64bS8tpHP72uG4OB3w4bcTpEuhILDygt9lZn92RJhPRQLl50TsNrs=
X-Received: by 2002:a37:64d8:: with SMTP id
	y207-v6mr4353867qkb.312.1536827583040; 
	Thu, 13 Sep 2018 01:33:03 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 13 Sep 2018 10:32:51 +0200
Message-ID: <CAGCTLNQLVKqxn0zO176Y8+ShPALPra93BRp=7=a-etoGD0A_Mg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][linux][wayland]
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
X-List-Received-Date: Thu, 13 Sep 2018 08:33:02 -0000
Content-Type: multipart/alternative; boundary="0000000000002b12b50575bc8e97"

--0000000000002b12b50575bc8e97
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I built custom image for intel-corei7 processor supporting wayland weston
instead of x11.

I need to hide the mouse pointer from the desktop .
I want to make it as mobiles, so I can use touch screen to click any where
but there is no mouse pointer,

Can any one help ?
Any suggestions?

Thank you in advance,
Regards,


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000002b12b50575bc8e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>I built cust=
om image for intel-corei7 processor supporting wayland weston instead of x1=
1.</div><div><br></div><div>I need to hide the mouse pointer from the deskt=
op .</div><div>I want to make it as mobiles, so I can use touch screen to c=
lick any where but there is no mouse pointer,</div><div><br></div><div>Can =
any one help ?</div><div>Any suggestions?</div><div><br></div><div>Thank yo=
u in advance,</div><div>Regards,<br></div><div><br></div><div><br>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--0000000000002b12b50575bc8e97--
