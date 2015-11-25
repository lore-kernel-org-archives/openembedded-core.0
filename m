Return-Path: <stefan.gangefors@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0AE6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9C82318142
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6ykgRNzYA4uz
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 76A76180D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 609851409
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 555F4F43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 51D353E44D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:11:19 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Wed, 25 Nov 2015 09:11:19 +0100
From: Stefan Gangefors <stefan.gangefors@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 09:11:17 +0100
Thread-Topic: do_rootfs task not executed after modifying externalsrc
Thread-Index: AdEmzmEwiBAAaX6oSRiMJ5ow6rRG0wAiX+VwAAA8i1A=
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6F06C5059@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: do_rootfs task not executed after modifying externalsrc
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
X-List-Received-Date: Wed, 25 Nov 2015 08:11:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

I'm trying to figure out how I can trigger a rootfs rebuild after modifying=
 source code in a git I'm using as an externalsrc.

I'm using Dizzy with a backport of externalsrc.bbclass from Jethro.
I have no PR service running.

My local.conf has these lines related to using externalsrc:
=A0=A0=A0 INHERIT +=3D "externalsrc "
=A0=A0=A0 EXTERNALSRC_pn-mypackage =3D "/my-path/my-package"
=A0=A0=A0 EXTERNALSRC_BUILD_pn-mypackage =3D "/my-path/my-package"


After modifying my code in my externalsrc I want to compile and rebuild the=
 image with the changes included. The first build works as it should since =
nothing is built before that. But the following bitbake <image> commands wi=
ll only update my package but it will not be included in the rootfs.

I notice that all tasks for my package up to and including do_package_write=
_rpm is executed and I see a newly written rpm file for my package, but the=
 do_rootfs task is never triggered.

So I wonder if this is an issue with bitbake or if I have missed something?=
 I would bet on the latter.=20

Any solutions?

Best regards
/Stefan Gangefors


