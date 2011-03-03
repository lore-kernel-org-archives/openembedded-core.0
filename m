Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvHwa-0001FK-HL for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 00:28:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NQtrF023433;
	Thu, 3 Mar 2011 23:26:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23025-08; Thu,  3 Mar 2011 23:26:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NQoWK023427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2011 23:26:50 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTi=-bWXFhaionzUfRvZJx1ajX9hPqBQAW1FY1kB8@mail.gmail.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<10e14f3105719259ad119b37ff1b49d1bc78a4ce.1299182375.git.sgw@linux.intel.com>
	<AANLkTi=-bWXFhaionzUfRvZJx1ajX9hPqBQAW1FY1kB8@mail.gmail.com>
Date: Thu, 03 Mar 2011 23:26:44 +0000
Message-ID: <1299194804.17567.186.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, "saul.wold" <saul.wold@intel.com>
Subject: Re: [PATCH 09/10] recipe: add slang from OE
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
X-List-Received-Date: Thu, 03 Mar 2011 23:28:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 12:59 -0800, Khem Raj wrote:
> On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > From: Kang Kai <kai.kang@windriver.com>
> >
> > slang is the shared library for the S-Lang extension language,
> > and required by newt because of LSB command check
> >
> > Signed-off-by: Kang Kai <kai.kang@windriver.com>
> 
> same thing for recipes imported from OE make note of last commit on the recipe
> that it came from. Probably adding patch header to patches would be
> nice to have as well.

Agreed, but I did merge these this time (a one off) to try and unblock
some bottleneck issues. I'm asking Saul to ensure the Yocto distro
people know to start doing this.

On the plus side, I've improved my scripts a lot to help move these
patches around and the various repos are starting to align better and it
should be easier to keep them that way.

Cheers,

Richard



