Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49853.1795635123503949264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 11:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZbrYOBD8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2481F4E41774
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:32:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E506E60480;
	Wed, 25 Nov 2026 19:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C0FB11E6B0FD;
	Wed, 25 Nov 2026 20:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795635116; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YYPNEWmJcV3AkW9NQfXgNWbQZXNX6I7EWxwD4g1t2fw=;
	b=ZbrYOBD8VISB0XKUAYKJwhQvKX8pLVgU62VXr0dGjB1nIbzL8Uo2GUyOnMbNX8sR1yVDis
	mxQ+6X/NIo+dYNdBsNx2FNdnfpPZD482/+rOI2E2E8ZxE9du8zv6AXyYcnX+AKKNcnIgyQ
	YrQkgKrJWqGAh0kpPh7DehOcj+0SyTCLWHR4pD00ZDWVYktTU3FK2m+pRJ8+2rTOMm4pEA
	1f8Ij6x/BQKGwhCMK/MsDEFZ54tN3hDF1dpp9Iug+0WPEC+T5ugQpXUFODQ2lqzXALUWuM
	h+FwQCgkEZVZv/zzcyqugAes1j4/rnFENcBQbgOr+5XzU1xFuFYQAT6cibjmUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 20:31:54 +0100
Message-Id: <DN4JIVKQJT9I.3D7K1EAW8F0UU@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] libpcap: upgrade 1.11.0 -> 1.11.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
 <20261125090627.78976-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251243

On Wed Nov 25, 2026 at 10:06 AM CET, Jaipaul Cheernam wrote:
> Tuesday, November 24, 2026 / The Tcpdump Group
>   Summary for 1.11.1 libpcap release
>     Source code:
>       Fix function names in two error messages.
>       Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
>         is invalid, as the return value isn't a general error.
>       Indicate no-capture and no-inject devices.
>       Require libpcap [internal-only] config.h in [internal-only] pcap-in=
t.h.
>       Use more parentheses in BPF_STMT() and BPF_JUMP().
>     General:
>       Set all the file descriptors/HANDLEs to an invalid value in
>         pcap_open_dead().
>     Building and testing:
>       At the build time require atexit(3) not to crash.
>       Require config.h to be from the libpcap build.
>       Test for <sysexits.h> instead of specific OSes.
>       mkdep: Use mktemp(1) if it is available.
>       mkdep: Propagate compiler errors.
>       Enable out-of-tree invocation of autogen.sh.
>       testprogs: Factor fcodetest out of filtertest.
>       Avoid some compiler builtins in Clang < 9.0.0.
>     Packet filtering:
>       Fix validation of "/", "%", "<<" and ">>" 2nd operand.
>       Fix a dangling register index in "proto[expr]".
>       Fix a register index leak in "protochain".
>       Fix the skipping of AH in "protochain".
>     Haiku:
>       Fix a compiler warning. (Issue #1738)
>     rpcap:
>       Properly check for a network error in one case. (Pull request
>         #1793)
>     Documentation:
>       Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
>         the descriptors returned by those routines must not be
>         closed. (Issue #1722)
>       Update a few OS-specific README files.
>     Linux:
>       Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
>     QNX:
>       Fix DLT_PFSYNC definition on QNX 8.0.
>     Link-layer types:
>       Add LINKTYPE_ETW2/DLT_ETW2.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade. I believe we have some new ptest failure:

WARNING: core-image-ptest-libpcap-1.0-r0 do_testimage: There were failing p=
tests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestr=
unner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestru=
nner
    self.fail(failmsg)
AssertionError:
ptests which had no test results:
['libpcap']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4979
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/5011
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1647
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1628

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

