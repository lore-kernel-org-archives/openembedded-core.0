Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9296.1795676544487890459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 23:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TjqilOG1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB4861A1804;
	Thu, 26 Nov 2026 07:02:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A94660237;
	Thu, 26 Nov 2026 07:02:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D85D11E6B098;
	Thu, 26 Nov 2026 08:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795676542; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W8sPvDRTB8GacH/ETHVbKXe7szUtyfoXFDzT29x6lRY=;
	b=TjqilOG14ZeAJZMJQTJfjLMvI98jFWTY/rZX+j0KwOL3hIQfZnY/Knv++DAnflBvYO3VaN
	991FrWzAeincJaZEfl62+t/AYTmhLnV/XXWCGteZde4mmIkmY5PXvZRABhKLiAWExt+WQS
	9uR35nkHREcYzIUSJP2hskw4n/12nCDYCWODcH/A7KjtatjPWlMpK/G31LOrPMz1pkKpYu
	4/yNIDZUEcn4XNXcpPME4V9C8xIHHWQWgQOsTfeDdkD3+TvoLTgaBf10qVX6kbKH3eiQVj
	rwdTurKXKxgkDXyF4RS1Nm41da1sZF1ilK41KPBbB9JUKBBzcC7BA6/C5YTTgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 08:02:20 +0100
Message-Id: <DN4Y7IH66QLD.1933S5XKTTM6E@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] gawk: Fix intformat ptest failure with
 clang
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261125165405.2553247-1-khem.raj@oss.qualcomm.com>
 <DN4Y68XZKURY.32DWV83QF4P1W@bootlin.com>
In-Reply-To: <DN4Y68XZKURY.32DWV83QF4P1W@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251284

On Thu Nov 26, 2026 at 8:00 AM CET, Mathieu Dubois-Briand wrote:
> On Wed Nov 25, 2026 at 5:54 PM CET, Khem Raj via openembedded-core wrote:
>> format_int() relies on undefined behavior when converting out of range
>> doubles to integers, which clang optimizes in a way that makes the
>> intformat test fail. Add a patch to range check before converting.
>>
>> AI-Generated: Uses Claude Code
>> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> ---
>
> Hi Khem,
>
> Sorry, it looks like the v1 was merged. Can you send a patch update
> instead?
>
> Thanks,
> Mathieu

Sorry, I just saw you sent it already.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

