Return-Path: <net147@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id BFDBD60290
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 11:51:41 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 188so13623827iti.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lCT+gwPFVZ6KCqHELveOlB1/pGWrKxjE0YDWnmkR9ws=;
	b=RHbyyRVEXuJeNaa1mlAF0NgcG/SMHBmxdvz7wz1awnR1gHTx4f6H5X+fqwUL03finb
	l3mu5P8eAU2aKoCdNhaE+BPnEeoP2dQt/CkbGZP326KydsFjZ9c6XjyFI2oduE+0BKEm
	oljwlvWK/Wqu2JKFUGi6kR/lNqJrFR/qHf19I1JDVwvqNj5gA5caTQGD92xvYGPptBng
	s5EEcLXGTdIGrq1otTAylD/hOO1dSaks04GJVwDf9nu4S1nCcWlw7gza/M7Vao9hPNeE
	wUx1fuZIDRaPp5vA4BcUvGCD4GBn9y38OKwyJuB4EiSFw4p/UILfvlcSNa76TA+XyUKl
	3UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lCT+gwPFVZ6KCqHELveOlB1/pGWrKxjE0YDWnmkR9ws=;
	b=ekAATfE02mA7RShSrSbrDZCEHPt6ZWWgNTLHl6Cr4CG7DYVrVBmxL4ZqU6PCORQRQo
	ElSZnpks2PmEMKRhhSF1LsC+d1KL0nipULFosDb+GLv1MjLnmxRX1UziCsEAPC8rdlFr
	aem1fue9fdztIy/sQVWCc2QVq32kS+nh21kDEi7dsh/vrceVB9w8Wuf1CbI5US+GGzz4
	ksnPLUWhBP6cWoPZ+JFQGrdoyAWphzIzr7F2BzvwGwTM2LJW9csKyl7E6JiXgD8JuS8N
	NYYj2QLXSVS163NtEQTYcw6c65gyGEeGjmnP+fm21qcsmC45en6O9LDZgMW87zbnw7PT
	y8Aw==
X-Gm-Message-State: AA6/9Rke4K+VOt7pDE+yofPwrFBGdr+T2bS1rXR8EGuyx/vxv+wDXUx6jOufEI5Kv1lC+vcHzAzC8wM7UCvUag==
X-Received: by 10.36.220.193 with SMTP id q184mr13310154itg.17.1475409102328; 
	Sun, 02 Oct 2016 04:51:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Sun, 2 Oct 2016 04:51:41 -0700 (PDT)
In-Reply-To: <4dd9e59c-8ba5-29a3-5128-05c0cba9fcde@mlbassoc.com>
References: <4dd9e59c-8ba5-29a3-5128-05c0cba9fcde@mlbassoc.com>
From: Jonathan Liu <net147@gmail.com>
Date: Sun, 2 Oct 2016 22:51:41 +1100
Message-ID: <CANwerB39TPL571sPZb-bVxLFNUn2CfO8bUVQg51PpXQv61S-Zg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Taskhash mismatch?
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
X-List-Received-Date: Sun, 02 Oct 2016 11:51:44 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2016 at 18:28, Gary Thomas <gary@mlbassoc.com> wrote:
> Can someone explain this error?
>
> ERROR: video-demo-image-1.0-r0 do_image_rpi_sdimg: Taskhash mismatch
> 7b8eab500890bd7cd6a00b70740800f1 versus 9471c988c4adee881554263bd10f7196 for
> /local/poky-cutting-edge/meta-rpi/packages/images/video-demo-image.bb.do_image_rpi_sdimg
> ERROR: Taskhash mismatch 7b8eab500890bd7cd6a00b70740800f1 versus
> 9471c988c4adee881554263bd10f7196 for
> /local/poky-cutting-edge/meta-rpi/packages/images/video-demo-image.bb.do_image_rpi_sdimg
>
> I'm building with Poky/Yocto + meta-raspberrypi:
> meta              = "master:725e66e1d08ae000d8f68455ddca0e192080dc1f"
> meta-raspberrypi  = "master:4817e2c087097c02755d6309304878e42cf61d3c"
>
> As far as I can tell, the image was created even though the error.
>
> Thanks for any pointers
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

It happens to me sometimes as well in meta-raspberrypi layer.
Interesting thing is that it doesn't happen in the meta-sunxi layer
for me which has a very similar image class, although without the
device-tree auto-detection and splitting code.

I haven't been able to explain it.

Regards,
Jonathan

