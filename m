Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEnhr-0001wJ-TE
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 22:18:28 +0200
Received: by pbcum15 with SMTP id um15so4011905pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xX7jqTOqkbVWx/JISKhgvYlZ8CRn5Oxz+vsk1ggsZ0o=;
	b=t/TBZyFptQalXTXZNcM/+Uom/XU67jAUoFFzVbDcfasKit+hYXkm6tLXNe1sezkfqw
	yPlEnaHWd8S1jiOlxv9ms2b3EM7SuQ8Gp/RYqZd3+MSpDtbDr4DU8KZ0pOuef4t0+sv6
	eSYUOkVE5zjVbWm66MHI2+03p15agSLSfqPN372P8CWJnfwF1362JL21SHQ9X+TClYPQ
	tmx/omRpWQ1uTaAm9VInGX2PgVdlhM17+ECu6b4TizHzcKXTtYf+kS7G73CjSy0axeAm
	66wTL13RCVG2c/MDTgwg0owhwABgMryl48y3pFSaP69xaQ7iw2/Ryk4l1RE3+tcB1aXE
	wDkQ==
Received: by 10.68.216.3 with SMTP id om3mr23021720pbc.18.1333397358714;
	Mon, 02 Apr 2012 13:09:18 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id r6sm14656791pbl.24.2012.04.02.13.09.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 13:09:17 -0700 (PDT)
Date: Mon, 2 Apr 2012 13:09:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120402200909.GB26494@sakrah.homelinux.org>
References: <4F5FF91F.5010407@opendreambox.org>
	<20120314083509.GA22878@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20120314083509.GA22878@rhein.zuhause.netz>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gdb 7.4 and libexpat
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
X-List-Received-Date: Mon, 02 Apr 2012 20:18:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/03/12 09:35), Henning Heinold wrote:
> On Wed, Mar 14, 2012 at 02:49:19AM +0100, Andreas Oberritter wrote:
> > Hi everybody,
> > 
> > in our rootfs, when debugging remotely with gdbserver on mips32el, gdb
> > 7.4 fails to find symbol names for use in backtraces. gdb 7.3.1 works
> > well. One of my colleagues ran git bisect and discovered the culprit:
> > 
> > gdb git revision 22d678fdfdfc56ec75555f8f44ae5f0c4fc97e9a
> > http://sourceware.org/ml/gdb-patches/2011-11/msg00103.html
> > 
> > We haven't found out why this patch breaks symbol lookup. However, we
> > found three options to fix backtraces with version 7.4:
> > 
> > 1.) Revert the changeset, possibly without understanding it fully.
> > 2.) Enable expat in gdb, dragging libexpat into the image.
> > 3.) Disable expat in gdb-cross, possibly losing functionality.
> > 
> > It seems that if one side is compiled with expat and the other is not,
> > then gdb and gdbserver now have problems communicating with each other.
> > 
> > Which way would you prefer?
> > 
> > Regards,
> > Andreas
> > 
> 
> Hi,
> 
> option 2 is my favourite.

yes enable expat on both ends is better. having xml support
is good to have better debugging experience.

> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


