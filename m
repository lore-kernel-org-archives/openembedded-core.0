Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbaLX-0001XI-AK
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:37:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5SFXK18024980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:33:20 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 28 Jun 2011 08:33:19 -0700
Message-ID: <4E09F43E.508@windriver.com>
Date: Tue, 28 Jun 2011 10:33:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1309239001.git.dexuan.cui@intel.com>	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>	<4E09E4E6.9040703@windriver.com>	<1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>	<B2EC960E-7F9F-49BB-BFB0-18C98A7FDE12@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6A167F0C716@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C716@shsmsx502.ccr.corp.intel.com>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 15:37:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/28/11 10:21 AM, Cui, Dexuan wrote:
> Koen Kooi wrote:
>> Op 28 jun 2011, om 16:52 heeft Cui, Dexuan het volgende geschreven:
>>
>>> Hi, thank you very much for the suggestions!
>>> I worked out a vesion 2 patch that combines 2 and 3:
>>> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/banner_v2&id=2c2d9d7c0e942b6748bc8bd7d5980113bae9a836
>>
>> Could you in the future please base them on oe-core instead of poky?
>> I just did 'git merge 2c2d9d7c0e942b6748bc8bd7d5980113bae9a836' and
>> git blew up.  
> Sorry... but to basing them on oe-core,  do I need the permission to push my commits to my own branch in git://git.openembedded.org/openembedded-core-contrib? I suppose so and I should put my public key somewhere into the server?

You can push oe-core (based) changes to the poky-contrib tree.  Many of us do
this regularly.

I base my changes usually on oe-core, unless they contain poky specific code..
I push both types to the same poky-contrib repository (in different branches of
course).

(I also always avoid "merge", and always use cherry-pick when pulling code from
someone else's branches into my own..)

--Mark

> Thanks,
> -- Dexuan
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



