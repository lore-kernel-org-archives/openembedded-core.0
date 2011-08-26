Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwzOO-0001wU-Nz
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:36:28 +0200
Received: by wwj26 with SMTP id 26so737617wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 09:31:39 -0700 (PDT)
Received: by 10.216.177.212 with SMTP id d62mr2010145wem.51.1314376299769;
	Fri, 26 Aug 2011 09:31:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fj19sm1430390wbb.66.2011.08.26.09.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 09:31:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314372632.19905.93.camel@phil-desktop>
Date: Fri, 26 Aug 2011 18:31:37 +0200
Message-Id: <C368959C-3433-4A60-8B2E-65AC7FBF341E@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
	<1314284316.5939.196.camel@rex>
	<1314367938.19905.90.camel@phil-desktop>
	<EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
	<1314372632.19905.93.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Fri, 26 Aug 2011 16:36:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 17:30 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-08-26 at 17:26 +0200, Koen Kooi wrote:
>> And that gives me =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=3D=
yocto&id=3D9b2e08e0c4da4881ba8c83be39697a40a63b75fd
>>=20
>> -locale_base_en_us -> eglibc_binary_localedata_en_us;
>> +locale_base_en_us -> eglibc_binary_localedata_en_u_;
>>=20
>> So something regexp is being a bit too greedy by the looks of it.
>=20
> Ah whoops, the old missing backslash.  Could you try this one instead?

That one doesn't seem to apply:

koen@dominion:/OE/tentacle/sources/openembedded-core$ git am -s =
/tmp/0001-libc-package-restore-correct-mangling-behavior-for-l-1.patch=20=

Applying: libc-package: restore correct mangling behavior for locale =
names
error: patch failed: meta/classes/libc-package.bbclass:241
error: meta/classes/libc-package.bbclass: patch does not apply
Patch failed at 0001 libc-package: restore correct mangling behavior for =
locale names
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".




