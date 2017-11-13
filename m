Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECD36782DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:55:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vADBtBm2016192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Nov 2017 03:55:11 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 03:55:11 -0800
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
Date: Mon, 13 Nov 2017 19:54:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510563249.4049.33.camel@andred.net>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Mon, 13 Nov 2017 11:55:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/13/2017 04:54 PM, André Draszik wrote:
> Hi,
> 
> On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
>> autoconf-archive is a set of common m4 macros, it should be allarch,
>> just like it is on other distros.
> 
> I have found previously that when changing a recipe to produce more generic
> output, like in this case, and the old binary package is still in deploy/,
> then the package manager would always pick the more specific version, even
> if a more recent (by package version) exists in deploy. In my case I was
> moving from PACKAGE_ARCH=${MACHINE_ARCH} to PACKAGE_ARCH=${TUNE_PKGARCH},
> but I guess it'll be the same here.

I think that it is because of the priority MACHINE_ARCH > TUNE_PKGARCH > allarch,
which is the right behavior.

> 
> What is the correct way to deal with that other that cleansstate?

There is no way to fix it except cleansstate AFAIK.

// Robert

> 
> Cheers,
> Andre'
> 

