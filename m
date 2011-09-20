Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1R678v-00017A-Pe
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 22:42:13 +0200
Received: by wyh5 with SMTP id 5so1173839wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 13:36:56 -0700 (PDT)
Received: by 10.227.170.139 with SMTP id d11mr1682505wbz.9.1316551015947;
	Tue, 20 Sep 2011 13:36:55 -0700 (PDT)
Received: from [172.20.1.6] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id r27sm3995342wbn.10.2011.09.20.13.36.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Sep 2011 13:36:55 -0700 (PDT)
Message-Id: <C39F352A-DF0C-4400-BEA2-492F17ACEEC4@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1316550641.14488.61.camel@ted>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 20 Sep 2011 22:36:48 +0200
References: <CALT56yOyp2VYEziGiZj4PLjYHFhTkxisKwWnP7_Uy69Cc1ufYw@mail.gmail.com>
	<4E78E508.9080706@windriver.com> <1316550641.14488.61.camel@ted>
X-Mailer: Apple Mail (2.936)
Subject: Re: [RFC] policy proposal: INC_PR
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
X-List-Received-Date: Tue, 20 Sep 2011 20:42:13 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 20 sep 2011, om 22:30 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-09-20 at 14:10 -0500, Mark Hatle wrote:
>> On 9/20/11 2:04 PM, Dmitry Eremin-Solenikov wrote:
>>> Hello, colleagues,
>>>
>>> While debugging some stuff in oe-core & company I've noticed that
>>> lot's of packages
>>> either don't use INC_PR, or misuse it (e.g. .inc has INC_PR, but  
>>> then
>>> .bb just defines PR = "rX").
>>
>> I've noticed similar things.  I'd agree, we should define and use  
>> INC_PR for
>> items that have .inc files.  There have been many times that I need  
>> to fix a bug
>> in the .inc file and end up manually updating the PR is 2 or 3  
>> recipes that use
>> the .inc.
>>
>> One question though, how do we handle packages with multilib .inc  
>> files?
>>
>> INC_PR += ...  (or is it .=)
>
> I'm going to disagree here. I'd actually like to see the whole PR  
> thing
> become irrelevant. Its insane we have to spend so much time doing
> something the system should be able to figure out for itself. It
> currently serves two purposes:
>
> 1. Triggers rebuilds of packages when they change
> 2. Handles package feed upgrades correctly
>
> For 1, we can use the sstate checksums and for 2, we can use some kind
> of PR server, either local or networked.
>
> I'm therefore proposing that after the current release is finished, we
> enable the BasicHash signature generator (which adds the sstate
> checksums to the stamp files) and stop bumping PR values (so INC_PR  
> can
> die and PR values can likely fade out of recipes). If the tooling we
> have for 2 isn't enough we'll then just simply have to improve it and
> make it work.
>
> Comments?

Judging from the previous big changes in OE-core, can we have the  
tooling actually work before abolishing PR?
AFAICT the PR 'syncing' across all builders for a distro hasn't been  
solved properly yet. With the current tooling it is impossible for  
people to rebuild a tag and get the same PRs as the master build had  
at the time of the tag.




