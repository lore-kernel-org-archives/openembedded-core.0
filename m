Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65FF57F4F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 23:31:16 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n26so5199922ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 16:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iBqwfclbj6tg+StBL/2MyTVahAhfqBEfGamQnHbTZd4=;
	b=H1v80n7UpGXTLpwUm7S3szvJ4qrEAreMJ7rKzkZ20ZFOoG5tQtGhCM0dPfSmJGKvSj
	WP1sPkSiPReI5h2eVr8wION9AsNj0VR+7/1pK7OI2gYWBSOAKkk4tjJfg71whDbg5rQH
	COI6I88ESapuNb1FXuJ2PZ9wDgxekDc8PomXAWAW9tkJu/wku1++zq5i8p+tENZyIYNQ
	gwE6WzNkp5g1IDcEyyAKTintcqWfouoDECMsDGk189XdeEtLjtGZunNFXYdITL0obEYn
	vgeJTGqWRlwb4/Q46j77GQtrYGokbzF2Z+oj74t+gz5vKxfxXm9oHvd06eSKMe2Nk5qH
	Cv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iBqwfclbj6tg+StBL/2MyTVahAhfqBEfGamQnHbTZd4=;
	b=PyHc7EmF41Zum2bSYQ1RccPDcwoAmUcMHZbi/EMoxDzXeA55jjKMdmYdd8QyZ9xJKP
	Oi4vWz39XvdQgDaiZNhmUlXc4C0RJiUilpHIX084nWERmfxe29dx12gqJoN2b4EnF1Rd
	flxYTAxVEWh43ZYsrXugQDtIUBhp2k8HDEQJTUoSlx71vTDvglhw07YvXTixsW1gXulQ
	Bc4Uwkpa/ZUcTgzp9ymBVFalpPp5kZZWJZK6K2hCjlUcqVwyRg9xXVsQx5+vvrU6Mb2m
	DEkK9sxfeAPX1UJkC+zml0HDGFRAh8I/mcVLd/cYaVj53t9T+ZJVmrSEfX3454XeaXeM
	df/w==
X-Gm-Message-State: APjAAAV/m7kwIQcFnFaSeBKDDqwzIjpUVcg/bErYvzRr+dMgE5VkLOlR
	NJDltulRZpH83lM+wSvfrs1v9rST1pQ7S9gL6Wc=
X-Google-Smtp-Source: APXvYqy41Vua1kdlXvHfPs4Ml0PK0h/9H59fmb93/Ju9Yw8pkiG6SR4JvhH5Sv7TNyxc+jjyVtZmaqfRNjuXrdnmYN0=
X-Received: by 2002:a5d:884f:: with SMTP id t15mr5934104ios.224.1571355077213; 
	Thu, 17 Oct 2019 16:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
In-Reply-To: <CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 18 Oct 2019 01:31:05 +0200
Message-ID: <CALbNGRTzdqJmgkztmS4NBvYkHVtpNL+j1xvNAFCn8E6t+7LzwA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Thu, 17 Oct 2019 23:31:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> > meson 0.52.x seems to be exposing the dconf build issue.
> >
> > https://errors.yoctoproject.org/Errors/Details/273492/
> >
> > also reported here
> > https://gitlab.gnome.org/GNOME/dconf/issues/59
> >
>
>
> Regardless of this report, this is now merged and I don't see any
> resolution either of a followup
> from the submitter or any other developer. This is quite disheartening
> since it takes a lot of effort to find
> these issues and reports. we should try to be considerate of the
> layers who are trying to keep up with
> OE-Core, like this we won't be able to improve the quality of these
> layers. I understand that there are no breakages seen in OE-cor but we
> should encourage more
> of other layers to test master and especially if there are reports
> than it would be good to heed to them.
>
https://github.com/mesonbuild/meson/pull/6030 looks seems to address.

Cannot test currently - am in 48h build from scratch currently (with
this patch reverted)

Andreas

