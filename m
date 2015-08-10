Return-Path: <prvs=657fc4add=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id CB26976846
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:38:52 +0000 (UTC)
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Aug 2015 14:38:47 +0200
Received: from unknown (HELO esabb3.muc) ([160.50.100.30]) by esagw2.muc with
	ESMTP/TLS; 10 Aug 2015 14:38:45 +0200
Received: from smuch58b.muc (HELO SMUCH58B.europe.bmw.corp) ([160.46.137.108])
	by esabb3.muc with ESMTP/TLS; 10 Aug 2015 14:38:43 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH58B.europe.bmw.corp ([160.46.137.108]) with mapi id 14.03.0248.002;
	Mon, 10 Aug 2015 14:38:42 +0200
From: <Mikko.Rapeli@bmw.de>
To: <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] [PATCH 2/5] screen: Add version 4.3.1
Thread-Index: AQHQ02U7j1sf69aRzkGDzzgNPHUIeJ4FCqsA
Date: Mon, 10 Aug 2015 12:38:42 +0000
Message-ID: <20150810123844.GI6102@loska>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
In-Reply-To: <bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Mon, 10 Aug 2015 12:38:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F571070F2FD5F4FA131576E9F874778@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 03:08:21PM +0300, Jussi Kukkonen wrote:
> The Debian diff in SRC_URI only added a debian/-directory in to the
> source tree and did not modify upstream source: So it does nothing.
> This commit removes the diff and does _not_ try to apply the 19000
> lines of patches in debian/patches. Any useful patches should be
> added separately.
>=20
> * Preserve the old 4.0.3 version (GPLv2+) and add new 4.3.1 (GPLv3+)
> * Remove unused debian patch from SRC_URI of 4.0.3, increase PR
> * Add a patchset to enable cross-compiling 4.3.1 (modified from
>   http://savannah.gnu.org/bugs/?43223)

FWIW, Debian and Fedora have just a few patches on top of 4.3.1:

https://pkgs.fedoraproject.org/cgit/screen.git/tree/
https://sources.debian.net/src/screen/4.3.1-1/debian/patches/

-Mikko=

