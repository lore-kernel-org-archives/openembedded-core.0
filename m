Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E13A06D99C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:27:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD2R3XE027070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Nov 2013 18:27:03 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 18:27:03 -0800
Message-ID: <5282E376.5060109@windriver.com>
Date: Tue, 12 Nov 2013 20:27:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1384305535.git.mark.hatle@windriver.com>	<c9dd76ae9feb0069409763f3f65ae4ff2ef10634.1384305535.git.mark.hatle@windriver.com>
	<CAP9ODKpK=eqk_UCR+RQB0N4u+qv8iGTit5S2iHCeu2LJgjhrUQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpK=eqk_UCR+RQB0N4u+qv8iGTit5S2iHCeu2LJgjhrUQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] gcc: Use alternatives for the *-symlinks packages.
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
X-List-Received-Date: Wed, 13 Nov 2013 02:27:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/13, 8:24 PM, Otavio Salvador wrote:
> On Tue, Nov 12, 2013 at 11:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> The various gcc related symlinks should be provided as alternatives instead
>> of hard coded symlinks.  This will permit multiple toolchains on a system.
>>
>> Multiple toolchains could come from multilib configurations or alternative
>> open source or commerical sources.
>>
>> Note, gccbug was skipped since it doesn't seem to be generated anymore.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> Wouldn't be better to squash patches 1 and 2 so it makes a real 'logic
> change'? You add code to remove in patch 2, I think the end patch
> would be easier to review, no?
>

It was done this way to match how binutils was implemented.  These are actually 
two logically separate patches.  The first switches from hard coded symlinks to 
using update-alternatives.  The second patch says that a separate -symlinks 
package is no longer needed.

See binutils:

1395aefcaeac94dd0e6ed3a718b7e58dd43b355e
24093e26f246f222c385dc37a2f8cf8b0f183175

(The second of the patches can be reverted -- if ever needed -- and the update 
alternatives functionality will still work properly.)

--Mark

