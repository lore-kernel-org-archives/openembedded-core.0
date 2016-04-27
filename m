Return-Path: <matt@madison.systems>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 395BB608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 15:19:46 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id j11so60707569lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=5Ni1Q7q4023mRx6VqfGHEJlRY2jGx05IJ/gzri5GR6k=;
	b=nMAprzQznw+o/oGn168DB5qPuFcK+7lYCXaxENjKi/ZL+8WA5HcUrzC62/OPW12hdN
	ay62r7ECi3gL4dF5gLljj9oWU09tlkwXG3Vv+jlkGPUXg69DSN6QywsrKRw59lkMonSD
	TqVjP6rPkAs5Bvd9sx9NU+ClLCAVDCp9ci78pgbIle/8srbkdrLB4AX/aNf1Lh3oXiII
	OnzdUq9ZCIfAlGOG5mx5UAMIa27v8CfCxFZzaAg31o7enptTysLiC8IiY5ld1fKf1AxR
	IhaNke5RZkV6YReySA812NVk0cPIGbqi1RC4AxbqFrLKzzPtX6CJKq0VtDtWFzGG0sEL
	GtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=5Ni1Q7q4023mRx6VqfGHEJlRY2jGx05IJ/gzri5GR6k=;
	b=ViCkoTZs3d/iK2XsppTIDjMIuKYMmAk38/LcyTPBztqrLYJXZAUcxGnOgyz88bqq/9
	1TkLyyY07r92yV0hXVOcUO2yAkg80dDCnMD5Q+cDqLVKmHecoc9k1fLjfIGPDrPk8iSB
	MkbtOXXepp2ARJAPeeS7kd7mct92FvSnvKwtbzzD4GuY3za4m90LBU6QI/SmABqiBjb4
	6vCYh6LRCZwosshkKXx1BJP7w5EGXRptBUHU2BMlHGYGsvBskEIkU3cVCVt5Ubj7hucy
	AENV0hjzeBl930gJqdhGSWoJIW9Y692dp1yPcptGcm9mjbABIeUHEWh8a69KXZ6pGt61
	zFIQ==
X-Gm-Message-State: AOPr4FV2/jm93O5h6ftAJahGmZ8ukE0JsneSJ0+jKy6JrarWqRnXICDJwkMg/IErSQst1P5Hu5IOpQCKjoi1XQ==
MIME-Version: 1.0
X-Received: by 10.112.130.41 with SMTP id ob9mr3822653lbb.81.1461770385966;
	Wed, 27 Apr 2016 08:19:45 -0700 (PDT)
Received: by 10.25.31.131 with HTTP; Wed, 27 Apr 2016 08:19:45 -0700 (PDT)
In-Reply-To: <CAJTo0LawbhSmPT_1DpcMFEMD7q9AMc29EKQMj0AGpn77amRc_w@mail.gmail.com>
References: <1461760323-27285-1-git-send-email-matt@madison.systems>
	<1461760323-27285-2-git-send-email-matt@madison.systems>
	<1461762212.31320.182.camel@linuxfoundation.org>
	<CAGgRHJohN6OXYd8hSSiAChMaCxiaFmu=cXiYP+EK9RV6GMmj8A@mail.gmail.com>
	<CAJTo0LawbhSmPT_1DpcMFEMD7q9AMc29EKQMj0AGpn77amRc_w@mail.gmail.com>
Date: Wed, 27 Apr 2016 08:19:45 -0700
Message-ID: <CAGgRHJo1qMjX_aDxGqP75e+RBoO69iJ4H6MBtRO49kWvnGSKhw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 15:19:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 7:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 27 April 2016 at 15:19, Matt Madison <matt@madison.systems> wrote:
>>
>> There are other variables that can cause this, too - ${DATE} and
>> ${TIME} by themselves, for example, which aren't deleted.
>
>
> If DATE and TIME were removed would the variables you're using stop
> changing?

That would fix some of the issues, but not all of them.  The latest
case I ran into was in building an sdcard image (from
image_types_fsl.bbclass in meta-fsl-arm).  The first command in
IMAGE_CMD_sdcard is:

   if [ -z "${SDCARD_ROOTFS}" ]; then

SDCARD_ROOTFS is defined using ${IMAGE_NAME}, which in turn includes
${DATETIME}.  When I look at the bitbake-dumpsig output for the
do_image_sdcard task, the value of SDCARD_ROOTFS appears between the
quotation marks, rather than the variable reference in the value of
do_image_sdcard.

I've worked around it by moving the check to another function and
changing IMAGE_CMD_sdcard to call that function to do the test.

Thanks,
-Matt

>
> Ross

