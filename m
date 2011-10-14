Received: from mail-yx0-f169.google.com ([209.85.213.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REgMK-0006Kp-Ni
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:55:28 +0200
Received: by yxs7 with SMTP id 7so1631054yxs.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 04:49:43 -0700 (PDT)
Received: by 10.223.85.134 with SMTP id o6mr3485909fal.8.1318592982868;
	Fri, 14 Oct 2011 04:49:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o16sm3273570fag.21.2011.10.14.04.49.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 04:49:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318592560.942.3.camel@ted>
Date: Fri, 14 Oct 2011 13:49:36 +0200
Message-Id: <BF4FDC68-E435-4309-8B20-8415A7C990EE@dominion.thruhere.net>
References: <20111014075529.GB4437@ad.chargestorm.se>
	<20111014104745.GD4437@ad.chargestorm.se>
	<1318592560.942.3.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC] Preventing race when compiling external kernel modules
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
X-List-Received-Date: Fri, 14 Oct 2011 11:55:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2011, om 13:42 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-10-14 at 12:47 +0200, Anders Darander wrote:
>> * Anders Darander <anders@chargestorm.se> [111014 09:55]:
>>> In our local tree, I've circumvented this race by applying a patch =
like
>>> [3]. (Well, we could likely have put the lock in do_make_scripts()
>>> instead of module_do_compile(), as we have done currently). =
Obviously,
>>> I'm not proposing to apply this patch, as it depends on lockfile =
from
>>> the procmail-package (host-package).
>>=20
>> Just to confirm, it seems (after a very few tests) that it indeed is
>> enough to guard the do_make_scripts() with the lock.
>>=20
>> However, the question on how to make the real solution remains...
>=20
> I've not tested this but it might give you enough info to test
> something:
>=20
> (Basic idea is to promote that function to a task, then apply a lock =
to
> it).

Or taking a step back, deleting the scripts to save 0.002 kilobytes in =
sysroot was not a good idea. Shall we just stop deleting them and go =
back to the old way which actually worked?



