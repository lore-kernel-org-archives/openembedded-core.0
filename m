Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phytec.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id B1456778AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 09:44:20 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id DC1B5A0044C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:44:47 +0100 (CET)
Received: from [172.16.25.223] ([172.16.25.223])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017030810442099-320402 ;
	Wed, 8 Mar 2017 10:44:20 +0100 
To: openembedded-core@lists.openembedded.org
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
Date: Wed, 8 Mar 2017 10:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 08.03.2017 10:44:20,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 08.03.2017 10:44:21
X-TNEFEvaluated: 1
Subject: Create more than one image with WIC
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
X-List-Received-Date: Wed, 08 Mar 2017 09:44:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks) and=20
added them to the local.conf.

When I build the image only the first wks in WKS=5FFILES will be used by=20
WIC and the second will be ignored. Is it possible to build two images=20
in one build?

Includes of the wks files in local.conf:
WKS=5FFILES=5Fti33x =3D "am335x-sdimage.wks am335x-emmc.wks "

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz

