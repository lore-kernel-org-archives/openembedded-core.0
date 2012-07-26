Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuNiT-0007xE-1s
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:02:57 +0200
Received: by wgbdr1 with SMTP id dr1so1587702wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 05:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PvJ+6Qwh4K+WOoKmR/8GwcLRBvp0Hi0O0dVLMBKUoEw=;
	b=SYpljF7S5M8Q/WbqTg+h9gD4IIgM20qja93jmEF8XF6E4Z85qx05MbB18ahGrGpi80
	FTOTb3y5BuDI2BVl/ZZTZckQlQOsiml4olpwRuKQIzrH29B0UKAvdVv8vgq55IzTLdmv
	c/+b/kzmETWRrXZCXCWRdj9aYzTkMIM552OHQI6SVA/1tw0N6zmcq3CTXzGf4ZeaptXS
	Bf5cfxvEDjerIZ+H22B/5c/xxNjCUyzFdX/KjFRUVL9hKC0WtIL/87jfA03/JBJ4YkQs
	KG2X1zlM8wR4iazmsHzIx3mIYXmLk+V42G1/3HGHilzDScauiifgQjrwwj0awRK8akQJ
	TjtA==
Received: by 10.180.86.226 with SMTP id s2mr13304537wiz.9.1343307086362;
	Thu, 26 Jul 2012 05:51:26 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id ep14sm8547603wid.0.2012.07.26.05.51.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 05:51:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <501139E2.1020003@intel.com>
Date: Thu, 26 Jul 2012 14:51:22 +0200
Message-Id: <7438F5F4-0D14-463F-ABCF-1884F9DCB7C7@dominion.thruhere.net>
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
	<501139E2.1020003@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmNt0wxE4jLraCW6D4wruLsi8G4s6vbZhOKzUBs99qZb6L2COl0ayNbBQq+FxP0jotmkoAA
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
X-List-Received-Date: Thu, 26 Jul 2012 13:02:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 14:36 heeft Radu Moisan het volgende geschreven:

> I understand the reasoning behind RPROVIDES. I've grep'ed the sources =
and none of the packages that depend on dbus-x11 have build time =
dependencies on it,=20

You grepped all the layers out there for 'dbus-x11' or only oe-core?=


