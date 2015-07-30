Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABC457622A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 01:51:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U1pHZ3025788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jul 2015 18:51:17 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 18:50:59 -0700
Message-ID: <55B98313.5010204@windriver.com>
Date: Thu, 30 Jul 2015 09:51:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Olof Johansson
	<olof.johansson@axis.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>	<55B8A89A.6050406@windriver.com>	<1438170429-sup-8609@axis.com>
	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
In-Reply-To: <CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 30 Jul 2015 01:51:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/30/2015 12:27 AM, Otavio Salvador wrote:
> On Wed, Jul 29, 2015 at 8:48 AM, Olof Johansson <olof.johansson@axis.com> wrote:
>> Excerpts from Robert Yang's message of 2015-07-29 12:19:06 +0200:
>>> It is just like what GNOME_GIT, GNU_MIRROR and others did.
>>
>> Tbh, I don't understand them either, but maybe that's just me. What is
>> the reason? I think it makes it harder to see what is happening.
>
> It allows for people to add local mirrors for example and even remap
> fetching without touching the recipes. It is a good addition IMO.
>
Thanks, I updated the commit message in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/github

commit 8b6d701aa812536dc5d4350d8a7646f54942ebac
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Jul 28 03:00:37 2015 -0700

     meta: git://github.com -> ${GITHUB_GIT}

     It allows for people to add local mirrors for example and even remap
     fetching without touching the recipes.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

// Robert

