Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2C1607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:39:21 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id q83so2466891iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to
	:content-transfer-encoding;
	bh=k7Nr9f/PbwBpi77QKO/CO7c8iTBV37KdVVCFDyJbzJY=;
	b=sbHNQ/VjSnlBe3zvgyK6yqIPGmWmI7agjhLkw7kWDziBSWl8J03d8+QKIQSxVqyAJD
	giZAGmb5YCLgIuxGC1cM666tMJFVa/RF8+m46Ad+n43h/AeN7SCzLlqkem80AtqOpY+g
	62LVpEhQxB5ZJ9O1BZqEGAdSrtUh6DJQtiGYYHHQ5WlrhzW+CROViAmhHmRWu7OlWYsG
	RWohxFrpp+tFbuX+HXGrnStH4WcthgHzs17Sm9tnppoTxNIac4ZkgmbqgNDev4oZ29G+
	2ChzDj8M0Y49nV9Snt2/Mcq37kjvtRM8lM+EM5iLjm9lZqkx5OQNZnQQnCCYOfwsAZLG
	JL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-transfer-encoding;
	bh=k7Nr9f/PbwBpi77QKO/CO7c8iTBV37KdVVCFDyJbzJY=;
	b=UOxu2kyWtlp44wxvZfIfQm32Beg6DJT4ry197l2tvocD7wO9/0aH6iNEwY/hr1cdeM
	dvFwBJuIONB4XxuoxdK3TZLdgb0aCG7gIrq8BES9RAuD5nimbXiwiNNK04gzrevq9vbB
	8cgDHZGlgn0Ju1xZNYO4e8gnRCmbZdGlK92D4COL1MsS5ipjpI5nI/JfaD2z9eKkx8jI
	D89yjDOrwmdM8cTcHYk6aNSK7YhjQyjKo6UR7EIsxC/kedLBv0IW0FCMID8NYfv7/oMZ
	jck6a6TxFCxRtznETPcRl58Dy8sAOSjBEV3kaBUkDNoZB8h9lN3vSKy9T9pEn69v9/p+
	jzUA==
X-Gm-Message-State: ALyK8tJCOznYKVG/xkZ+50xKi8ZY0eGAWdmEV7Kt5AskLAzDcAcNcvcYv5biv4qhTFzcRQ==
X-Received: by 10.107.173.205 with SMTP id m74mr20272812ioo.87.1468258761775; 
	Mon, 11 Jul 2016 10:39:21 -0700 (PDT)
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com.
	[209.85.214.51])
	by smtp.gmail.com with ESMTPSA id 68sm7850528itl.22.2016.07.11.10.39.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 10:39:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-it0-f51.google.com with SMTP id u186so66544557ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:39:19 -0700 (PDT)
X-Received: by 10.36.13.19 with SMTP id 19mr12112931itx.76.1468258759593; Mon,
	11 Jul 2016 10:39:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.198.16 with HTTP; Mon, 11 Jul 2016 10:39:18 -0700 (PDT)
Date: Mon, 11 Jul 2016 14:39:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
Message-ID: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Armin Kuster <akuster808@gmail.com>
Subject: [for-krogoth] musl backport
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
X-List-Received-Date: Mon, 11 Jul 2016 17:39:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem and OE-Core fellows,

I would like to propose the backport of following changes:

commit a572a1181411668a9bd4c264f5124d13f3d7cead (HEAD -> for-krogoth)
Author: Khem Raj <raj.khem@gmail.com>
Date:   Thu Jun 23 15:23:19 2016 -0700

    musl: Upgrade to tip

    Rich Felker (4):
          fix undefined pointer arithmetic in CMSG_NXTHDR macro
          fix a64l undefined behavior on ILP32 archs, wrong results on
LP64 archs
          avoid padding gaps in struct sockaddr_storage
          remove comments on copyright status from UTF-8 implementation fil=
es

    Szabolcs Nagy (8):
          fix the use of uninitialized value in regcomp
          add preadv2 and pwritev2 syscall numbers for linux v4.6
          add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
          add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
          update siginfo struct for linux v4.6
          add CLONE_NEWCGROUP clone flag, new in linux v4.6
          add new tcp_info fields from linux v4.6
          update sys/socket.h to linux v4.6

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit d81bb8c6362d59a124bbe9b3a60cb259733b120d)

commit a8e05129847ac01bddb01dcd8f1592fcacf0c908
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri May 20 07:03:30 2016 -0700

    musl: Update to latest tip

    Bobby Bingham (3):
          x32: remove arch-specific syscall remapping
          x32: eliminate __X32_SYSCALL_BIT constant
          deduplicate __NR_* and SYS_* syscall number definitions

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 6993e88cccbfe2f990e4ea9bd7cc186d59e5a84b)

commit d782ecec07bd270f1a9c7a440460cf4dd0cb1616
Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed May 11 10:35:30 2016 -0700

    musl: Upgrade to tip of tree

    COPYRIGHT file was changed to clarfiy the MIT Licence
    which resulted in checksum change, see

    http://git.musl-libc.org/cgit/musl/commit/?id=3Df0a61399330bae42beeb27d=
6ecd05570b3382a60

    below are changes in upgrade

    Andrew Kelley (1):
          fix incorrect protocol name and number for egp

    Bobby Bingham (1):
          add powerpc64 port

    LeMay, Michael (1):
          fix redundant processing of --build flag in configure script

    Petr Van=C4=9Bk (1):
          remove dead store in res_msend

    Rich Felker (10):
          fix undefined pointer comparison in stdio-internal __toread
          fix regression disabling use of pause instruction for x86 a_spin
          fix read past end of haystack buffer for short needles in memmem
          add support for mips and mips64 r6 isa
          add mips n32 port (ILP32 ABI for mips64)
          fix thread structure/dtv-pointer corruption on powerpc
          fix FILE buffer underflow in ungetwc
          update COPYRIGHT file to clarify that permissions apply for all f=
iles
          follow standard configure behavior for cross compile prefix
          fix spurious trailing whitespace in powerpc & powerpc64 bits/errn=
o.h

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    (cherry picked from commit 21d8d60b2bfb205dcb5d304119d4dbd627db7163)

We have been using those backports locally with success and it fixes a
number of important things for our application, as musl is ABI
compatible I think those backports would be good for stable. What do
you think?

Best Regards,

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

