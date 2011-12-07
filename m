Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RYQRU-00051m-5x; Wed, 07 Dec 2011 23:58:24 +0100
Received: by iadj38 with SMTP id j38so1583473iad.6
	for <multiple recipients>; Wed, 07 Dec 2011 14:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sOvrCifdvEsVbhwf2gwwTfP3XJTcubSUM+4SfgqOt5E=;
	b=G3U5gGPR6QqMe/BJR+JCLgtbi58GrJC7WQsxGWo5Ttt5rHyOwXXnXmBagiNvNdC8xZ
	z+RT+SH6hYvaJ/fNEr+skqDkIfY6UZRUWfYoptr0nhtK45UIwk6994H8wIP41hbno4jP
	lKkNuxWhRsP/A8QL+4/saGez70BrLp2jVNDpQ=
Received: by 10.42.157.137 with SMTP id d9mr937767icx.31.1323298292868;
	Wed, 07 Dec 2011 14:51:32 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id v18sm11712761ibh.4.2011.12.07.14.51.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 14:51:31 -0800 (PST)
Date: Wed, 7 Dec 2011 14:51:08 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207225108.GB7003@sakrah.homelinux.org>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, ulf@emagii.com
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED54C2B.2060505@emagii.com> <4ED66835.3050400@intel.com>
	<4ED793E2.5070205@emagii.com> <4EDA80A2.5070303@emagii.com>
	<20111204112019.GB4871@rhein.zuhause.netz>
	<1322998509.25960.55.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322998509.25960.55.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org, ulf@emagii.com
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Wed, 07 Dec 2011 22:58:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/12/11 11:35), Richard Purdie wrote:
> On Sun, 2011-12-04 at 12:20 +0100, Henning Heinold wrote:
> > On Sat, Dec 03, 2011 at 09:03:46PM +0100, Ulf Samuelsson wrote:
> > > Have made some further tests with the same machine, but now running
> > > Ubuntu 11.04 x64
> > > 
> > > bitbake console-image
> > > 
> > >     PARALLEL_TASKS        BB_NUMBER_TASKS        BUILD TIME
> > >     2                                  2
> > > 1:24:16
> > >     4                                  4
> > > 0:48:22
> > >     6                                  6
> > > 0:45:00
> > >     24                                24
> > > C++ compiler fails with --sysroot problem
> > >         after ~2200 out of 2400 tasks.
> > > 
> > > 
> > > 
> > > BR
> > > Ulf
> > 
> > Hi Ulf,
> > 
> > can you try the attached patch if it solves the problem?

Does this really fix the problem.

> 
> Can someone please explain to me how this would fix the problem?
> 
> If this were the issue shouldn't it either always work or always fail?
> 
> I'm worried that even if this does "fix" the problem, there is a deeper
> issue lurking somewhere :(

We use --with-local-prefix and then also --with-gxx-include-dir which
points to /usr/include/c++ 

Now the documentation says that --with-gxx-include-dir is an absolute
path but if sysroot gets prepended to it or not I am not clear yet
if sysroot gets prepended to it then we should be in safe spot


> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


