Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0Cam-0001VO-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:50:48 +0100
Received: by werc1 with SMTP id c1so31328wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 05:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.79.229 as permitted sender)
	client-ip=10.180.79.229; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.79.229 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.79.229])
	by 10.180.79.229 with SMTP id m5mr35646301wix.6.1329918148533 (num_hops
	= 1); Wed, 22 Feb 2012 05:42:28 -0800 (PST)
Received: by 10.180.79.229 with SMTP id m5mr29504052wix.6.1329918148279;
	Wed, 22 Feb 2012 05:42:28 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm71432930wib.0.2012.02.22.05.42.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 05:42:27 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1329916583.git.liezhi.yang@windriver.com>
Date: Wed, 22 Feb 2012 14:42:25 +0100
Message-Id: <287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkJjLZLEJLJCCCU63WUb6QjHsCKho0CkBm/8ZlAfiEoILngyRR5Jfb4y1xMr8O0v2tEBhzZ
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
X-List-Received-Date: Wed, 22 Feb 2012 13:50:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 14:27 heeft Robert Yang het volgende geschreven:

> Here is the testing result:
>=20
> $ ./poky/scripts/sstate-cache-management.sh =
--cache-dir=3Dsstate-cache.bak/ --remove-duplicated
> Figuring out the archs in the sstate cache dir ...
> The following archs have been found in the sstate cache dir:
> i586 ppc603e x86_64 qemux86 qemuppc
> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> Removing the sstate-xxx_deploy.tgz ... (8 files)
> Removing the sstate-xxx_package.tgz ... (3282 files)
> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
> 12088 files have been removed
>=20
> // Robert
>=20
> The following changes since commit =
87e32edb88c30ac116fa396148ac26357051f93a:
>=20
>  iputils: Add base_libdir to VPATH in order to find the crypto library =
(2012-02-21 17:59:40 +0000)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib robert/remove-sstate
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/remove-ssta=
te

Do you have a patch against oe-core instead of poky??!?





