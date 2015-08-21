Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B5E5773CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:56:15 +0000 (UTC)
Received: by iodt126 with SMTP id t126so67089716iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7OJ3R/vPZ2VkQMaTwGPqpppSdCnHGMdEhBVyHeb6xWE=;
	b=QacW12qRpymEzrddjImpl/miu/IuMs0l5166l1nbu5Qa2u/p1s6H5+N0Bj0WX1WkK8
	lxbkXTM7SX6cJTo1VmB/REBSM46h1msLkApPVmbc+seBaz0wHZfAm0LVC1GTYSLsd/jZ
	DF1zXL5ZPLSSVODeMcucKQUN1TWF/vJM0cQX0tREpWghheTryFsWwPQggXPEk2/q8IQ5
	tbQh10s2BNNbz49cxi1nUZMn7KjEPHjyoTDUuLECDah4TysIjZ4wXiJFV3Rhp9iZ5tDL
	XIvmhSYyTJU7IIzZT8DrJJQv+2HRZ4uyIG3mNhop6AfeGItQb32/gXijaCLjOX4IYdpE
	YfFg==
X-Received: by 10.107.168.214 with SMTP id e83mr5086907ioj.112.1440122175476; 
	Thu, 20 Aug 2015 18:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 18:55:45 -0700 (PDT)
In-Reply-To: <55D682D9.4050902@windriver.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
	<CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
	<55D5D076.5000106@balister.org>
	<CAMKF1sqfGP1VGefHU_HRBSZnF=UikHZcs=b9sO92PO5v5TBaBQ@mail.gmail.com>
	<55D682D9.4050902@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 18:55:45 -0700
Message-ID: <CAMKF1sri6DoKeMpG8Sk_8siMHSTDpXiO4nEja5o=X_c=agZHxQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Fri, 21 Aug 2015 01:56:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 6:46 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> Khem,
> What testing have you done so far?

booted all qemu machines. ARMv7 machines e.g. rpi2 and st2120, and
some bcom mips platforms.

> Any ptest?

No

> What toolchain version are you building with, btw?

gcc 5.x as well as 4.9.x on master.

