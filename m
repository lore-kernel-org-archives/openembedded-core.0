Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0DNJ-0003Hk-7o
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 15:40:57 +0100
Received: by wibhq7 with SMTP id hq7so71072wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 06:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.82.227 as permitted sender)
	client-ip=10.180.82.227; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.82.227 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.82.227])
	by 10.180.82.227 with SMTP id l3mr36177167wiy.1.1329921157265 (num_hops
	= 1); Wed, 22 Feb 2012 06:32:37 -0800 (PST)
Received: by 10.180.82.227 with SMTP id l3mr29894415wiy.1.1329921157187;
	Wed, 22 Feb 2012 06:32:37 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm71984352wib.0.2012.02.22.06.32.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 06:32:36 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329920131.20261.148.camel@ted>
Date: Wed, 22 Feb 2012 15:32:40 +0100
Message-Id: <9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkm8K0RIETcGKRpimsHy8e1e6wSXJkfJp9m1PHU2a7Q9kO1GRj65WK7JQV3MjOW0Gaw/FLo
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 14:40:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 15:15 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-02-22 at 14:42 +0100, Koen Kooi wrote:
>> Op 22 feb. 2012, om 14:27 heeft Robert Yang het volgende geschreven:
>>=20
>>> Here is the testing result:
>>>=20
>>> $ ./poky/scripts/sstate-cache-management.sh =
--cache-dir=3Dsstate-cache.bak/ --remove-duplicated
>>> Figuring out the archs in the sstate cache dir ...
>>> The following archs have been found in the sstate cache dir:
>>> i586 ppc603e x86_64 qemux86 qemuppc
>>> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
>>> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
>>> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
>>> Removing the sstate-xxx_deploy.tgz ... (8 files)
>>> Removing the sstate-xxx_package.tgz ... (3282 files)
>>> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
>>> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
>>> 12088 files have been removed
>>>=20
>>> // Robert
>>>=20
>>> The following changes since commit =
87e32edb88c30ac116fa396148ac26357051f93a:
>>>=20
>>> iputils: Add base_libdir to VPATH in order to find the crypto =
library (2012-02-21 17:59:40 +0000)
>>>=20
>>> are available in the git repository at:
>>> git://git.pokylinux.org/poky-contrib robert/remove-sstate
>>> =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/remove-ssta=
te
>>=20
>> Do you have a patch against oe-core instead of poky??!?
>=20
> Does this really need as many question and exclamation =
marks???!!!!????!
>=20
> ;-)
>=20
> Its not hard to manipulate the patches around from one tree to the
> other.

That's good to know, so why wasn't it manipulated to work on oe-core =
when being sent to the oe-core list?




