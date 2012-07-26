Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuMqf-0006ws-ER
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:07:21 +0200
Received: by wgbdr1 with SMTP id dr1so1543073wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 04:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bkUL6YVr7o338hUeN/Wc6UyBW5xS/WSKssrshWVTAV8=;
	b=j+yjYYGsvI8h8BWRaVav+Tu1lIGvB1R/s5K/JZrKI4sEWWKQZ92H05+jYzoBEh4Zlz
	gs58orUNFPT5MSsqnhLwzzHgAfc3sxq7EefbatbHxZQ/TBI/DHWzVqs4BB/ziYPGrbOj
	yVDtQJatTKKc1zYvHU2W7aV5+iCY5KtQtt4rkioG8DwbN4ok9kvl6wG7vXcKHyAjdcns
	HLiJJm4J59dFvhULncpHMBeh5/zbEbLhFLSOxuLjImJCl+O8X+IGsGWVYRZa0EgqUd63
	VnaKAfXOK2Q+UrsExlH1LueGcfFqrHWCpjKWM/iyW1WNzCE5A5D0YdtzsZWnZVj3ugm3
	KJtw==
Received: by 10.217.1.136 with SMTP id n8mr13343060wes.10.1343303750883;
	Thu, 26 Jul 2012 04:55:50 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id eu4sm7876667wib.2.2012.07.26.04.55.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 04:55:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
Date: Thu, 26 Jul 2012 13:55:47 +0200
Message-Id: <C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
	<CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnixp+t22OOFn53pFZoHm6vaXi6crvY8UmHVl2twI5MnGjNsCkcBe5+RmLE1vzaZa8/lsRL
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
X-List-Received-Date: Thu, 26 Jul 2012 12:07:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 13:27 heeft Burton, Ross het volgende geschreven:

> On 26 July 2012 11:55, Radu Moisan <radu.moisan@intel.com> wrote:
>> I see no build-time dependencies on dbus-x11 (only runtime =
dependencies),
>> so, assuming PROVIDES is used at build-time, I don't see it's point.
>=20
> We've just removed dbus-x11 because it's pointless, the provides is
> only for compatibility.

It would be nice if other layers that have RDEPENDS_foo =3D "dbus-x11" =
keep working till their maintainers get around fixing them. Note that =
you might need to do a -c cleansstate on dbus first to trigger any =
errors.=


