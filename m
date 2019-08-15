Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 681417F30A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 22:44:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q12so3576762wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 15:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=dZ1v2oVRmBGvLvmOnhppWgLVclDw0ykw0Ss0Z5vcrhs=;
	b=bh7pDPgCBpsoZ/yZjI8SDwMF7AfOQuinNSIv6Yvo0hqywavZRdCCn/TF19Wwzka3Ns
	Q8Eul0iKTu7gr13wSiWS7HYjGA/6Wxk3bwWGSMYORQs7RYh/0110hW5sTDvss7607vMC
	xd0n9tuHMbcyHrmNvfhNKhjMMWycssU15ZaJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dZ1v2oVRmBGvLvmOnhppWgLVclDw0ykw0Ss0Z5vcrhs=;
	b=LktkzimeIvurJBOELsJAUsxg0zendMJPsoK8EroT1GgtlHViFMt3SJuWkUTXCsh9eZ
	kPcAaaRP7PGXOXQ1yAMpvd7g6naInUpmHOVsw49u7ARakxcWr46mbNIDNJ/wgIihv4fm
	SVXukPgM5sGL42c/bEEnRgNxJm38I8VLb75/SY8f/z61CDilznY1BTfoJPpI008dZCWA
	3cOaKifxFU2Qdq7m9a7ipP4U2cyPz4yQnzoac83uu1vrd2j8zQFTO7yxF8gGX4ze9WSc
	ZwNRzKEpVVDEIqPlyjo0nCRkjkakpr+SKH6DlRAphIG17QlFiYWkxlxi0wrhZM2Va4Zf
	CxlQ==
X-Gm-Message-State: APjAAAUSBwkbsxpDC9HQBCrDx4WOAwAPmwpV+lzZeGYKWqVS4C4BXHzQ
	2wA4YoVR4OSCu2vuzUFJYDpPGg==
X-Google-Smtp-Source: APXvYqztV+Yzp8PbujBoi3+5jSJcMjo/r61d6gjEAbFw5JHMqUyEjDTcIUEyh10nsUGLrW5IBSm+rg==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr7853389wru.258.1565909055891; 
	Thu, 15 Aug 2019 15:44:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u129sm3871274wmb.12.2019.08.15.15.44.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 15:44:15 -0700 (PDT)
Message-ID: <9e75c7c4fa442cfc62a9a171e573a6aedf77ae27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Aug 2019 23:44:13 +0100
In-Reply-To: <21c7f2ef52a0776dbdc9ac948d3e964d0fd937af.camel@linuxfoundation.org>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
	<CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
	<f30af5bfdca30721a345f656c6f3762dbb947d25.camel@linuxfoundation.org>
	<CANNYZj_2GJt9=YaSJ8VG4gdEzxgtA+WRaNgknvQWmi6fHvQVBw@mail.gmail.com>
	<21c7f2ef52a0776dbdc9ac948d3e964d0fd937af.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Thu, 15 Aug 2019 22:44:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-15 at 14:56 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2019-08-15 at 14:56 +0200, Alexander Kanavin wrote:
> What is really odd is this on both traces:
> 
>    524436  405.102    0.001  405.266    0.001
> /home/alexander/development/poky/bitbake/lib/bb/cooker.py:264(notific
> ations)
> 
> What that means is that cooker recieved notification of 524436 file
> changes whilst it was parsing/preparing runqueue.
> 
> I would be very interested to understand which files its being
> notified
> of changes to as I suspect there is something that shouldn't be
> there.

This is a bit of a false lead. At least locally I found them to be
profiles of the individual tasks being written out which is only
triggered on profiled builds.

We should write those files to a different directory to avoid this
confusion of the profiles...

Cheers,

Richard


