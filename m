Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCT33-0000Xe-CM for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 11:55:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24AkS2S025502; Mon, 4 Mar 2013 10:46:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A4yKqPEwwn9D; Mon,  4 Mar 2013 10:46:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24AkKrU025497
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Mar 2013 10:46:22 GMT
Message-ID: <1362393507.29587.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 04 Mar 2013 10:38:27 +0000
In-Reply-To: <20130304103306.GF3268@jama>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
	<20130304081846.GC3268@jama> <1362391887.29587.5.camel@ted>
	<20130304103306.GF3268@jama>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Mon, 04 Mar 2013 10:55:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 11:33 +0100, Martin Jansa wrote:
> On Mon, Mar 04, 2013 at 10:11:27AM +0000, Richard Purdie wrote:
> > On Mon, 2013-03-04 at 09:18 +0100, Martin Jansa wrote:
> > > On Sun, Mar 03, 2013 at 08:34:30PM -0500, randy.macleod@windriver.com wrote:
> > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > > 
> > > > The hardcoded paths in libtool will cause apache2 compile fail at
> > > > link stage when the package apr is installed from sstate cache, so
> > > > add libtool to SSTATE_SCAN_FILES.
> > > > 
> > > > [ CQID: WIND00405372 ]
> > > 
> > > You can drop this.
> > 
> > Is this really a big problem? I can understand people wanting to be able
> > to track commits back to defect reports...
> 
> Not big problem, but isn't link to cgit in their tracking system enough?
> 
> That's what I'm using for SHR bugs now, because I cannot assume that people
> using oe-core will know where bug tracker for [SHR #666] is.

I am quite happy for the meaning of some of these to be documented
somewhere with a link to the appropriate bugzillas or other systems.

> I cannot find public windriver bug tracker where I can search 
> WIND00405372 to find longer description why this change is needed (I
> know why in this case) - that's why I find yocto bug tags useful, but
> not WIND00*.

As per the commit guidelines, these are additional information and no
excuse for not writing a self-standing commit message. Some will be more
useful than others but I'm not sure it makes sense to remove them just
for the sake of it.

Cheers,

Richard




