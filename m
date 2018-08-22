Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0ABE746B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 20:42:45 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j14-v6so1544141vke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ItDmn847XALg+RVXJd3qsI9d2C6tZKi2gye2bkPlKEw=;
	b=drTv14Kpi0RYwX5IuNfVU20uDCJ1GZPn1y/x4dYlXmxyOKjKQKzhfZSoo/Oiqsh8SY
	P4kLPkAwq4FqWuNbUGlYnbC89xmfgXSQLROSuEb1d0PjaiJ/0SyPXYp/xa9nJiGeVcVE
	A2KdE9Q71h7bCSkuoeFmEfnqYmQ030fFxpeJxnLxq8Iua6/JK2JpsnjrRJ6rxHcoJTTK
	JTbfX0kU2E1QC0cLbD8omjSPc5cQiWo3QPe8/165mMBVZA3wnF86CXp4QqlzjK83/kEX
	QcUn6gtIoLuG2imvZlB915lItfwUesih+zfxWvQP+h/Shk7fTEw9aqpdH4bbq9m+oVMk
	Ryzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ItDmn847XALg+RVXJd3qsI9d2C6tZKi2gye2bkPlKEw=;
	b=bAcawPs9dtvk5ZAZPb4L2X+4oFPw1BvOGsy/HKKNmsOPamZS6HbZo1lKEDT0dz0Rnp
	YfAI2nDSnoKZETqMOkju5WUD55YKcu+3pyTqDQNmzRzjhLYA7ileu7eVZEugV1HNld4a
	+D1x7+RNriT+PtoQfok6DLWN5zRmR/eMuOlAoT5RjF70SNI0MvIUDYSuJimqstoewXwa
	BFG1Zgl/7n2X8pQRw1Z/4TRSKF4aR5IoU/QdXTtPtN1RyDlINAAkPydCw0lpnc9/tzAb
	nfwVntdv1efQgNLbDW4/RsjfzvAMI8Z/2qpZHwxlFJIGuq121shLS/vErKo/ViDTNRPR
	LuDQ==
X-Gm-Message-State: APzg51D3+Ja17xKIWHj6k+R/+FVki9XK+pLxsV27iPiagstTG2fgVEa3
	/kYTRFb+SRtMTo3A1IuPMgM8hW+crw4p1/a1ZCI=
X-Google-Smtp-Source: ANB0VdYKst1wjQESaLwisvQMU9EvExReaRSj5R1kRUJVlFOZKyxHMyC+Py8/7x1ck8cEIZzPStYdwh3l+pcdNLXgKHA=
X-Received: by 2002:a1f:ff1d:: with SMTP id p29-v6mr661162vki.22.1534970566674;
	Wed, 22 Aug 2018 13:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 22 Aug 2018 13:42:46 -0700 (PDT)
In-Reply-To: <CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Aug 2018 13:42:46 -0700
Message-ID: <CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 20:42:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.org> wrote:
> On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:
>>
>> Your 1st parameter is wrong, compare again with the example I gave you
>> (don't include "brcm/" path in 1st param, because you want the symlink to
>> point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
>> after cd).
>
> That doesn't work either. I tried it with the same result, but didn't send a
> log of it. That works for you?

Martin's example is correct so maybe check your tests again for typos.
It it still doesn't work then please do send a log.

The link will point to whatever you define via the first parameter, so
if you changed the first parameter it shouldn't be possible to get
"the same result".

  $ mkdir foo
  $ ln -sf test_target foo/test1
  $ ln -sf brcm/test_target foo/test2
  $ ls -l foo

  lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
  lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target

