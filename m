Received: from smtp22.4emm.com ([69.18.222.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QrN5Z-0003cW-UR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 06:41:50 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB22.4emm.local ([fe80::1428:544e:162c:c29b%14]) with mapi id
	14.01.0289.001; Thu, 11 Aug 2011 00:33:05 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR
	assignment to unconditional.
Thread-Index: AQHMVjnZX+Jvlt+5PkG8wRgqH9pj0pUVgK2AgAAW+YD//78+cIAA634AgADPCRCAAAKvEA==
Date: Thu, 11 Aug 2011 04:37:19 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF183CF9@MBX20.4emm.local>
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
	<4E41D1B3.4090703@intel.com> <4E41E4F9.60404@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF183852@MBX20.4emm.local>
	<1312977970.14274.357.camel@rex>
	<840A81C1B782724A8EB52725BD519EFF183CDB@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF183CDB@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
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
X-List-Received-Date: Thu, 11 Aug 2011 04:41:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> Worse, I don't think bitbake.conf is guaranteed to be in the same spot in
> every layers.conf, so different layers will parse with different environm=
ents.
>=20

Sorry, that last line is wrong. Bitbake.conf always parses last.

James


