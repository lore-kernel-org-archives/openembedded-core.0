Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm1iP-0008Ba-Pb for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 12:51:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RAlaeZ029229
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:47:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28368-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:47:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RAlRqj029223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:47:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311759861.30326.276.camel@phil-desktop>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<4adc1ac758823bf95ef5259ecf90a7906b38afc9.1311752531.git.sgw@linux.intel.com>
	<1311759861.30326.276.camel@phil-desktop>
Date: Wed, 27 Jul 2011 11:47:16 +0100
Message-ID: <1311763636.2344.348.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated & Tested 24/35] siteinfo: Move certain bash entries to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 10:51:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 10:44 +0100, Phil Blundell wrote:
> On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
> > diff --git a/meta/site/arm-common b/meta/site/arm-common
> > index 5d3e68a..39eb30b 100644
> > --- a/meta/site/arm-common
> > +++ b/meta/site/arm-common
> > @@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
> >  
> >  # bash
> >  ac_cv_c_long_double=${ac_cv_c_long_double=yes}
> > -bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
> >  bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
> 
> That sigsetjmp thing looks pretty bogus to me.  sigsetjmp() is POSIX.1;
> it isn't (shouldn't be) architecture specific in any way, and both
> eglibc and uclibc implement it nowadays.  I think you should probably
> have sigsetjmp=present in linux-common.

This is tangential to this patch, could you send one handling that issue
please? :)

Cheers,

Richard



