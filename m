Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Riviy-0004p8-1r for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:23:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05MGQWK011532;
	Thu, 5 Jan 2012 22:16:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10664-09; Thu,  5 Jan 2012 22:16:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05MGJJ8011526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Jan 2012 22:16:21 GMT
Message-ID: <1325801780.20759.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 22:16:20 +0000
In-Reply-To: <CAEsOVNcVXE+hTNMBzHnVS_x9zs_Gp+_VKaop90n8h=-_Y_RJPQ@mail.gmail.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
	<CAEsOVNcVXE+hTNMBzHnVS_x9zs_Gp+_VKaop90n8h=-_Y_RJPQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 22:23:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 15:57 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Jan 5, 2012 at 5:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> Zhenhua Luo (1):
> >>   linux-dtb: add multi-dtb build support and keep dtb in deploy cache
> >>     package
> >
> > This looks like it should be done in do_deploy and doesn't fix the real
> > problem just adding some races in.
> 
> Can you add a bit more info here? Should we be building all the device
> trees in do_deploy? What races are added?

I guess what I'm asking is why this isn't happening in kernel_do_deploy
(with an append) and installing the files into ${DEPLOYDIR}? It seems to
be appending to do_install instead and this confuses the purposes of the
different tasks.

If the files were placed into ${DEPLOYDIR} as part of do_deploy, things
would be much more consistent.

Cheers,

Richard





