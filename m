Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40FB078694
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:58:21 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c5so1976764qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/W7ZJQ27WE1XQlJIAuHmInheetYCtc3YomW1HxAqk4k=;
	b=gJOgG7lm8Cd31A8HUi9hIqDqw7IQxwKliOb1dZ6FE0swd8g1OeG5AmIj80YQ+FJpLw
	u3E/ACwPN/oNPXMyW8VGFZN9EaSR18orCcDk8mNVtG3tNf15ElWHiSGNR/snTAbB3EkC
	2DuuXrMSaffd3rztbXEQM20J/sY7K3hidDBV/XDLtm26uu4n04RCmWJen3Fzx3R73lxb
	OJwhTgeNT9v9LbTntTFe4322tFGqueBXwqevU6IL/9yzY/uXEPnX41wjFy9eU2jRrMCD
	XE+Y0UxxImfO0sQ9QbiTVhR0ynU+Hj5nFVXe7/8+K/4sZtBHk+zKuFVTyRa1bojt9xnx
	r23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/W7ZJQ27WE1XQlJIAuHmInheetYCtc3YomW1HxAqk4k=;
	b=j/Z413GWl2miN8m6pK4zUwHiTlszqEx3IJW9dSynuK5Vr2RyP/87q87qHRqTHd0bzC
	gh6uA09yXgO8HhKPMrT/UU0Ae7/i+xcEjyJoBJBIZ9FRhb3oaB7u+xVZlT/FeXfs97K5
	IA/WX9B5nkl6ojhLSzx5roj9q2Ro+e1vKQd6vbe/QEZDtijs2IRt2p8+wdClkguoodiY
	ICmU5jDSBGWTXBzBYt9PmPyuM53pS+1zYTDEfXLps8rj+X7wE2QIWTtMN2ST+ProQnRF
	Gbqs63LynM2bysBT9XbSeI58x7bJrdQjplIOs7bhZimuap5PIXbGwU2Fm12wcYFjZD43
	kZiA==
X-Gm-Message-State: AKGB3mLgsIPz86Lvy91pIiJiPtO6ri++fiyjjYHZymmtuViSe/JFaBdE
	v1dglOwmQPQGN4hur1AkoLIBm0ab6Vg29wvVW4Y=
X-Google-Smtp-Source: ACJfBot/q/cvHZ+fO++L7q2qA+rGSkq1y4EqzYvO76/x9bH6pyZpj9TV0z260qIMc3iJLugPQVcn9vWX/Ma2+vCO+qg=
X-Received: by 10.233.221.194 with SMTP id r185mr6038590qkf.141.1515074303150; 
	Thu, 04 Jan 2018 05:58:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 4 Jan 2018 05:58:22 -0800 (PST)
In-Reply-To: <1515053647-10815-1-git-send-email-zhe.he@windriver.com>
References: <1515053647-10815-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jan 2018 08:58:22 -0500
Message-ID: <CADkTA4NqH3ErPkd=z5xQ3crd3esy+8DWnWxLyvdj=ViRM3nFDQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add paravirt_kvm support for qemux86-64
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
X-List-Received-Date: Thu, 04 Jan 2018 13:58:22 -0000
Content-Type: text/plain; charset="UTF-8"

Make sure to cc' me on any changes to linux-yocto*

Ross (or whoever else), I'll pick this up as part of my next consolidated pull,
no need to do anything with it.

Bruce

On Thu, Jan 4, 2018 at 3:14 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> This feature includes paravirtualized KVM guest support.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> index ed65f77..ebfed3e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -35,4 +35,4 @@ KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/ta
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

