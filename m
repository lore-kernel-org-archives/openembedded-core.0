Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF806FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:05:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBT25JwV000823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Dec 2016 18:05:19 -0800
Received: from [128.224.163.136] (128.224.163.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 28 Dec 2016 18:05:18 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1482820791.git.zhe.he@windriver.com>
	<1fad67ac-8ae2-e242-9830-e89311f14b12@linux.intel.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <afdc76ed-6600-6292-c927-89e240a0e325@windriver.com>
Date: Thu, 29 Dec 2016 10:05:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1fad67ac-8ae2-e242-9830-e89311f14b12@linux.intel.com>
X-Originating-IP: [128.224.163.136]
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH v2 0/1] kexec-tools: Upgrade to 2.0.14
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
X-List-Received-Date: Thu, 29 Dec 2016 02:05:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 12/28/2016 08:15 PM, Alexander Kanavin wrote:
> On 12/27/2016 08:43 AM, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> Remove kexec-aarch64.patch since it has been merged upstream
>> Remove kexec-x32.patch since it has been reverted upstream
>> Backport patches for kdump arm64 from:
>> https://git.linaro.org/people/takahiro.akashi/kexec-tools.git
>>
>> v1 to v2: Remove redundant tarball link in SRC_URI
>
> None of my comments are addressed in this new version of the patch. Specifically:
>
> > Remove kexec-aarch64.patch since it has been merged upstream
> > Remove kexec-x32.patch since it has been reverted upstream
>
> You should also remove the actual files, not just drop them from the recipe.
>
> > Backport patches for kdump arm64 from:
> > https://git.linaro.org/people/takahiro.akashi/kexec-tools.git
>
> If the patches are coming from a different repository, they are not a backport. Change the upstream-status to 'pending' please, or 'submitted (link)' if they have been submitted upstream.
>
> >  meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  37 ----
> >  meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  44 +++++
>
> Please use git's rename detection when submitting patches, so we can see what is the difference between the two files.
>

Thank you for your careful review. Sorry for missing your comments for v1 since I just filter mails specifically sent to me...
I'll send v3 soon.

Thanks,
Zhe

>
> Alex
>
>


