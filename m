Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9DED177407
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 16:57:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so10241219pga.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 08:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=oj9nxml3A14X+q56YKLJ5VhnXmA/ycYelm4uv4ev/5o=;
	b=cQ81ZktpqHTor9ejIhUOwrM22Pvi2YXlDSFO1ZZ9xWbeo0RBXU9a0uSQU/j6vQnwzl
	8Jji3+Jj6cJGbnIsh4UeYyI9pAEummXq+LEe5Rz11s0mErzuLCMWzHfyQRL/nsLGCM9M
	5lGo2ImrLqpFgyK6VGMS66Z592unO47P7H2sZERMxSp2O1YNTe2Cxit+HZ1+4mRscqNO
	4VYNJFnq/Jekhhm0E+gaDeGm1dZloSFkr6LnrCHcz6z9qUDLvl83dp4xxJ1TRf1BG4LJ
	4JuRHNEW2WgfStQKL8BePNVRXdILZtwLBiCygAdA78apDcWkXzuAW/l2sGYSAWvOMfvU
	mCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=oj9nxml3A14X+q56YKLJ5VhnXmA/ycYelm4uv4ev/5o=;
	b=OeLO2ycp9OaxfyQP6c3Dx5jAdxO6+1KwtlSYCPDm/RVzCVW8lTmWWmmt7zxhsR7jEr
	qHd6GcORbks4ue5YgrhK3q45T9UkPXtBtsNl7UyhqhkyH6r1AYxlYnhs1NRcXdJLnu0F
	ZtC4KuX8BhrsLtxtwBBii5r7eg1Rf2amdB0+foTlaFBDoST4lY06I25H4Sr0U4opr3B+
	n4gmPXwjFyxnvVPH9AqSDWjKJaBvfSYgSs+qvnP5nvxbqb9wQoOkYVostVvWu/PXGXgw
	ncqRderCJYsYcFbNaP9CmuDcmeS+C26d3MGkiuoOtYOXNoRbwJ/nPKFK2AFNr8oBsYqm
	QApQ==
X-Gm-Message-State: AKaTC02/uNJTf/q2sD/42feb8LxVaCC795Jw5PHYW++GZ4Jod0WFjXtIIB2dXZ7BnjzlpQ==
X-Received: by 10.84.168.129 with SMTP id f1mr9006573plb.42.1481907432652;
	Fri, 16 Dec 2016 08:57:12 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:8035:ba73:d6e2:ea72?
	([2601:646:8882:b8c:8035:ba73:d6e2:ea72])
	by smtp.gmail.com with ESMTPSA id
	p14sm13155305pfl.74.2016.12.16.08.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 08:57:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1481793382-34767-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Date: Fri, 16 Dec 2016 08:57:11 -0800
Message-Id: <48DE1321-CAEA-4C5E-AAD5-6367729C3498@gmail.com>
References: <1481793382-34767-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
X-Mailer: Apple Mail (2.3259)
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
X-List-Received-Date: Fri, 16 Dec 2016 16:57:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 15, 2016, at 1:16 AM, Zheng Ruoqin =
<zhengrq.fnst@cn.fujitsu.com> wrote:
>=20
> 1) Upgrade gdb from 7.11.1 to 7.12
> 2) Delete 11 patches below, since they are integrated upstream.
>    0001-include-sys-types.h-for-mode_t.patch
>    0002-make-man-install-relative-to-DESTDIR.patch
>    0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
>    0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>    0005-Add-support-for-Renesas-SH-sh4-architecture.patch
>    0006-Dont-disable-libreadline.a-when-using-disable-static.patch
>    0007-use-asm-sgidefs.h.patch
>    0008-Use-exorted-definitions-of-SIGRTMIN.patch
>    0009-Change-order-of-CFLAGS.patch
>    0010-resolve-restrict-keyword-conflict.patch
>    0011-avx_mpx.patch

I doubt if they all are merged. Can you check if you can build gdb for =
musl targets ?


