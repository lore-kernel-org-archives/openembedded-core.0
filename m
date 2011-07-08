Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfJfW-0001kR-IZ for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 00:37:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68MXCCo024291;
	Fri, 8 Jul 2011 23:33:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24227-01; Fri,  8 Jul 2011 23:33:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68MX3s9024254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 23:33:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <michaelx.d.halstead@intel.com>
In-Reply-To: <4E17848D.5090304@intel.com>
References: <CAOd_LFwKQHF7-wtHPALJhfDZTvWkpWBR_wmgLPAUCRh3Y8-RaA@mail.gmail.com>
	<1310161925.20015.918.camel@rex>  <4E17848D.5090304@intel.com>
Date: Fri, 08 Jul 2011 23:32:24 +0100
Message-ID: <1310164344.20015.935.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libmatchbox fetch error
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
X-List-Received-Date: Fri, 08 Jul 2011 22:37:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 15:28 -0700, Michael Halstead wrote:
> On 07/08/2011 02:52 PM, Richard Purdie wrote:
> > On Fri, 2011-07-08 at 16:16 -0400, Cliff Brake wrote:
> >> I'm trying to get some basic oe-core builds going (core-image-sato)
> >> and am running into:
> >>
> >> ERROR: Logfile of failure stored in:
> >> /scratch/oe/openembedded-core/build/tmp-eglibc/work/i586-oe-linux/libmatchbox-1.9-r8/temp/log.do_fetch.24235
> >> Log data follows:
> >> | NOTE: fetch http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz
> >> | ERROR: Function 'Fetcher failure for URL:
> >> 'http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz'.
> >> Unable to fetch URL
> >> http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz
> >> from any source.' failed
> >> NOTE: package libmatchbox-1.9-r8: task do_fetch: Failed
> >> ERROR: Task 1884
> >> (/scratch/oe/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb,
> >> do_fetch) failed with exit code '1'
> >>
> >> It seems like the matchbox site is in flux right now.  Is there a
> >> stable place to get the download?
> > At the very least the yocto mirrors have those pieces on them. I don't
> > know what has happened to those urls but I'll try and find out.
>
> Those files were moved when we converted the matchbox-project site from 
> Wordpress to static HTML for security reasons. The files have been 
> restored. Thank you for bringing this to my attention.

Thanks for the prompt fix, much appreciated! :)

Cheers,

Richard



