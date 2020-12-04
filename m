Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by mx.groups.io with SMTP id smtpd.web10.170.1607114390702705456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@efficios.com header.s=default header.b=FsEV1mhO;
 spf=pass (domain: efficios.com, ip: 167.114.26.124, mailfrom: joraj@efficios.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 7B67D2CEA83;
	Fri,  4 Dec 2020 15:39:49 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rV5bMhlS0OBG; Fri,  4 Dec 2020 15:39:49 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 333D72CE6C5;
	Fri,  4 Dec 2020 15:39:49 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 333D72CE6C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1607114389;
	bh=uR+/N2YUWewQe8X5z/RQxFXKxxVN3hkJ2xZFUfD8vy8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=FsEV1mhO+KHE0gTvfJ69Wa/njpg/mvTdxixYZaYZpBbr2dGErPDjf1jrESb+j6jXg
	 h/oKKEhgu0FCKoou1gf6XBEmUz+O2jpxnqgA8mbY2d3n5+OJE12uoO9iz4Q77b5M0v
	 aPO5zahQJ8mpGN8ZUJQ/topGHX4+DvaUmUn4RjsnJJ3QorZmOcF76EtsQf0GbnVrB2
	 zr8Ifk4KSAvEBJ8nlJULED73/JTlEGcVxSjbNZckq6xP/aA5s0Jup70vEqGwQPIX/n
	 qSRRp/N4uMm8+q5g7vwPWYzFA4fcmZua2yX/OubAsajIBkxdsI/WkwfEZjYJ0Sor1g
	 ng0bsNaYRYlBw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ewC-YLRVAy0k; Fri,  4 Dec 2020 15:39:49 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
	by mail.efficios.com (Postfix) with ESMTP id 2AE172CE5E2;
	Fri,  4 Dec 2020 15:39:49 -0500 (EST)
Date: Fri, 4 Dec 2020 15:39:49 -0500 (EST)
From: "Jonathan Rajotte-Julien" <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <1310333798.6725.1607114389130.JavaMail.zimbra@efficios.com>
In-Reply-To: <20201204200737.7072-23-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com> <20201204200737.7072-23-alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3980 (ZimbraWebClient - GC86 (Linux)/8.8.15_GA_3980)
Thread-Topic: ptest-packagelists.inc: exclude lttng-tools-ptest
Thread-Index: bDCzzukAgTDC9O8VpproCk8O64cFbA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Upstream here.

Always happy to give input as long as we are put in the loop. 
Also bugs/sporadic test failure can be reported on our mailing list [1] and bug tracker[2].

[1] https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
[2] https://bugs.lttng.org/

We understand that the burden can be quite high for a project such as lttng given we end up doing weird 
testing due to the nature of our work and that we are human ;).
Still we are always interested in getting info about "sporadic" failures.

To be clear, we are not against this patch. We understand the burden associated with testing lttng.

Cheers

----- Original Message -----
> From: "Alexander Kanavin" <alex.kanavin@gmail.com>
> To: "openembedded-core" <openembedded-core@lists.openembedded.org>
> Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
> Sent: Friday, December 4, 2020 3:07:36 PM
> Subject: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest

> These tests have been failing for a long time (and even more failing
> tests are already patched out); no one in YP has the
> expertise to fix the issues, so until upstream steps in, let's take
> them out, and try to reach the goal of hard ptest failures so that
> ptest regressions are caught as they happen.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
> meta/conf/distro/include/ptest-packagelists.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index ce13368c2e..90272a70af 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 = "qemu-ptest"
> #    bash-ptest \ # Test outcomes are non-deterministic by design
> #    ifupdown-ptest \ # Tested separately in
> lib/oeqa/selftest/cases/imagefeatures.py
> #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
> +#    lttng-tools-ptest \ # multiple sporadic failures, lack of expertise in the
> project to look into them
> #"
> 
> PTESTS_SLOW = "\
> @@ -73,7 +74,6 @@ PTESTS_SLOW = "\
>     gstreamer1.0-ptest \
>     libevent-ptest \
>     libinput-ptest \
> -    lttng-tools-ptest \
>     openssh-ptest \
>     openssl-ptest \
>     perl-ptest \
> --
> 2.29.2
> 
> 
> 
> 
