Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Swjfr-0000G0-L4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 02:53:59 +0200
Received: by lbol5 with SMTP id l5so608796lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 17:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=hl5EANR4XHRF5Q6Z5YkaES7O0cwrGjJKytRwgTAkkZ0=;
	b=MHtniipVsqWNNRMhyy82EzOg3fvoK29sqT3OMXqd7mlXCR9DPwQM2mznvEF/NOzqDX
	0e3s2vQWJq/HqllgpvT58rWat8JLiB2BWIlO9+JTRd6VYjTKssgyNYwV6Ijd0g28CNHz
	Hyp8+V0Akpli9Ek4XciJzhRD+RpnSQCKP+CW2LaOmg7AxVH0A2Q0yznz1sqrZQrPs+Ev
	EN6ABMIN+lHaiTOsaab2MSCBTnJtSwPTJB+IWT2W7YOrYci1evH1a8P31XWGAjtiPMb4
	0ZtPwaPEkZPOtTG+1g5PLyTi2+NFCRGZF6ymggQvW0omuprkOsWC3jKTbUpljyH/IqSf
	FhuQ==
Received: by 10.112.85.225 with SMTP id k1mr8841074lbz.38.1343868140653; Wed,
	01 Aug 2012 17:42:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Wed, 1 Aug 2012 17:42:00 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1208011855500.26345@oneiric>
References: <alpine.DEB.2.02.1208011831540.5168@oneiric>
	<CAEsOVNfHoY3gbwJoVCUfS61LeN_idZpNMtU3aOmZLVs7=BDQmA@mail.gmail.com>
	<alpine.DEB.2.02.1208011855500.26345@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Aug 2012 17:42:00 -0700
X-Google-Sender-Auth: k-enG4VUUIW079jAl_v9SECVLI8
Message-ID: <CABcZANkSy37E3DFWH6n53sbG-7nPzOzBBfPp2JOqRzhyPS=erQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: using an external (arm) toolchain - just checking i did this properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 00:53:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 4:57 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> | + cp -a ERROR: ld.so: object ''\''libpseudo.so'\''' from LD_PRELOAD
> cannot be preloaded: ignored.
> /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/lib/.
> /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib
> | cp: target
> `/home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib'
> is not a directory
> | ERROR: Function failed: do_install (see
> /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/temp/log.do_install.26331
> for further information)
> NOTE: package external-sourcery-toolchain-2009q1-203-r7: task
> do_install: Failed
> ERROR: Task 270
> (/home/rpjday/y/src/oe-core/meta/recipes-core/meta/external-sourcery-toolchain.bb,
> do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 83 tasks of which 78 didn't need to be
> rerun and 1 failed.
> ERROR: An uncaught exception occured in runqueue, please see the
> failure below:
>
>   but i'm *guessing* it's because i don't have the 32-bit libs
> installed on my 64-bit ubuntu system.  i'll worry about that after
> food.

Could be, also make sure you have NO32LIBS set to 0. The toolchain
binaries are 32 bit, so need a 32 bit libpsuedo.
-- 
Christopher Larson


