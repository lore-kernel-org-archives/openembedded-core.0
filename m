Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD767FB63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 12:47:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9TClokB016599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 05:47:50 -0700
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 29 Oct 2019 05:47:49 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191019155242.100169-1-trevor.gamblin@windriver.com>
	<e678117f-93e0-c3d8-0561-49b6b048f713@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <774e31bc-61e0-9813-261c-0ec7038192b0@windriver.com>
Date: Tue, 29 Oct 2019 08:47:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e678117f-93e0-c3d8-0561-49b6b048f713@intel.com>
Subject: Re: [PATCH] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Tue, 29 Oct 2019 12:47:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/28/19 7:29 PM, Ross Burton wrote:

> On 19/10/2019 16:52, Trevor Gamblin wrote:
>> Note that the patch 
>> 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
>> was removed as its intent was to provide a pkg-config option, but
>> libgcrypt upstream added one in commit 813b002eaf.
>
> I think we need to retain portions of that patch:
>
> | checking for libgcrypt-config... 
> /data/poky-tmp/master/work/corei7-64-poky-linux/gcr/3.34.0-r0/recipe-sysroot/usr/bin/crossscripts/libgcrypt-config
> | checking for LIBGCRYPT - version >= 1.4.5... ERROR: 
> /usr/bin/libgcrypt-config should not be used, use an alternative such 
> as pkg-config
> | ../gcr-3.34.0/configure: line 14093: test: 
> --should-not-have-used-/usr/bin/libgcrypt-config: integer expression 
> expected
> | ../gcr-3.34.0/configure: line 14096: test: 
> --should-not-have-used-/usr/bin/libgcrypt-config: integer expression 
> expected
>
> Whilst it's great that libgcrypt is shipping a pc file, we need to 
> retain the porting of the macro files to use that pc file.
>
> Ross
>
Testing a v2 now. Will cc you on the update.

