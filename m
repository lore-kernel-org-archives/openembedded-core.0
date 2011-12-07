Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYMGR-0005mh-BZ for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 19:30:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7INs2o018146
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 18:23:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17238-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 18:23:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7INkxS018140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 18:23:47 GMT
Message-ID: <1323282237.30601.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 18:23:57 +0000
In-Reply-To: <4EDF991D.1010601@balister.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
	<1323276042.30601.42.camel@ted> <4EDF991D.1010601@balister.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] boost : Add icu to DEPENDS to fix a build failure.
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
X-List-Received-Date: Wed, 07 Dec 2011 18:30:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 11:49 -0500, Philip Balister wrote:
> On 12/07/2011 11:40 AM, Richard Purdie wrote:
> > On Wed, 2011-12-07 at 10:59 -0500, Philip Balister wrote:
> >> Part of boost needs libraries from icu. Without this, either the build or
> >> image construction fails. (I forget exactly which)
> > 
> > That is a fairly heavy dependency to add and we're not seeing builds or
> > images fail due to this being missing as far as I can tell. Do you have
> > any further information on this?
> 
> Googling gets me this page:
> 
> http://www.boost.org/doc/libs/1_41_0/libs/regex/doc/html/boost_regex/ref/non_std_strings/icu/intro.html
> 
> I'm no expert at this unicode stuff, maybe we need to nuild boost
> without unicode?

That sounds preferable since I can't see how we can be using it at
present anyway. I'm hoping we can just disable that bit of boost until
somebody needs it...

Cheers,

Richard



