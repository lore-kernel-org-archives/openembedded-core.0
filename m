Return-Path: <rcalhoun@shotspotter.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe001.messaging.microsoft.com [65.55.88.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5536F6D74F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 16:21:21 +0000 (UTC)
Received: from mail229-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Mon, 18 Nov 2013 16:21:22 +0000
Received: from mail229-tx2 (localhost [127.0.0.1])	by
	mail229-tx2-R.bigfish.com (Postfix) with ESMTP id C4A30C4012E;
	Mon, 18 Nov 2013 16:21:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:157.56.240.85; KIP:(null); UIP:(null); IPV:NLI;
	H:BL2PRD0410HT001.namprd04.prod.outlook.com; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: PS-1(zz1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2fh109h2a8h839h944he5bhf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1fe8h1ff5h209eh2216h1155h)
Received-SPF: pass (mail229-tx2: domain of shotspotter.com designates
	157.56.240.85 as permitted sender) client-ip=157.56.240.85;
	envelope-from=rcalhoun@shotspotter.com;
	helo=BL2PRD0410HT001.namprd04.prod.outlook.com ; .outlook.com ; 
Received: from mail229-tx2 (localhost.localdomain [127.0.0.1]) by mail229-tx2
	(MessageSwitch) id 1384791680892383_14911;
	Mon, 18 Nov 2013 16:21:20 +0000 (UTC)
Received: from TX2EHSMHS013.bigfish.com (unknown [10.9.14.249])	by
	mail229-tx2.bigfish.com (Postfix) with ESMTP id D5508580034;
	Mon, 18 Nov 2013 16:21:20 +0000 (UTC)
Received: from BL2PRD0410HT001.namprd04.prod.outlook.com (157.56.240.85) by
	TX2EHSMHS013.bigfish.com (10.9.99.113) with Microsoft SMTP Server (TLS)
	id 14.16.227.3; Mon, 18 Nov 2013 16:21:20 +0000
Received: from BL2PRD0410MB349.namprd04.prod.outlook.com ([169.254.9.124]) by
	BL2PRD0410HT001.namprd04.prod.outlook.com ([10.255.99.36]) with mapi
	id 14.16.0383.001; Mon, 18 Nov 2013 16:21:13 +0000
From: Robert Calhoun <rcalhoun@shotspotter.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker
	<paul@paulbarker.me.uk>
Thread-Topic: [OE-core] opkg in svn?
Thread-Index: AQHO5FYuk7tLbFhcxECAd+QJq3ya75oq19uA
Date: Mon, 18 Nov 2013 16:21:12 +0000
Message-ID: <CEAF8F07.1E9235%rcalhoun@shotspotter.com>
In-Reply-To: <1384776180.6460.218.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.3.8.130913
x-originating-ip: [10.255.99.4]
MIME-Version: 1.0
X-OriginatorOrg: shotspotter.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 16:21:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17A1402EF287FD4F92148CA2D09C27BC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

From: Richard Purdie <richard.purdie@linuxfoundation.org>

>opkg is in svn but its one of the few remaining
>components we use from svn. It means we have to build subversion-native
>which has a fairly long dependency chain. It would be nice if we didn't
>need to so is there any chance we can move opkg to git?

I'm one of the great unwashed who still use subversion internally. For
these users, removing subversion SRC_URIs from oe-core will not remove the
need to build subversion-native. I'm not suggesting that oe-core should
not move away from svn when appropriate, only that many users aren't going
see much of a performance bump when every last reference is purged.

>An alternative would be to have good tarball releases we could use
>instead?

If opkg doesn't change much, a tarball download will be faster and use
less disk space than svn checkout. This seems like a good approach.

From: Saul Wold <sgw@linux.intel.com>
>Yup, that's the one, and they don't keep the older tarballs around
>either, a real pain!

...as long as the old tarballs hang around!




Documentation on the various SRC_URI fetchers is pretty thin in the yocto
manuals. The bitbake documentation is also incomplete and it requires 1 GB
(!) of dependencies to make. I'd be happy to work on better documenting
SRC_URI syntax; where should this go? A new section under 5.3 of the dev
manual seems most appropriate:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#usingpo
ky-extend-addpkg

I assume bitbake's usermanual.xml should be updated as well? There are a
half-dozen commits in the last two years, so it is neither very active nor
very dead.

This sort of falls under
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4370 but as that is
about the OE user manual, should I make a new ticket and assign it to
myself?

-Rob Calhoun



