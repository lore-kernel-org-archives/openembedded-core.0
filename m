Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3DC76D1FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 01:40:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9O1ewQb019919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Oct 2013 18:40:58 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 23 Oct 2013 18:40:57 -0700
Message-ID: <52687AAB.4050904@windriver.com>
Date: Thu, 24 Oct 2013 09:40:59 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1382512567.git.kai.kang@windriver.com>
	<5267A51F.6050906@linux.intel.com>
In-Reply-To: <5267A51F.6050906@linux.intel.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Migrate lua from meta-oe
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
X-List-Received-Date: Thu, 24 Oct 2013 01:40:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年10月23日 18:29, Saul Wold wrote:
> On 10/23/2013 12:18 AM, Kai Kang wrote:
>> The following changes since commit 
>> ffb440c37c3491fa5d9a1408341f7c15eacdc9ce:
>>
>> midori: exclude from self-hosted for mips64 (2013-10-23 07:18:54 +0100)
>>
>> are available in the git repository at:
>>
>> git://git.pokylinux.org/poky-contrib kangkai/lua
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lua
>>
>> Kai Kang (1):
>> lua: add lua recipe
>>
> Why?
>
> You talk about the migration, but git no indication of why this should 
> be moved into OE-Core, this was discussed recently (Late July, Early 
> August) when Randy MacLeod proposed it and it was rejected then.

I searched the maillist, and found nothing about lua. So I sent the recipe.
Sorry for the noise.

Kai
>
> Sau!
>
>> meta/recipes-devtools/lua/lua/lua.pc | 11 +++++
>> meta/recipes-devtools/lua/lua/uclibc-pthread.patch | 13 ++++++
>> meta/recipes-devtools/lua/lua_5.2.2.bb | 49 ++++++++++++++++++++++
>> 3 files changed, 73 insertions(+)
>> create mode 100644 meta/recipes-devtools/lua/lua/lua.pc
>> create mode 100644 meta/recipes-devtools/lua/lua/uclibc-pthread.patch
>> create mode 100644 meta/recipes-devtools/lua/lua_5.2.2.bb
>>
>
>


-- 
Regards,
Neil | Kai Kang


