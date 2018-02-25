Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 558 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 25 Feb 2018 13:40:09 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7C65F77D81
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:40:09 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 4A7C43F33C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 14:30:48 +0100 (CET)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <a469d763-d304-5808-30c4-533188aa28f3@pseudoterminal.org>
Date: Sun, 25 Feb 2018 14:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: Adding recipe to DEPENDS only if mesa provides virtual/opengl
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
X-List-Received-Date: Sun, 25 Feb 2018 13:40:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

A recipe here has support for Mesa 3D GBM based EGL contexts (which is 
needed for rendering directly to KMS framebuffers). However, this also 
needs libdrm.
I'd like to detect that the provider is Mesa3D, and if so, add libdrm to 
DEPENDS.
Perhaps it is possible to detect that libgbm is available, and I can use 
that to decide whether or not I need to add libdrm to DEPENDS?

