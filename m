Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S60qe-0000Kn-0a for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 15:31:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q29EMWm5010211
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Mar 2012 14:22:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08772-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 14:22:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q29EMJhr010205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Mar 2012 14:22:22 GMT
Message-ID: <1331302938.3006.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Mar 2012 06:22:18 -0800
In-Reply-To: <20120309082923.GC3813@jama.jama.net>
References: <20120229104508.GA3844@jama.jama.net>
	<1330512429-29934-1-git-send-email-Martin.Jansa@gmail.com>
	<1330521852.24508.42.camel@ted> <20120309082923.GC3813@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] layer.conf: exclude meta-environment with SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Fri, 09 Mar 2012 14:31:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-09 at 09:29 +0100, Martin Jansa wrote:
> On Wed, Feb 29, 2012 at 01:24:12PM +0000, Richard Purdie wrote:
> > On Wed, 2012-02-29 at 11:47 +0100, Martin Jansa wrote:
> > > * it's machine specific and depends on TIME
> > >   basehash changed from 30e97f9eeed1df8488b62b4fb47a3a0c to 72ea9a277e6599ae9052b169b9a94f1b
> > >   Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from
> > >   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_config_site.d
> > >   to
> > >   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-linux_config_site.d
> > >   Variable TIME value changed from 084543 to 085638
> > > * causes task-cross-canadian to be also machine specific
> > 
> > I think a better way to fix this might be:
> 
> Agreed, please push your patch instead.

I already have :)

Cheers,

Richard



