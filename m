Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URQuj-0000eP-Uy
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 19:40:30 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1909634eaj.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 10:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xg7DKtJjjz9m+Avze6LkRmHgCCls+QUy8OlnnQPADfw=;
	b=AYkz287YFeEDOvFz6PwdfsKuSa2NP9Dod4QPxdWGMm/yGc1sIbPG8kCZOdrcdSxoSU
	Q0WP/EZRrwKSWaMa62bAPi0PGxv0yDwyB8V9C3PLxsZDspZX3qOYgjqQCbtkju2OX645
	zXnh0YGTO6b2w9GoTBkyR+2QToSBnJb6MibOzJS3ZUPLRa7sGIMtLbx4n1zWVFGju9sF
	SsDyvHX0Mky7eLeqYq7AG4HeQq2c9BIl22ZsUsE2wYrmioEaOyzVqaNAukccGola2nFG
	mvlhqiXDXM0l6BnZksESboHB5UFcSsTVuz2L96llcdjBSWAE6lG6FUz7XDrNhSGWs3hD
	qKIA==
X-Received: by 10.15.99.201 with SMTP id bl49mr52663967eeb.43.1365960182117;
	Sun, 14 Apr 2013 10:23:02 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1cd5:7e72:317b:cd33?
	([2001:610:612:0:1cd5:7e72:317b:cd33])
	by mx.google.com with ESMTPS id i53sm22526291eeu.5.2013.04.14.10.23.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 10:23:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130414170556.GH2475@jama>
Date: Sun, 14 Apr 2013 19:23:01 +0200
Message-Id: <6F9FB6C8-5BBD-46FA-9FAB-96A319D9949C@dominion.thruhere.net>
References: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
	<20130414170556.GH2475@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlfKhyqrHlUmNkvtlMJWBE5jXlDrXCqIueNrIweJ7pAL4jEMVp4hmW8Z6SSazM0VqARQff+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCHv2] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 17:40:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 apr. 2013, om 19:05 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Apr 10, 2013 at 10:05:01AM +0200, Koen Kooi wrote:
>> This allows a clean seperation between all image outputs and making =
it possible to have convinience symlinks to make it ready to deploy. And =
while it isn't a valid reason, it must be mentioned: BSP layers which do =
use convenience symlinks already don't step on files owned by others =
anymore.
>>=20
>> I assumed this was the default behaviour in OE-classic, but as it =
turns out every DISTRO set it to deploy/images/$MACHINE on its own.
>>=20
>> Code inspections shows that the all references to the image deploy =
dir in classes and scripts in OE-core do the right thing and parse the =
DEPLOY_DIR_IMAGE variable, except runqemu.
>=20
> I'm not using runqemu scripts, but the change looks OK:
>=20
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks!

Since one part of this patch is a legitimate fix, should I split it and =
submit the runqemu fix for dylan?=


