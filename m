Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbAVa-0006VP-8X for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 13:33:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFCR1OD003585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:27:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02527-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:26:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFCQs2b003578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:26:55 GMT
Message-ID: <1323952015.4568.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 12:26:55 +0000
In-Reply-To: <jc8idq$j9d$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-9-git-send-email-dbaryshkov@gmail.com>
	<1323805698.25491.12.camel@ted> <jc8idq$j9d$1@dough.gmane.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 9/9] libatomic-ops: drop directory with documentation to remove QA warning
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
X-List-Received-Date: Thu, 15 Dec 2011 12:33:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 02:07 +0400, Dmitry Eremin-Solenikov wrote:
> On 12/13/2011 11:48 PM, Richard Purdie wrote:
> > On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> >> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> >> ---
> >>   .../pulseaudio/libatomics-ops_1.2.bb               |    3 ++-
> >>   1 files changed, 2 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> >> index 184c167..f81aeb6 100644
> >> --- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> >> +++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> >> @@ -26,5 +26,6 @@ ARM_INSTRUCTION_SET = "arm"
> >>   inherit autotools pkgconfig
> >>
> >>   do_install_append() {
> >> -	mv ${D}${datadir}/libatomic_ops ${D}${datadir}/libatomic-ops || true
> >> +	# those contain only docs, not necessary for now.
> >> +	rm -rf ${D}${datadir}/libatomic_ops || true
> >>   }
> >
> > Shouldn't we move that to docdir/${PN}?
> 
> I'm thinking another way: why is the recipe called libatomicS-ops (note 
> the S) if the upstream source is named as libatomc_ops (so it should 
> become libatomic-ops). Then documentation will land in the proper place 
> after the mv command which is currently in place.

I agree it should probably get renamed, I can't see a good reason for
that name. That will potentially cause some friction with other things
depending on it though :(

Cheers,

Richard



