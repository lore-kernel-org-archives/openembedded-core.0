Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
	[209.85.222.53])
	by mail.openembedded.org (Postfix) with ESMTP id DCEEA7F2DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 20:58:01 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id w12so4808877uam.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b8ZLHIaSYJrwT2JvHWgsHsxo7kxvrtdJqxSobakmrlc=;
	b=kp/arKiWpu3k7M8WRqi3UaRYRnKq4KUa/iDJ9JJSeXYsZqtyv4LWSZ4/0ZGiKxh5Gf
	izdn+wkxlsDnk4K6gXrLXJd+LPVaM48to6VpCkHgyRs5aWq0PezB1OUbmwtuSNzZkdHr
	CvOjVDSUpI1lf0CLBrZ3uZscwnqbp+QpJmqN7qTpOvtZQbwpKvMyBAsoP0Qe6KL0P8Tb
	2IIAxjFDltKeKK9fhTvU4v1UtH03Pg38GRMUm+TNAjjihfoXKuLjp45z0PzVUdkTBOBm
	RQEJBTKCZabodQ9+RkegwHOZpU4aKIkBc1jfEbtltbsAveHZGWlo9Ag3f2sHeFyQQOBS
	QmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b8ZLHIaSYJrwT2JvHWgsHsxo7kxvrtdJqxSobakmrlc=;
	b=c/JSJtAUNe6dSFx8QGUKR2rKtebc2KOY+xWPA/T98VSrbVd/vkZ8DBxOUlIwPGnjm6
	pGkcs4xHNmNxRKskDhSRk/fe2CdtmLueLISdqf3FBmdTU2aWD1kbvvCexVdNvQyoEWLX
	YPG0RV+ECrUAdigvKPATgytUDc67wGCTm4L5eOWLBmewH8V9bGVmEQBkvKRIQ5xutImR
	4I1cn2FGUbLTkzNDBTE8AgtdrcIME08X+yC+ingGvah5Be83JcMTBiAU1yoiPlwtnJAm
	JH9FRCkz/Bhs09voM1YGtD3zdGcBw4kcxi2pKOlQM86M476YRLvQi/TDwx04xaBCAnLI
	c5DQ==
X-Gm-Message-State: APjAAAUaPyimn3odvCuegLdnLhR+5g1eR/Y8Ib7tNESuRh+n4QQ3aJl5
	j4n7I4wOYUX8rulxGUwANfB0uPLEwoZp+UROPNw=
X-Google-Smtp-Source: APXvYqybqRCE1Tx2PaZ8qtxoVnWREq8LOsHh4VcNb4wOox8nJ9TpMJ1QatyMl6Wx+0hvqpdQ51CwoPWqFTSKNzRB4oA=
X-Received: by 2002:ab0:60d3:: with SMTP id g19mr3618065uam.81.1568062682762; 
	Mon, 09 Sep 2019 13:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
	<CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
	<CAP71WjwuAbAd=h3WdW=Ku8EaFPx1=z8P2jvbWA6yvAHsGuFPkw@mail.gmail.com>
In-Reply-To: <CAP71WjwuAbAd=h3WdW=Ku8EaFPx1=z8P2jvbWA6yvAHsGuFPkw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Sep 2019 13:57:51 -0700
Message-ID: <CAJ86T=V5kkimWLjU59kJuCECaNutn6__5zY3qvawbHvxhjbTww@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: make-mod-scripts question
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
X-List-Received-Date: Mon, 09 Sep 2019 20:58:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 1:25 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> If this reasoning is correct that means that kernel signing + external
> module is broken. Note that I am working out of Thud for now, i am
> sending this email for now to get some feedback, and will try to
> reproduce without all our custom layers and with master.
>
> Should we deploy the keys/certificates in the kernel recipe instead of
> adding them in STAGING_KERNEL_DIR? Would that be enough?

Maybe even better would be to have the module signing key provided by
a separate recipe and not rely on the kernel to auto generate it?

