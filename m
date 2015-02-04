Return-Path: <peter.gejgus@kistler.com>
X-Greylist: delayed 651 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Feb 2015 07:44:17 UTC
Received: from mx2.kistler.com (mx2.kistler.com [195.49.77.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1F85B606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 07:44:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,517,1418079600"; 
   d="scan'208";a="2362880"
Received: from unknown (HELO kihagsepp01.int.kistler.com) ([192.168.52.67])
	by mx2.kistler.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	04 Feb 2015 08:33:22 +0100
Received: from kihagsepp01.int.kistler.com (localhost [127.0.0.1])
	by kihagsepp01.int.kistler.com (Postfix) with SMTP id 5ECE75
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 08:33:22 +0100 (CET)
Received: from mx1.kistler.com (unknown [192.168.52.57])
	by kihagsepp01.int.kistler.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 08:33:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.09,517,1418079600"; d="scan'208";a="14274145"
Received: from kihagwinex01.int.kistler.com ([192.168.100.23])
	by mx1.kistler.com with ESMTP/TLS/AES128-SHA; 04 Feb 2015 08:33:20 +0100
Received: from kihagwinex02.int.kistler.com ([fe80::10cf:df86:bb65:2502]) by
	kihagwinex01.int.kistler.com ([fe80::d70:7df0:c903:4e43%16]) with mapi
	id 14.03.0224.002; Wed, 4 Feb 2015 08:33:20 +0100
From: Peter Gejgus <Peter.Gejgus@kistler.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: post-installation scripts vs. init scripts
Thread-Index: AdBASrrcoe5U4dasR/OQUqPlpAUqZg==
Date: Wed, 4 Feb 2015 07:33:20 +0000
Message-ID: <672D6A2F0F2E8A43891580C45CE5D2E6013D7790@kihagwinex02.int.kistler.com>
Accept-Language: en-US, de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.116]
MIME-Version: 1.0
Subject: post-installation scripts vs. init scripts
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
X-List-Received-Date: Wed, 04 Feb 2015 07:44:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've checked experimentally that post-installation scripts (executed during=
 the first boot) run before init scripts. I've checked it by putting long s=
leep into the following script and I've also verified timestamps from init =
script and post-install script in the log:

pkg_postinst_PACKAGENAME()=20
{
     #!/bin/sh -e
     if [ x"$D" =3D "x" ]; then
          # Actions to carry out on the device go here
          sleep 300
     else
          exit 1
     fi
 }

Can you confirm that post-install scripts run before init scripts and there=
 is no overlap?

Regards,
Peter

