Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeR5c-0007WA-I5 for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:24:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDEJjH010639
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:14:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08346-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:14:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDEAuG010633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:14:11 +0100
Message-ID: <1339506849.8065.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 14:14:09 +0100
In-Reply-To: <4FD68BF8.9030607@intel.com>
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<5bbd09a3f268bff3c7f1126e6d88bb61aeccbb2f.1338658339.git.otavio@ossystems.com.br>
	<CAPhnLPDP65iKqruiLLE2UmmEZsR7LOKeUNMGHVitwKp54dHWRg@mail.gmail.com>
	<4FD68BF8.9030607@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] openjade: autoreconf to fix building on newer host systems
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
X-List-Received-Date: Tue, 12 Jun 2012 13:24:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-11 at 17:23 -0700, Scott Garman wrote:
> On 06/11/2012 10:34 AM, Flanagan, Elizabeth wrote:
> > On Sat, Jun 2, 2012 at 10:34 AM, Otavio Salvador
> > <otavio@ossystems.com.br>  wrote:
> >> When using an update host system the build environment fails to
> >> properly get config.h done. To solve it we update the build system
> >> thought use of autoreconf. The build failure was:
> >>
> >> ,----
> >> | ...
> >> | DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope
> >> | DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope
> >> | make[2]: *** [DssslApp.lo] Error 1
> >> `----
> >>
> >> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> >> ---
> >
> > Merged into OE-Core
> 
> I don't see this commit in oe-core master?

It was not merged and I've now proposed an alternative patch.

Cheers,

Richard



