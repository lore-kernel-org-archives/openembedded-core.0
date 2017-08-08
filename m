Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8622771984
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:25:17 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id r199so2467005vke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EOCSyGkn6G2gFzH5hA6vRlMX0Z0GWx+Y7PEJEv7A5DQ=;
	b=Qd1hkgX73GQJ5kaM/ws+5oN8R9eeS3Sn3H7jDU6yGTXZiKRFJpJbktGfRsJLDYl+pz
	S9TRR/K3EbkQOX7USgzSG4Vwsd2jQZ/2tfIm8MhmATsUzSWRdILe65ALVvzFTKHIB+TE
	DYZQ4fbM+XNwA8ILj/bueY3YygLeOQlAMAYUqLr5Wbzidp1S5AM0SInaNg6CZ6twMbHW
	6DX4mt/lDF27r4JOwPr2Bg24JUvDLUGqxNyKTMw014wYV76wFW4sCQhdV+E59zsXENkR
	NGXVXiNlJa4XqxMA6zANbcN1Kmmme8PfspYrjqr+urGlkfDZal60TO5KatHyMgeuzY/Y
	dsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EOCSyGkn6G2gFzH5hA6vRlMX0Z0GWx+Y7PEJEv7A5DQ=;
	b=rW8VRqnsR1DREEOEXfO3CqYqwWezKMjUc58MpaAemsdfm1DV+MrsaT7KkFka20VPw0
	bwtC3eUSqQdtD5Hv56cJvtgBaHG+cPpMn2J3XYbFMG0tNHh7tDNXFr7uHVuuVduGFlig
	u65nFJDkwCDgw9V1xDtQ8aNDpynCLZ5jF7aSIE9JrV3qAnHuSB2Z8gRiItifv2UG92N5
	XBvZjVR0Dz9GpP7Hrcw1Se5Z39E36rLlRMjfvqOLplrhWrTVVU48lQ6WMEja9wsZb2IM
	DKzz0/HPswqdaByQQnwSie039XzhmcdVYGL2d6h2vTifM+eW9FU1m+m4OS9qAdFEMmsW
	dgkg==
X-Gm-Message-State: AHYfb5hZJ7t3RZ0oGunRGYCEZQo7PsvvYXdBHxMAPgdqTzLRJds6vhzl
	uf9vpo6v2mEXjeuU4W8Eq+XIIWMJeQ==
X-Received: by 10.80.218.3 with SMTP id z3mr5247315edj.228.1502213117848; Tue,
	08 Aug 2017 10:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 10:24:47 -0700 (PDT)
In-Reply-To: <3ab5897f-4c1c-841a-9ef5-1335fe2279d0@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
	<CAMKF1so_29Ojxcmmm6u+HmSo3SF55DQHQEXmokdnvy_ca-5sCA@mail.gmail.com>
	<3ab5897f-4c1c-841a-9ef5-1335fe2279d0@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 10:24:47 -0700
Message-ID: <CAMKF1soe7884GzLXL2Mi=_gxT+LKmrYa-ZRh0cYtXQP7Cp=+MQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Tue, 08 Aug 2017 17:25:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 8, 2017 at 10:19 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/08/2017 06:48 PM, Khem Raj wrote:
>>
>> I think such a patch would be good upstream too. There are many
>> packages making distinction between
>> build host and target host and help cross compilation.
>
>
> btrfs-tools does not support this distinction. The host compiler is enforced
> in the patch through an openembedded-specific variable.

yes, however there are packages which define *_FOR_BUILD variables for
such distinctions, this
could do the same and upstream would most likely be happy to get this
improvement.

>
> Alex

