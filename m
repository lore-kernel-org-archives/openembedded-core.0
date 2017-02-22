Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDD773159
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:24:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DF98D22627;
	Wed, 22 Feb 2017 11:24:18 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Wed, 22 Feb 2017 11:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	smtpout; bh=R3FUg3OmWrtBhajpOrL0TSZ51VA=; b=pDqzWuHU99Fp0zmvPPt7
	6XnWrslRWK/XD248by9laXej0Sb4FVUpCxwtAwfo1pHnzO3+M3bR4vi2aKG96s1K
	TedWBL3GgtWBlm0ozHFR30/9/GSAIt/cnrH38Ig9wRxpMx+qS/ykdb1SfgX0G9YF
	XaqJF3wleXE6cF9S/9T4ncg=
X-ME-Sender: <xms:MrutWBRRxdr1PXqTm6SDXtWZjFle_VGO3d_RUfj9ONPeKqozbi0d-w>
X-Sasl-enc: wAVSGMCkLMD6UlO1xtxS3KyHI4Hp/AbJt9uVOAYZaDMx 1487780658
Received: from laptop (unknown [192.40.95.15])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E1F624355;
	Wed, 22 Feb 2017 11:24:18 -0500 (EST)
Message-ID: <1487780656.2292.3.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 18:24:16 +0200
In-Reply-To: <CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
X-Mailer: Evolution 3.22.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Wed, 22 Feb 2017 16:24:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-22 at 14:48 +0000, Burton, Ross wrote:
> On 3 February 2017 at 07:06, Tanu Kaskinen <tanuk@iki.fi> wrote:
> 
> > Relase notes:
> > https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/
> > 
> 
> I'm seeing a new warning now:
> 
> WARNING: pulseaudio-10.0-r0 do_package_qa: QA Issue: ELF binary
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/pulseaudio/10.0-r0/packages-split/pulseaudio-server/usr/bin/pulseaudio'
> has relocations in .text [textrel]
> 
> Would you be able to identify where this comes from?

I'll investigate it. I'm not familiar with the topic, though, so I'll
first have to figure out some basic stuff: What does it mean to have
"relocations in .text"? Why is it a bad thing to have those? How can I
check if a binary has relocations in .text? If you have quick answers
to any of the questions, that would be helpful.

-- 
Tanu

https://www.patreon.com/tanuk

