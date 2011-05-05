Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHww4-00013X-Oy for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:41:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BcvGV010464;
	Thu, 5 May 2011 12:38:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10447-01; Thu,  5 May 2011 12:38:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BcoLa010458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 12:38:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <21e4929e2ef79647b16852bb6f15537939012b02.1304520272.git.paul.eggleton@linux.intel.com>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<21e4929e2ef79647b16852bb6f15537939012b02.1304520272.git.paul.eggleton@linux.intel.com>
Date: Thu, 05 May 2011 12:38:49 +0100
Message-ID: <1304595529.20791.25.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 3/3] meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc
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
X-List-Received-Date: Thu, 05 May 2011 11:41:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

Great work in doing this, thanks. I was just looking at it with a view
to making machine support cleaner and I think there are still things we
can likely to do help with this. As one example:

On Wed, 2011-05-04 at 15:51 +0100, Paul Eggleton wrote:
> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
> @@ -0,0 +1,2 @@
> +QT_GLFLAGS_atom-pc = "-opengl"
> +
> diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
> new file mode 100644
> index 0000000..076ade2
> --- /dev/null
> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
> @@ -0,0 +1,2 @@
> +QT_GLFLAGS_atom-pc = "-opengl"

could we set QT_GLFLAGS in the machine.conf file instead of using a
bbappend?

We could also do with finding a way to clean up clutter...

Cheers,

Richard




