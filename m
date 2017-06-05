Return-Path: <Peter.Marko@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 31A1377BE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:05:58 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v55B5xGM029170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jun 2017 13:05:59 +0200
Received: from ATNETS99132MSX.ww300.siemens.net
	(atnets99132msx.ww300.siemens.net [158.226.163.55])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTPS id v55B5xLk002838
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jun 2017 13:05:59 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.215]) by
	ATNETS99132MSX.ww300.siemens.net ([158.226.163.55]) with mapi id
	14.03.0352.000; Mon, 5 Jun 2017 13:05:59 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH 1/5] cve-check: honor RM_OLD_IMAGE flag
Thread-Index: AQHS3cxXtJZSD1EYHk6LnsEWZ2QioqIWGxTQ
Date: Mon, 5 Jun 2017 11:05:58 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A841B84072D@ATVIES991UAMSX.ww300.siemens.net>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
	<1496647273-9693-2-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1496647273-9693-2-git-send-email-peter.marko@siemens.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.12]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] cve-check: honor RM_OLD_IMAGE flag
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
X-List-Received-Date: Mon, 05 Jun 2017 11:05:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> +                if d.getVar('RM_OLD_IMAGE') =3D=3D "1":
> +                    os.remove(os.path.realpath(manifest_link))

I have been working with Krogoth and ported my changes to master.
It seems this flag is no longer supported, thus this commit is wrong (or go=
od only for backporting to Krogoth).
I'll remove it in v2 as soon as I get feedback on the other commits, too.

Peter

