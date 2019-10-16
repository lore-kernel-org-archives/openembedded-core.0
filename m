Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAD07F353
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:35:34 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w67so18332292lff.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3qNzVipS3knkI/vvvrYBzQVnB5wavW9y+LhSrLrO8SE=;
	b=B9Ep+TMybIwuWG3Qm15XqgpPamjPmoa4o6Q8vLD0RoqroYVBjJLLC3UcGTvdt31YfQ
	H2Q+Uqk8Jiq8kU2HfjnbLeYd/IVtYG33L+/w9cvrCBcJww6ECyuJhy4u+mUE+jaPDd4f
	bejg2WMqBpzM+/fsiC4b9aFa4WJmmSx3VWZPEmqv6Eunc6L3IGB8VUnl8Pk5Qk4acAo4
	DRVgF4EGooWEOBIqlEcTuUJuTiGKGJsWPPy1EXmYd8kr2iUN6gi21IU3RoWdO5zhE+E0
	iOeUzK+jrdnqO+XTVxjJsA54DXyMPVz5E6AssRoVAduDI8aKOVpS3ZQyGQFbNV+7b4HP
	LbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3qNzVipS3knkI/vvvrYBzQVnB5wavW9y+LhSrLrO8SE=;
	b=YqcN31/4hck/bjQVDcc4uCX5izhTG4BbU/KeG/FpdUM7XotgwbFN974X9ynBDNxLXW
	XeLxk10cQY+HyBofyKrz71/HdYQyITRIGMBWuY//mZenE/nbWnnZDLSmXT2XlJSemJxl
	Ty6W3ppo5okfUNDLZRIYLPoGMcj4WMlTU42Yegfy8PmqZxWFJgRAW58mb8jZ08sdGrGT
	If+jqJxqfT1bN3X0pqH+gUCRguPsOHTVRx02K83zG62c+P/Ndhk2agpv0xyZSF/Jpugg
	lpD4OdBCSopXQ94a25Uyeyem7KTW7bxak5TPKAuBtHs7tTX83zYQFRTXghS53h2/D817
	HNkg==
X-Gm-Message-State: APjAAAWmvTW9CtDlxpp8lsNP2yZ2LeAAm6b7cvmC1GGwcyioPLdDim06
	qhk73Kg8VuR4iKi0GcnZF++rLK364/Q1gzT8E3YlgY6muj4=
X-Google-Smtp-Source: APXvYqz/K2thuNHfhHv900YacNiw9+k6FZm5zVL5/cBQw33BZ8dVfoydnCYX9tfE9yFdNqyY7tMA7W2/6l5RTAKo3mk=
X-Received: by 2002:a19:ac01:: with SMTP id g1mr25958334lfc.141.1571250934660; 
	Wed, 16 Oct 2019 11:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191012165433.24511-1-alistair@alistair23.me>
	<CAP9ODKpmB_kkXtd0LZEK-KWaK2VFM_T7yGjdwkyABR0d-Lgsew@mail.gmail.com>
In-Reply-To: <CAP9ODKpmB_kkXtd0LZEK-KWaK2VFM_T7yGjdwkyABR0d-Lgsew@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Oct 2019 11:30:26 -0700
Message-ID: <CAKmqyKMp6y8hbCaC1rgvHezzHAWTmX6xXtRhXFSSEaNMyoEOXw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 16 Oct 2019 18:35:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 16, 2019 at 11:21 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Sat, Oct 12, 2019 at 2:01 PM Alistair Francis <alistair@alistair23.me> wrote:
> > The glx-tls option was removed as it isn't included in the meson.build
> > file.
>
> Why drop it? Update the patch, please.

It doesn't exist any more. It has been removed from mesa.

It does look like it has been somewhat replaced with USE_ELF_TLS
though. So if musl builds break I can re-add USE_ELF_TLS. I'll see if
musl works with it enabled.

Alistair

>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

