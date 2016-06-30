Return-Path: <jefro.net@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id D0C9B60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 22:50:05 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id c2so130907212vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=WMSIv+4g+123UOj8ZILR18Ttwt9oGgN/mrCaxfnzJUw=;
	b=tx0mIv+meKgL1s9gfCyMctgxWFzhMcEcfdtofzjeDYRyH5tPlmLCz/HAm4oDBXM8hP
	bsoQjgRl0U6JwjG8vU/0Ad6CGj4DJBQ/fPJ2ZQ4KURC6uRq92uTM+DeCmb4prBpXCwWk
	vjwZ1wqRx7cG+AIQbZnkuZbij1u/wg3mdd9qgHSGQkDpy8Rkn2spQDF4w2i+Bb7dI4bo
	FUC8qxOWSKMQlNa9Ew654sZZSSyzfU6/6Wql/g9TqOsAp+pkBfc9Cmbf2Q9GOVi3I+Xt
	cArP6CXZ5yGSueTTzSBxWFxCH/epS9LNr6OyNsmV7N0uoiXf1YJCCzImk+MJyZZ6ZfZM
	nJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=WMSIv+4g+123UOj8ZILR18Ttwt9oGgN/mrCaxfnzJUw=;
	b=hRvaI2jHD+2VecyEkHt/6P/m1arNeFFJq/M3a3pWi07piYTkInYHZqrfBKjQ0alFo1
	LsS1ObU7P3WLBZ5rOjYLgQLMDNspr/Pk4wRGz+/F3aNt2+LwF5XAZ05JlkMNuAPuGlv1
	qTct3CUqncBQN42O0+F+h4bvpa1btg5kjCV8VzLJ+Vh5Y7qiA42WQDByshbc9ZaaBlP/
	qMZQ0RHDqJLc/SwHtIXtXirts8iwO1C2CvcMFd5ZML9tAhgO79M2mvjJd38xHJ0xRr9U
	j9lK94MY82eSgjHHKoQpJiOi9qyp7+16GbBoe1vGbctmekJJ77TpVO47q1eQeJVbZ9b2
	n+OQ==
X-Gm-Message-State: ALyK8tKIJkbAkEweuDp4EYQf+WhJUt7xzBvmKHU2GZsnCJw8Hv56Ci/t4TF5kMkMrqG0Yg7JSIJaIa8Blgb0OA==
X-Received: by 10.159.37.66 with SMTP id 60mr6799421uaz.56.1467327005788; Thu,
	30 Jun 2016 15:50:05 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.103.68.65 with HTTP; Thu, 30 Jun 2016 15:49:46 -0700 (PDT)
In-Reply-To: <09856974BCEE6F48AB378E52E4CAA73C230FDAAF@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
References: <09856974BCEE6F48AB378E52E4CAA73C230FDAAF@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Thu, 30 Jun 2016 15:49:46 -0700
X-Google-Sender-Auth: LmF_wFTHimfAKPjuYdLa_D0Nsjk
Message-ID: <CA+YB3rYjiB4A1XgUjwiVB5y1y136WofFuJFx5cHPUD1G_oNFVw@mail.gmail.com>
To: Praveenreddy Padamati <praveenreddy.p@hcl.com>
Cc: Phani Kara <phani.k@hcl.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reg: Yocto installation problem
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
X-List-Received-Date: Thu, 30 Jun 2016 22:50:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi Praveen - make sure you follow the guidelines in the Quick Start
Guide for which packages need to be installed in Ubuntu before running
bitbake.

http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.html

In general, you'll

(1) install the required packages
(2) clone poky from the git repository
(3) check out the current release
(4) run the environment script
(5) then run bitbake

The Quick Start Guide goes over all these steps in detail.

You might also get responses more specific to the Yocto Project by
posting on the yocto mailing list, rather than OE. You can join the
yocto list here:

https://lists.yoctoproject.org/listinfo/yocto

hope this helps


On Wed, Jun 29, 2016 at 9:56 PM, Praveenreddy Padamati
<praveenreddy.p@hcl.com> wrote:
> Hi all,
>
> I am installing the yocto in ubuntu version 14. Installtion is aborted
> intermediately. It comes out with the error
>
> "ERROR: Task 984
> (/home/kumarn/imx6_build/fsl-release-bsp/sources/poky/meta/recipes-devtools/perl/perl-native_5.22.0.bb,
> do_configure) failed with exit code '1'".
>
> Please find the log file in the attachment.
>
> Thanks
> Praveen Reddy P
> 9989642159
>
>
>
> ::DISCLAIMER::
> ----------------------------------------------------------------------------------------------------------------------------------------------------
>
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only.
> E-mail transmission is not guaranteed to be secure or error-free as
> information could be intercepted, corrupted,
> lost, destroyed, arrive late or incomplete, or may contain viruses in
> transmission. The e mail and its contents
> (with or without referred errors) shall therefore not attach any liability
> on the originator or HCL or its affiliates.
> Views or opinions, if any, presented in this email are solely those of the
> author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification,
> distribution and / or publication of this message without the prior written
> consent of authorized representative of
> HCL is strictly prohibited. If you have received this email in error please
> delete it and notify the sender immediately.
> Before opening any email and/or attachments, please check them for viruses
> and other defects.
>
> ----------------------------------------------------------------------------------------------------------------------------------------------------
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

