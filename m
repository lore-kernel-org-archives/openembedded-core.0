Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBPtf-0003QW-Hj for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 13:44:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BjIks016627 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:45:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hJ5YQSk5bO1f
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 12:45:18 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BjFw5016611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:45:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 12:38:45 +0100
In-Reply-To: <4E8C3603.9000803@gmail.com>
References: <4E8C3603.9000803@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317814733.14671.139.camel@ted>
Mime-Version: 1.0
Subject: Re: Workaround to compile linux-omap_2.6.39.bb?
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
X-List-Received-Date: Wed, 05 Oct 2011 11:44:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 12:48 +0200, Tasslehoff Kjappfot wrote:
> I need to compile linux-omap_2.6.39.bb, but it fails since the 
> tmlind-repos are not currently on kernel.org.
> 
> I have downloaded 
> git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux-omap-2.6.git_v2.6.39.tar.gz 
> from the angstrom mirrors. Can I extract that into my downloads/ in a 
> way that will make bitbake find and accept it?

OE-Core uses fetch2 and that is a tarball from fetch1. You'd need to
convert that tarball into the form that fetch2 expects and rename it,
then you stand some chance of it working.

Also note that your recipes needs to be using a fixed source revision
and that revision needs to be present in that tarball.

Cheers,

Richard



