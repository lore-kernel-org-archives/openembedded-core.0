Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E60CC60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:07:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2015 13:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,423,1437462000"; d="scan'208";a="549810990"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 13:07:16 -0700
Message-ID: <55DF6E3A.8060506@linux.intel.com>
Date: Thu, 27 Aug 2015 15:08:26 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>	<8664014de25c7f4d9903bea81eaeddce1e7219df.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>	<2003255.VjrPsemNp7@peggleto-mobl.ger.corp.intel.com>	<55DF0F98.8050708@linux.intel.com>
	<CAP9ODKo+krDM+4ZsoxnNzjmEcfYNvnNftimjFLwEHXc_inphpA@mail.gmail.com>
In-Reply-To: <CAP9ODKo+krDM+4ZsoxnNzjmEcfYNvnNftimjFLwEHXc_inphpA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] devtool: upgrade feature
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
X-List-Received-Date: Thu, 27 Aug 2015 20:07:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/27/2015 08:29 AM, Otavio Salvador wrote:
> On Thu, Aug 27, 2015 at 10:24 AM, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> On 08/26/2015 07:04 PM, Paul Eggleton wrote:
>>> We already have code for editing recipes like this in recipeutils (and in
>>> lib/bb/utils as well) - in fact I see you're using patch_recipe() later
>>> on, so
>>> why do it by hand here?
>>>
>>
>> can 'oe.recipeutils.patch_recipe' patch variable's flags? I did not try but
>> looking at the function definition, seems like it does not.
>
> So add this feature there if you need it.
Hi Otavio!

you are completely right. I gave it some hours today without much luck. 
What I have right now is that it appends the new checksums at the end of 
the recipe instead of replacing them. This works fine because the last 
assignment is the one remaining after the parsing stage, but not really 
elegant to have duplicate values in a single recipe.

Paul,
For this particular feature, I believe we should focus on bitbake's 
edit_metadata function instead of recipeutils's patch_recipe. In 
general, we should refactor many things on the devtool code, now that 
many stuff is just in a single file (standard.py). This seems to me like 
work for me targeting 2.1 release.

>

