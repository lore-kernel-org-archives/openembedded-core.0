Received: from smtp1.4emm.com ([69.18.222.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S71YY-0000XX-8d
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 10:28:42 +0100
Received: from HUB20.4emm.local (192.168.160.61) by HUB01.4emm.local
	(192.168.160.132) with Microsoft SMTP Server (TLS) id 8.3.106.1;
	Mon, 12 Mar 2012 05:19:58 -0400
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::cc60:b27f:4624:1b8c%14]) with mapi id
	14.01.0289.001; Mon, 12 Mar 2012 05:19:58 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: building multiple kernel and module packages for the same MACHINE
Thread-Index: Ac0AL+O3BS+j8cFgTdWd60hZX9cFdg==
Date: Mon, 12 Mar 2012 09:19:57 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF33807F8E@MBX20.4emm.local>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: building multiple kernel and module packages for the same MACHINE
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
X-List-Received-Date: Mon, 12 Mar 2012 09:28:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I need to have multiple kernels built for a particular piece of hardware, t=
o be packaged within several different images. I understand that in oe-core=
, there is a single kernel provider, and the kernel it builds is staged int=
o the machine sysroot so that external kernel modules can be built against =
it. This isn't itself a problem - I don't mind having a generic kernel in t=
he staging area, so long as I can build multiple kernels, and install their=
 kernel modules onto various images.

I have considered simply defining several equivalent machines in order to g=
et around this 1:1 limitation, but this results in multiple sysroots, and t=
he sysroots get rather large.
Does anyone know of a ready-made alternate solution, or have any advice to =
share? The only hints I could pick up from the mailing list archive seemed =
to predate oe-core...

Thanks,=A0
James



