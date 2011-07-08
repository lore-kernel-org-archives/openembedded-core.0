Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QfDUO-0002je-Fw
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:01:13 +0200
Received: by wwi18 with SMTP id 18so1726512wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 08:57:19 -0700 (PDT)
Received: by 10.217.1.197 with SMTP id n47mr802428wes.28.1310140639615;
	Fri, 08 Jul 2011 08:57:19 -0700 (PDT)
Received: from [172.16.66.153] (host-131-196-68-109.spectrum1.uk.sharedband.net
	[109.68.196.131])
	by mx.google.com with ESMTPS id fy9sm2745687wbb.25.2011.07.08.08.57.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 08:57:18 -0700 (PDT)
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
	<4E15D389.9040906@mentor.com>
	<1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
	<27ED3419-C3F8-40B4-AF21-D7BEDC631813@dominion.thruhere.net>
	<1310137217.20015.874.camel@rex>
In-Reply-To: <1310137217.20015.874.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <AAA99274-8387-49A8-9DD1-0AA9FC18D344@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 16:57:14 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] powertop: inherit update-alternatives and use	a higher priority than busybox
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
X-List-Received-Date: Fri, 08 Jul 2011 16:01:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 8 jul. 2011 om 16:00 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Fri, 2011-07-08 at 08:25 +0100, Koen Kooi wrote:
>>=20
>> Op 8 jul. 2011 om 02:40 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het vo=
lgende geschreven:
>>=20
>>> Tom Rini wrote:
>>>> On 07/07/2011 01:39 AM, Dexuan Cui wrote:
>>>>> busybox-1.18.4 installs /bin/powertop and the powertop recipe
>>>>> installs /usr/bin/powertop. So, in PATH, if /bin appears before
>>>>> /usr/bin, we would run the version offered by busybox, which has a
>>>>> very limited function (e.g., no parameter is accepted) and this
>>>>> causes trouble to eclipse plugin.=20
>>>>>=20
>>>>> We can use update-alternatives for powertop with higher priority to
>>>>> resolve the issue.=20
>>>>>=20
>>>>> Fixes [YOCTO #1208]
>>>>>=20
>>>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>>>=20
>>>> This fix seems a bit incomplete.  Why is busybox putting powertop into
>>>> /bin when it almost certainly belongs in /usr/bin like the real recipe
>>>> was placing it.  busybox needs a fix here too.
>>> Thanks for the comment!=20
>>> I was hesitant about fixing busybox as I wasn't sure if it's worthy
>> to make a patch to only fix the path for busybox. I don't know why
>> busybox puts it into /bin. I think the best place may be /usr/sbin/.=20
>>> A little unluckily this patch to powertop has been already in poky
>> master... So maybe we could try to fix the recipes in future, e.g.,
>> when upgrading them.
>>=20
>> we should do the right thing in oe-core,  the poky people can clean up on=
 their own.=20
>=20
> I don't think anyone is suggesting we shouldn't do the right thing in
> OE-Core? :)
>=20
> I merged the original patch on the grounds that its was an improvement
> to the situation. We've identified a better improvement so can someone
> please send me the patch and I'll likely merge that too.

the email makes it seem that the patch was merged into poky, but not oe-core=
.  When reading it like that the proposal involved merging the 'incomplete' p=
atch for the sake of keeping poky and oe-core in sync

>=20
> FWIW, I agree that powertop should really be under /usr/...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


