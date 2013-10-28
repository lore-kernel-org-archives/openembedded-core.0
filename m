Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id E9D7E6D1BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:30:58 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id j1so516445oag.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=E9qXC3LGCAec3ojlS2qWWsKIlP91n3CbrsjTXh8jegU=;
	b=z0CT73MQ55wtHLukrfvqpo+CRv2ZCGjQEXDAGPrW0Q7MH7/VoLBCa7HJ1MdO4Vg1lH
	Mnz3+UwU7lCOr/SNUQDci6Eq7g3Q45WRfcYgGs3MVQpzDG2r4VsYzq4UvK0w3Hb4n1SL
	1xzX6QcvsN3T7OR2oZZri/ipWqGffCyUHy+dp2ebdu6XwDX+F9Ekb4fFd0/lH9eop/U9
	V4DfHlT4uw6uIei0rvtpgBsG8dGrdQiLcU5Hndj6ISOPOzPDvErH+hieXJfbDjRim90o
	/IKFIJL3XeJGYfbWMNPYu4MOm1gP6nt6Q0fnvIjOhX/jPF9jVGVa9FNwPG6uO5dH/Xde
	BftA==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr81084obx.89.1382985060652; Mon,
	28 Oct 2013 11:31:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 11:31:00 -0700 (PDT)
In-Reply-To: <1382984521-22179-1-git-send-email-eu@felipetonello.com>
References: <1382984521-22179-1-git-send-email-eu@felipetonello.com>
Date: Mon, 28 Oct 2013 16:31:00 -0200
X-Google-Sender-Auth: RWIvEPSMG41odb-0QwyhbnK3Ymg
Message-ID: <CAP9ODKq0_L_1bqOuDE70vNXCbQ=8Bcs9bvAtC2BafGStyz4Mnw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Tonello <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] psplash: Show psplash before X in reboot/shutdown process
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
X-List-Received-Date: Mon, 28 Oct 2013 18:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 4:22 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> This is interesting because if you shutdown/reboot a device the screen will
> flicker because X will be killed and then psplash will take a while to run.
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
...
>  SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
>  PV = "0.1+git${SRCPV}"
> -PR = "r15"
> +PR = "r16"
...

Please  don't do PR bumps.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

