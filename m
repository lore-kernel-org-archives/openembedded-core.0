Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THXsh-0005d9-0Y for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 12:33:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAKK5Y008958;
	Fri, 28 Sep 2012 11:20:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08702-02; Fri, 28 Sep 2012 11:20:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAKDMZ008952
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 11:20:14 +0100
Message-ID: <1348827615.15753.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Date: Fri, 28 Sep 2012 11:20:15 +0100
In-Reply-To: <cover.1348695851.git.elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] license.bbclass fixes
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
X-List-Received-Date: Fri, 28 Sep 2012 10:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 14:50 -0700, Elizabeth Flanagan wrote:
> [YOCTO #3118]
> 
> license.conf hasn't been being parsed. This commit series ensures that 
> license.conf is parsed, that it contains useful variables that should be
> in a global conf file and that those variables are not kept within 
> license.bbclass.
> 
> This also fixes an discreprancy between the documentation of LICENSE_PATH (which
> is what we tell people to use) and what we were using "LICENSE_DIR". This ensures
> that when the end user needs to add additional licenses, that they use 
> LICENSE_PATH += "path/to/additional/licenses" and that it works.
> 
> The following changes since commit 0b09e50810162a07ef0aecee91ee32b4a36334a3:
> 
>   busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib eflanagan/LICENSE_PATH
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/LICENSE_PATH
> 
> Elizabeth Flanagan (3):
>   license.bbclass: Variable standardization
>   bitbake.conf: parse license config
>   license.conf/bbclass: Move globals to license.conf

Merged to master, thanks.

Richard



