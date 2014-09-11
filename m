Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 80298617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 18:47:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 11 Sep 2014 11:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,506,1406617200"; d="scan'208";a="590006740"
Received: from agalvare-mobl1.amr.corp.intel.com (HELO [10.254.78.160])
	([10.254.78.160])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2014 11:44:13 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Thu, 11 Sep 2014 11:44:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
Sender: "Hart, Darren" <darren.hart@intel.com>
To: Chiz Chikwendu <chiz.chikwendu@Haemonetics.com>,
	"Openembedded List (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Message-ID: <D0373AAC.A8510%darren.hart@intel.com>
Thread-Topic: bzImage not included in rootfs
References: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
In-Reply-To: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
Mime-version: 1.0
Subject: Re: bzImage not included in rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Sep 2014 18:48:02 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

From:  Chiz Chikwendu <chiz.chikwendu@Haemonetics.com>
Date:  Thursday, September 11, 2014 at 5:08
To:  "Openembedded List (openembedded-core@lists.openembedded.org)"
<openembedded-core@lists.openembedded.org>
Cc:  Darren Hart <darren.hart@intel.com>
Subject:  bzImage not included in rootfs


>I am new to Openembedded (and yocto).

Hi Chiz,

For future reference, when sending email to public open source mailing
lists, it's a good idea to use plain text and avoid HTML. Some lists will
actually block all HTML email.

>=20
>I have built an image with poky build environment.
>=20
>I noticed that the kernel=B9s bzImage is not included in the rootfs.
>
>How do I get the system to include =B3bzImage=B2 in the rootfs
>(boot/bzImage-)?
>=20
>I=B9ve done some research, and I saw a note about setting the parameter:
>RDEPENDS_kernel-base =3D =B3zImage=B2
>=20
>This should override the kernel settings and build the kernel into the
>rootfs. I tried it, however it is not working for me.
>=20
>Can anyone help?

The kernel image is installed in /boot by the "kernel-image" package. Most
images do not include this by default as many targets boot with the kernel
located on a separate system partition.

See the documentation for how to add new packages to existing image
recipes using variables like:

CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-image"

http://www.yoctoproject.org/docs/1.6.1/dev-manual/dev-manual.html#usingpoky
-extend-customimage-localconf

--
Darren Hart
Intel Open Source Technology Center




