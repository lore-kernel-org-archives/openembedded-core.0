Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id 40953713BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 16:44:42 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id n4kg1o00J1mTNtu014khAc; Thu, 04 Sep 2014 09:44:42 -0700
Message-ID: <540896F8.9040805@pabigot.com>
Date: Thu, 04 Sep 2014 11:44:40 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 16:44:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2014 11:29 AM, Burton, Ross wrote:
> On 4 September 2014 17:07, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>> .inc files make sense with current packaging because they are revision
>> control friendly.  E.g. you can put the logic into .inc and follow its
>> history with 'git log' which is not possible when there are only the
>> versioned .bb files.
> You can follow changes to the .inc but not anything that went in and
> out of the .bb, but I do concede that git not tracking the renames
> directly does mean some histories are harder to track (although simple
> to follow as the commit where the history stops will tell you where to
> pick it up again).

git log --follow foo_1.2.bb handles 90% of this:

       --follow
            Continue listing the history of a file beyond renames (works 
only for a single file).

E.g. you can go all the way back to systemd 196 with:

     git log --follow meta/recipes-core/systemd/systemd_216.bb

Peter

