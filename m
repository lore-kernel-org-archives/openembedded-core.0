Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sru9j-0002HQ-4g
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:04:51 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58346 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Srtyk-0000Pj-DX for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:53:30 -0400
Date: Thu, 19 Jul 2012 12:53:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4P+z4SCiH80WGszFe5ttFHksKbc5Nt6v5F0RHyHDOzjzA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207191253010.21258@oneiric>
References: <alpine.DEB.2.02.1207191213190.13512@oneiric>
	<CADkTA4P+z4SCiH80WGszFe5ttFHksKbc5Nt6v5F0RHyHDOzjzA@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: Re: possible typo in kgit-checkpoint
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
X-List-Received-Date: Thu, 19 Jul 2012 17:04:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Jul 2012, Bruce Ashfield wrote:

> On Thu, Jul 19, 2012 at 12:16 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> > if [ -n "$check_refs" ]; then
> >     checkpoint_branch=`echo $check_refs | cut -d- -f2`
> >     verify_branch=`git show-ref $checkpoint_branch`
> >     checkpoint_tag_name=$check_refs
> >     if [ -z "verify_branch" ]; then
> >     ... snip ...
> >
> >   should that last line read
> >
> >     if [ -z "${verify_branch}" ]; then
> >
> > instead?
>
> Yep. I can just fix it here, or you can send patch, either works.

  all yours.

rday


