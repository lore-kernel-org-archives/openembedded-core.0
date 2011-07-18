Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qin4H-0000pO-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 14:37:01 +0200
Received: by wwi18 with SMTP id 18so2599674wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 05:32:54 -0700 (PDT)
Received: by 10.227.62.194 with SMTP id y2mr3444304wbh.43.1310992374366;
	Mon, 18 Jul 2011 05:32:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 20sm3419100wbw.36.2011.07.18.05.32.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 05:32:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
Date: Mon, 18 Jul 2011 14:32:51 +0200
Message-Id: <281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>
	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to support multilib
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
X-List-Received-Date: Mon, 18 Jul 2011 12:37:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:

>=20
> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende geschreven:
>=20
>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>> ---
>> meta/recipes-core/udev/udev-164/makefile.patch |   16 =
++++++++++++++++
>> meta/recipes-core/udev/udev-new.inc            |    1 +
>> meta/recipes-core/udev/udev_164.bb             |    2 +-
>> 3 files changed, 18 insertions(+), 1 deletions(-)
>> create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
>>=20
>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch =
b/meta/recipes-core/udev/udev-164/makefile.patch
>> new file mode 100644
>> index 0000000..c46ff4b
>> --- /dev/null
>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
>> @@ -0,0 +1,16 @@
>> +Upstream-Status: Inappropriate [configuration]
>=20
> Could you explain why it's inappropriate for upstream but why we do =
need it here?

I asked the udev maintainer:

14:25 < koen> kay: the udev Makefile.am has 'ln -sf =
$(libexecdir)/udev-acl =
$(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any reason =
for not using ${libdir} over ${prefix}/lib ?
14:29 < kay> koen: libdir is /usr/lib64 here, can't use that

So upstream is aware of multilib, but wants to put these scripts in a =
non-multilib dir. Since I don't have any experience with the =
fedora/opensuse way of multilib nor the new oe-core one, could you =
please explain why oe-core needs this patch, but fedora/opensuse don't?

regards,

Koen



