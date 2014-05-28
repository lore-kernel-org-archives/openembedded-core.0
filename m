Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (unknown [209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id D45756FBCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:43:24 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hl10so2983611igb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eEYJKmr/jpq/B9P8uikpzXzphYEJJOYilJnGIm6rh3U=;
	b=TZkK7G6CEwd0NJdAlPgcV4B4moLZT0QbsswQMtHfgyoh61+6LVdKcHNOjWsZbHIKo0
	n/zZ+Fe41cHZ+kQYctw8du8YovFU+hkln6xzqihqjzq9sheu7IgcwewfjpMEusfjqh9Q
	ZvvVAxb3CQsi4eQF4KNbnGnrxBdFaXyFgYInAolZvReaUvNBKC1oILWU/8Kon7e+K1lD
	nO8Wvf73baP8Kp2LWrBz2hpoODVHrSlVMmPWQSItd/ZWJ8axEG/17UKnhyhG+q2koV4U
	Rbemtl8iJ1mY69lXMObnyHPXVMV2WmGYZPZhgkDNUBWBJNcFn0pE1oawf3bM54e31bL0
	sDcw==
X-Received: by 10.51.17.99 with SMTP id gd3mr47211041igd.2.1401309805748; Wed,
	28 May 2014 13:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 13:42:55 -0700 (PDT)
In-Reply-To: <53843793.3030309@topic.nl>
References: <53843793.3030309@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 13:42:55 -0700
Message-ID: <CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Wed, 28 May 2014 20:43:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 26, 2014 at 11:58 PM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> I have a deja-vu feeling about this question.
>
> I have this recipe:
>
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image-miami.bb
>
> Which includes this one:
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image.inc
>
> I have a build server that exports its sstate-cache directory through HTTP,
> and a local host that attempts to use that sstate-cache. This works fine,
> except for the recipe above. Building this recipe takes about 1 hour, so i
> really really really want to share that state at any cost. As you can see,
> I've done a big shotgun blast of "vardepdsexclude" to get the recipe to be
> as common as possible. Still any host wants to build its own version.
>
> How can I diagnose the REASON that my machine thinks it isn't building the
> exact same thing as the build server?

see https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
towards the end it talks about verifying sstate sigs

>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
> http://medteceurope.com/index.php?page=home-en
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

