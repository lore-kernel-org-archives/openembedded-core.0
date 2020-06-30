Received: from mail2.multitech.com (mail2.multitech.com [65.126.90.11])
 by mx.groups.io with SMTP id smtpd.web10.2273.1593537879536820380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: multitech.com, ip: 65.126.90.11, mailfrom: prvs=14431d34bc=john.klug@multitech.com)
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id F0505587FFD_EFB7555B;
	Tue, 30 Jun 2020 17:24:37 +0000 (GMT)
Received: from EXCHDBPM1.dc.multitech.prv (unknown [192.168.11.6])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client CN "", Issuer "MultiTech Systems Intermediate CA 01" (verified OK))
	by mail2.multitech.com (Sophos Email Appliance) with ESMTPS id 68760587D2F_EFB7554F;
	Tue, 30 Jun 2020 17:24:36 +0000 (GMT)
Received: from EXCHDBPM1.dc.multitech.prv (192.168.11.6) by
 EXCHDBPM1.dc.multitech.prv (192.168.11.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 30 Jun 2020 12:24:36 -0500
Received: from EXCHDBPM1.dc.multitech.prv ([192.168.11.6]) by
 EXCHDBPM1.dc.multitech.prv ([192.168.11.6]) with mapi id 15.01.1847.009; Tue,
 30 Jun 2020 12:24:36 -0500
From: "John Klug" <john.klug@multitech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] git do_unpack
Thread-Topic: [OE-core] git do_unpack
Thread-Index: AQHWTXFgQdNOqBKAikyDTZHWQuTCS6juvhkAgAHRjWOAAJj2AIAAGkli
Date: Tue, 30 Jun 2020 17:24:36 +0000
Message-ID: <67ef24cd6a614dafb4245c9454854247@multitech.com>
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
 <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
 <f0fc34bfb15642bdab4a1def06639238@multitech.com>,<CANNYZj_L2fE=j2o7pZ+_i_UH8GgVEZQR3kmg=obJi5vxjWnKqA@mail.gmail.com>
In-Reply-To: <CANNYZj_L2fE=j2o7pZ+_i_UH8GgVEZQR3kmg=obJi5vxjWnKqA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.52.101]
MIME-Version: 1.0
X-SASI-RCODE: 200
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We typically use tags to match PV and name our recipes NAME_TAG.bb

Recipe name:

dhq-client_0.39.bb=20

from bitbake -e dhq-client output:

# pre-expansion value:
#   "${PN}-${PV}"
P=3D"dhq-client-0.39"

In recipe:

SRCREV =3D "${PV}"
SRC_URI =3D "git://git@gitlab.multitech.net/devicehq/mAPI-dhq-client.git;pr=
otocol=3Dssh;nobranch=3D1 \            file://config.json.sample \         =
   file://dhqclient.init \            file://dhqclient \            file://=
dhq-rootCA.pem \ "

Sanity check:

jklug@trustytahrdm1:~$ git clone git@gitlab.multitech.net:devicehq/mAPI-dhq=
-client
Cloning into 'mAPI-dhq-client'...
remote: Counting objects: 485, done.
remote: Compressing objects: 100% (199/199), done.
remote: Total 485 (delta 285), reused 450 (delta 265)
Receiving objects: 100% (485/485), 84.73 KiB | 14.12 MiB/s, done.
Resolving deltas: 100% (285/285), done.
jklug@trustytahrdm1:~$ cd mAPI-dhq-client/
jklug@trustytahrdm1:~/mAPI-dhq-client$ git log -1 --format=3D%ai 0.39 | hea=
d
2020-05-05 09:47:03 -0500
jklug@trustytahrdm1:~/mAPI-dhq-client$ git checkout 0.39
Note: checking out '0.39'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at d21aab3 Merge branch 'vp/fix_logs' into 'master'
