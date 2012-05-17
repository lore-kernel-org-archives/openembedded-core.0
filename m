Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SV6m5-0002Cl-EH for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 21:54:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HJiAr9030929
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 20:44:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30705-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 20:44:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HJi1N8030923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 20:44:03 +0100
Message-ID: <1337283840.7473.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 20:44:00 +0100
In-Reply-To: <CAMKF1spuwjLQ3hT8J6oNcFWowynBdKfX6=-NNKD7R=oRGWMknA@mail.gmail.com>
References: <cover.1337246557.git.lianhao.lu@intel.com>
	<932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
	<CAMKF1spuwjLQ3hT8J6oNcFWowynBdKfX6=-NNKD7R=oRGWMknA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] (libc-)package.bbclass: Added MLPREFIX to locale packages.
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
X-List-Received-Date: Thu, 17 May 2012 19:54:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 11:12 -0700, Khem Raj wrote:
> On Thu, May 17, 2012 at 2:25 AM, Lianhao Lu <lianhao.lu@intel.com> wrote:
> > Added multilib prefix to the locale related package names/dependencies.
> >
> > Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> 
> Does mlprefix already has a leading '-' ?
> otherwise I think adding a - would make is more readable.

mlprefix adds this. Trying to do this the other way makes things too
difficult and potentially inconsistent.

Cheers,

Richard



