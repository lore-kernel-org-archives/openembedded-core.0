Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 63772723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 17:13:58 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so26182183igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5YBmxnAbMO5kH4ARsODVTUz8Y2T2SPtOJ9U3JmlNGn0=;
	b=0zwNHn1wqhM8jhe9y7Iytp/jicFAWagxw2t+TvlAPi9v0tpj0zBvpB6wmL/FeB8Dzu
	uN2dGKpyoABmHoMTsI5PGb1TEZ1xioEvXIro52x1Eqd2WLm6IC4+Ravx8b3Yfk3hqfIQ
	5wza5qwretwkY5CSzEL9qGc9Le8qTf7X8hRxACyDQpIqklPZRW3iV3NvlyRp3p4S8qlh
	/GENY0i32DwNYgBDo1qbopF9s6Utp/Feyr+7twUdmXX1dkcRJhQ/0UjPh6b8cfZf2fC3
	6TO/oFpOq44XVctjUAwE8zsnqulnxvswfwRlc/OHNOz9tJtJHDjNOgmFIeJbeS48iogZ
	lalQ==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr30973173ioi.1.1427476440250;
	Fri, 27 Mar 2015 10:14:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 27 Mar 2015 10:14:00 -0700 (PDT)
In-Reply-To: <1427277082-28117-1-git-send-email-B40290@freescale.com>
References: <1427277082-28117-1-git-send-email-B40290@freescale.com>
Date: Fri, 27 Mar 2015 14:14:00 -0300
X-Google-Sender-Auth: EnmOroJ9IbVR8YwL6-8JYlrf_aM
Message-ID: <CAP9ODKpTHisqoGU7g2xjyEQjPR=C06i_BY_S-voQ2aahw-Yt3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>, "Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] u-boot.inc: fix rename image error
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
X-List-Received-Date: Fri, 27 Mar 2015 17:13:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 25, 2015 at 6:51 AM, Chunrong Guo <B40290@freescale.com> wrote:
>    Resolve mismatch between U-Boot configs and uboot image name.
>    The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>    and repeat compile or install so we need to check if ${type} match ${config}
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Ross and Richard, this patch should go into master and fido. The
current inc has some issues which this address fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

