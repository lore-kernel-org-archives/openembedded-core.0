Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id F09BC60722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 17:06:01 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id r5-v6so4093399ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c+xjLDB9E6Aizzz8nubzqkBd5KoZ+B2Je8b0F1sDtC8=;
	b=Qo+llXFc0y9cpzNNO9T1pglMSvlrzSpuA+G61qeQR50gZkP1lHNM2rpZEX2YNF/vXf
	3yxAC+dUPnYh0EbD0zW+K52aipEiPwQgMMbla4jDv87fqT38KNu7ipNn/sa6eXTXDn+/
	YMd93rCB0ictAOYVgCnSXBVRLHI4nkJ9as4o3j2KtNN0Bewcsn5Y11R6VPh+JRxjzDR8
	Gze1U0HUhfPf4qX0jpMnwkywG1FTcFvWr2uIjkkkDHlJYKP5R7FjPddUD2yKSidTfSc8
	aocI4j8mH2aD8WpgYIY4VMe1Pl7r5ftQqtQpBKjJlV+/3Ekav3WqRJ85JwP0aqxzS9DL
	/Xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c+xjLDB9E6Aizzz8nubzqkBd5KoZ+B2Je8b0F1sDtC8=;
	b=eovf8ona8ftFsxwXYTcW6IJ6A6I8HqYEDyAeVhxyg+vJRUggLv9yOvVHPDQ1fGGEjG
	2uvJc/pts+zZlZogzq8NIJJ1Tmej9rKu+aK7v9upMrYjoPCYR/+mzO4imu7A1Dd2uH1f
	M3wcnL4iqobw3xGLt4oTPhUkYJo/y/oOmlawMhcqyXRLCLnA1+dp/sf36r5T6QI9Q9wL
	tO8uBrke4YN0gAF4Jlyaz0WFAPPD6VklDcgiO8Bc3LmjC2VulqME3YqjYUEQjoKtLlw+
	3Dx4KgmCJ29qNxRcuAXvvjirAtJcSGrBfK5CPvGOamAkepSZN12mUwnETvaM/DHPLgt9
	9phg==
X-Gm-Message-State: AGRZ1gIGvNwukcbZ2wf4q0Mm7mpt85UvW0x0zqAYos5GR9D4YDKN+lpj
	bbCcgxE7t+k/GMXuisF1gr5NaccZF9wOo5q9RW+gJA==
X-Google-Smtp-Source: AJdET5dVYbwIsF8314O2Nv2yzN/fZRE/HJW+QFL1Qk6hU7tLd6IZcVgj9NYsxGBmhbxXZcOQ0/zW9/D0jEhcyG/fboY=
X-Received: by 2002:a24:9287:: with SMTP id l129-v6mr97549itd.26.1541178363047;
	Fri, 02 Nov 2018 10:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
	<CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
	<CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
	<CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
In-Reply-To: <CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 17:05:51 +0000
Message-ID: <CAJTo0La78WeKvXtvFRQT0Lp2vy6dx46MYkRO9jev70CadYFNqw@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 02 Nov 2018 17:06:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Nov 2018 at 16:29, Burton, Ross <ross.burton@intel.com> wrote:
> > Turns out enabling reproducible builds breaks the test suite:
> >
> > test test_py_compile failed -- Traceback (most recent call last):
> >   File "/usr/lib/python3.7/test/test_py_compile.py", line 125, in
> > test_source_date_epoch
> >     self.assertEqual(statinfo.st_mtime, testtime)
> > AssertionError: 1541175127.6495416 != 123456789
> > 0:11:47 load avg: 0.41 [269/415/1] test_pyclbr -- test_py_compile failed
>
> We're patching in SOURCE_DATE_EPOCH but 3.7 supports this directly, I
> think we should just drop the source-date-epoch patch.

Confirmed that dropping our patch fixes this.

Ross

