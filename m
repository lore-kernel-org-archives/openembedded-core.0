Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C518477441
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 09:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBH9liKo017723; Sat, 17 Dec 2016 09:47:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NvWmJxp_1Lpl; Sat, 17 Dec 2016 09:47:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBH9jw4e017708
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 17 Dec 2016 09:45:59 GMT
Message-ID: <1481967958.9843.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Date: Sat, 17 Dec 2016 09:45:58 +0000
In-Reply-To: <48DE1321-CAEA-4C5E-AAD5-6367729C3498@gmail.com>
References: <1481793382-34767-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<48DE1321-CAEA-4C5E-AAD5-6367729C3498@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb 7.11.1 -> 7.12
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
X-List-Received-Date: Sat, 17 Dec 2016 09:47:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-12-16 at 08:57 -0800, Khem Raj wrote:
> > 
> > On Dec 15, 2016, at 1:16 AM, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.
> > com> wrote:
> > 
> > 1) Upgrade gdb from 7.11.1 to 7.12
> > 2) Delete 11 patches below, since they are integrated upstream.
> >    0001-include-sys-types.h-for-mode_t.patch
> >    0002-make-man-install-relative-to-DESTDIR.patch
> >    0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> >    0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> >    0005-Add-support-for-Renesas-SH-sh4-architecture.patch
> >    0006-Dont-disable-libreadline.a-when-using-disable-static.patch
> >    0007-use-asm-sgidefs.h.patch
> >    0008-Use-exorted-definitions-of-SIGRTMIN.patch
> >    0009-Change-order-of-CFLAGS.patch
> >    0010-resolve-restrict-keyword-conflict.patch
> >    0011-avx_mpx.patch
> I doubt if they all are merged. Can you check if you can build gdb
> for musl targets ?

Its confirmed as not building:

https://autobuilder.yocto.io/builders/nightly-musl/builds/104/steps/BuildImages/logs/stdio

Cheers,

Richard



