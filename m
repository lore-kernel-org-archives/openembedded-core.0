Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D21160123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:20:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id n19so31479685vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8dnR+hbPg5MhkYV0AadYFJqS7W5C7iwZA5/TynmwYNs=;
	b=V14BoQ1qOfgQk/lB8xE5UFepFA3wBHpGlvsPvSQw0BOqt7KPsnDXQhbi+HO1oIBohv
	qS2J15coAIkxYZvAREMCTfPGoYEbg/yVv11gq7kvTBZYHJbw4jONrg8T60Q22K0ELrG3
	iKyCrYaVbTJNmC7x/dCSFC2lySeIzckWzdCcCeT9sCP5li3mNdOoqw09aBdEewbn2rSN
	gTJ5VEepLpuWe0kXKLcY+Zj/E/kjE4CqQ9+Zp7XwDtao1iiMoo+Cs59PBkiYzVmksVMn
	vhHQUKs3uyiXQF6E9kW+4+cDgiY90TGz9czcVeLOmDPkRyaQK+5gKLD/xXstd1T5DtNv
	rFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8dnR+hbPg5MhkYV0AadYFJqS7W5C7iwZA5/TynmwYNs=;
	b=AbXvgkYbsQVtVno5GR5StI7W6CU6jywI0qkdZwxYWDB81BMne1805uq8j67xrNF1Er
	TIOq3wgeyd/TclixXp1K580mO8Wvo0G6JWNsSghHaYTeOMSJWSW+WkTzWHUTkNrZXtwu
	3T21lNYYLsAaWHZPQl8/nQKiK+DfhUQdII820L5HW9dyvUAe2gHkkm0TbCYmsYEMHqYB
	mT9384wNGS2w6PBhlycAu2n+ZSK/Hm2U51Xauu7v9gd3HKkJygHXzm2uN81cREkjcmn5
	ntWmbnjq8z5bCDLEDuR0/nHXAxn9TEHcS06W6yLgNWNlEQ5U6OJ6kZy6V9OP1XDdyO3k
	TJ5g==
X-Gm-Message-State: AIkVDXJwHiOS+e8b1m1u/dv8rBP8GYqiWsSEpgknmU8xoHemW5gTN/p6AmJ6YFi8A1hofvBM6pAfReplx6WdMA==
X-Received: by 10.31.41.73 with SMTP id p70mr1073257vkp.68.1485951605648; Wed,
	01 Feb 2017 04:20:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Wed, 1 Feb 2017 04:20:05 -0800 (PST)
In-Reply-To: <CALbNGRQwaEuhq_VnzbidYMWXO0BK2wTPNunOGbXSfqm=3nhQqw@mail.gmail.com>
References: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
	<CAHiDW_ESMwJK3xaE3sBUYXuhioBa51=QQ+aXudmFM0bSZ_ewuQ@mail.gmail.com>
	<CALbNGRQwaEuhq_VnzbidYMWXO0BK2wTPNunOGbXSfqm=3nhQqw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 1 Feb 2017 13:20:05 +0100
Message-ID: <CALbNGRRpBux0WkL0UWnRUPfBRAK_97TQzyU+RAWg9TxtW3fmmg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 12:20:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2017 at 12:47 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 1, 2017 at 12:38 PM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> On 1 February 2017 at 03:22, Tom Hochstein <tom.hochstein@nxp.com> wrote=
:
>>>
>>> Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure o=
f
>>> useSIGIO option:
>>>
>>> xfree86 SIGIO support is reworked to use internal versions of
>>> OsBlockSIGIO and OsReleaseSIGIO
>>>
>>> The check for useSIGIO is no longer needed.
>>
>>
>> Can you explain what the crash is or how to reproduce, I can't figure it=
 out
>> from the patch. Link to possible upstream ML discussion is fine as well.
>>
>> Thanks,
>>   Jussi
>>
> While we are at it: This patch conflicts whit the patch fixing
> xserver@beaglebone-black [1-2].
>
> What do people think of the patch - would it make sense to rebase this
> one against it?
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2017-Januar=
y/131843.html
> [2] https://patchwork.openembedded.org/patch/136497/
>
FWIW: Just tested: I can conform that this patch fixes xserver on imx6
(vivante accelerated).

Andreas

