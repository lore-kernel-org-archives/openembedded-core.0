Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B42C475A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:14:10 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so10364877igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=IQdzM06wVYVK0f/j57h39Jsb2B/xp2Pshe7G9A3C17s=;
	b=UMFTOAF6bg6XsL0JqT9cc7NN+yidbXZD30nsr97DL9ogguJ/Q6WUQMJrnrODAYc33a
	wRwrv15AQe2uurmu3AZ72eTtU2wHgIGvqohVj+0feIinwgSTan91vyrIC+Ti+St5vg48
	V0rFO84dNPCesSgRIzQHSeuftorEY3sNNOePtKqTHBoB9LsaS0Ys+MBl8T7QibOC7UXs
	dRkf59d25pbmXy0LfUkvaq53FQuMxW5/RyZOd2b8wF8Y9MdbH62vQyL0O4kza752qg52
	NLBwIya7h0JuG7laSjMGrYV863bvRZJonY5qDIAKabBi66Oz9i6gbNennt2ZyeR8lejY
	JAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=IQdzM06wVYVK0f/j57h39Jsb2B/xp2Pshe7G9A3C17s=;
	b=bEUwzeUGkglSGVOo5h6xmxnuTU8Eri0o/Aink3tdCpgKQ4BR+PbWWkBlhIjF0RYNn2
	5NNC1fmpJ4E30n/dQUniWSQ0VWxWeKq+hNzS0bAgDB8Y/zZTE/bPmbjTh+RpsIqPDLA/
	PTmEe8L+JPtWZ7xMEjlNw7+phGTfj+ZuYttKceNACV9bOfpDe2ko3cFEFlOCBic7RcCi
	xSUV74bVWo+r35F+Hidr7iuITbtFTdHtrC6EeomZRJH9OdOl+0DTIJEf5HkOPY+aS+/8
	cwXG/3hHtU6OinmtSChHKarJ4/4KSU+nUEso8xK42mftmCea4fkbZ6ANXXeIRvI8h2nb
	OrMw==
X-Gm-Message-State: ALoCoQkvqJKPpA4oksR+g21L20zcDTgqAnYooMKd6mNAeZulVWOhBdnsgLVApHGByrdDiZID18+a
X-Received: by 10.50.4.98 with SMTP id j2mr3094783igj.13.1446729250962;
	Thu, 05 Nov 2015 05:14:10 -0800 (PST)
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com.
	[209.85.213.175]) by smtp.gmail.com with ESMTPSA id
	ux6sm11134040igb.19.2015.11.05.05.14.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 05:14:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igpw7 with SMTP id w7so10457492igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 05:14:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr3184169igt.5.1446729249255; Thu,
	05 Nov 2015 05:14:09 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Thu, 5 Nov 2015 05:14:09 -0800 (PST)
In-Reply-To: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
Date: Thu, 5 Nov 2015 11:14:09 -0200
Message-ID: <CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
To: Radek Dostal <radek.dostal@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 13:14:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello Radek,

On Wed, Nov 4, 2015 at 2:06 PM, Radek Dostal
<radek.dostal@streamunlimited.com> wrote:
> ${TOOLCHAIN_OPTIONS} does not contain some important flags such as
> "-march=armv7-a -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8". It only
> specifies sysroot as mentioned in commit 923eb657 "u-boot.inc: update
> linker arguments to pass --sysroot arg"
>
> Fixes bug: u-boot 2014.04 build breaks with error:
> "fatal error: gnu/stubs-soft.h: No such file or directory"
> when building with hard float compiler as compiler does not receive
> flag "-mfloat-abi=hard"
>
> Before this patch only gcc compiler could be used due to CC explicitly
> being set to gcc.
>
> Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
> Acked-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Nack!

The U-Boot is close to the Linux kernel regarding the use of the
compiler and does a huge set of handling internally to properly pass
options depending on the SoC, arch and others.

This build error has been fixed in new U-Boot releases and if the
board required an old version (and cannot be updated) the fix should
be done on the recipe and not on the common file as it can change,
behind the scenes, what is in use for several recipes without notice.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

