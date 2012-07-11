Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sp5mn-00025P-Do for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 00:53:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BMgJRt013441;
	Wed, 11 Jul 2012 23:42:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11943-05; Wed, 11 Jul 2012 23:42:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BMg99Z013434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 Jul 2012 23:42:11 +0100
Message-ID: <1342046531.11939.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 23:42:11 +0100
In-Reply-To: <4FFDE7B3.8050804@linux.intel.com>
References: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
	<4FFDE7B3.8050804@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] xz: update to 5.1.2alpha
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
X-List-Received-Date: Wed, 11 Jul 2012 22:53:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 13:53 -0700, Saul Wold wrote:
> On 07/11/2012 07:10 AM, Koen Kooi wrote:
> > This contains bugfixes from the 5.0.3 and 5.0.4 releases
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >   meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} |    7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >   rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} (86%)
> >
> > diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > similarity index 86%
> > rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > index 7fa7177..9d68720 100644
> > --- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > +++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
> >                       file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
> >
> >   SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
> > -SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
> > -
> > -PR = "r0"
> > +SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
> > +SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
> >
> >   inherit autotools gettext
> >
> >
> 
> How stable is this alpha release?  We don't generally take up 
> re-releases, correct?

We've talked about this before and I think this might be an exception to
the rule? I don't remember any objections at least when this question
got asked...

Cheers,

Richard



