Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sb5ho-0008RF-1j
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 09:58:32 +0200
Received: by wibhn14 with SMTP id hn14so1530485wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2012 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=NIK7SiA9jJgMoHYfFMXX1dFP0+tI24EldhWw5tgmDOs=;
	b=wUfsQCUl7xrO02VLPnbBC20Dx8lEkrKudbzSWph9AzWrloktvOvH65xdyrqj9FRgmW
	vqdwB7bgn2eNxCvOjspNZoveHWxxM8bfizPi7k5YaVWpmQxiK9j0j1aVu8sUGqddav6g
	w3Uc/ketKxrcOmC3ouQjytQAG5TGQsBTI//tlGmA/rlX6evW+rRFUm4vAmMqpTm2UHVh
	igR6Zic1wJFoB31OQWl7rHbwQage+3Y79ANAfr59vSpYK1V0qzgpq+/lpchE9DoQ7Lv5
	a1iLKmMRfs8YmNrw42ZL9HqYTG0+vrXzYAHkDUkBSxDMQZQOd6f0qKUyYLbl8y2awIfz
	qfkQ==
Received: by 10.216.196.72 with SMTP id q50mr7734276wen.90.1338709688845;
	Sun, 03 Jun 2012 00:48:08 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id k8sm17328134wia.6.2012.06.03.00.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 03 Jun 2012 00:48:08 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sun, 3 Jun 2012 09:48:05 +0200
Message-Id: <090BB650-33ED-48AE-8AD2-4CDD89A3AEFB@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] How to create a u-boot-xilinx_git.bb recipe for virtex5 and microblaze machine architectures
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
X-List-Received-Date: Sun, 03 Jun 2012 07:58:32 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8815D75A-CAD3-4D4B-B4AA-8FAB6C60D536"

--Apple-Mail=_8815D75A-CAD3-4D4B-B4AA-8FAB6C60D536
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
       I'm trying to make the =
meta-xilinx/recipes-bsp/u-boot/u-boot-xilinx_git.bb recipe work for both =
the virtex5 and microblaze machine architectures.

So far, I find that you can start off by simply prefixing the machine =
architecture for a bunch of variables like

PV_virtex5
SRC_URI_virtex5

and so on.

I have two basic questions:

01. When setting PV_virtext5, should I be using SRCPV or SRCREV? What is =
the difference between SRCPV and SRCREV?

PV_virtex5 =3D "v2012.04.01+git${SRCPV}"=20

02. When setting the SRCREV, which one should I use SRCREV_${PN}_virtex5 =
or SRCREV_pn-${PN}_virtex5

SRCREV_${PN}_virtex5 =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"

or=20

SRCREV_pn-${PN}_virtex5 =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"

I'm looking at meta-ti/recipes-bsp/u-boot/u-boot_git.bb, and I see =
inconsistent application, e.g.  SRCREV_${PN} for omap3evm, and and =
SRCREV_pn-${PN} for the rest like am37x-evm, etc, in that recipe. It's =
got me confused as to what the proper way to set SRCREV is.

Best regards,

Elvis Dowson=

--Apple-Mail=_8815D75A-CAD3-4D4B-B4AA-8FAB6C60D536
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div>&nbsp; &nbsp; &nbsp; &nbsp;I'm trying to make the =
meta-xilinx/recipes-bsp/u-boot/u-boot-xilinx_git.bb recipe work for both =
the virtex5 and microblaze machine =
architectures.</div><div><br></div><div>So far, I find that you can =
start off by simply prefixing the machine architecture for a bunch of =
variables =
like</div><div><br></div><div>PV_virtex5</div><div>SRC_URI_virtex5</div><d=
iv><br></div><div>and so on.</div><div><br></div><div>I have two basic =
questions:</div><div><br></div><div>01. When setting PV_virtext5, should =
I be using SRCPV or SRCREV? What is the difference between SRCPV and =
SRCREV?</div><div><br></div><div>PV_virtex5 =3D =
"v2012.04.01+git${SRCPV}"&nbsp;</div><div><br></div><div>02. When =
setting the SRCREV, which one should I use SRCREV_${PN}_virtex5 or =
SRCREV_pn-${PN}_virtex5</div><div><br></div><div>SRCREV_<font =
class=3D"Apple-style-span" color=3D"#ff221b">${PN}</font>_virtex5 =3D =
"415d386877df49eb051b85ef74fa59a16dc17c7d"</div><div><br></div><div>or&nbs=
p;</div><div><br></div><div>SRCREV_<font class=3D"Apple-style-span" =
color=3D"#ff221b">pn-${PN}</font>_virtex5 =3D =
"415d386877df49eb051b85ef74fa59a16dc17c7d"</div><div><br></div><div>I'm =
looking at meta-ti/recipes-bsp/u-boot/u-boot_git.bb, and I see =
inconsistent application, e.g. &nbsp;SRCREV_${PN} for omap3evm, =
and&nbsp;and&nbsp;SRCREV_pn-${PN}&nbsp;for the rest like&nbsp;am37x-evm, =
etc, in that recipe. It's got me confused as to what the proper way to =
set SRCREV is.</div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis Dowson</div></body></html>=

--Apple-Mail=_8815D75A-CAD3-4D4B-B4AA-8FAB6C60D536--
