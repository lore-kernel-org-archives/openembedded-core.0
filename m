Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id AFBCE6B7BE;
	Sat, 17 Aug 2013 18:48:39 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id f4so5087632iea.23
	for <multiple recipients>; Sat, 17 Aug 2013 11:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=/nRKzwtlkVC0ZX34C+4T82bxtf5wen1+5isXpOnXQeg=;
	b=UNVnkxTNnJ4vvx1wRUx8RcTQx5G9nbySxzEasaqE3mTjp8WOGsttLx7qL7bzSDbJpM
	DcR8R9CfYHWESlJ9YWwYMvmDo3aZVlJyCIKgkPa06faTBMXImHuTZ8990B/ay8MS7a/P
	NCy3UqBQV5Igqlok0/5j1iRT/uZjiqaUSnJFtqcDo4e6bHi3rKPAZXjO1VckyoGsm1Dl
	97z3/+gpym+D9nVFzXMTFxBbWXOQbLK5KEXa/GezRfKbA4XQCOpqtmnzcOhOLU8f9nZW
	vywatwm5+2Sp/w5qP1zciDWPs4mpVr2Ivscyc+MubPVS1NuuhVKs9vpnArkM/xGwaUOV
	Wd6Q==
X-Received: by 10.50.61.179 with SMTP id q19mr1974026igr.33.1376765320271;
	Sat, 17 Aug 2013 11:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Sat, 17 Aug 2013 11:48:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Aug 2013 11:48:10 -0700
Message-ID: <CAMKF1srmPOcwYYEb1a1y-++vmTQtmH3Ex=ZemhCjgh=h16zwtg@mail.gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: angstrom world build
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
X-List-Received-Date: Sat, 17 Aug 2013 18:48:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have started a world build of angstrom for beaglebone
and soon will extend it to more machines. Angstrom uses most
layers in OE universe and nothing gives better coverage

The wold log for bb is here

http://sakrah.homelinux.org/files/world/beaglebone-world.log

There are interesting failures. Feel free to  peruse and lets fix them
all !

-Khem

