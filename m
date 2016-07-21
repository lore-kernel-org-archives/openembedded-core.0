Return-Path: <niqingliang2003@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5758E6FFDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 02:53:03 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id r135so5780270vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YQibTbq2DbpdqioKbnkXa6AFHvmnX2CtvPpud/XIIpI=;
	b=HEvEUlgF5JrKKUgraXaQQl05dhpfNejL9wk97iL+DjTvzNEY3cWcs97OwaUOd6ad1z
	kBkcR/UIA/RZciHd77oimMQEDKITOhXpSwlQPF71X7o1ReFNx/beLmtb1Oqoxflox0UM
	AY/81DS07Y8dHgcQ4pTkW4kiokBnYuhS6kxaJEPUGG3UBAy1Ae0t6JGgahPkGv40+Jsa
	EvsOFUR2uq5yRVZYNnqzqWjpQWJBO6XrUHtZpEWLMUcXl7D44YeHNpFW3bIJtTKLfmsP
	7cm192Zr74wSrPdZVgtwBM+lJSpB1sPcOXrF5XMpgSJ0dnmQvhG0KXjp0B+mF2daOgYr
	1xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YQibTbq2DbpdqioKbnkXa6AFHvmnX2CtvPpud/XIIpI=;
	b=SIgiHY5le7I/hDZZeuVqet2bWOw1W/1rh3ZADmZmdZ6EzzLD7nsI2MsUB+eC/jlglh
	P2uRjkjkNNNb177q2wXdpRJCAWYlfBk0yA/p9Gx0wsp8DpD+hp8qf+YM7UilL044ueYQ
	0R9Kc7jI3bm6W1decRWeOvHcPTughh8LSNKYh/7iIiX556oIFpROxoWVHoknfgC88eWi
	se+O9b88H0KdZiImtvZgA28NxjnnuBteRAPdycCCLFpyU058M6oa0wvVtfl2NMKG+r8w
	RIR2rUFPNtLdexjCxTqGNuy4YDC2FCMapZDIRVldj1jKOgRFHMGCuAldgQy38/h+Jtmw
	wxBw==
X-Gm-Message-State: ALyK8tL+DinlmAI0Nx8wbAQnk+cn394A6MrvkLCGpGAjfN23hqEvi0UzsiUrP0H95k+qRMziX7bHC6nLiKPjYQ==
X-Received: by 10.31.6.74 with SMTP id 71mr24957296vkg.33.1469069584365; Wed,
	20 Jul 2016 19:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.13.199 with HTTP; Wed, 20 Jul 2016 19:53:03 -0700 (PDT)
In-Reply-To: <CAMKF1sqZqH8n9S77XQucTFVTVjtyMeGEa-rvvBTvhV_SzDV+GA@mail.gmail.com>
References: <CADwFkYf23qz0t+gH4r80r3tstXkkQ_2hDDa0cKjZf7CGa62Pyw@mail.gmail.com>
	<CAMKF1sqZqH8n9S77XQucTFVTVjtyMeGEa-rvvBTvhV_SzDV+GA@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
Date: Thu, 21 Jul 2016 02:53:03 +0000
Message-ID: <CADwFkYf_sZPGCN53hxREP_xCH5zWgfxJq1oDkOzfontJ+4-fFg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [BUG] gcc: require neon on arch without neon
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
X-List-Received-Date: Thu, 21 Jul 2016 02:53:04 -0000
Content-Type: text/plain; charset=UTF-8

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9991

On Tue, Jul 19, 2016 at 3:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Thanks. You can open a yp bugzilla to track it or even better send this
> patch backported
>
>
> On Jul 18, 2016 11:53 PM, "Yi Qingliang" <niqingliang2003@gmail.com> wrote:
>>
>> when compiling qtbase in meta-qt5, it says:
>> | ../../include/QtCore/../../../git/src/corelib/global/qendian.h:143:36:
>> fatal error: You must enable NEON instructions (e.g.
>> -mfloat-abi=softfp -mfpu=neon) to use these intrinsics.
>> |      return __builtin_bswap16(source);
>> |                                     ^
>>
>>
>> bug description:
>>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71056
>> upstream patch:
>>       https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=236910
>> mirror on github:
>>
>> https://github.com/gcc-mirror/gcc/commit/84d2a5509892b65ed60d39e6e2f9719e3762e40e
>>
>> Yi Qingliang
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

