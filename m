Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id C5A4F78D86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:53:17 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id s6-v6so2529230vks.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 19:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NUm/bl1yYNPtIG485RYrJaf0Yvmz/tNvHTCMsHWK37o=;
	b=YJvqwkEvFxQKtEGA9KwHoiKJyV2YrPSjEdNoLZyrYbb1VVBsvClehsl5S6jNPBy7iU
	7j+ozJSGTzS2nrU1TBUtHe89npo8JiSr8lb6SHJWEg2eILDECs522/WeV4fBJaHPVRz5
	wxe7swxpu3H2T7svcdggzI6y0a0DTbA3xyERoQRDIOWf00PazjoAS2AjLvc7uYP5xNW+
	/tCFDKTC6AQve9HGagky8F7oTBxBs+eH23xeCmZpuuepiVWjRjkiEWTe0iKJDtuGNgJq
	tlWJR6H1vsFl/dTlxnHT0q5LZlCC79YOsG7jMW+GLhg0+g4p78cBPcB+/cgcabbvY9rG
	X3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NUm/bl1yYNPtIG485RYrJaf0Yvmz/tNvHTCMsHWK37o=;
	b=DwXAv+lQADyThLPlM4zpzxtuE6qkYO2/P0sTc2nDqlnWz60MU+xLLRZUTWDgnD0Y7I
	Uycw6UhiZZz7py7YxSEUuQXAQf3HeAhv1KCv1QAjSY+bVyFfAWe9/vY+LERBEJr58iS/
	eYiHzA089deV8/VEU9SiCKEbz/alL7qfes7OATzXQQeZNVKuLL04SfFTn/cuydJa3ApP
	xqAFH4Mt95zNTBXZz8rc94j6nTay+KOGNxz+jAUfpU2cFiw23oMfpng3JhIJ4loPKfL4
	Q6QEjvKcwnkjeK6OWK067guc3LY7l72ciUfk1I449nNT4P8L5jtjnL4B75CKhS9gplhq
	FwEQ==
X-Gm-Message-State: AOUpUlGvYRkEK6v2d3BHoqS74Lw9C+WrbY6VQ7eVFTRhC07LMWT2k8Ra
	TyD2OLoqlxmuF3bglAlEqbNPJUivZHVKh2np9HY=
X-Google-Smtp-Source: AA+uWPyZOOsSxdppTJSK60WbThj9/Gs2VW7ClngETRl1TodotUyBGPGVKukl5r8zi14HdY4iUqS9jknVQhOXOzg4Edk=
X-Received: by 2002:a1f:d844:: with SMTP id
	p65-v6mr41631120vkg.54.1535079198604; 
	Thu, 23 Aug 2018 19:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a:0:0:0:0:0 with HTTP;
	Thu, 23 Aug 2018 19:53:17 -0700 (PDT)
In-Reply-To: <CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Aug 2018 19:53:17 -0700
Message-ID: <CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Fri, 24 Aug 2018 02:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
> So now the ln issue is resolved, I'm not convinced my MACHINEOVERRIDES is
> the correct approach. Does anyone have any feedback on how I can improve
> that?

If you want to make a configurable symlink then perhaps the more usual
approach would be to just use a variable in the linux-firmware recipe
to weakly define a default target for the symlink. Machine config
files could then either do nothing (ie use the default) or provide
their own value. For example, in the linux-firmware recipe:

  BCM43430_NVRAM_SYMLINK ?= "brcmfmac43430-sdio.AP6212.txt"

  FILES_${PN}-bcm43430-nvram = " \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt \
  "

  do_install() {
    ...
    ln -sf ${BCM43430_NVRAM_SYMLINK}
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
  }

And then in the machine config files of machines which need the MUR1DX
firmware instead of the default, add:

  BCM43430_NVRAM_SYMLINK = "brcmfmac43430-sdio.MUR1DX.txt"

However... note that currently the linux-firmware recipe is
architecture independent (ie it won't be rebuilt if the target is
changed). Adding a machine specific symlink is going to cause problems
with that, so the above is still not a full solution.

