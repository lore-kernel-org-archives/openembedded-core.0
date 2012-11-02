Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TUFdl-0005OZ-JL for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2012 12:42:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA2BScnl022237;
	Fri, 2 Nov 2012 11:28:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21569-05; Fri,  2 Nov 2012 11:28:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA2BSRnJ022230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 2 Nov 2012 11:28:29 GMT
Message-ID: <1351855707.6502.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 02 Nov 2012 11:28:27 +0000
In-Reply-To: <50932FD4.6090307@windriver.com>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
	<508F8AD7.2000006@windriver.com> <1351671493.2828.71.camel@ted>
	<50932FD4.6090307@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Morten Minde Neergaard <mneergaa@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Fri, 02 Nov 2012 11:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-02 at 10:28 +0800, Robert Yang wrote:
> 
> On 10/31/2012 04:18 PM, Richard Purdie wrote:
> > On Tue, 2012-10-30 at 16:07 +0800, Robert Yang wrote:
> >> I met the same problem on openSUSE 12.1 64 bit.
> >>
> >> I used ssh -X to opensuse, and my client is Ubuntu 11.10 32bit
> >
> > The trouble is the removal of:
> >
> > os.environ[export] = str(value)
> >
> > I think we're going to have to add this back since it looks like we need
> > the parent environment adjusted as well as that of the child.
> >
> > For now I'm tempted to add that line back...
> 
> Hi Richard,
> 
> I'm sorry, but it doesn't work well, it only spawns once now,
> but the environment is incorrect, for example, the PATH:
> 
> $ echo $PATH
> /usr/lib64/ccache:/usr/local/bin:/usr/bin
> 
> I tested it on Fedore 17 64bit and openSUSE 12.1 64, either of them
> didn't work.

Thanks for reporting that, I've just pushed a fix for this.

Cheers,

Richard



