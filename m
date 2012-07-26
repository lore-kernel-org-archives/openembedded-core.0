Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuNNB-0007H9-3c
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:40:57 +0200
Received: by weyr6 with SMTP id r6so1163510wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 05:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MPkdS37XQg5ILT7yG9+13rkcg+gz6fsp73Br1rC7wi8=;
	b=eN/LJKuRmFyJSHRpHNQsUSO/lAfJ7HNPCh9zXi62jQehr8PO56pMqchOELx4R5cU3K
	g+9TnYyq+nMtrU+FHLxn6mGkZC0Pfukt0xxxCHTWd8IoX7TJd1/KbHinB+bJysawFIDm
	zzmq1tP9OTvKin174Xxb0Fy309O0Rru657D6XwWqQmJ1OI2U5F3U9iGBlV93YWWzTBan
	W9yId1Wt5R+KsQG0ZGETOLOHtr4LOVeLa/NGPxVBSZypbo8nnC6iYZI2mdnh0ykp6Q5H
	P133MxL5VApPZjh8VP7bu04x1GAXgvx4cluJvh5EVhLTYgBs3CuqN1reaOqsiy5s3wLm
	UEIg==
Received: by 10.216.119.6 with SMTP id m6mr6448019weh.215.1343305766509;
	Thu, 26 Jul 2012 05:29:26 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id y5sm7991935wiw.9.2012.07.26.05.29.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 05:29:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
Date: Thu, 26 Jul 2012 14:29:14 +0200
Message-Id: <2CA706BF-4D5B-4488-B128-B665F32A0DD3@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
	<CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
	<C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
	<CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQn1xp895yvVuRAU/nqCF2Ojmm3M0ckwyQ2Z/DNzGw+vfKlpSkFLBA29kXd4RraWIuaXOs34
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 12:40:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 14:00 heeft Burton, Ross het volgende geschreven:

> On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It would be nice if other layers that have RDEPENDS_foo =3D =
"dbus-x11" keep working till their maintainers get around fixing them. =
Note that you might need to do a -c cleansstate on dbus first to trigger =
any errors.
>=20
> Yes, and isn't that what the RPROVIDES is for?

I'm not sure if bitbake can map RPROVIDES to PROVIDES, I vaguely =
remember that it doesn't, but it will pick it up *after* do_package has =
run. I broke OE way too many times doing things like that :)=


