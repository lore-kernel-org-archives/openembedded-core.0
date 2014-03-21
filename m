Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 69D936B819
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 17:04:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2LH40UQ024542; Fri, 21 Mar 2014 17:04:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zURlRnGzk8m5; Fri, 21 Mar 2014 17:03:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2LH3rEc024489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 21 Mar 2014 17:03:57 GMT
Message-ID: <1395421427.24232.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 21 Mar 2014 17:03:47 +0000
In-Reply-To: <53231A33.8000800@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LZPGDftsVZD0NQKSWYD9BnKkMOrdTGUOKnQ2bVY+b-jwg@mail.gmail.com>
	<53231A33.8000800@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6 V3] refactor the archiver*.bbclass
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
X-List-Received-Date: Fri, 21 Mar 2014 17:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-03-14 at 23:03 +0800, Robert Yang wrote:
> 
> On 03/14/2014 01:45 AM, Burton, Ross wrote:
> > On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> >> Robert Yang (6):
> >>    classes/archive*.bbclass: remove archive-*-source.bbclass
> >>    archiver.bbclass: refactor it
> >>    package_rpm.bbclass: archive the source to srpm package
> >>    archiver.bbclass: move a few code to copyleft_compliance.bbclass
> >>    local.conf.sample.extended: update for the archiver
> >>    patch.bbclass: do_patch: unset TMPDIR from environment
> >
> > This series appears to work for me and doesn't cause rebuilds (after
> > removing the patch change, as that obviously does).  Can anyone else
> > who actively uses the archiver verify that it still works for them?
> >
> 
> Thank you very much for the testing and suggestions, I've updated it
> a little:
> 
> * Remove the [PATCH 6/6] which is used for unset the TMPDIR, we can fix
>    it in another thread as bug 5968 describes since it doesn't affect the
>    archiver.
> 
> * Modified the do_ar_configured a little and tested the "bitbake
>    core-image-sato world meta-toolchain", it worked well.
> 
> Here is the repo: (the same repo as before)
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/archiver_v3
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver_v3
> 
> Robert Yang (5):
>    classes/archive*.bbclass: remove archive-*-source.bbclass
>    archiver.bbclass: refactor it
>    package_rpm.bbclass: archive the source to srpm package
>    archiver.bbclass: move a few code to copyleft_compliance.bbclass
>    local.conf.sample.extended: update for the archiver

I'm going to merge this into master (its queued in master-next for final
testing) but this is on the condition that we work on follow up patches
to the issues raised during review.

Cheers,

Richard


