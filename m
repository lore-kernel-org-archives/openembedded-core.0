Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA05FC981C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:45:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46663.1774860311909711193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yIpfEDkp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 110B64E42874;
	Mon, 30 Mar 2026 08:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB4EB5FFA8;
	Mon, 30 Mar 2026 08:45:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFCE1104507BA;
	Mon, 30 Mar 2026 10:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774860309; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g6aPFhxgsyOKNvbf6jHjt6cUq1YUve45XWGAhxTeGy0=;
	b=yIpfEDkp3GDZBfO9SvywTOQUG60PixfNsUA1psYbAV3sZirbtTL1mCkl5xe2AEfJZsishJ
	EtjvIT1X0ZkUaf9FQYR+JqgHxYbgM4yE5hzBwgHS9ZQc3aJNxNZUmUnogCI6eHFxu9Mdos
	HgefysZIRHQxK4d/mbW+96rnlwiIaMLhDbDtmS/rEQ0yFEd+zCYfpZk7P3EpOIB8QfgE9C
	qEC4TLptgNIbbx6Mv+LeKjE0GRmsqrmPqpSFwuhkbL5I/gm6V69mp+EsENWYT+MgdhWL49
	Ly5NC5TIlKTbvigh8Xd7Ly6YSVvmfd5s+jkZUfBjJ8W7VXIw/+fLr9VEgsBCGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 10:45:07 +0200
Message-Id: <DHFZGX7DZMOA.2A5X3GLAFO3U1@bootlin.com>
Subject: Re: [OE-core] [PATCH] ucm2: da7213: Add ADC switch in HeadphoneMic2
 sequences
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <le.qi@oss.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260327084754.431898-1-le.qi@oss.qualcomm.com>
In-Reply-To: <20260327084754.431898-1-le.qi@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234206

On Fri Mar 27, 2026 at 9:47 AM CET, Le Qi via lists.openembedded.org wrote:
> Enable and disable the ADC switch in HeadphoneMic2EnableSeq.conf and
> HeadphoneMic2DisableSeq.conf to ensure headset microphone audio works
> properly on Talos EVK with DA7213 codec.
>
> Without this change, the headset mic path remains muted and capture
> does not function.
>
> link: https://github.com/alsa-project/alsa-ucm-conf/commit/8a9581426459e1=
b423ef87d5ae0fe0a9e21eeaad
>
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---

Hi,

I note this will break meta-qcom, but I suspect you are already aware
of this as you added the patch there.

ERROR: alsa-ucm-conf-1.2.15.3-r0 do_patch: Applying patch '/srv/pokybuild/y=
octo-worker/meta-qcom/build/meta-qcom/recipes-multimedia/alsa/alsa-ucm-conf=
/0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.patch' on target=
 directory '/srv/pokybuild/yocto-worker/meta-qcom/build/build/tmp/work/all-=
poky-linux/alsa-ucm-conf/1.2.15.3/sources/alsa-ucm-conf-1.2.15.3'
https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/489

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


