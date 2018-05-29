Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id B18F16022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 18:41:30 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e67-v6so9508486vke.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MsskWtceLX0WuEBiMjtwm2TqAu3EjzK4EFqlip2Y3oQ=;
	b=qkgIlS8CxITGx+cvcHdSXb7xUYM+Dgo14hiVSLe9rtR9+rHwztDIDjBe2BAVMgRdAM
	8sly2SvUUrHIsWofJw7cvDxR/MF6kmQ0lyuQCBlkWYevfKHXpr6j9Ip/LE1AWdEzDtXM
	vjQ4OaQw3ZTGzv4X1CPnmQB2Hx9+/I8e2SgDCOOl/Cr6To84wxvJR9rEwKqaYty9RIXG
	pn62DsLlM5AFmDWErs97tWT8Ioc3d1jkilgKhycivzWwbs71PB4Df8s/ptC331jaP8cf
	nQLVmsEU8VmQDakg++VUotKbzY5lBg0vt9eXd19gbAqQCqkQ5CRskURrsFrnefTuXOpv
	imOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MsskWtceLX0WuEBiMjtwm2TqAu3EjzK4EFqlip2Y3oQ=;
	b=CvVSRavqWrnx6j6l0Bt/mKjMdtUDCdDWKb397IJPwGjwnbKvbkyRxJ3bafDwiqPPNK
	zQMvNPd8csmk75SQ7YMJiVcmrax2BGpOSh2Wa6QdotekVFlQ6LMNu4nHZO0pkVC2hHgg
	rX+eaqKDqTQc9d1KdTioDFr8RI5mFxil8HO0/Ndc8yGc3mQeT21BhzodOzix35TbX7Nc
	CcN60k42pFzE+mpV/3gY2I7LenIexQaRNtMGguChgtXKVDunk0SyGq7PIWzLlAPOTQ0d
	32K8QbjcU1WFRt4bD+3XYsqkuPus5EEJERFP4gfk5A9eg/fsvwQtJHCve2DQ6gGvw0Kc
	bCAQ==
X-Gm-Message-State: ALKqPwdB7Lq7AHBBUt5VeoGHEUki3/F2Poc5952EcG5dCMis+qjX4UdJ
	lYAxQd8bG1ToTPbauNY9ASOVPJOXTiOScPNMvOi+Jg==
X-Google-Smtp-Source: ADUXVKK9YZV3cJjoCx+JgYM3hqqDSdf+joqtmYLeDzI7/PuhG3qm+zml0x1OArJIvwIf9TxERjiMQJEfMBlXoLAyeYo=
X-Received: by 2002:a1f:e9c3:: with SMTP id
	g186-v6mr6064131vkh.194.1527619291345; 
	Tue, 29 May 2018 11:41:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 11:41:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 11:41:30 -0700
Message-ID: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Tue, 29 May 2018 18:41:31 -0000
Content-Type: text/plain; charset="UTF-8"

This change looks wrong (or at least incomplete and lacking a decent
explanation):

  http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=fbec01f01fdad23d95271db063ee0a4d0ab44568

It was never posted to the list but seems to have made it as far as master-next.

