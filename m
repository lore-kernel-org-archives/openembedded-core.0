Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0Dyr-0004qN-RG
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:19:45 +0100
Received: by wibhq7 with SMTP id hq7so99737wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.138.195 as permitted sender)
	client-ip=10.216.138.195; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.138.195 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.138.195])
	by 10.216.138.195 with SMTP id a45mr9358453wej.25.1329923485808
	(num_hops = 1); Wed, 22 Feb 2012 07:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VZf4DPYToAvj9zR+cJm++eQrlhRYnC6lQp0r5WPd3lc=;
	b=q6AjKa/2Fc4GztGSmwyFHbZxiFA1LGAiHEYYd61yvmD88SN0OQmaP5uvvllicYzieK
	G+sIyJZJL0B/IojkCFBLjU1/xmTq/Vkc3AnbPX11Wu+IUDKwuZGfu41JS+khceKiidyx
	iJw3YsZZGvTJf+7KFu1WitemGEmwa0XeHiBsY=
Received: by 10.216.138.195 with SMTP id a45mr7755236wej.25.1329923485738;
	Wed, 22 Feb 2012 07:11:25 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ft8sm29744852wib.11.2012.02.22.07.11.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 07:11:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329923198.20261.160.camel@ted>
Date: Wed, 22 Feb 2012 16:11:26 +0100
Message-Id: <AB7E7710-28E1-4A2E-8822-CB710F839D7C@dominion.thruhere.net>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
	<9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
	<1329923198.20261.160.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkOa7yxUzq7BIKxqrC6AMUJ0JnVNQUs7EKxz8by0wfQIWOjRpWdYF2rL5mKV9LhUN5jh+xN
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
X-List-Received-Date: Wed, 22 Feb 2012 15:19:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 16:06 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-02-22 at 15:32 +0100, Koen Kooi wrote:
>> Op 22 feb. 2012, om 15:15 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2012-02-22 at 14:42 +0100, Koen Kooi wrote:
>>>> Op 22 feb. 2012, om 14:27 heeft Robert Yang het volgende =
geschreven:
>>>>=20
>>>>> Here is the testing result:
>>>>>=20
>>>>> $ ./poky/scripts/sstate-cache-management.sh =
--cache-dir=3Dsstate-cache.bak/ --remove-duplicated
>>>>> Figuring out the archs in the sstate cache dir ...
>>>>> The following archs have been found in the sstate cache dir:
>>>>> i586 ppc603e x86_64 qemux86 qemuppc
>>>>> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
>>>>> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
>>>>> Removing the sstate-xxx_deploy.tgz ... (8 files)
>>>>> Removing the sstate-xxx_package.tgz ... (3282 files)
>>>>> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
>>>>> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
>>>>> 12088 files have been removed
>>>>>=20
>>>>> // Robert
>>>>>=20
>>>>> The following changes since commit =
87e32edb88c30ac116fa396148ac26357051f93a:
>>>>>=20
>>>>> iputils: Add base_libdir to VPATH in order to find the crypto =
library (2012-02-21 17:59:40 +0000)
>>>>>=20
>>>>> are available in the git repository at:
>>>>> git://git.pokylinux.org/poky-contrib robert/remove-sstate
>>>>> =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/remove-ssta=
te
>>>>=20
>>>> Do you have a patch against oe-core instead of poky??!?
>>>=20
>>> Does this really need as many question and exclamation =
marks???!!!!????!
>>>=20
>>> ;-)
>>>=20
>>> Its not hard to manipulate the patches around from one tree to the
>>> other.
>>=20
>> That's good to know, so why wasn't it manipulated to work on oe-core =
when being sent to the oe-core list?
>=20
> Or why can't people just cherry-pick the patch in, or apply the patch
> manually?=20

Personally, I'm too lazy for that. If someone sends a pull request to =
oe-core I kinda assume it's for oe-core. I tried to pull it in for =
testing and it blew up.




