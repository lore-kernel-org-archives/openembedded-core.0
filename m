Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTuVy-0004Kp-Lp
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 13:04:22 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTuPe-0002ss-Eb
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:57:50 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 11:57:49 +0000
In-Reply-To: <1322219300.10928.60.camel@ted>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
	<1322179246.10928.38.camel@ted>
	<1322219018.26081.70.camel@phil-desktop>
	<1322219300.10928.60.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322222270.26081.73.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 12:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 11:08 +0000, Richard Purdie wrote:
> The vesa driver looks like its using DGA APIs to expose mode setting. A
> comment to that end is also in a TODO list at the top of the file.

Ah, I see.  I guess that can just be turned off for non-DGA builds then.
As you say, making it use Xrandr would be a better solution in the long
term but it doesn't seem all that likely that anybody is going to have
much enthusiasm for enhancing the VESA driver at this point.

p.




