Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net [188.165.45.168])
 by mx.groups.io with SMTP id smtpd.web08.7000.1619167960162544691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 01:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 188.165.45.168, mailfrom: norbert.kaminski@3mdeb.com)
Received: from player756.ha.ovh.net (unknown [10.110.171.40])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0779D1FDBC6
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 10:52:37 +0200 (CEST)
Received: from 3mdeb.com (178235223047.warszawa.vectranet.pl [178.235.223.47])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player756.ha.ovh.net (Postfix) with ESMTPSA id 9E2BC1C953EA9;
	Fri, 23 Apr 2021 08:52:32 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-98R002f8f7aed0-91c8-4e0d-b517-5a990d0c4702,
                    8EFEE0A226E679BCA5E8A8E64744624175B10D43) smtp.auth=norbert.kaminski@3mdeb.com
X-OVh-ClientIp: 178.235.223.47
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 =?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>, ross@burtonini.com,
 Richard Hughes <hughsient@gmail.com>
From: "Norbert Kaminski" <norbert.kaminski@3mdeb.com>
Subject: Development of fwupd recipe
Message-ID: <1696db50-c2d4-1ef5-50ad-0afbe12f6a0a@3mdeb.com>
Date: Fri, 23 Apr 2021 10:52:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10003902149412165990
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepvffhuffkffgfgggtgfesthekredttdefjeenucfhrhhomheppfhorhgsvghrthgpmfgrmhhiknhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgfdtgeegffefieduveeiffduveekffdulefhudefvdevheejjeeufeetlefgveenucffohhmrghinhepfehmuggvsgdrtghomhenucfkpheptddrtddrtddrtddpudejkedrvdefhedrvddvfedrgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all,

We (3mdeb Team) are interested in fwupd recipe development. We saw that
Ross Burton did some great work on this topic (fixing fwupd
dependencies), and we would like to know if there is any work in
progress that we could help with. Currently, we are porting fwupd
to *BSDs, so if you have any questions or troubles with the fwupd recipe,
feel free to ask.

Best regards,

Norbert Kami=C5=84ski
Embedded Systems Engineer
http://3mdeb.com | @3mdeb_com

