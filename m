Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSR79-0004Lp-9b for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 11:56:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p539r91x003376;
	Fri, 3 Jun 2011 10:53:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02786-09; Fri,  3 Jun 2011 10:53:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p539r157003370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Jun 2011 10:53:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
In-Reply-To: <4DE8A163.6040009@windriver.com>
References: <cover.1307083232.git.kai.kang@windriver.com>
	<adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>
	<1307089346.27470.624.camel@rex>  <4DE8A163.6040009@windriver.com>
Date: Fri, 03 Jun 2011 10:52:39 +0100
Message-ID: <1307094759.5715.4.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Kang@smtp1.linux-foundation.org, poky@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 03 Jun 2011 09:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 16:54 +0800, Kang Kai wrote:
> Hi Richard,
> 
> Thanks for your comments. And I have one question:
> 
> > On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
> >> From: Kang Kai<kai.kang@windriver.com>
> >>
> >> Migrate configurability from oe, try to shrink minimal image size
> >>
> >> The switch is in local.conf.sample, uncomment the line
> >> DISTRO_FEATURES_EGLIBC = ""
> >> and write what options you want to enable.
> >>
> >> If want to disable locale-code charsets or locales, you have to uncomment
> >> PACKAGE_NO_GCONV = 1
> >> Because without this, it fails on package_do_split_gconvs in libc-package.bbclass
> > I have some comments:
> >
> > a) I think these should become flags in DISTRO_FEATURES with an
> > "eglibc-" prefix so something like "spawn" would become "eglibc-spawn"
> Do you mean every option in DISTRO_FEATURES_EGLIBC should be a single 
> flag in DISTRO_FEATURES?

No, you'd still have all the options you currently have but instead of
being called X they would be eglibc-X.

Cheers,

Richard




