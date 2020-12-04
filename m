Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by mx.groups.io with SMTP id smtpd.web12.695.1607116910022099976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 13:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@efficios.com header.s=default header.b=kRnDRcxW;
 spf=pass (domain: efficios.com, ip: 167.114.26.124, mailfrom: joraj@efficios.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 5F1E82CF046;
	Fri,  4 Dec 2020 16:21:49 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id aQbHohPXbksu; Fri,  4 Dec 2020 16:21:49 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 1C0682CF2A6;
	Fri,  4 Dec 2020 16:21:49 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 1C0682CF2A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1607116909;
	bh=To1gTx7OoSNo9BL4OmC6Gn1M3yWQMZuRb1/g/e76Gm0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=kRnDRcxWF+dk8cxVG1/9qPc//jAi/g4pLvsc0w+lP+X1UHSfrKBiViDv6kIH6jhnA
	 5nR9T9l2D4NcML5wBm0uQM4srjp4vWTV2TZHx6eAmLGZpHRA1iuCCFQAr8K34PrRt3
	 zc0fbl4YoPB6ol87Z6xUA/VMBwEffgt/HpNd2rYdHzqCXdoDVREwNDxk+1XDt1Hsad
	 p4Pnw383HJga5rYVNHNQiJjW9UeaQ88PgJcHyKsfjXiUaqn6kKkRctyTdQUnJMpAa1
	 eIbABXOtBQkCJYxQZ6HAr5tCGkkP6BlgUo3DOFH8MAsRqAazIBF1N94KiwHbEoilxu
	 5PGkP3hpk6oZw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DYxw8B4Wh8KZ; Fri,  4 Dec 2020 16:21:49 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
	by mail.efficios.com (Postfix) with ESMTP id 1483A2CF0EA;
	Fri,  4 Dec 2020 16:21:49 -0500 (EST)
Date: Fri, 4 Dec 2020 16:21:49 -0500 (EST)
From: "Jonathan Rajotte-Julien" <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <1014226017.7050.1607116909042.JavaMail.zimbra@efficios.com>
In-Reply-To: <CANNYZj92PzV-5DXm1RGqz2eh4hcFVWtJ11XeACKTrk0GCY4Hag@mail.gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com> <20201204200737.7072-23-alex.kanavin@gmail.com> <1310333798.6725.1607114389130.JavaMail.zimbra@efficios.com> <CANNYZj92PzV-5DXm1RGqz2eh4hcFVWtJ11XeACKTrk0GCY4Hag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3980 (ZimbraWebClient - GC86 (Linux)/8.8.15_GA_3980)
Thread-Topic: ptest-packagelists.inc: exclude lttng-tools-ptest
Thread-Index: Mj9bR6XfGaROlsX+BkHym8VdoCPQOg==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

> This is the patch that disables the sporadically failing stuff:

> [
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
> |
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
> ]

I suspect that some of these tests are not that sporadic anymore since a lot of work was done on the live feature. Still, it is not up to you to prove this.

> And this is the bug I had filed upstream:
> [ https://bugs.lttng.org/issues/1217 | https://bugs.lttng.org/issues/1217 ]

Well, time goes by fast. 

> As no movement occurred on that bug since Jan, I am not keen on filing
> additional bugs, but you can see the additional,

I'm okay with taking responsibility regarding the long time to fix but not so much in not fixing bug/issues that are simply not reported. 
Not all issues are of the same nature and require the same amount of work to fix. 

> currently occuring failures here:
> [
> https://autobuilder.yocto.io/pub/non-release/20201204-4/testresults/qemux86-64-ptest/lttng-tools.log
> |
> https://autobuilder.yocto.io/pub/non-release/20201204-4/testresults/qemux86-64-ptest/lttng-tools.log
> ]

Thanks for the link. Any link or doc that would allow me to easily setup a similar build (conf file, ram size etc.).

Is core-image-sato-sdk-ptest a good image to reproduce this?

Cheers 
