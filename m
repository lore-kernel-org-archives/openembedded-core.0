Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36415.1793890875885099774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 07:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j08Pg+EU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 70ABF1A03D6
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 15:01:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E2545FF85;
	Thu,  5 Nov 2026 15:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 952A3103291F9;
	Thu,  5 Nov 2026 16:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793890868; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ex4yYZH+f2IusOhFfEP6pW7PQStuFr8oTf88gN7AN58=;
	b=j08Pg+EUdNp0cGsn+jh1IMaBGP06muqKFAOkwxi9T4Rh4d9VlCuOhjN4l42lUnSnegO2yO
	FbCOcu1U8m9QNWfEDPYIB5RPkHSGY6rQnfTagvJHWapOr++mMowgxNOmN+NzICQCoP1wOl
	ku4rIFt4s3vT8ebnC9IpMjdFRdxbf7G1P0oMulTOVElKIWHEOG1Fb8XFiJuGDlQTNkQGQA
	WJX3NYDBzWPD/O8JQPywZzsGnZE3pA+0mFo0+V4daN2OyYhSdSDV7i7Zn+UVuq6KuOJ0wB
	UpMs3OfhGmv92p3R1C2ARPaioYFnuVci2pvIJj838LYQSWlgrYYl+li6mr22Ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:01:06 +0100
Message-Id: <DMND8NCBAAIS.2WLJVJJ9MFLNE@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 0/6] Add multi-kernel FIT image support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <vgharaee@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261031162649.944625-1-vgharaee@gmail.com>
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 15:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249561

On Sat Oct 31, 2026 at 5:26 PM CET, Vahid Gharaee via openembedded-core wro=
te:
> From: Vahid Gharaee <vgharaee@gmail.com>
>
> This patch series extends FIT image generation to support=20
> multiple kernel images and custom configurations.=20
> It allows different kernels, such as standard and real-time=20
> kernels, to be included in a single FIT image and=20
> selected at boot time.
>
> Vahid Gharaee (6):

Hi Vahid,

Sorry, I've been a bit slow to reply: this is conflicting with the
"kernel-fit-image: drop the synthetic FIT_LOADABLE_* values" patch that
was merged a few days ago. Can you rebase on master and send a new
version please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

