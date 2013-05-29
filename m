Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 093616A633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:24:34 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id b10so1270186vea.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=lb28RPNC60gilpUl3ExcUROWVIsMKnbhz+/f5eGi5sY=;
	b=cd/vztrwUV7ex3SC1Rss8aQdgx7ro7njvi0VeVYzQ/2sKOryXGQfmZaXiB1/aoVY4K
	TIrGbT7zUhWCre+ErLCF/DXwzroaFzIB03NVmXJ0+se+QAkITqy6djKlhBcS7f5nMvgg
	NhhkTpbQ4clFrCSNYDEqcmNhbucuLwFidVl3PhY2pntnurqKCfurVAPVNroyoK32yTWu
	RJuMKoKqKjx8mvji1k6W0NYX/13xnelssFMQ8VtfoaPX2aFEQwwx3symhm0uDEsEhf5T
	xSEH5EwjczrkZ1zG/mic0A+l+l6LRJWD6SLO6uO9nYhUZYH4Q9J8eU9VhRZyjjhHjWlF
	XG8g==
X-Received: by 10.220.248.137 with SMTP id mg9mr1883358vcb.38.1369841075558;
	Wed, 29 May 2013 08:24:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 29 May 2013 08:24:15 -0700 (PDT)
In-Reply-To: <000f01ce5b5b$c64e39d0$52eaad70$@com>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
	<000701ce5b4e$3c7684e0$b5638ea0$@com>
	<CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
	<000f01ce5b5b$c64e39d0$52eaad70$@com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 May 2013 16:24:15 +0100
Message-ID: <CAJTo0LbLEH+S4OpoKVQyeV2j2gV9pkzsS1L9vyoB=SPSCzL1VQ@mail.gmail.com>
To: Zongchun YU <b40527@freescale.com>
X-Gm-Message-State: ALoCoQk0PvzVsevgrLe4H4PBO6r4ukz5gTh4ClvBAWR4rr+4F1+azYesZxqRlWJ0XhBxH7t5OZ5d
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Wed, 29 May 2013 15:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 May 2013 05:28, Zongchun YU <b40527@freescale.com> wrote:
> It seems that setting it in environment is a workaround for the real issu=
e.
> Can't the same be accomplished changing busybox settings?
>
> Can you explain your idea in detail? Do you mean changing the setting of
> =E2=80=9Cresize=E2=80=9D in busybox or other?

Yes.  At least for my target, CONFIG_RESIZE isn't enabled that I'd
expect to be required for this to work.

Ross

