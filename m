Received: from mail-gx0-f173.google.com ([209.85.161.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R1xRU-0002it-3V
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 11:32:12 +0200
Received: by gxk26 with SMTP id 26so1139061gxk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2011 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=elyJl5S0HJYQDACAt3JtcBre59vUytKXbVRz+uDEX1Y=;
	b=Th2PCxq+gNyWDV3EAr5BbfkdM0VT5ACWBsVy0tIMbLeMaKDAdGEVuLZr8WoOnGnEXi
	9v7FHszW1jOGm3eeTmGBbSW6akubU7mdmHprl2nNm4vYHbeWNTTVOZMIItbroXMPnXyJ
	gfPPJzAnqu6/pp8Tp/tn/TcOUL3h6l1OIYFhE=
MIME-Version: 1.0
Received: by 10.150.104.6 with SMTP id b6mr1715133ybc.129.1315560424357; Fri,
	09 Sep 2011 02:27:04 -0700 (PDT)
Received: by 10.150.192.6 with HTTP; Fri, 9 Sep 2011 02:27:04 -0700 (PDT)
Date: Fri, 9 Sep 2011 11:27:04 +0200
Message-ID: <CAAQYJAuBa8_P_JNoT91RhYNtgEzsp85ovSRSE92MHGNE5bGb-Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Klibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2011 09:32:12 -0000
Content-Type: multipart/alternative; boundary=000e0cd4893cc640d204ac7ec7c5

--000e0cd4893cc640d204ac7ec7c5
Content-Type: text/plain; charset=ISO-8859-1

Hello,

we have the latest klibc release in the meta-openembedded layer.

Awaiting an imminent klibc_2.0 release, I'd be grateful if someone could
review and possibly test the recipes [1]
which happen to build and package apaprently well for arm and mips targets
(runtime tested le only).

The recipes can be built separately (e.g. klibc-static-utils only) and are
packaged
in order to minimize the fooprint of the runtime dependencies.

Thanks in advance for your comments

Andrea Adami

[1]
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/klibc
**

--000e0cd4893cc640d204ac7ec7c5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>we have the latest klibc release in the meta-openembedded lay=
er.<br><br>Awaiting an imminent klibc_2.0 release, I&#39;d be grateful if s=
omeone could review and possibly test the recipes [1] <br>which happen to b=
uild and package apaprently well for arm and mips targets (runtime tested l=
e only).<br>
<br>The recipes can be built separately (e.g. klibc-static-utils only) and =
are packaged <br>in order to minimize the fooprint of the runtime dependenc=
ies.<br><br>Thanks in advance for your comments<br><br>Andrea Adami<br>
<br>[1] <a href=3D"http://cgit.openembedded.org/cgit.cgi/meta-openembedded/=
tree/meta-oe/recipes-devtools/klibc">http://cgit.openembedded.org/cgit.cgi/=
meta-openembedded/tree/meta-oe/recipes-devtools/klibc</a><br><b></b>

--000e0cd4893cc640d204ac7ec7c5--
