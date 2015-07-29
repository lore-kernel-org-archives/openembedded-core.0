Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E358601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:19:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6TAJ806017771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jul 2015 03:19:08 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 03:18:51 -0700
Message-ID: <55B8A89A.6050406@windriver.com>
Date: Wed, 29 Jul 2015 18:19:06 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Wed, 29 Jul 2015 10:19:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/29/2015 06:11 PM, Paul Eggleton wrote:
> Hi Robert,
>
> On Wednesday 29 July 2015 02:11:53 Robert Yang wrote:
>> The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:
>>
>>    harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/github
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/
>> github
>>
>> Robert Yang (2):
>>    bitbake.conf: add GITHUB_GIT
>>    meta: git://github.com -> ${GITHUB_GIT}
>
> Interesting, but you don't explain why this change is needed in the commit
> messages.

Hi Paul,

It is just like what GNOME_GIT, GNU_MIRROR and others did.

// Robert

>
> Cheers,
> Paul
>

