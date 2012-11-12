Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TXtlr-0004QC-Dq for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 14:09:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qACCtqCh025696;
	Mon, 12 Nov 2012 12:55:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25592-01; Mon, 12 Nov 2012 12:55:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qACCtfwa025690
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 12 Nov 2012 12:55:43 GMT
Message-ID: <1352724941.9083.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2012 12:55:41 +0000
In-Reply-To: <CAJTo0LZE56zn8UeSZ8OHs_oCX2U+y=L+F+HD9Dm74JPZyp_Eow@mail.gmail.com>
References: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LZE56zn8UeSZ8OHs_oCX2U+y=L+F+HD9Dm74JPZyp_Eow@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libxslt: upgrade to 1.1.27
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
X-List-Received-Date: Mon, 12 Nov 2012 13:09:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-09 at 10:15 +0000, Burton, Ross wrote:
> On 9 November 2012 10:00, Constantin Musca <constantinx.musca@intel.com> wrote:
> > --- a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
> > +++ b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
> > @@ -1,24 +1,24 @@
> >  Upstream-Status: Inappropriate [configuration]
> 
> This doesn't look "inappropriate" or "configuration" but a genuine
> build fix.  Has anyone approached upstream?
> 
> (I'm genuinely dismayed at the number of build fixes that get marked
> as inappropriate when they are clearly genuine build fixes)

I'm not going to reject the patch on this since its not a new issue
being introduced but I do support what you're saying 100% here, the
categories do seem to have gotten a little misplaced and people should
take the time to validate them when upgrading recipes...

Cheers,

Richard



