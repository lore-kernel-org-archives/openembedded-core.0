Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVJqa-0002RN-DV for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 10:19:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAT9Cnw2010915
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:12:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10756-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:12:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAT9CgJG010909
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:12:43 GMT
Message-ID: <1322557971.2140.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 09:12:51 +0000
In-Reply-To: <4ED49F3E.2010403@windriver.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
	<647b040f65373d5f2922a381f3515c62471773c8.1322554339.git.wenzong.fan@windriver.com>
	<928A241D-6223-4A84-9681-A4472F0DFC01@dominion.thruhere.net>
	<4ED49F3E.2010403@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/5] autoconf: Extend to provide nativesdk	recipe
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
X-List-Received-Date: Tue, 29 Nov 2011 09:19:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 17:00 +0800, wenzong fan wrote:
> On 11/29/2011 04:49 PM, Koen Kooi wrote:
> > Op 29 nov. 2011, om 09:39 heeft<wenzong.fan@windriver.com>  <wenzong.fan@windriver.com>  het volgende geschreven:
> >
> >    
> >> From: Wenzong Fan<wenzong.fan@windriver.com>
> >>
> >> [YOCTO #1603]
> >>      
> > For every recipe: what is '[yocto #1603]'?
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1603
> 
> The updates to each recipe was related to this requirement for yocto 
> 1.2, so I add the id number in all commit messages.

What Koen is asking for in a rather cryptic fashion is for more
explanation of the change being made in the commit message. The bug ID
is fine as a reference but we shouldn't rely on that to explain what the
change is and why its needed.

Cheers,

Richard



