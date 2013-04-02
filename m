Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UMzY0-0007mh-95 for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 13:38:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r32BVvGf029389; Tue, 2 Apr 2013 12:31:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OjU+aQVK4+Fq; Tue,  2 Apr 2013 12:31:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r32BVo4d029377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 2 Apr 2013 12:31:54 +0100
Message-ID: <1364901677.6526.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 02 Apr 2013 12:21:17 +0100
In-Reply-To: <40756f91f56034eef88d0338fb8975ca31db9213.1364872107.git.Qi.Chen@windriver.com>
References: <cover.1364872107.git.Qi.Chen@windriver.com>
	<40756f91f56034eef88d0338fb8975ca31db9213.1364872107.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: allow override for ROOTFS_BOOTSTRAP_INSTALL
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
X-List-Received-Date: Tue, 02 Apr 2013 11:38:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-02 at 11:31 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Previously, if 'package-management' is in IMAGE_FEATURES, this variable
> is set to "", otherwise, it's ${ROOTFS_PKGMANAGE_BOOTSTRAP}. It works fine
> with deb and ipk, because their postinsts rely on their package managers.
> However, rpm is a little different, as its postinsts are just shell scripts.

Why don't we just make the rpm package RDEPEND on the postinst scripts
package like opkg and dpkg do?

I can't think of any case where that dependency would be an issue...

Cheers,

Richard



