Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34F3C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 06:41:23 +0000 (UTC)
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
 by mx.groups.io with SMTP id smtpd.web11.78560.1723185674005446982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 23:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=R8RX5Qiu;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.162, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id cJJHsz2Ji4k5vcJJHsmigr; Fri, 09 Aug 2024 08:41:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1723185671; bh=heOOMzXbLS09WYWn77Ne4QgOKg2D4yOOBXfSPvuKC+w=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
	b=R8RX5QiuTYp6N6FYOpFvOL0L7RmQk8Hn87AtdgvlL2QoCGx8SvzPYShHvQAxqhuGc
	 Dc3MwWbqN3XnBqk/QDWUYpP6a1937SWvXf+zxDLV/4IS7jCxecyBnvT68vvvwBYJIZ
	 UCjcOwCSL8ZQuuoIGUXtJHhYQFnr1bK19bLXuGhGBJugsITSziyU0Tq1/IYewVN2Tv
	 4lHv91Ovba20tVp984wb9mV4hPN2FyIqt9hIh0lVw/yMp4+B8bxG76ujNDAb29bqq9
	 ulS3OM0EurCY/Lewp5lJBmKDKq+S0N3ZDspawkCt5ultooepauXkJXAKz6LpHrK6JI
	 NmhgGhhcTtA9w==
Message-ID: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
Date: Fri, 9 Aug 2024 08:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe]printhello
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfE+NDa0GL0CZopvXr/FJmxM+2/zVEivs9HsWRABVvhlmEobgMihJZbFGAPJY7tOs2G96sWmvYv3UI3jOvY7w71tlbiNcLuclnuuqzJCmvzpoIl2OLCcR
 Y3omIbleyuTItpUSbrO6UV7mrWmw4BZ6dxr5wNFxalhqfTqw60lR+z/jgMtIxAsgIM5smvCyt5qfvCF0SuAt8sXCYgP3cEbwf5JRnT5RltOk4emuP84+oWT5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203156

Dear community!

I know this could be a funny question, but I wanted to use the 
"printhello" recipe as a basic example. But looks like, that is little 
bit "out-of-date".

I know, that I can crate a custom recipe, but I wanted to use something 
"standard", so I took 
poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and 
created an "printhello.bb" out of it. I made some modifications to try 
to make it working.

  DESCRIPTION = "Prints Hello World"
+LICENSE = "CLOSED"
  PN = 'printhello'
  PV = '1'

+ inherit allarch

  python do_build() {
-   bb.plain("********************");
-   bb.plain("*                  *");
-   bb.plain("*  Hello, World!   *");
-   bb.plain("*                  *");
-   bb.plain("********************");
+   bb.warn("********************");
+   bb.warn("*                  *");
+   bb.warn("*  Hello, World!   *");
+   bb.warn("*                  *");
+   bb.warn("********************");
  }

+SSTATE_SKIP_CREATION = "1"

Even if I made these modifications nothing has been printed in terminal.
So the question is how good is the example?

Thank you,
Andy

