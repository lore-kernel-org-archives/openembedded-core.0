Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1UGHbX-0005Im-BW
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 00:30:43 +0100
Received: from NAEMCASHT02.na.leapfrog.com (unknown [10.12.2.36])
	by mx3.leapfrog.com (Postfix) with ESMTP id 45ACD5FF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 15:50:24 -0700 (PDT)
Received: from naemmail03.na.leapfrog.com ([fe80::491e:453:9918:658c]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0379.000;
	Thu, 14 Mar 2013 15:50:23 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Added task doesn't seem to run when rebuilding recipe
Thread-Index: Ac4g/CgDW9bHqzmKSGCXMmvc3kqpbQ==
Date: Thu, 14 Mar 2013 22:50:23 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0FE6C8449F@NAEMMAIL03.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Added task doesn't seem to run when rebuilding recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 23:30:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I ran into an interesting problem today involving custom tasks and rebuildi=
ng recipes. We have a bbclass that adds 2 new tasks to a recipe, do_complet=
e_metainf() and do_create_lfp(). They are added as follows:

do_create_lfp[nostamp]=3D"1"
addtask complete_metainf after do_install before do_package
addtask create_lfp after do_package_write before do_build

Now I have 2 recipes, recipe A and recipe B. Recipe B depends on A. When re=
cipe A changes version and gets rebuilt, recipe B also gets rebuilt, as in,=
 reconfigured, recompiled, reinstalled, but complete_metainf doesn't get re=
run along with the others. create_lfp does get rerun (as always since it ha=
s no stamp). I'm guessing there's some signature change thing at work here =
but I don't know how oe-core/bitbake decide to recompile recipe B when reci=
pe A changes.

I'm on the denzil branch in case this behavior has changed.

Thanks for your help,

Daniel Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com



