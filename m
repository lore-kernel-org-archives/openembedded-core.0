Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm6IC-0003zP-LP for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:45:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RFeoRc030943
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 16:40:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30197-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 16:40:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RFegJ4030937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 16:40:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E303066.4070902@mentor.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<7f9b1ed3edb4bd9e8e23e6d191248a0c28d924e6.1311752531.git.sgw@linux.intel.com>
	<1311760065.30326.278.camel@phil-desktop> <4E303066.4070902@mentor.com>
Date: Wed, 27 Jul 2011 16:40:32 +0100
Message-ID: <1311781232.2344.399.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated & Tested 27/35] siteinfo: Move the rp-pppoe entry to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 15:45:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 08:36 -0700, Tom Rini wrote:
> On 07/27/2011 02:47 AM, Phil Blundell wrote:
> > On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
> >> --- a/meta/site/common-linux
> >> +++ b/meta/site/common-linux
> >> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
> >>  # mysql
> >>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
> >>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
> >> +
> >> +# rp-pppoe
> >> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
> > 
> > Per previous discussion, I am pretty sure this is wrong.
> 
> Agreed.  This is actually fixed right now in meta-oe and doesn't belong
> in oe-core (until someone argues rp-pppoe needs to be in oe-core).

Can someone send me the removal patch please? :)

Cheers,

Richard




