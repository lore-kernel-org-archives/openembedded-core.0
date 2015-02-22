Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1A67F606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:58:48 +0000 (UTC)
Received: from [99.240.204.5] (port=50050 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPSNC-00081a-Hv; Sun, 22 Feb 2015 03:58:46 -0500
Date: Sun, 22 Feb 2015 03:58:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4NntZdNHW=Fk9127RjiqU-zJXhS120q5kiff8AAo2tN5A@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1502220356050.14143@localhost>
References: <alpine.LFD.2.11.1502210237270.4835@localhost>
	<CADkTA4NntZdNHW=Fk9127RjiqU-zJXhS120q5kiff8AAo2tN5A@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about kernel .scc and .cfg files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Feb 2015 08:58:49 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 21 Feb 2015, Bruce Ashfield wrote:

> On Sat, Feb 21, 2015 at 2:43 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   once a SRC_URI refers to an .scc file that further refers to a
> > .cfg file, is there any need for the SRC_URI file to
> > *additionally* refer explicitly to that same .cfg file? i ask only
> > because i've noticed this on occasion and i'm not sure if there's
> > something subtle going on that i don't know about.
>
> There's no need. Everything is migrated into the kernel workdir, and
> the .scc processing picks up the .cfg. It's that way, since the .scc
> + .cfgs are used elsewhere and in that format are fully standalone.

  ok ... so once a .scc file is picked up that further refers to .cfg
files, there is no need to refer to those same .cfg files directly.
that's what i'd understood, but every so often, i run across recipes
that do things i don't expect, and it always makes me wonder if i
don't quite understand something.

  it's my sheldon cooper-like OCD that motivates me to want to remove
stuff that has no need to be there. bazinga.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

