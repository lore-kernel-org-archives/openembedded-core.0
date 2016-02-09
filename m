Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A043C65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 16:00:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19G0DO2014290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Feb 2016 08:00:13 -0800 (PST)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 08:00:12 -0800
To: Marek Vasut <marex@denx.de>
References: <1455017471-6682-2-git-send-email-marex@denx.de>
	<1455023303-8137-1-git-send-email-marex@denx.de>
	<CAJTo0LbuO5c=Hv7LUHMpuOYtLG48YFN7t+ZpeTR+cjdHrpdXNg@mail.gmail.com>
	<201602091529.17418.marex@denx.de>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56BA0D0B.60104@windriver.com>
Date: Tue, 9 Feb 2016 11:00:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <201602091529.17418.marex@denx.de>
X-Originating-IP: [128.224.56.84]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/7] binutils: Repair nios2 PLT and GP handling
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
X-List-Received-Date: Tue, 09 Feb 2016 16:00:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-09 09:29 AM, Marek Vasut wrote:
> On Tuesday, February 09, 2016 at 03:21:17 PM, Burton, Ross wrote:
>> On 9 February 2016 at 13:08, Marek Vasut <marex@denx.de> wrote:
>>> Repair corner cases in nios2 PLT and GP handling. See the patches
>>> themselves for extensive detailed explanation.

This sentence doesn't really add much value since many patches
contain additional description and the logs here are mostly a
few lines from the ChangeLog which doesn't count as an extensive
detailed explanation in my books. :)

I expect that you're familiar with this but take a look at:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Committing_your_patch

     Commit with a concise and descriptive message -
     one that explains your changes in a way others get
     a short overview without looking at the code.

>>>
>>> The patches don't contain the ChangeLog entries, since the changelog
>>> entries often cause trouble when applying the patch.

I'd prefer to see the ChangeLog snippets duplicated in the git log
so that it's easier to see what happened.

If you do a v2, please also mention that the patches are backports
since that's important to people when they consider whether the patch
should be accepted.

Thanks!

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

