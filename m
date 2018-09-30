Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B21086025F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 01:30:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8U1TPCr007156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 18:29:35 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 18:29:14 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alexander.kanavin@intel.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<0b27127115cad5c47512fe6384898234a9bf53db.1538199671.git.kai.kang@windriver.com>
	<16cf316e0447025d4df7b76653b408350f236ced.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <96996649-d973-4f3f-b608-b1161fb803f2@windriver.com>
Date: Sun, 30 Sep 2018 09:26:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <16cf316e0447025d4df7b76653b408350f236ced.camel@linuxfoundation.org>
Subject: Re: [PATCH 10/10] vala: update vapigen-wrapper
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
X-List-Received-Date: Sun, 30 Sep 2018 01:30:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月29日 20:33, Richard Purdie wrote:
> On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> gobject-introspection has changed installation paths of .gir files.
> gobject-introspection has not changed. *We* have changed it.
>
> This is basically why I really don't want to start messing with
> upstream code like this as I'm guessing this will be the first of many
> such problems.
>
> Has anyone discussed the gobject-introspection gir path issue with
> upstream? If data is arch specific, it shouldn't be going into datadir
> but into libexec iirc. I'd like to understand the upstream response
> before we start hacking around this in OE in a way which will generate
> a ton of patches and incompatibility.

I have sent the patch to 
https://gitlab.gnome.org/GNOME/gobject-introspection/merge_requests/63. 
It seems
no objection but can't build pass for VS2017, so not merged yet.

--Kai


>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


