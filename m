Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS9V3-0001ez-0N for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 17:07:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52F4BGj015261;
	Thu, 2 Jun 2011 16:04:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14220-07; Thu,  2 Jun 2011 16:04:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52F43uZ015252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Jun 2011 16:04:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4DE7A4E5.4050109@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
	<1307022616.27470.541.camel@rex>  <4DE7A4E5.4050109@linux.intel.com>
Date: Thu, 02 Jun 2011 16:03:42 +0100
Message-ID: <1307027022.27470.572.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/12] 2-June-2011
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
X-List-Received-Date: Thu, 02 Jun 2011 15:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 07:57 -0700, Saul Wold wrote:
> >
> > Not pulled as likely dependent on the above.
> >
> >>    bison: upgrade from 2.4.3 to 2.5
> >
> > Likewise.
> >
> >> Saul Wold (2):
> >>    ghostscript: Fix up file locations and add i686
> >
> > Why did this need the location fixups? Something sounds wrong here and
> > needs digging into.
> >
> So what I changed was to move the architecture header files (in 
> architecture directories) into the ghostscript directory instead of 
> being in the top level of the recipe directory.  I also need to add an 
> i686 directory in addition to the i586 directory, if there is a way to 
> map this for the native then more digging is needed.  This is required 
> to build ghostscript-native.

Sorry, I misread this diff. What you've done is what I'd have expected
was needed and I'm find with that. I've merged it.

Cheers,

Richard



