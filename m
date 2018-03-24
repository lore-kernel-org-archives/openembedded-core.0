Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3306B787C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 20:27:04 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z73so15245058wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zYiB9tGqxVr2UgBC7jKn9/QEyUDx539p8KTPPi609Xk=;
	b=nkPpWngNwvLWuQxp7SVhCAZxvc3Irg+BHRnkTrNTyuVBX5FlRzykojKU53dbazUTaG
	0O7SiQBF5jSpk8xOm5XJOXcjm+oZ49DPqCIoLmukSg73jJlJscZfLNtqkWx5U3OSpl/T
	Y8k0cN70lTiIAzMj/NjmISNQ9gXiMlPPgbC4Lx/X1w4yc5C5JM140ly/94Q5m29QvRSQ
	zH6nds99F3aEcVgr7I6fC66u5CFnBdYU0Egub1otiIOFEHBGcO696+n7BJ+uZ9oF7q8Y
	8Phm3WW7QbI+RJfTxRYvhMLZpf/aVFNVnt1pGs4q4ohvcwAB7b0drTKYg9tGY9mYwYJe
	IGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zYiB9tGqxVr2UgBC7jKn9/QEyUDx539p8KTPPi609Xk=;
	b=A5dD0k/e9WWLbdprJqI61OEvZB/K2PFD6I2s4y/Pb2fq6BPWIhG0M3f8KEuYRMzhch
	35eBlg9GNPkKujJhTvbqMsQYa/MoX/r1C7Og2261HSFkiuCFD0vEiC0VjLX801/2Hw4g
	caHisMt1B1VFhSnxcFYKhH49TuT7lpyaKwwypGXY5Hz3/VTyhn3JjGD5CMIA7mAWYbYn
	THHF+TvmAbPPzrOC/I/nXU4KOTMjtVMhi9nGB/KJ58tgIP7r1oQsSPyLbU+LOavMwC7B
	TBLID4+NhWi0QQcKwTSz1Tnt7VDc1UtgWcAssrmOSP6OCA1AkOlWJR4p7rCgaoV1S+mC
	A/2g==
X-Gm-Message-State: AElRT7F17CKiU3WeSxfgBQ+gzlKYS9fK411ItUnRLlGQb4kjffDH4gQO
	R99/gbvQQgpcUO2g9B7I980NIuwv6Z5e7ANsHmw=
X-Google-Smtp-Source: AG47ELstRlFN9k5EV6Es6DiO79S0YAhTfo2A2rmD0DCH00yWFkIWUKEb564Wu/wKhM2kcbj1bboVaBRprlF/OBQxgj0=
X-Received: by 10.223.134.47 with SMTP id 44mr18678247wrv.114.1521923225912;
	Sat, 24 Mar 2018 13:27:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sat, 24 Mar 2018 13:27:05 -0700 (PDT)
In-Reply-To: <20180324145044.168f7e3f@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 24 Mar 2018 13:27:05 -0700
Message-ID: <CAJ86T=U3Eba_3qQ0gdvpF1kTZXLOJKgqE=SmrKt5VjqNPMxy6w@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 20:27:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 12:50 PM, Seebs <seebs@seebs.net> wrote:
>
> pseudo's call sequence:
>         various_setup()
>         real_syscall() // sets a3
>         other system calls // also set a3
>         return

You don't need to know that the kernel returns a result in any
particular register. The libc syscall() internal implementation will
take care of collecting the result from the kernel and returning it
via the normal function call ABI. Therefore pseudo's call sequence
becomes something like:

        various_setup()
        temp = real_syscall()
        other system calls
        return temp

