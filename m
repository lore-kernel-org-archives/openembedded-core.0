Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYILp-000489-K2 for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 17:56:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FemQ5006882; Fri, 3 May 2013 16:40:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rQe-oulrxYqg; Fri,  3 May 2013 16:40:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FegKO006874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 3 May 2013 16:40:43 +0100
Message-ID: <1367595520.27116.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 03 May 2013 16:38:40 +0100
In-Reply-To: <CANyK_8f0a-PRB22bCQekZLPp7aKH75yO4noUpZ7damPsPcnzaA@mail.gmail.com>
References: <1367325716.5379.90.camel@ted>
	<CANyK_8f0a-PRB22bCQekZLPp7aKH75yO4noUpZ7damPsPcnzaA@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: Ensure target packages don't reference perlnative
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
X-List-Received-Date: Fri, 03 May 2013 15:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-30 at 14:02 +0100, Paul Barker wrote:
> On 30 April 2013 13:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Currently a load of scripts in ${bindir} start with:
> >
> > which is undesireable, this patch fixes that.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Missing a line in the commit message?

It was swallowed by git. I fixed it when I merged the commit.

Cheers,

Richard



