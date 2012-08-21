Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3mSK-0002VM-7Q for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 13:17:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LB52Hw012524;
	Tue, 21 Aug 2012 12:05:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32616-09; Tue, 21 Aug 2012 12:04:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LB4qaN012512
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 21 Aug 2012 12:04:53 +0100
Message-ID: <1345547093.3907.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 21 Aug 2012 12:04:53 +0100
In-Reply-To: <CAMZjud3O9u4EyO8gt2wPYWW=N8vpJAHQp4y-4-UWU8TwMsS07A@mail.gmail.com>
References: <1343893746-4260-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMZjud3O9u4EyO8gt2wPYWW=N8vpJAHQp4y-4-UWU8TwMsS07A@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [Multilib] Complete recipe enablement
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
X-List-Received-Date: Tue, 21 Aug 2012 11:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-21 at 11:40 +0300, Marinescu, Bogdan A wrote:
> Resending.
> 
> On Thu, Aug 2, 2012 at 10:49 AM, Bogdan Marinescu
> <bogdan.a.marinescu@intel.com> wrote:
>         RP: The list of recipes in multilib.conf needs to go away and
>         we need
>         to just be able to extend all recipes with the multilib class.
>         Tested by building and running lib32-core-image-sato-sdk.
>         
>         [YOCTO #1563]
>         
>         Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>         ---
>          meta/classes/multilib.bbclass |    3 +
>          meta/conf/multilib.conf       |  745 

Already merged:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c4a7517f8ae6e176a0b8e59b1176cf65bb45aa78

As a sidenote, please put a prefix to the subject line showing which
area the patch touches (missing a multilib: in this case) as per the
commit message guidelines.

Cheers,

Richard




