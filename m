Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 945C66612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 20:08:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so33112780wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=owT4LXBhd5ErPsLxp6BhA2q+bCYwiOns/PbsPjLsF2g=;
	b=mRBlFABCA8i6r9fqGN2wAoeipvbluMPkvhhfasn8S7+jWM72M1V4UK1PmYhwN6C8n6
	c38xKX4Xngvpcyqne7Q5nTStzCttUSdonUDBEDg9TBKwmih+crW06+EN2ygZ1Q0P18wH
	sQMRIc3yw9qNsrXhCPjXYXK3Gk0U7VaXAAQF5/8R6lUEs67iKVY09DfMyAs6OO2QQB8g
	bknFX3Cr/u98VzZ2HDFB+QUYXCnIjgwU2CFuB/TighQbjAKLxRUbs6XzXcpP5fyEXtNB
	Gpg0dlmt6+YQcN/1Wsex84nrFoAeb+zbN4JNKGPH/ktGaMJILaxbUnaB/uLfosS828kd
	okfw==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr142913002wjc.3.1452629285983;
	Tue, 12 Jan 2016 12:08:05 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 12 Jan 2016 12:08:05 -0800 (PST)
In-Reply-To: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
References: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
Date: Tue, 12 Jan 2016 12:08:05 -0800
Message-ID: <CAJ86T=UoRjC4aabWUARoVWcR6UX+5bM-Rr+Fp+5a_5ogW0r8cA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] move do_kernel_link_vmlinux() into kernel.bbclass
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
X-List-Received-Date: Tue, 12 Jan 2016 20:08:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 4:12 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> do_kernel_link_vmlinux(), or something like it, is useful for MIPS,
> since MIPS has no support for zImage images:
>
>   http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/mips/Makefile#n400
>
> Moving do_kernel_link_vmlinux() from kernel-yocto.bbclass into
> kernel.bbclass makes the task available to non-yocto kernels and so
> avoids the need to duplicate or re-implement it in kernel recipes
> based on kernel.bbclass.

Ping. Any issues with these changes?

> Andre McCurdy (2):
>   kernel-yocto.bbclass: remove do_kernel_link_vmlinux from SRCTREECOVEREDTASKS
>   kernel-yocto.bbclass: move do_kernel_link_vmlinux() into kernel.bbclass
>
>  meta/classes/kernel-yocto.bbclass | 14 +-------------
>  meta/classes/kernel.bbclass       | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> --
> 1.9.1
>

