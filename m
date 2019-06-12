Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1EA07E1B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 01:35:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5C1ZAxG026431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2019 18:35:20 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 18:34:59 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190611200158.GA1858@jama>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <779149c6-f205-2730-7af6-be69819b478f@windriver.com>
Date: Wed, 12 Jun 2019 09:34:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611200158.GA1858@jama>
Subject: Re: meta-openembedded git repo in some of the openembedded-core-contrib branches
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
X-List-Received-Date: Wed, 12 Jun 2019 01:35:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/12/19 4:01 AM, Martin Jansa wrote:
> Hi,
>
> when accidentally checking for some old meta-oe commit in oe-core
> repository I was surprised that it was found in some of the contrib
> branches:

Sorry for the mistake

> ~/openembedded-core $ git branch -a --contains 30bbde3d09e
>    remotes/contrib/hongxu/add-recipes-20190215
>    remotes/contrib/hongxu/dbg-split
>    remotes/contrib/hongxu/misc-fixes
>
> These branches are actually from meta-oe repo, not oe-core.
>
> Please remove old irrelevant branches from -contrib repositories:
> https://git.openembedded.org/openembedded-core-contrib/
> https://git.openembedded.org/meta-openembedded-contrib/
>
> and make sure you're pushing to the right remote :), it unnecessary
> almost doubles the repo size.

I 've already cleaned them up on openembedded-core

//Hongxu

> Cheers,



