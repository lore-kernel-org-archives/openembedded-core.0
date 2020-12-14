Received: from wforward2-smtp.messagingengine.com (wforward2-smtp.messagingengine.com [64.147.123.31])
 by mx.groups.io with SMTP id smtpd.web08.1284.1607972864602612045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=fOEOPtw9;
 spf=neutral (domain: iki.fi, ip: 64.147.123.31, mailfrom: tanuk@iki.fi)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailforward.west.internal (Postfix) with ESMTP id 328FB608
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:07:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 14 Dec 2020 14:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YExzUd
	OofZz24xQwVFS+yEnQnchRNusJA9ppn5332zM=; b=fOEOPtw9uDLnvrgnAHbXK9
	j5Q6bLq6fPuD+22Vkqb2DBfGVZmCdqj0fp313Nbj8bkFLfqnCkUHuEmr3mjiK0yQ
	ZdwmDPThz1SWKNQW5mrgEsVgmB7+rS1r/tfoHfBBx127wBXls69DmNqYe/ac/pr/
	2N49juXnCFDM9zUkDJgZN3BWZ1g/PzGwoaafVti2lzVP8qaOG3fTieijjVCTLBur
	ojGop0qwIyoJW9UQRq6T0fdLf55jLkJZcKWtHa2FGQMXCteiYzWnlOf6JxCblmiJ
	UfdMYth+ojvcw0h+t+jzFbEHGxJJJOG/5Oio2cBRXzwvfklJfowQWoQvqvrl4xbA
	==
X-ME-Sender: <xms:_bfXX02RnSagnSoAdFsvQUfdOzuQOUp2M1KgMW_soM9uwoVp6rq_7w>
    <xme:_bfXX_CMEyN5OiigLqeY2yhCyrAQmjNtVBKXsnEz8RX8dlg0E1lHnklJrp-duUeeX
    A58X6GVQDw0gbuS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgtfggggfesthejre
    dttderjeenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
    rdhfiheqnecuggftrfgrthhtvghrnhepvddtieeiffejfeeludejuddttdffgeetueevff
    dtteffvefhfefhgedvuddugefhnecukfhppedukeekrdduvdeirdekledruddunecuufhp
    rghmkfhppfgvthifohhrkhepudekkedruddviedrkeelrdduudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:_bfXX5yXVy41-QaC-TqSI3UaZocAWiAaZvuB5mrj0afXI86fn6FMFw>
    <xmx:_bfXX1mi_DpyY6A_rLNbTOQtUiLhootO1KYS931Ga_wIegtrzPjXig>
    <xmx:_bfXX2EfeP7O8Cg6sNiMWWCK3AhhyLMWrXkCPqzxdtIPZZ3g7f8h3Q>
    <xmx:_rfXX-6Ekfpu2gOrlZyW635oQLoXx8Crpi5W7r-qMPvj_7v_k_Bw9n7UReE>
Received: from laptop (unknown [188.126.89.11])
	by mail.messagingengine.com (Postfix) with ESMTPA id E8C63108006A
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:07:40 -0500 (EST)
Message-ID: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
Subject: I wish to drop my recipe maintainer duties
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2020 21:07:36 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I haven't lately had time to do OE work, or maybe the lack of time is
more rooted in lack of motivation since I don't objectively have a very
busy life, but in any case, I think it's time for me to step down as a
recipe maintainer. When in 2015 I transitioned from being paid for the
work to a volunteer, I had plans to use OE in hobby projects, but those
projects haven't materialized, so I don't really have any connection to
OE other than being a recipe maintainer. My experience of the community
has been very positive, it has always been nice to work with you, thank
you for that!

Should I post a maintainers.inc patch that changes all my recipes to to
unassigned, or should they or some of them be directly transferred to
someone else?

I will still post some patches for pulseaudio that convert the recipe
from autotools to meson. I've had them ready since the last feature
freeze, and I intended to submit them today, but I found out (as I read
the mailing list for the first time in three months) that the recipe
has had a major version update, so I'll have to redo some tests first.

-- 
Tanu

