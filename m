Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0D592781DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:47:50 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b76so3131817wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jan 2018 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=1UdmsqLukuVdEZ7qTxlJJp8oG2bKnbu3stWANeqSLLI=;
	b=BT0Gv0TxfrgNIPfgkzcN02ccJwjs/tcYSAnt7LpJuiv+hNhVs9TP1wIqfgllBOHYbJ
	jms0qG1eI5PfBT+fefimKN0O40NcvZaRqg1a3bCehGpZmp00l8QrQ/91YtY2tjBEiTPY
	m1YKdRbqdER8iQ5QVFqmc7qOtaLMtvLVR8H7yynBLflp9PIUshfk5wleb/VPUjhsARRe
	L1NEa4TNeWqrhN84vPVHUgQ2d/R3ypHPVL6SPG0nsdPZiasRr8ZT38bLBtC7FbDb47wn
	ODV8jrH3B4U/mCADOPVZNTzx+bEyrBR1BVHARmshSHXSrf5X+SFmZHVTl8FYm5OYlZkH
	NAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=1UdmsqLukuVdEZ7qTxlJJp8oG2bKnbu3stWANeqSLLI=;
	b=Gysv0KThek/BrOcWLfBIJyFmVPi6BNd43tBP6/rmYbHWtnZvm9HZox4oXdNglAIqNn
	yzwKL0bTB/26f5E2fp6YnDIikcaACUOOdG6YYbDntcYubX7kNPCtm4A14ApHT718RA7B
	q41+mho3kYcXRqwHMrYKP2n+xeZvpbqAjq3L0wgBfazlfse8YRmIClXfSxlgIa/j8g7Z
	ybb7WEcUQcEVqjUcJAIIEG3HNMA7Wck38EGOODKpv6SQgAraifFg9zVbXbE9yYeu6KtY
	wyl/1Wyhjd/wYHKKunZlT6jUbxv23TpBntDqvfDb68keFD3d80emsO8rR/kR9gdZBoGv
	ZvhA==
X-Gm-Message-State: AKGB3mJs8s2g5/DE8Ug9RVS6xL8E15Mc79r+BPegfJqikAzph+FIjcGL
	fzh1Cme1gUqAn1BhUMgg5gz+2wNKnqao6X2HHfzgktla
X-Google-Smtp-Source: ACJfBosIWSn5L+ngjXd85hM5gnXuAKUDpRdfq6v1XGHDSfz65drjjQ+hb1r2/iJem+KGZSndZY/55uwZsgQlVgNit1M=
X-Received: by 10.28.156.10 with SMTP id f10mr1782855wme.128.1514990871665;
	Wed, 03 Jan 2018 06:47:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.182.79 with HTTP; Wed, 3 Jan 2018 06:47:51 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
Date: Wed, 3 Jan 2018 14:47:51 +0000
Message-ID: <CAPyrkgxupO+=0+bmA=+JO+zs=t_i=Pm06GJyRFvYfTb5sXjSBA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	openembedded-members@lists.openembedded.org, yocto <yocto@yoctoproject.org>
Subject: Slideshow for FOSDEM
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
X-List-Received-Date: Wed, 03 Jan 2018 14:47:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As we've only got one table at FOSDEM this year we're not going to
have space for as many bits of hardware as usual. I'd still like us to
show off the project and what people are building with OpenEmbedded &
Yocto Project though. Given the limited space I think the best way to
do this would be to put a slideshow on my laptop.

I've made a start on this here:
https://docs.google.com/presentation/d/1KYxhsxO-8GxhAreE0GKnTOCPdY6_4uXYIEp=
6Lc55MB8/edit?usp=3Dsharing

I've made this publicly editable so please feel free to add slides for
any OE features you want to show off and any projects (professional or
hobbyist) built with OE. If anyone can add a slide on project history
that would also be great. I'd also like a slide on the latest release
and the new features added. Photos of hardware projects using OE and
features like Toaster would be especially welcome!

I'll give this a final edit before FOSDEM and the put it on rotation
on a laptop at the stand. Hopefully it will be useful for future
events as well.

Thanks all,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

