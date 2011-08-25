Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwbSy-0004p5-87 for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:03:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PEwn8s031114
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 15:58:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30999-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 15:58:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PEwdR4031108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 15:58:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314264296.19905.29.camel@phil-desktop>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
Date: Thu, 25 Aug 2011 07:58:36 -0700
Message-ID: <1314284316.5939.196.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Thu, 25 Aug 2011 15:03:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 10:24 +0100, Phil Blundell wrote:
> On Wed, 2011-08-24 at 20:32 +0200, Koen Kooi wrote:
> > diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> > index 0d5ce20..d3b33d6 100644
> > --- a/meta/classes/libc-package.bbclass
> > +++ b/meta/classes/libc-package.bbclass
> > @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
> >  	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
> >  		m = re.match("(.*)_(.*)", name)
> >  		if m:
> > -			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
> > +			libc_name = "%s-%s" % (m.group(1), m.group(2).lower().replace("-",""))
> >  		else:
> >  			libc_name = name
> >  		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
> 
> For what it's worth (probably not much), this is not quite the right
> fix.  Joining with "." was correct; it was the splitting on "_" that was
> wrong.  The right thing would be to put it back how it was before the
> glibc/eglibc merge commit, i.e. change the re to "(*.)\.(*.)" and leave
> the output pattern alone.  That ought to fix your problem and also allow
> the encoding to be correctly canonicalised.

Can someone please send me the correct patch against master? :)

Cheers,

Richard



