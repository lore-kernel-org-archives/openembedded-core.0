Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (unknown [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BCC766A362
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 10:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 0E7C72E2BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pjMsbxItR0JQ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E24152E333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CAF11FAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:14 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id BFADC9B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:14 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id BDF9C3E048
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 12:38:14 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Fri, 23 May 2014 12:38:14 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 12:38:10 +0200
Thread-Topic: [OE-core] Using users/groups from another recipe than the one
	creating them
Thread-Index: Ac92cxfFMHWSvh+eSJeWOV3pn8Snlg==
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Fri, 23 May 2014 10:38:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 19 maj 2014 10:15
> To: OE Core (openembedded-core@lists.openembedded.org)
> Subject: [OE-core] Using users/groups from another recipe than the one
> creating them
>=20
> Which assumption is correct: "a recipe A that depends on another
> recipe B can use users/groups that B creates" or "all recipes must
> create the users/groups they require themselves"?
>=20
> The problem for us is that we have a lot of recipes that create
> users and groups, and subsequently a number of other related recipes
> that need to use those users and groups.
>=20
> If the first assumption is correct then the useradd.bbclass needs to
> be corrected so that it adds a dependency from do_install to
> base-passwd:do_populate_sysroot and
> base-passwd:do_populate_sysroot_setscene, because if either of those
> tasks execute they will overwrite /etc/passwd and /etc/group,
> effectively removing any users/groups that were created earlier...
>=20
> On the other hand, if it is the second assumption that is correct,
> then there should be QA tests in place to make sure all recipes
> create the users/groups they use.
>=20
> //Peter

*ping*=20

Doesn't anyone know how users and groups are supposed to work?

//Peter


