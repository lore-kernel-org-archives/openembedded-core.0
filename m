Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E249165E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 17:37:42 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id m20so3240873qcx.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 10:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K/PA4PlUkOMwY2x9zA1rucKSRJImgelxMmNI5FFaDF4=;
	b=OiyQfCLbtLAwnrxhJ1YUZ8Td4uQPZ222IVz8LnumCIEuwR3gp1oRpIWCNkfjzvpDu0
	CuJ6d9D0VCYK2ZIHH4URUIituiJqOr5rJHJW9KvOHNcN5ktOxTRdg0G0N2heAVE+jp6X
	HVNyV/XxBbXv46BzDKpnKfxj7xi1JP91WRprBmJLfeqy8Vl7PG1ww8X0J43wTtMb/jHb
	QEZiWhg8ezc5BJcyvow0BUK2ZvsTIsz5B/ZqwjIAJhFb6jTmj1eA4R+xbedgoRDs00QH
	dvev1VcNE1z4jkI7QfVHYUhvMgHbHVQ5EnS2yk4q+mqNwlSTkiw7rUNg7MokBwC8BSyt
	APHQ==
X-Gm-Message-State: ALoCoQl78UF2PZzmxgEDJlORPIlzs163K1JX5ZzmMxtTHKfxkFXs08TzG8uZ3/8it0lj3prm8r46
X-Received: by 10.224.126.202 with SMTP id d10mr37402190qas.22.1410802657780; 
	Mon, 15 Sep 2014 10:37:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 10:37:17 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF845CC43BF7@ALA-MBB.corp.ad.wrs.com>
References: <1410555811-30996-1-git-send-email-jslater@windriver.com>
	<CAJTo0Lb7wL2J2T1u3JS6LjuuzB2wTvWbkaSL6OX+VqkB1NEptA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF845CC43BF7@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 18:37:17 +0100
Message-ID: <CAJTo0LaPBoO+bS+pQXymMQkw_NzF1bcBCdnZSihW5fBDJR1V1w@mail.gmail.com>
To: "Slater, Joseph W (Wind River)" <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Mon, 15 Sep 2014 17:37:43 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 18:20, Slater, Joseph W (Wind River)
<joe.slater@windriver.com> wrote:
>> On 12 September 2014 22:03, Joe Slater <jslater@windriver.com> wrote:
>> > +++ b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
>>
>> This patch is missing a signed-off-by and upstream-status.
>
> I am not creating this patch, just modifying it.  The existing patch does
> have an upstream-status.  To avoid this issue, I will fold the change to
> util.h into the new patch and not touch rmb-arm.patch.

You're right, sorry.  Don't worry about changing your patch.

Ross

