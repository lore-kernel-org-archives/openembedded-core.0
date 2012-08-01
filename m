Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwhCV-00053e-KH for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 00:15:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71M3sx9001764;
	Wed, 1 Aug 2012 23:03:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01623-02; Wed,  1 Aug 2012 23:03:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71M3ioN001757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Aug 2012 23:03:44 +0100
Message-ID: <1343858624.9756.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Aug 2012 23:03:44 +0100
In-Reply-To: <cover.1343811985.git.liezhi.yang@windriver.com>
References: <cover.1343811985.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] createrepo 0.4.11: create wrapper for python script
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
X-List-Received-Date: Wed, 01 Aug 2012 22:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-01 at 17:14 +0800, Robert Yang wrote:
> This is used for fixing the rpm-createsolvedb.py error:
> 
> 'import site' failed; use -v for traceback
> Traceback (most recent call last):
> File "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/scripts/rpm-createsolvedb.py", line 14, in 
> import sys, os
> ImportError: No module named os
> 
> // Robert
> 
> The following changes since commit 4f31d21bcb1c8c744e9abb33248715afe4a40af0:
> 
>   lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:02:11 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/createrepo
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo
> 
> Robert Yang (2):
>   createrepo 0.4.11: add rpm-createsolvedb.py
>   createrepo 0.4.11: create wrapper for python script

Merged to master, thanks.

Richard



