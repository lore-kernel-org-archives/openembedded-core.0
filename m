Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A31971483
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:33:28 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id v1so2125243yhn.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=XzBPRWl6Y50vbQMOjJflrEQ0jP0gGrOC9M8zlXZ4jvA=;
	b=JTGagmt4bwMaa5a8ymkSgk9FIucLefTG+Mxy3KFp6qg4ZX8r1aN7KMckHFNNh6OJql
	odzrrikhaV1px9ttPgsQN86rEClNSl4kfYv9DhICNHRvRR6jpU1GND75KoQoaY67zzL5
	4S22nrMjkFvbSXVQnvsJoWAJuomKRkMEHsYxGKzAlSQBQz6iV14eRCj2eCVxrtm/V7LA
	Qpw9Si9xxD/1bQ7AXn+MaiPJ4SFQeQLxHyN0+W0wCBgPNezg+m/UECKNHiSmAPJp0y0C
	eewkZNcmWpPCi4UMG49V6rU0Q2Fqd2IDiYFLLvQAHWNUy8mKf115j51EKxfhl4VIksn/
	buYg==
MIME-Version: 1.0
X-Received: by 10.236.149.134 with SMTP id x6mr463924yhj.149.1410788009560;
	Mon, 15 Sep 2014 06:33:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 15 Sep 2014 06:33:29 -0700 (PDT)
In-Reply-To: <CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
Date: Mon, 15 Sep 2014 10:33:29 -0300
X-Google-Sender-Auth: K19-4tk2nevP8haPMDL6dahE4RA
Message-ID: <CAP9ODKqT2nWtMGrF751s03qKe95WL5V-V+Asr0o9zLFLmQpNEA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 13:33:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 10:33 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sun, Sep 14, 2014 at 6:40 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 14 September 2014 04:34, Denys Dmytriyenko <denis@denix.org> wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> * Update U-boot and corresponding tools to version 2014.07
>>> * Small cleanups with indentation and consolidation of u-boot.inc
>>
>> This missed the feature freeze, so can you justify merging this after
>> the freeze or can it wait until 1.8 opens?
>
> I am using 2014.07 in meta-fsl-arm for a while and I support the merge
> of this for 1.8.

I meant 1.7 here sorry.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

