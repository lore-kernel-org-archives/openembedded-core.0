Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9g3V-0005tR-N0 for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:35:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UGaEOg030768; Fri, 30 Sep 2011 17:36:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vaKLn81v53AM; Fri, 30 Sep 2011 17:36:14 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UGaAwt030764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 30 Sep 2011 17:36:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 17:29:43 +0100
In-Reply-To: <CAEsOVNej5XjNzLnrxXVexEBj4xGDoVsrhSbzLZe71A4kpTWGWw@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<1317382729.12332.174.camel@ted>
	<CAEsOVNej5XjNzLnrxXVexEBj4xGDoVsrhSbzLZe71A4kpTWGWw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317400191.12332.211.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Fri, 30 Sep 2011 16:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 15:51 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Sep 30, 2011 at 6:38 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > That isn't quite what I meant, that also overwrites anything existing in
> > CXFLAGS just in a different way. Also, I suspect you mean CXXFLAGS?
> >
> > I'd meant something like:
> >
> > CXXFLAGS_append_powerpc64 = " -Wno-error=format"
> 
> In the mdadm Makefile it gives the following instructions:
> 
> # define "CXFLAGS" to give extra flags to CC.
> # e.g.  make CXFLAGS=-O to optimise
> 
> So I was following that...

Ok, normally we'd use CFLAGS for this but people love to be different
when writing makefiles :)

In that case your patch is fine...

Cheers,

Richard



