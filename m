Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A21CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:00:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7775.1790935205235926367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mYohQzcH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 713D91A10D7;
	Fri,  2 Oct 2026 10:00:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45025603DC;
	Fri,  2 Oct 2026 10:00:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BB0510328455;
	Fri,  2 Oct 2026 12:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790935201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wUQm9E0Z8O6f2r2R6A8dUIck7iZceo2nEZ0w81DBIPQ=;
	b=mYohQzcHBhO0s4smWSZtUOoLbMl1HtDfCIGLcoI2K2f2i0At54WbErfXyTceYiMuTcqCMp
	wRtd+7oFNAzGdubFac3ezdHjGJtMJOURgw6vrh2BSnzvyBdZYi0P9390RCTZ7TP2xk0QFH
	VLCopZ5L+h/D4Xd5lVRg0sWpjIPP9vIJnvxCDXTHhgRqObyZQDxHtd9rlCL7dtIsju2IIN
	ql/1pwUxaxdfX3XGW2HSyptRytuhJaNwLiifS6DbGdcPViVaPagfTnTxlR3n1w5ACb0Ffy
	XcD22/PFWDs+6UUp1DoSTj5e97WDxXW+HRXvrN5o1D0okHSU/lqDxS+SFkvfQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:59:59 +0200
Message-Id: <DLU9JKOBR4XT.PP4ZR1D3XKUT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/9] acpica: upgrade 20260408 -> 20260930
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Jennifer Chukwu"
 <jennifer.chukwu@amarulasolutions.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com> <20261002-mathieu-2026-10-01-upgrades-v1-6-3fdeab391403@bootlin.com> <6905022a-cdb2-460e-9bab-53b352149463@rootcommit.com>
In-Reply-To: <6905022a-cdb2-460e-9bab-53b352149463@rootcommit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247098

On Fri Oct 2, 2026 at 9:51 AM CEST, Michael Opdenacker wrote:
> Hi Mathieu
> Thanks for the patch!
>
> On 10/2/26 9:36 AM, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
>> --- /dev/null
>> +++ b/meta/recipes-extended/acpica/acpica_20260930.bb
>> @@ -0,0 +1,345 @@
>> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgr=
ade'.
>> +# The following is the difference between the old and the new license t=
ext.
>> +# Please update the LICENSE value if needed, and summarize the changes =
in
>> +# the commit message via 'License-Update:' tag.
>> +# (example: 'License-Update: copyright years updated.')
>
> You forgot to remove the FIXME section ;)
> By the way, Jennifer Chukwu sent another patch for the same update=20
> yesterday. Your patch has a better summary of upstream changes but hers=
=20
> doesn't have this problem...
>
> Thanks
> Michael.

Oops! I definitely went too quick here, thanks!

Good new is I picked Jennifer's patch for testing, so my patch was
already dropped. :)

Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


