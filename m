Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 359006D762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 12:23:35 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so303110pbc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 04:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=R3qWOTWqwdiSBBDGqqNHw3dyj/dveJb43GkvD8ulgPQ=;
	b=R2Zi+WSc/5sqSqw+eeuMo7fg1kg3OCeKvjee3TCFbzsYBOYWrpKC7qzb2ywhu+vl7S
	B6zFsY703uP2CIPNRD41+zl0rllPXRMw6MJFlZ974gNp7rFMkXGTkw5rqUs+9TO8MysU
	G4NXFJP2yfPgzfA4kQmYav/RSU52UYLI82HqISnYAVXOApQtmzj690NmsCRHjvaZsML6
	jrpTdFj0TGs7lpdaRXuI9XhtZ6d/ooK8nysDpPE20mOjdzS80awo67/iXkzBgk7G47hE
	bXQWHs/NpIvOS2LtpG97w67PaiXC/9duLnE7pf4WjW9WXfox7Te+8E6QiFnp0RB6y7K9
	ulKg==
X-Received: by 10.66.164.229 with SMTP id yt5mr1324849pab.67.1391603015684;
	Wed, 05 Feb 2014 04:23:35 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	bz4sm76171386pbb.12.2014.02.05.04.23.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Feb 2014 04:23:34 -0800 (PST)
Message-ID: <52F22BC7.2050006@gmail.com>
Date: Wed, 05 Feb 2014 23:17:11 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <1391317132-23608-1-git-send-email-net147@gmail.com>
In-Reply-To: <1391317132-23608-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] syslinux: fix booting memtest86+ using pxelinux regression
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
X-List-Received-Date: Wed, 05 Feb 2014 12:23:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

On 2/02/2014 3:58 PM, Jonathan Liu wrote:
> After syslinux was updated from 4.07 to 6.01, booting memtest86+ using
> pxelinux would fail:
> PXELINUX 6.01 2013-07-04 Copyright (C) 1994-2013 H. Peter Anvin et al
> Loading memtest86... ok
> Booting kernel failed: invalid argument
>
> This backports the necessary upstream patches to allow memtest86+ to
> boot using pxelinux again.
>
> [YOCTO #5501]
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Can you please cherry pick this patch from master into dora branch?

Regards,
Jonathan

