Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id A0E2D78951
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:44:40 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id b8so4299441uaf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=aosOl/ww7t+3QiSfRFHGV6sM0r34h77AqfYuwt/FS3c=;
	b=m1Zf0R3LLjyTc8x68jLM3lvQN2V0K23VfZ6b1LnTuiwblm78y4TmZQJUGyOzdP5f+Y
	ur9u12saPhij+SQiUmWOSfpvqfFBPD3dx6I4zlEdIXkS4sikxJQsuqp1U9q0YaApvY1r
	H+scjPNmwk35XSt7vrIRvM5BBN27GW/rnhCZJR1tZHLjzdETzUnLM1ysLokSLHKo0EYe
	/8rcmyBDFomL/IfJM5z2h4cvoyc/lXjlzf6A2f8fd/AQW4U/dZHGFOvfmFrfPrm/T9V7
	tBjJ4sYrM9QqErC2qx2hSFCE08id7lh+doUzGjyX+UCLFRKvujcmmHQIFSytDCOP2UnG
	oI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aosOl/ww7t+3QiSfRFHGV6sM0r34h77AqfYuwt/FS3c=;
	b=aluId6OMta2xP9u9g5xNx++z3U+EZV+apQkFUWYvrEnNMR5U1dOyPiM2gC4haHczvQ
	4n4ykPQ4SWpZoa4gkqjbBYOezzVtPv9lVjI+9+auAKSUJJFUH9I67U2Ikk8P/+SUJzB2
	rB2+AOdgruQI3dIeeaESNH2OT+KOoWFgF9EH3yf/GuZcRb7Kh2rZoWPOrTH0GtEdEJ7f
	CB6UORN/iZqsba3xx9LmE6M83xvFHgLS0pmSeFRaF7G/jtqlUKSaAYBtnOGfEPItGuyy
	F+vKz4bh1xAEt4NRwaABNIDSRdHvDpSCroLUet2UW333BDB3y4yEhxkR8YUozgOrOQMI
	qvnw==
X-Gm-Message-State: AElRT7HRfDz0sfHVYG1tSn9dEI0lKAtrKhd+tlAvWqp0hKiIJRq8I2PH
	zVz29/W0cYXzPaMT5+nzmLjtFqv7EluAs5xo0rgSxQ==
X-Google-Smtp-Source: AG47ELtCFKUuO8hIN6AzOuNJ5lRJepi7XXZRFAeBAQyvpWB66qJjwvZN1lVenoXvzvOvLk/rDhchIlhsF7Ysq4pvP+4=
X-Received: by 10.159.53.105 with SMTP id o96mr9655618uao.33.1521488680956;
	Mon, 19 Mar 2018 12:44:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Mon, 19 Mar 2018 12:44:40 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Tue, 20 Mar 2018 01:14:40 +0530
Message-ID: <CAPGMVzFwWL9xqX-tQSWEFsa-f56nh01ONCCzE2p1+Bx8T1=zdQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Build Error
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
X-List-Received-Date: Mon, 19 Mar 2018 19:44:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c04c6445bbbd30567c930de"

--94eb2c04c6445bbbd30567c930de
Content-Type: text/plain; charset="UTF-8"

Hi,

1. So while building the target i get the following error,

bitbake core-image-sato
Loading cache: 100%
|#################################################################################################################|
Time: 0:00:00
Loaded 1 entries from dependency cache.
ERROR: ParseError at
/home/jarvis/poky/meta-openembedded/meta-python/recipes-extended/python-pyephem/
python-pyephem_3.7.6.0.bb:12: Could not inherit file classes/pypi.bbclass

for which i create a file called pypi.bbclass and copy the code in it and
place it it /poky/meta/classes and run
"bitbake core-image-sato" for which i dont get any error,
is it the right method to be followed?

2. This error appears when i am using bitbake in rocko branch but doesnt
appear when i shift to master branch and build the image; is it fine to
shift branch (i.e. from rocko to master) and build the image?

Thanks

--94eb2c04c6445bbbd30567c930de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br>1. So while building the ta=
rget i get the following error,<br><br>bitbake core-image-sato<br>Loading c=
ache: 100% |###############################################################=
##################################################| Time: 0:00:00<br>Loaded=
 1 entries from dependency cache.<br>ERROR: ParseError at /home/jarvis/poky=
/meta-openembedded/meta-python/recipes-extended/python-pyephem/<a href=3D"h=
ttp://python-pyephem_3.7.6.0.bb:12">python-pyephem_3.7.6.0.bb:12</a>: Could=
 not inherit file classes/pypi.bbclass<br><br></div>for which i create a fi=
le called pypi.bbclass and copy the code in it and place it it /poky/meta/c=
lasses and run <br>&quot;bitbake core-image-sato&quot; for which i dont get=
 any error,<br></div>is it the right method to be followed?<br><br></div>2.=
 This error appears when i am using bitbake in rocko branch but doesnt appe=
ar when i shift to master branch and build the image; is it fine to shift b=
ranch (i.e. from rocko to master) and build the image?<br><br></div>Thanks<=
br><div><div><div><div><br></div></div></div></div></div>

--94eb2c04c6445bbbd30567c930de--
