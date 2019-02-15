Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1CB7C707
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:26:30 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id m1so16474319otf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l/mkp++hffOgzjcCVlHoPXMUDUB1jAeBDQlJ+wpjQZY=;
	b=LyFv+mDauCckmAQUylk7PSWOTKNiPA5JQWY+5n9vrhd+RMAHBAV10WarOeOoboqeC1
	pT9FsucKzUdZ+8Gcxc83C/tCzVno459ZEopM8PnEWbRmCSFePuTmFXk/uSdyTZ+aNUfN
	mrjbrGPMCAENHku3/iqhQ02Ijk1TtKYmGzJE0QhT+OJUBZnbJNL/C0vwYjfpAOKa2kCg
	Bdiml+zorWanUVUF7AM31DfCmOycVFF9wnRkpT7SSGgXh92bEXKP/aClv6/k1+0EE2Cj
	QAycbx3/P4eDCpi0ZXDAeDoUg2eKJspkN7XQ4aEjnJeAowoMoKNofbceOQkpGyMjZujp
	PVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l/mkp++hffOgzjcCVlHoPXMUDUB1jAeBDQlJ+wpjQZY=;
	b=Hf035EDCVowlNO73FElmPIHfk8KxEcKz9edtIZkfSf0JTzD42lGXlnEJ+Rx4K0dxtI
	a7TxxdB4ns+9l0qeHAcdSBHH//QbDkB6L1oBlevnDqUh/MQ1FdsJ/4dTWtnkH18lPAKV
	5hcjSYxkZ1CAvMBNCy3wyC8KrhvOjGpVKmH76O57OB/d5sM4nmTDrOx+AgQUG8z1URii
	b/NOGg+Yh7lXIS8FT6uv1X92ZcvnNEHSt9v1p0DqhYWM14D09YrhiLXpXUjbQQa/u4xx
	etuRblL30ofrC1oxzbTloa2wBT3AeQOiIBtxsouxbWKLHFQ3sAzeypf1i5BQNaFbdXLG
	4vzw==
X-Gm-Message-State: AHQUAuY3bcIJvz/el3a+q0BfR6K7dG1Hk6RqmH/1ohTNUGFjzkDtEpTL
	7I2Cqxxa/l4tUvVUsg8qTykxTrOYJySnQQYDcy8=
X-Google-Smtp-Source: AHgI3Iai/Viggm+aZkFE99l2gIt1NqPLMwiVuQDONsrNVRx5GdDpbp7Hl0kLgjdHYEUyB4LRRenSwIhlyuck82ToYSU=
X-Received: by 2002:aca:c3cb:: with SMTP id t194mr5482231oif.70.1550237191591; 
	Fri, 15 Feb 2019 05:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
In-Reply-To: <CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 14:26:19 +0100
Message-ID: <CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:26:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 14:21, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> In my opinion, there is no relation with an update and change build
> system, once we can use mesa 18.3.3 without meson.

Please see:
https://www.phoronix.com/scan.php?page=news_item&px=Mesa-19.0-Deprecates-Autotools

We might as well switch to meson now. The patches are ready and
(mostly) working.

Alex

