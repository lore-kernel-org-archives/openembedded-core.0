Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8938A744C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 21:59:19 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j7-v6so14104403vkc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UPCc2WMhT7pr0m08cHVMbRNQdWArrLvxNHYXlyvI8n8=;
	b=JqflcrmTOxw/q6pyBMAiG7kKIFfLGLKmYZUhnKteL8OCvPTc6o0gbrDUoqyPZYFkwc
	LvP9rpmRGQezMx8yowrwOWdWpKl5v2RAD+7waz+73TCd87/s7ZIZ1Sr290kdFsvpx+Ct
	hrrSJPeErhJGWDCQmYEqvq+qh8XJPPDQCdPyJZQ4ClYsVRNNHNGYb8UHJLwblKbLm6lS
	m4q2crVaSiB3/B1YbdkTi0iTzKFEYzhdEEaGWTDYD9IOTy2K5qq7BttLyT4JzpDzSEkg
	Ihi7G/7WgebnpKoHz8o8Q+0NvpBY/8hxRpWJ5vKaw/DefWcaxqyAJLcwT04YKsjHptgG
	0eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UPCc2WMhT7pr0m08cHVMbRNQdWArrLvxNHYXlyvI8n8=;
	b=iCY6SFoI1IPNyCinBCh+1bbDmDaYewcvcB+cgUq3HqeiHUzb2Hs/Z/RX9TVPmzoLGy
	mQMnZNdVmPISMnNBx6GCfaL8p26qvtFhv7EMFO9kH3ykiCEn217jOePpDKiCqEJF4kfA
	QleR6AQ8kpSY/+M/Z9SjPdVtRn3rqaI2RK1cAP6EF3S2mo1MAo7C9of0omkBp1pL2chS
	9bn++IFxR9zs9guDlN8/2+wU0WLxt6yyONvFpmPn8AUbkSZi7IIFGkOkPdVffB3gpVSV
	0V0GOA1d3xVS20AcaBjzgiAR2Au3Y/OPhWw9hj66I5qYLjr8Nx6UqPJipRDSBwI844Dy
	Kc3Q==
X-Gm-Message-State: ALKqPwfMPuiVDZ2kkvKwit8+SDlSblSfD/f1mUV+R/TPfu/plpy4KRBG
	Jb4UrPOBy0GPfzfKGaJAl15Zcr4SzDmxGOTTKyg=
X-Google-Smtp-Source: AB8JxZpTtpdzC1UFvcYhntk+Fc5R7HgMVhFDL0pE0FBkE1GULOLDtvtmkmsRoVaVIlGc80HvYZVw3uT6vckrfYDPCu8=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr3001909vkd.154.1527112760040; 
	Wed, 23 May 2018 14:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Wed, 23 May 2018 14:59:19
	-0700 (PDT)
In-Reply-To: <0893459e-7525-8f5c-47d5-b0b8fc749de4@windriver.com>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
	<e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
	<e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
	<CAJ86T=WdrLA322wwwSNhCJ1f=rKsr3pnzE5t1p3Kn2t4wmgP1A@mail.gmail.com>
	<0893459e-7525-8f5c-47d5-b0b8fc749de4@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 May 2018 14:59:19 -0700
Message-ID: <CAJ86T=WF5xQTs4Vj4NROnPq+tdOeEZhAb_L=WyHPo5gJ996Hmw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Wed, 23 May 2018 21:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 23, 2018 at 2:40 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 05/23/2018 05:01 PM, Andre McCurdy wrote:
>>
>> If/when we update the CPU used in the oe-core qemu ARM machine, I vote
>> we continue to just call it "qemuarm".
>
> That would surprise me as a user of qemuarm so my vote is to change the
> name unless there's precedent to support your vote.

I think we've updated the CPU used by qemux86 a few times (and with
kvm doesn't it even change depending on the host?).

