Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14AAD71B2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 03:55:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU3tI3K027829
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Nov 2017 19:55:18 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 19:55:11 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
	<2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8d950b8b-c9f4-75c4-2cbf-655ac7d452a9@windriver.com>
Date: Thu, 30 Nov 2017 11:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 03:55:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks for the reply.

On 11/30/2017 11:27 AM, Paul Eggleton wrote:
> Hi Robert,
> 
> FYI Anibal has left Intel; the AUH is now being worked on by Alex Kanavin (on
> CC).
> 
> On Thursday, 30 November 2017 3:23:25 PM NZDT Robert Yang wrote:
>> I tried auto-upgrade-helper, it is very helpful when upgrade recipes.
>> I'd like to make some enhancements to make it can be easily used by the
>> maintainer (recipe upgrader) himself:
>> 1) Don't send email when maintainer uses it, for example, when I want to
>>      upgrade "strace", I don't need it send email to anyone.
>> 2) Use git's user.name and user.email in git commit when not send email,
>>      we need let the maintainer take responsible for it.
> 
> It's probably not just about not sending email - manually running the script
> without sending email is also useful when testing the AUH script during
> development so we'd need to switch usage of the git user/email a different
> way, but otherwise yes this seems reasonable. Probably we would just have some
> kind of local-only mode, possibly that's made the default (or can be
> configured to be).

I prefer default to local.

> 
>> 3) Do the commit on the recipes when the upgrade is succeed, currently,
>>      it keeps the commit when failed, but removed it when succeed.
> 
> No problem as long as it doesn't interfere with automated operation on the
> server.
> 
>> 4) Make upgradehelper.py can accept multiple recipes as args.
> 
> Seems reasonable yes.
> 
>> 5) It's a small tool and helpful when upgrade recipes, can we move it into
>>      oe-core/scripts, please ?
> 
> So for manual (or should I say semi-automatic) recipe upgrades, our primary
> tool is "devtool upgrade" - at the moment it is true that there are things
> that the AUH can do that devtool upgrade can't (e.g. auto-detecting the latest
> upstream version, handling LIC_FILES_CHKSUM, etc.), but I believe Alex will be
> working on some of those and then will be moving the AUH to use devtool
> upgrade itself so that we don't have two codebases for the same task. We don't
> plan to deprecate manual usage of the AUH, but if there are use cases that
> devtool upgrade cannot currently handle, then assuming they fit I would like
> to handle them there first and point most users at devtool upgrade rather than
> manually running the AUH, since devtool upgrade is much more suited to
> enabling the work that follows on when an upgrade cannot be completed
> automatically.
> 
> Have you looked at devtool upgrade at all?

I tried "devtool upgrade less --version 529" just now. What I like AUH most is
it can help update md5sum, do the commit, and do build testing on a few qemu
machines, that really helps a lot, which can enhance the quality of patches.
Does "devtool upgrade" has a plan to do that, please ?

// Robert

> 
> Cheers,
> Paul
> 

