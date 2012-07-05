Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1Smorp-0001t2-Kf
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 18:25:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q65GE77H029450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2012 09:14:07 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 5 Jul 2012 09:14:06 -0700
Received: from paul by yow-pgortmak-d1 with local (Exim 4.74)	(envelope-from
	<paul.gortmaker@windriver.com>)	id 1Smogv-0003kD-Nr; Thu, 05 Jul 2012
	12:14:05 -0400
Date: Thu, 5 Jul 2012 12:14:05 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120705161402.GA2309@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
	<20120704150005.GD1817@windriver.com>
	<1341415765.20265.30.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1341415765.20265.30.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Thu, 05 Jul 2012 16:25:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCHv2 0/3] u-boot recipe updates] On 04/07/2012 (Wed 16:29) Phil Blundell wrote:

> On Wed, 2012-07-04 at 11:00 -0400, Paul Gortmaker wrote:
> > I've found Richard's comments [looking in OE archive and not poky
> > helped] and will test what he proposed to replace FILESDIR.  But I still
> > think it extremely worthwhile if some fine tuning to the mailing list(s)
> > can be done to address what I mentioned below.
> 
> Can you be more specific about what you think should be changed?  If I
> look at the message of yours that I'm replying to, it has:
> 
> Return-Path: <openembedded-core-bounces@lists.openembedded.org>
> Received: from linuxtogo.org ([188.40.83.200]) by hetzner.pbcl.net with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.72) (envelope-from <openembedded-core-bounces@lists.openembedded.org>) id 1SmR3u-0002an-JT for pb@pbcl.net; Wed, 04 Jul 2012 17:00:14 +0200
> Received: from localhost ([127.0.0.1]) by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <openembedded-core-bounces@lists.openembedded.org>) id 1SmREX-0006Iq-NQ; Wed, 04 Jul 2012 17:11:13 +0200
> Received: from mail1.windriver.com ([147.11.146.13]) by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <Paul.Gortmaker@windriver.com>) id 1SmREW-0006Ih-OQ for openembedded-core@lists.openembedded.org; Wed, 04 Jul 2012 17:11:13 +0200
> 
> [...]
> 
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> To: Saul Wold <sgw@linux.intel.com>
> Message-id: <20120704150005.GD1817@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> 
> which all seems in order.  Which part do you think is wrong?
> 
> > > On a related note, is it possible to fix the mailing list so that it
> > > does not strip To/Cc information and Message-ID strings?  [I'd have to
> > > check -- maybe it is (also) inserting a needless Reply-To: header that
> > > messes things up.]

Hi Phil,

Your mail suffers the exact same problem.  My address is nowhere to be
seen on the To/Cc:  I only happened to see it since I told mutt to
show me all archived poky/oe mails with u-boot in the subject.
Otherwise your message would have been lost in the noise, perhaps seen
next week when I return from OOO.

And when I hit reply, it won't go to you unless I tell mutt to ignore
the broken Reply-To line.  It is the line right at the bottom:

-----------
	From: Phil Blundell <philb@gnu.org>
	To: Patches and discussions about the oe-core layer
	        <openembedded-core@lists.openembedded.org>
	Date: Wed, 4 Jul 2012 16:29:24 +0100
	In-Reply-To: <20120704150005.GD1817@windriver.com>
	References: <4FF0C930.4000104@linux.intel.com>
	        <1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	        <4FF33085.1070703@linux.intel.com>
	        <20120704141259.GA1817@windriver.com>
	        <20120704150005.GD1817@windriver.com>
	X-Mailer: Evolution 3.0.2- 
	Message-ID: <1341415765.20265.30.camel@phil-desktop>
	Subject: Re: [OE-core] [PATCHv2 0/3] u-boot recipe updates
	X-BeenThere: openembedded-core@lists.openembedded.org
	X-Mailman-Version: 2.1.11
	Precedence: list
	Reply-To: Patches and discussions about the oe-core layer
	        <openembedded-core@lists.openembedded.org>
-----------

Note the absence of the To/Cc: with my name?  How are people to sort the
"needs attention from me now" mails from the general mailing list traffic?

The hijack effect of "Reply-To:" is evil and should be removed.  It
isn't used on any of the other dozen devel mailing lists I'm on.

Thanks,
Paul.
--
	
> > > 
> > > Further, without a proper Message-ID, it breaks patchworks, so Richard's
> > > comments should be here:
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


