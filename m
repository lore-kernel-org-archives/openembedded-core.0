Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SS8Ix-0007Yn-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:55:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49Ejs6A017010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2012 07:45:54 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 07:45:53 -0700
Message-ID: <4FAA8321.707@windriver.com>
Date: Wed, 9 May 2012 09:45:53 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<1336573316.5602.68.camel@phil-desktop>
In-Reply-To: <1336573316.5602.68.camel@phil-desktop>
X-Enigmail-Version: 1.4.1
Cc: Phil Blundell <philb@gnu.org>
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
X-List-Received-Date: Wed, 09 May 2012 14:55:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/09/2012 09:21 AM, Phil Blundell wrote:
> On Wed, 2012-05-09 at 08:46 -0500, Jason Wessel wrote:
>> External distributions based on the oe-core will typically include
>> bitbake in the top level directory.  The idea is to make it easy
>> for external distributions to easily assemble a distribution
>> with a pristine version of oe-core, add avoid the git untracked messages:
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


It appeared to me that the bitbake was maintained by an entirely different group of people, but oe-core is completely tied to bitbake.  It might always be the case that it will still be a separate repository and perhaps this is a side effect of how the poky git vs the development of the Yocto Project are maintained, with the other work flow being to assemble a distribution.

Technically the poky git has the same issue, but you do not see it because of the way it is managed.  Ideally I would have liked to see that change as well, but I understand it is done that way for simplicity vs using git submodules or subgit trees with a tool like repo or others.

It would be interesting to hear a few more view points on this topic.

Jason.


