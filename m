Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15735.1795705771604078394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=SrKPZwsn;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Nbi9W9hp;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A754AEC092F
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 10:09:30 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 10:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795705770;
	 x=1795792170; bh=gFrDg8tmatn6bEG2mvv4FhBb3L/lkK9xc4c2D6TMQa8=; b=
	SrKPZwsng0DmfuTQIvaCJBtHoxCQ9B5h+lwyjr8iCNpYMCFbKZ5ofBEW2i2oG8Lk
	DB/mdckJoxITcW1o2pJ8PFjUY7oudlLZkUi0FAlRrxrwK/+vnzlUUnKcLoOd3bgc
	/Mp1ejTY88TchJQzGn9OtAfOwbSUD5eCopgsja4ioc/13VGuZ8GsKuL+kpL1EaEH
	nLH6l53LLdR/rkf8E/QDLgS9hBouFSnhyrpp7QhXTT6xMsL2PzlNV9WMoeVvjAk8
	KwOoBEnFkvVeqvqsGQdJiftSUyZsz/QsxSx23s1iJLCcDtfPDVKCumJjmlmAKig2
	qEY+RP56PKfx29GpAvS1aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795705770; x=1795792170; bh=g
	FrDg8tmatn6bEG2mvv4FhBb3L/lkK9xc4c2D6TMQa8=; b=Nbi9W9hpIurzrHsZ0
	SQtpUNM9bvqPcqW0EptX1RuQNfrd1bSDdNfs+vnJ263onKplROf37u+QRpAUtPkP
	d/XDEPub4xGeBYIhMA4nccinjdSsH5gHE+zDAPjwIukCDHyUqJRLIlNW/y0ZBQUc
	w6J+xSDHMf8RT+0NZWVYr7E97PscctEKftb4YHkhYMzyNmSPXyrMprjn+4vxdCEQ
	V02OfkmX5s3ELWvXgrjBqqhC1Ge8kGST9KKPctlWIe/ioobsNMqqEeAaWZ667+E2
	qWV/9nDV2edsX29c/Gv3cKVYUG4557G6NK89LvCNcV6A2vqreGXAaiKj80XEq8p+
	8JvrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795705770; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:BE8M8M52ZlKvmHNiGoN6m3wBz0WFCOhdiK+LhPSopIh6XRf
	yi1TgQIJ1lLM8VlpHef9IfwMv/4xxZpEBMMj42qU7h8QtlJGIAq9aAL5dvAPVUb4
	GFnBqftA4UZxLaVKYXz3aMZ//TtVjqvBqpFxeBNE6ROS+rYITJTRUfCRnd3kMMgF
	6uex7zIJRq7PwZJVFYOoDyaBYlXl/RNdQKBusOXkFN4k6ktZt8hT7p11WflcrzaZ
	E3nuqxT5tEaM2nDj0WYGRQFtngUBA8fSXcIaD2D1kzeMFexe1h5D21s1cMJ+hItZ
	09xD4bK5UpeUn875Wb+RMNDtU848uA8bOxXjj5Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wn5kekF8Zfj3WedkMWtweCSsLDe1oPiEl79VIh/8J1w=:IQR0qG6m2ld5brke/S8Tl24Y4cmupwLLndH5fXOx7Bg=;
X-ME-Sender: <xms:qksIa4lYsO3nn6oxi__2bSEap0wLMCklYyYc1CCOxZp23ExMKeYHGQ>
    <xme:qksIa91ngOh_-2eTZqMMfVflrQt7Jxylcm41AzaT38tzTyIdzkaejuefaDYYFpmG4
    DfjWPIz6UktMOSHSC1Km1eLfnYCyKXaVXd6c2fJDxCOljJvh0yL9okK>
X-ME-Received: <xmr:qksIa0S9AfaNB1ed3N9ZQgkWluEC4RiZ46LG1IWr_qjNAd1HEvA_JVSFM7P70YAVzuqode1C33GA8rBl4C3RKvSLjshr>
X-ME-Proxy-Cause: dmFkZTG1c//Mvyn2yNWID8bcNMjg5769jONwusPzKQxbri+2T4mCe1Ypj9ZF6QhndmskV7
    uwJkJNKCIO3+qTE7cDmkNUWMRjQi8Ivnq8+oxJ9sUYAcs7NhvkbmQqMP7NVjN6wm9KFWRI
    J1FOYsbixU2ludti7clsnCxBwJxS1FV8SkgHzhHxU5spsKKvkX+qeqDDD2QjBMO8uMg3ZS
    07XPFqlNIqIjmNZhmjd4vVFuJvMRYveWP0UYSktfAalNIoyLfTV+foai5Fd51pl4G0HhYy
    qeA/5YI9DCvpyZJp8tWTkz5cB36v0aLOmpUumgg5d/mSEfSvtJEIrjP6wUJuWUkqmqtHJB
    GJHMkXL+k23UGdjoJEru16rmHFMHT87JnKxW4Q+dYTJW/Ypc8FDY4R8qYw4yk1MT73Q9ID
    9Qg8CH7VSpRZdVJzL3a2RDewJIA2Fx+qNW2i3+3JFSyBDM9xcMOp8BfoH4qyWE4xfB+9oW
    4JHcZVRkBWa6d9YPSNPZpHpgt3mBN42BQmXYp26C9QIFsOgb9ZOUmkjDfEEKGYaBDfBte8
    B0GpUB2J0ET8CRkQBUeXaenMs/c5CnJ1/PZZ9WP4nJGWun7G8fVYPHhRB5BfNRUPInd/hO
    oXY5dbV48BsSd2zvOXqn2Jav8t6jGkptYt+D+8J4CBoL1V707d2KlO2xaI6Q
X-ME-Proxy: <xmx:qksIa_v2UunJBXdzoYCeyuXNsrcMbgcMdZODApJ05ob9_PUWsTSmmg>
    <xmx:qksIa5YoYyWYrpJ-ju4rMVfEs_qjUw7GcbKKb8ltR1UBu6y95frEaQ>
    <xmx:qksIa0v3jh2-8-zmDVYuIsBSm1Y347iGW-kCbtJCUsr30-w_A0c5zg>
    <xmx:qksIa7FfxeZQU21BI8LFoDbr3YvKa6h6Jw20uaJFB2CVP6iP-B_SxA>
    <xmx:qksIa0BRp1UDBAOSqjMmLSp0_ErUgnzACThHwcAeIRe9qukaCUVBCDQJ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 10:09:29 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 15:09:29 +0000
Message-Id: <DN58KHZSPJW5.37L7ERKRY60B1@pbarker.dev>
Subject: Re: [PATCH] systemd-serialgetty: Fix do_install for mixed baud
 rates
From: "Paul Barker" <paul@pbarker.dev>
To: "Niko Mauno" <niko.mauno@vaisala.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261120163326.6114-1-niko.mauno@vaisala.com>
In-Reply-To: <20261120163326.6114-1-niko.mauno@vaisala.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251313

On Fri Nov 20, 2026 at 4:33 PM GMT, Niko Mauno wrote:
> Since commit b6a7617145c3 ("systemd-serialgetty: use existing unit
> files in systemd") removed the recipe's own serial-getty@.service, any
> SERIAL_CONSOLES entry whose baud rate differs from the first one fails
> do_install, as the unit template it copies no longer exists:
>
>   install: cannot stat '.../serial-getty@.service': No such file or direc=
tory
>
> Enable systemd's serial-getty@.service for every console instead, as is
> already done for the first one. That unit runs agetty with --keep-baud,
> so a console's configured rate takes effect only where the kernel has
> set it up, i.e. on a kernel console. Since b6a7617145c3 this has been
> true of the first entry as well; say so in the recipe.
>
> Tested on master and wrynose with mixed-rate SERIAL_CONSOLES: both
> consoles get a getty, and on a qemux86-64 boot with "115200;ttyS0
> 38400;ttyS1", ttyS1, not a kernel console, runs at the 9600 default.
>
> Fixes: b6a7617145c3 ("systemd-serialgetty: use existing unit files in sys=
temd")
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>

Hi,

This seems like a step backwards as we're dropping support for
non-default baud rates. Can we fix this support instead of removing it?

Best regards,

--=20
Paul Barker

