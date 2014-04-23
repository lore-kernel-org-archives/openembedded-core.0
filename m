Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 037DA6098B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:36:46 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id h3so512426igd.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kfy1uq24B7AX6v6GWduBLyr9XtcAir7540pQkrsbBLM=;
	b=IjEcgzD6auo8vuHpHsttdeskRGfX1ZN7OFaq1vloooMDlBlz8xVp2XLu448lLNI9D0
	226H3FLdfX3ZHwpSsnDHaZJNK2lU2/P/eOGJbAUEKSd+xx13LkDS4IEjZHLwMWa/iL27
	huADPwQePWKSEzNNPidmBFqet7JOpqZ4Ufc56zbYoofKlhb3ZEl38P1XhIeYLVNTSf+f
	OG/pI6W2/YDVH56J0yQT0U/F4r42RyNfdNktaxXaym4HY0UlCcKJ0QtrDKBT1sKCYsHj
	qro0J380N7oLlJruq5DtV9QPsILlmH99oXF6iQC/8Kmvi2MziaX2DjR5KwAh/eFUEd0v
	OUwg==
X-Received: by 10.42.157.74 with SMTP id c10mr6436064icx.74.1398224208108;
	Tue, 22 Apr 2014 20:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 22 Apr 2014 20:36:17 -0700 (PDT)
In-Reply-To: <1397456023-21015-1-git-send-email-B40290@freescale.com>
References: <1397456023-21015-1-git-send-email-B40290@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2014 20:36:17 -0700
Message-ID: <CAMKF1sqk_9W1gnRnsK5Uh=t_uFAeRK_6scBKMQxa5L14pkpuWg@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-modules: update to 2.4.1 version
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
X-List-Received-Date: Wed, 23 Apr 2014 03:36:49 -0000
Content-Type: text/plain; charset=UTF-8

2014-04-13 23:13 GMT-07:00 Chunrong Guo <B40290@freescale.com>:
> +# lttng currently blacklists arm with gcc-4.8
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> +

is this still the case ?

