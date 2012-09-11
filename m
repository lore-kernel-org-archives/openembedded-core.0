Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBJ7S-0008WG-J5
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:34:42 +0200
Received: by iaky10 with SMTP id y10so106394iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 22:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FtDSmJcn2f5I0i0SrIc5MfVHU7ghIlGj5j5BFvWjrbk=;
	b=uDO1nGhlSM0wX0KpFdHH+ozF/AVyEXGEShQ9xsVYaVN0HFyDhCTICZeB2r1+zwk3yQ
	1dom65mFdxqI3Ceisa465TaOg2HfM0EBk0ZQip+hWvnrJUqepXAhMGyIJlmqOsjyQrCA
	3x0jnHvKberKH0SojraQYTXaSb+JR8DL1Y49uBz+YpqyiaF9XZ2CRste/E551lOJm+Kp
	AgjnFroLZiVqeD7g2lc/JYD1cutHMCPGu+0zN42nl3k8nYhmkPB5KdlCrjPm02S7zi+e
	5r578uCHUgQEA3dlcgqpt4z4kgOKCNZTfhKrfjt1fY2Azi0txMzug2b5oe91wHHUXLK1
	kaXA==
Received: by 10.42.18.8 with SMTP id v8mr2731802ica.16.1347340931784;
	Mon, 10 Sep 2012 22:22:11 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id a10sm1211215igd.1.2012.09.10.22.22.10
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 22:22:11 -0700 (PDT)
Date: Mon, 10 Sep 2012 22:22:07 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911052205.GC3035@sakrah.homelinux.org>
Mail-Followup-To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<20120911045038.GE2980@sakrah.homelinux.org>
	<504EC385.6060008@windriver.com>
	<20120911045557.GF2980@sakrah.homelinux.org>
	<504EC4F3.30705@windriver.com>
	<20120911051602.GA3035@sakrah.homelinux.org>
	<504EC96B.7090205@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504EC96B.7090205@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
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
X-List-Received-Date: Tue, 11 Sep 2012 05:34:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/12 01:17), Bruce Ashfield wrote:
> On 12-09-11 1:16 AM, Khem Raj wrote:
> >On (11/09/12 00:58), Bruce Ashfield wrote:
> >>On 12-09-11 12:55 AM, Khem Raj wrote:
> >>>On (11/09/12 00:52), Bruce Ashfield wrote:
> >>>>On 12-09-11 12:50 AM, Khem Raj wrote:
> >>>>>On (10/09/12 14:11), Bruce Ashfield wrote:
> >>>>>>Updating to 3.4.10 which has been soaking for a bit now, as well
> >>>>>>as picking up the following meta commits from Tom Z:
> >>>>>
> >>>>>would it also need bumping linux-libc-headers too ?
> >>>>
> >>>>There's no new interfaces in the -stable updates, so there's no reason
> >>>>to bump. I typically elect to jump to a 3.x.0 and leave it there, but
> >>>>we had an interim bump that I wouldn't have done .. so we sit at 3.4.3
> >>>>at the moment (which is still fine).
> >>>
> >>>OK. Next question is, do stable updates get changes such that we need to
> >>>bump the linux-libc-headers ?
> >>
> >>Not that I've ever seen.
> >
> >OK thats what I was expecting to hear
> >so in theory if we always pin linux-libc-headers to major release we are
> >good. say 3.4.0 and then 3.6.0 and so on we really dont need 3.4.1 or
> >later and similarly for other versions. In this case we only bump
> >the linux-libc-headers recipe when we add a new major kernel release
> 
> Correct. If you check the mailing list archives, I was a bit surprised
> to see it go to 3.4.3, but going forward, expect to only see major rev
> bumps.

yes essentually IIRC I mentioned that recipe should be called
blah_3.4.bb and blah_3.6.bb and so on and not really blah_3.4.x etc.
OK I am glad we are on same page boundary here :)


