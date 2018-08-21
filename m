Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7844874E1A;
	Tue, 21 Aug 2018 22:02:16 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d131-v6so4365597qke.11;
	Tue, 21 Aug 2018 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OzTwNt0Tdqr6fYbRauKBx+xan3EfZM2mm1AtQ2RySvc=;
	b=t89YbJb+eYsRav8ttNBS22ZSSEGdICGNZ3Rdkd+XHPzDLGmyGe9owEvB4UcRRktbQx
	7vA7/TBQ7RBiqvXn+dlrZjMq3eoANxYTWOtRk64GewgcmyrAjt1v+REdF14kLdpdtNGt
	l7fx6Tg4j8n5Wqi3//w3iaeA7fj6pojQTVLxMzm4LfEfRbuGwENg2SK1V5wzVdmOAfFJ
	huguez3dy8gwlDl/VAEIe7yl7lAhTAT2PZFKjRRppzJaK6FOYMA5P56epbHVa47qDEm7
	3SclZo69bfs50NxVVf5bLafhbjrdWv4h+A+MsRKjKLafyjm1chcI0R0Lm+rewsWqBLRd
	WqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OzTwNt0Tdqr6fYbRauKBx+xan3EfZM2mm1AtQ2RySvc=;
	b=tZBRoQlqxBLAparWMfeciyu4OLAcng/5byR/sOAnucOBXDyXU/aE6Xgo1hLlmq2l0d
	asJPMPt1iqXPN7fS5nfgWo4Alu5xVECiMsK2M6jplAe/9bytQV7Hdypkf+oU0Q5nInlE
	0p8/ehvRMnnR/z2hG0WywjEhxgM9bpXNiW15GGNZc8kpTmVRuei1OrUekcc2RJN+nZZm
	ZkCgxCQ16hFQh5r3bUwbrAp7Q/uXqanIuAnkuWCjfBLJktUDqhOWtJc4WWU99rrI7KQy
	DihWMMyYgBKVUjpbHQ3uYR7c5nUoVcADYN1LeQs7KPGTY1NjenoYNEYKl05DUsFXnTqG
	kwvA==
X-Gm-Message-State: AOUpUlFYjyaDfwizC4MiVoMyGDhgN2/V2a2Am8Jupgyb0M30KuDoS7Sh
	+WmbJLcjd0SIl0dGvNhoMsd3+2BvHUb3q3um+EM=
X-Google-Smtp-Source: AA+uWPwvrT8l3NZYTGorNLhBt0XLBmDce82M8hwdM9FVee3FO+kssJIe+3VfKN4aobhwb137cfSfTU9ppeSCHRIx9jQ=
X-Received: by 2002:a37:21a5:: with SMTP id
	f37-v6mr22006982qki.206.1534888937072; 
	Tue, 21 Aug 2018 15:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
	<a6e6fea9d8763611b2df805006639187f9c95326.camel@linuxfoundation.org>
In-Reply-To: <a6e6fea9d8763611b2df805006639187f9c95326.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 15:01:50 -0700
Message-ID: <CAMKF1spOozHrDEvdzWf+YKVP3OqGg7uicLpYBitLAGMPF4RQdA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Tue, 21 Aug 2018 22:02:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 2:58 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-08-21 at 08:36 +0000, Jonas Mark (BT-FIR/ENG1) wrote:
> > Hi Richard,
> >
> > This is my third attempt getting my reply onto the mailing list. I
> > suspect the first two attempts were filtered due to the link to the
> > v2
> > patch I added. I removed the link this time.
> >
> > I already sent an updated version of the patch to the
> > openembedded-devel@lists.openembedded.org mailing list because an
> > automatic system informed me that I hit the wrong mailing list. I
> > propose to switch to openembedded-devel for further discussions.
> >
> > [meta-oe,v2] directfb: fix tslib version check in configure.in
> >
> > Sadly, there hasn't been any reaction yet.
>
> FWIW your messages do appear to be making it to the mailing list(s) and
> you can see them in the archives, e.g.:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120115.html
>
> I look after OE-Core, not meta-oe where this patch needs to go so I
> can't help with that but the patch is on the right list for them to see
> it.

its in master

>
> Cheers,
>
> Richard

