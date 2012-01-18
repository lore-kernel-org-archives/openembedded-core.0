Received: from belief.htu.tuwien.ac.at ([128.131.95.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jin@mediatomb.cc>) id 1RnWKW-0003yO-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:17:36 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 555A783882; Wed, 18 Jan 2012 14:43:23 +0100 (CET)
Date: Wed, 18 Jan 2012 14:43:22 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120118134322.GB5443@deadlock.dhs.org>
References: <4F16C61C.4020304@ts.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <4F16C61C.4020304@ts.fujitsu.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 14:17:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rainer,

On Wed, Jan 18, 2012 at 02:16:12PM +0100, Rainer Koenig wrote:
> built my first basic customized console image (based on angstrom's
> console-image.bb) and managed to get SystemV init pulled in by deleting
> the systemd entry for the init manager.
> 
> But systemd is still pulled in via connman, dhcp, rsyslog and ntp. How
> can I get totally rid of systemd so that I don't need a kernel with CGROUPS?

I also did not want systemd in my image, I had to create a layer and patch
out systemd from each package that was pulling it in, one by one.

Surely not the nicest solution, but I did not find any other ways to solve this.

Actually, it would be nice to have a global variable setting for it... i.e.
build with/without systemd :P

Kind regards,
Jin



