Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1bQW-0007oC-Og
	for openembedded-core@lists.linuxtogo.org;
	Wed, 15 Aug 2012 13:06:16 +0200
Received: by eaad12 with SMTP id d12so351857eaa.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 15 Aug 2012 03:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=O1JGZx9zIWPme/PaaFLMLvwB8NHEQg0CgrZX3CA22sU=;
	b=iyxOwlTQaRsKvE5WaP7YxAWFDvMXwnFxWfzB7Dfx0eG1oW1HUQMoi8eNHazssJjlZ4
	mFwv/giYWkwJn4dALwVchz2XFopTbVQOY/6SGuY3Hrq77zR5oQgT0XgFhfY3G6C05GwV
	lKmtGgDFK4vRAz07TYDIV6n9Dge9ZJFMfFG/KzlOo4vURsQgnkgcw/TAs3wBOSPu2+E9
	3nmd3yehy/V9Q4a7MLtROp8fm+R3cVuzzDAxBx7zx0A9Gsb0Nsdck9xS5bV7FNSPpvo3
	39SS5t95AgtPdi02G9s7mrQYEPAuRejjaWa+ZfLcg+MzdQej+JXGdRboc/WA44qSthVI
	IPbg==
Received: by 10.14.223.196 with SMTP id v44mr20186412eep.4.1345028060860;
	Wed, 15 Aug 2012 03:54:20 -0700 (PDT)
Received: from ?IPv6:2001:610:612::fdf3:e292:2da4:ca2e?
	([2001:610:612:0:fdf3:e292:2da4:ca2e])
	by mx.google.com with ESMTPS id 45sm3028535eed.17.2012.08.15.03.54.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 03:54:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2404459.dJBf5OQotX@helios>
Date: Wed, 15 Aug 2012 12:54:17 +0200
Message-Id: <515C1337-A61A-49A6-837A-9305749FF1DA@dominion.thruhere.net>
References: <2404459.dJBf5OQotX@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmTPcmZriDgtW17o9VmhYVhkr0MUJwrTmvCt0nykJ6leuOeSYlyKsMrDCSrNNnvQQL/JFWK
Cc: openembedded-core@lists.linuxtogo.org, yocto@yoctoproject.org,
	openembedded-devel@lists.linuxtogo.org
Subject: Re: [yocto] RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 11:06:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2012, om 11:46 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:
>=20
> 2) Look at the existing tasks and:
> * evaluate their usefulness
> * remove any that are obsolete
> * adjust existing contents if needed
> * look for useful groups of packages that might be added
>=20
> We need to pay particular attention to task-core-boot and task-base as =
these=20
> are pulled in by default in any image that inherits from =
core-image.bbclass -=20
> if these are not generally working for people that are creating their =
own=20
> images, we need to change them such that they are.

Have a look at task-boot and task-basic in meta-oe: =
https://github.com/openembedded/meta-oe/tree/master/meta-oe/recipes-core/t=
asks

My pet peeve is the bloat oe-core forces onto qemu* builds in the name =
of "our testing team needs it!!!". Why am I forced to build an nfs =
server and distcc when setting MACHINE=3Dqemusomething?

Keep things like that in mind when overhauling the tasks.

regards,

Koen=


