Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 135776013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 20:20:53 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0224.002; Wed, 13 May 2015 22:20:52 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: opkg and gpg signed ipk packages
Thread-Index: AQHQiQF1GoctQW/hYkC8XY65YpEcWJ1xw3SQgABfj4CAAdOP8A==
Date: Wed, 13 May 2015 20:20:51 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150507200911.GA19158@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258EEECD@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
In-Reply-To: <20150508162311.GA20977@bang.betafive.co.uk>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Wed, 13 May 2015 20:20:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi=20
> SHA256 is also supported. In OpenEmbedded, use the PACKAGECONFIG
> 'sha256' then ensure that your Packages file contains a 'SHA256sum: ...' =
line
> for each package.

Does anyone know where do I specify this PACKAGECONFIG configuration? I wan=
t all ipk packages to be checksummed using sha256 (in the Packages file tha=
t describes the ipk  packages). The default seems to be md5:

tmp/deploy/ipk/ppce500v2/Packages
Package: acl-dbg
Version: 2.2.52-r0
Recommends: libc6-dbg, libattr-dbg, libacl-dbg
Section: devel
Architecture: ppce500v2
Maintainer: Poky <poky@yoctoproject.org>
MD5Sum: 0903a158d6c7acc825bf7e71b255d7fc     <<<<<

Thanks
//Sona

