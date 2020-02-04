Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 63AA5611F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 07:26:38 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id z193so19788928iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 23:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=l4G5teVi9vZEtaBB4qJDXz8cRurOcK1IF0pv9ECV4sE=;
	b=akcohl/rYyWcCJxIPdurwqxUPOl/nBrGRQRRDiO58zCP9h1XASgcn3CjIHBm8N2DH3
	o7GI89NtbLbjzbVSow1MS8kxdVVDOJeBz+cmlgyQOe0EqCoXawijnf3MImsuGO5c+NWs
	zqPjnX8Aei/XD9zU+M1SBT7hXNOxnvDgkRQVLXMAJMgWp3f/jA0gb9AMbnZc7IsI62Ai
	kuHmdlPzwMV7oNXfh9esu6hf9zqo0PGqmN/JJW2OXTpeKnSx2IcbhejDQo62OXLtia6z
	JKWny9oe/S+M3wvGqQjjKSTG4NnkiyVi1iQk1kGi2ZNCaGO9pVSZk65qTcK9075ijVAn
	O9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=l4G5teVi9vZEtaBB4qJDXz8cRurOcK1IF0pv9ECV4sE=;
	b=I10eQGRYC+bhXByM0aG6vJdGC2oZkpuSV8cf9Qy/UlL08QBszukzHaHjwnayoCS+Jr
	X01Nda53JroLX9O86NgChsBzyeqdQ6IIbhpBABWGmxhDoc8Qbcpm4GNJ6D6TR1bCUxiy
	q1CyAT9Gd8DrWXzSsVtYpSuIIEzUsMSVViUPhpH27lWIT8SBhZZJVkvT4lCnuUtOTWuS
	11uB6TSDw0UMCLi15eOGQOrhNX265fSbekLxmvWZPLxi9yJRUg9FSTgehz962uCaDpyd
	4OukoAEtYdh2c3BIvVD6epVa3JH/SS5XO6TLpCNhX18wGnes6xKM0oXH15NJ+nn/8D68
	udOQ==
X-Gm-Message-State: APjAAAUjKP5cpEzVVb4wowdAy/ROQ9N5BTO3fueImTEdgt5r+nDgCYsx
	VZ1rSIQP+62NPgLPe0uym/RLkEEPI2Cw/h2Tve89/YIdQvE=
X-Google-Smtp-Source: APXvYqwqu6/B2/pkywIOQ+Z1DN/mJDjuIUV4GeVjU3PuExuJ9OVePKypzl7qQej5ik3XU25+CR2TVtlRZOzLtdAfODQ=
X-Received: by 2002:a02:6055:: with SMTP id d21mr23911872jaf.21.1580801198965; 
	Mon, 03 Feb 2020 23:26:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Mon, 3 Feb 2020 23:26:38 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 4 Feb 2020 18:26:38 +1100
Message-ID: <CAA=hcWQ47R4kiGtB-zAuzf1OSorJ2SumgEt6DZMebEzb14jBYg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: How to patch a local file in a simple elegant way?
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
X-List-Received-Date: Tue, 04 Feb 2020 07:26:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

Is anyway to patch a local file without committing to the git source?
I did not realize a local patch is that hard or if it is impossible.

In my OE build, I want to make a patch file for mx6ullevk.h in
meta-freescale/recipes-bsp/u-boot/u-boot-imx_2017.03.bb, to customize
mtdparts and bootargs as I could not find a simple way to do it using
bbapaend, I did not and I don't want to submit the patch to the git
source. So I got a bunch of errors:

ERROR: u-boot-imx-2017.03-r0 do_fetch: Fetcher failure: Unable to find
revision 8be98e9322040c655b9e5c9fb2c494e002e3fad9 in branch
imx_v2017.03_4.9.123_imx8mm_gafile://mx6ullevk.patch even from
upstream
ERROR: u-boot-imx-2017.03-r0 do_fetch: Fetcher failure for URL:
'git://source.codeaurora.org/external/imx/uboot-imx.git;protocol=https;branch=imx_v2017.03_4.9.123_imx8mm_gafile://mx6ullevk.patch'.
Unable to fetch URL from any source.
ERROR: u-boot-imx-2017.03-r0 do_fetch: Function failed: base_do_fetch
ERROR: Logfile of failure stored in:
/build/Installation/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/temp/log.do_fetch.25780
ERROR: Task (/build/Installation/sa_platform_build/Source/Yocto/oe-core/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2017.03.bb:do_fetch)
failed with exit code '1'

Googling Internet, there are many suggestions to workarounds, git to
local repository, git to your own repository, or even copy all git
source to build u-boot offline. None of is elegant, I am sure there
are some nice way to do it. Could you please advise if there is a
simple elegant way to do it?

Thank you.

Kind regards,

- jh

