Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sm0ic-0002Gs-E1
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 12:52:30 +0200
Received: by eaal1 with SMTP id l1so2451567eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 03:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=/VSunBNzKeDl8aprbyXOsQpWzeQpGAq7zJ9PRYWgsps=;
	b=CaUa5IKbSuie3WXYvWJ1FAGRidXefkHg9Z3fsJa7v2G1HphyrHJ/gnkFnvMH3UTQjm
	MDeOKxelPqHSpQHoXzvyDqFvVlDlszUHIRG3bUInU6YVxZT48MzOIe0PyCarha0xnRq5
	f0s8hgAbbS6gItfK4rhqCAn8/l8yoyY4+MrJzUNY4F2/bREAXqG9hlW4SblttLy//tFc
	Pdo8ONl6uy9TLI6QbH4x29qhp/+ZK+oE3/jR9+JSVmX5SCsgYibEbr3TL/vrOo8K6r+h
	kkjJF+KzuCqSOmsm3mAy9GndHN5DoMcOIvRt8YoCxbC/oZ0brjSRwS+mSm3yv8klxzg4
	Tk1w==
Received: by 10.14.53.9 with SMTP id f9mr4054643eec.116.1341312088353;
	Tue, 03 Jul 2012 03:41:28 -0700 (PDT)
Received: from ?IPv6:2001:610:612::45ca:7eeb:84e1:aad5?
	([2001:610:612:0:45ca:7eeb:84e1:aad5])
	by mx.google.com with ESMTPS id f56sm43668603eea.16.2012.07.03.03.41.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 03:41:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
Date: Tue, 3 Jul 2012 12:41:30 +0200
Message-Id: <A0120681-E39C-44BA-9487-C3C2EAD91307@dominion.thruhere.net>
References: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQn7KJFoj4qlu0Di+JNp5pEzie0AFCRa1bWe5i4IovDqxboYDuOaAG9CY8ls5sSD+zBnl04p
Subject: Re: [PATCH] udev: don't mount with -o sync
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
X-List-Received-Date: Tue, 03 Jul 2012 10:52:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jul. 2012, om 10:49 heeft Jesse Zhang het volgende geschreven:

> mount.sh mounts all partitions with -o sync, which is bad for system
> performance.

But good for data integrity :)

> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
> meta/recipes-core/udev/udev/mount.sh |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/udev/udev/mount.sh =
b/meta/recipes-core/udev/udev/mount.sh
> index 53fefa3..c13b8bb 100644
> --- a/meta/recipes-core/udev/udev/mount.sh
> +++ b/meta/recipes-core/udev/udev/mount.sh
> @@ -23,7 +23,7 @@ automount() {
>=20
> 	! test -d "/media/$name" && mkdir -p "/media/$name"
> =09
> -	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
> +	if ! $MOUNT -t auto $DEVNAME "/media/$name"
> 	then
> 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME =
\"/media/$name\" failed!"
> 		rm_dir "/media/$name"

Missing PR bump=


