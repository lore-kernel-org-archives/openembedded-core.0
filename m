Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UN4sQ-0007M9-93 for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 19:20:06 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r32HCSnI027334; Tue, 2 Apr 2013 18:13:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cpE7hh4-+K6M; Tue,  2 Apr 2013 18:13:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r32HDIXH027553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 2 Apr 2013 18:13:21 +0100
Message-ID: <1364922164.6526.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 02 Apr 2013 18:02:44 +0100
In-Reply-To: <cover.1364872107.git.Qi.Chen@windriver.com>
References: <cover.1364872107.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] make rpm-postinsts installed on target
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
X-List-Received-Date: Tue, 02 Apr 2013 17:20:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-02 at 11:31 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The following changes since commit 92aeb31341b28b193d616ab5cf38af1b9673e37d:
> 
>   qemuimage-testlib: Fix quoting issue (2013-03-30 17:26:56 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib ChenQi/rpm-postinsts-problem
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rpm-postinsts-problem
> 
> Chen Qi (2):
>   image.bbclass: allow override for ROOTFS_BOOTSTRAP_INSTALL
>   rootfs_rpm.bbclass: make rpm-postinsts installed on target

This issue was causing problems elsewhere so I've merged a fix for it as
I described (adding the right dependency to rpm).

Cheers,

Richard



