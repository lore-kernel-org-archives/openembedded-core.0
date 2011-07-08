Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qf5cE-0004FX-4t
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 09:36:46 +0200
Received: by bwf20 with SMTP id 20so1828093bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 00:32:50 -0700 (PDT)
Received: by 10.204.156.194 with SMTP id y2mr222034bkw.369.1310109951403;
	Fri, 08 Jul 2011 00:25:51 -0700 (PDT)
Received: from [10.105.55.80] (62-50-199-254.client.stsn.net [62.50.199.254])
	by mx.google.com with ESMTPS id m6sm5151653fac.3.2011.07.08.00.25.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 00:25:50 -0700 (PDT)
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
	<4E15D389.9040906@mentor.com>
	<1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <27ED3419-C3F8-40B4-AF21-D7BEDC631813@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 08:25:46 +0100
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
X-List-Received-Date: Fri, 08 Jul 2011 07:36:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 8 jul. 2011 om 02:40 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het volge=
nde geschreven:

> Tom Rini wrote:
>> On 07/07/2011 01:39 AM, Dexuan Cui wrote:
>>> busybox-1.18.4 installs /bin/powertop and the powertop recipe
>>> installs /usr/bin/powertop. So, in PATH, if /bin appears before
>>> /usr/bin, we would run the version offered by busybox, which has a
>>> very limited function (e.g., no parameter is accepted) and this
>>> causes trouble to eclipse plugin.=20
>>>=20
>>> We can use update-alternatives for powertop with higher priority to
>>> resolve the issue.=20
>>>=20
>>> Fixes [YOCTO #1208]
>>>=20
>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>=20
>> This fix seems a bit incomplete.  Why is busybox putting powertop into
>> /bin when it almost certainly belongs in /usr/bin like the real recipe
>> was placing it.  busybox needs a fix here too.
> Thanks for the comment!=20
> I was hesitant about fixing busybox as I wasn't sure if it's worthy to mak=
e a patch to only fix the path for busybox. I don't know why busybox puts it=
 into /bin. I think the best place may be /usr/sbin/.=20
> A little unluckily this patch to powertop has been already in poky master.=
.. So maybe we could try to fix the recipes in future, e.g., when upgrading t=
hem.

we should do the right thing in oe-core,  the poky people can clean up on th=
eir own.=20




>=20
> Thanks,
> -- Dexuan
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


