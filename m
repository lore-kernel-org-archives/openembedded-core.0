Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SS9N1-0003E2-Dq for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:04:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49FsEma023906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 16:54:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23680-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 16:54:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49Fs6lL023900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 16:54:09 +0100
Message-ID: <1336578845.2494.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 16:54:05 +0100
In-Reply-To: <1336573316.5602.68.camel@phil-desktop>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<1336573316.5602.68.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 16:04:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 15:21 +0100, Phil Blundell wrote:
> On Wed, 2012-05-09 at 08:46 -0500, Jason Wessel wrote:
> > External distributions based on the oe-core will typically include
> > bitbake in the top level directory.  The idea is to make it easy
> > for external distributions to easily assemble a distribution
> > with a pristine version of oe-core, add avoid the git untracked messages:
> 
> Presumably any non-trivial external distribution is going to include
> other metadata as well, in which case they're going to have to
> edit .gitignore for themselves anyway.  So it doesn't really seem as
> though having bitbake be mentioned there in oe-core buys much.
> 
> On the other hand, actually moving bitbake inside the oe-core repository
> seems like an idea which might have some merit.  It's not obvious that
> having it in its own tree really achieves anything other than making
> release engineering slightly more difficult.

The one thing I will say in favour of the separate repositories is that
its helped make the API and separation between the two very clear. For
example, bitbake has no knowledge of many variables such as WORKDIR and
this is the way it should be.

My main concern with any merge would be creep of knowledge from one to
the other which I think lets us have clean and well structured code at
the moment with good separation of responsibilities.

Cheers,

Richard



