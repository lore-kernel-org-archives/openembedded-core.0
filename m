Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2UUa-0001JF-8j for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:54:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HLg9Hs013487;
	Fri, 17 Aug 2012 22:42:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12882-05; Fri, 17 Aug 2012 22:42:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HLfvvj013480
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 22:42:00 +0100
Message-ID: <1345239717.27428.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Fri, 17 Aug 2012 22:41:57 +0100
In-Reply-To: <502E886E.30002@windriver.com>
References: <1344897787-27726-1-git-send-email-paul.gortmaker@windriver.com>
	<1345222636.27428.20.camel@ted> <502E886E.30002@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Fri, 17 Aug 2012 21:54:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 14:07 -0400, Paul Gortmaker wrote:
> On 12-08-17 12:57 PM, Richard Purdie wrote:
> > On Mon, 2012-08-13 at 18:43 -0400, Paul Gortmaker wrote:
> >> Without this, you will get occasional build failures if libproxy
> >> tries to build before the glib headers are placed in the sysroot.
> >>
> >> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >>
> >> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> >> index 7e3cf27..a39e3a8 100644
> >> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> >> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> >> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
> >>  LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
> >>                      file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
> >>  
> >> -DEPENDS = "gconf"
> >> +DEPENDS = "gconf glib-2.0"
> >>  
> > 
> > We've gone around in circles on this and had issues over circular
> > dependencies. The bottom line is that we don't need glib-2.0 here, we
> > want to disable the glib-2.0 using components of libproxy. I don't know
> 
> Fair enough.
> 
> Can we _finally_ fix the mailing lists to not override the To/Cc lines
> with crap Reply-To: lines?  Once again I almost missed seeing this reply,
> since I was no longer on the To/Cc.
> 
> AFAICT, all were in agreement that it was broken, but it never got fixed.

There were a few things causing problems here such as lost admin access.
Those have been resolved and I just changed the setting that I think was
causing the problems. Let me know if there are still issues...

Cheers,

Richard



