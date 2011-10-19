Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGUZ3-00067G-La
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 13:44:07 +0200
Received: by eyd9 with SMTP id 9so1532094eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 04:38:14 -0700 (PDT)
Received: by 10.14.11.206 with SMTP id 54mr255791eex.107.1319024294595;
	Wed, 19 Oct 2011 04:38:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y11sm14753602eej.5.2011.10.19.04.38.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 04:38:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <40dcebe98e97bb4fabfec74e9e7acb59548da091.1319022793.git.anders@chargestorm.se>
Date: Wed, 19 Oct 2011 13:38:11 +0200
Message-Id: <3D79364E-4D29-49B8-B196-4E1FBD4E82FE@dominion.thruhere.net>
References: <cover.1319022793.git.anders@chargestorm.se>
	<40dcebe98e97bb4fabfec74e9e7acb59548da091.1319022793.git.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] module.bbclass: add lock to prevent error bulding ext modules
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
X-List-Received-Date: Wed, 19 Oct 2011 11:44:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 okt. 2011, om 13:15 heeft Anders Darander het volgende geschreven:

> When external modules are built, files in =
$STAGING_KERNEL_DIR/scripts/basic will/can get
> rebuilt.
> This raises a potential race condition. Prevent this by adding a lock =
around the
> do_make_scripts() function. Further, make sure that the kernel has =
been installed
> to the sysroot, prior to executing this new task.

So what do external module recipe that aren't using do_compile from =
module.bbclass need to change to keep working?




