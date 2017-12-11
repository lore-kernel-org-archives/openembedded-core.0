Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A148278735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 08:55:05 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n138so12880301wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 00:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=jofgHTLCnZnFhJi7XJyCZJ20UzVGvEvB/izKzJBFm4c=;
	b=PBlTkQfhJCXsS07RLg6R/dukXMtw4LpSOrpXB6lavZliWUYBuJNDE60v9ZKIJVrrtk
	CF7T1b0z27pzCJ6+R9+mdzW10Sl5kzJAqDAiXl8SUXB3OmOoHqkaqAOsvuZdFg9vWTyw
	L77iOT8NoKtk3P5z6swfExMa5o69tHt40Dv6Yt3S8ga0puGPToDWrVK1HCGGX0iRizGG
	y6kQziljeWmrkvnMENZododlX+a8SRWSgB0og5w9fsB/4Iyw36hsRATnA8xT1NyieNeI
	/++qI/AV55h0ewPF+tMbS/wLwgoaZy8dKamBlR4poHAvRpN5EEMMaP1CsBvuXB2ZQgtW
	22bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=jofgHTLCnZnFhJi7XJyCZJ20UzVGvEvB/izKzJBFm4c=;
	b=tCus2MUqfw1cSQu1s/0Q0pm41b5KbNsStsOe6PySNTxhi2uyFPUvOQDJRZLvZdd0W6
	A4HJvnMy7XZUSiD3Evg1AcYiMMsp1UrWsAB8cmxjcK/iEhMLSkeYCxFMz/ztLiotd4Sq
	DEZTwWhrbag8onyg5dXqv1qugyxM5WEE1e4Uz/SYze8a8zNKx6FPTMdNOeH54CeOhBOo
	psEWdQYwoe9pZ2Hfz0v9GIhbWaPmhseCWtrRTAhPrHbIb2jeOKqdSuTD4EfYPkkzByB3
	+AkL/J4kUMCpmNaBizN66RxwnUBe0z/dHe1B9Q7NRULdJTuf7ENrzI2weOGF8wI//SzI
	vgmA==
X-Gm-Message-State: AKGB3mKZVfTzlDOCyejLSg3m9NiBtdRAm3psdOPaxefLpUCoyykHonLg
	fDpuj3pdzTHav70Ni0umJLUDKK5Tn5mWXPhnAplcyQ==
X-Google-Smtp-Source: ACJfBos4UGVwgAvPDmgo7oEazFrvY9Uh80uzN/1BRs0QYG+H3Z8tntOqe4U6HMaE5n2m1aUSDK0fyGXQF0XzWuSrNaM=
X-Received: by 10.28.71.5 with SMTP id u5mr96737wma.84.1512982506308; Mon, 11
	Dec 2017 00:55:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.199 with HTTP; Mon, 11 Dec 2017 00:55:05 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 11 Dec 2017 08:55:05 +0000
Message-ID: <CAPyrkgwxYUBGb4wLa83Bcm5dRDFh0m7X3o0tZx9sCYy2PEZV=A@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Subject: OpenEmbedded stand at FOSDEM 2018
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
X-List-Received-Date: Mon, 11 Dec 2017 08:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We've got confirmation for an OpenEmbedded stand at FOSDEM 2018! We're
in the AW building as usual, you can see the full list of stands and
location details here: https://fosdem.org/2018/stands/

What we need:

* People to help out on the stand and chat about the project. If
you're going to FOSDEM and don't know many people in the OE project
this is a great way to get to know some. Even if you can only help out
for an hour or two this would be much appreciated!

* Device/product demos which show off the features of OE. We only have
one table this year so please let us know if you're bringing hardware,
that way we can make sure everything fits. Preference will go to
hobbyist projects as this is FOSDEM but we're happy with commercial
projects as long as they're not an explicit sales pitch.

* Build system demo. I really want us to show off toaster again as
that got a lot of interest last time we demo'd it at FOSDEM.
Unfortunately I'm on holiday before FOSDEM and I'm not travelling
directly from home so I'll be unable to bring something to run this
demo on. So if someone could bring a laptop or mini-PC/monitor/etc to
run a build system demo on that would be excellent. If not I'll see if
I can get something shipped to Brussels.

I've created a wiki page here:
https://www.openembedded.org/wiki/FOSDEM_2018. Please add to this if
you're planning to bring anything or just attend.

Look forward to seeing many of you in Feb :)

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

