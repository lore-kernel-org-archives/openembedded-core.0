Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 942A57BEDF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 15:08:34 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id c12so9730005ilm.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 08:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qWM8NC6XgNdNjYWEj2EKx+6jp0f22RoNFZAu4LDDusg=;
	b=dbSRxy8dO7Us7efXt89kz9yl7l9U/ZYAVGC+Wn+iyEPoqpeHu36iLfyGsN+vyg6heL
	z81I7/R1e50Z95MRk6xDBp6mPm93z73yQZ1Hhwxc5XyXc063IKC+ztNxBCSE6iYOWCt0
	7vwbjcJYfQ4wEkws9Qbd5lmAYOMld4mnQebx+plk8P+dSGU1OMZ6mpRf/KxrEu6/KS6W
	fwnF7aUhbdD8Ds3vR7A1rdZfb9DWljjv5d2F3Cl6ZwLvVP7GN4CNgGh6k45/RhTnonf5
	am6Fq9QpKWk0y32FidUTuWh0GLutKBSBPE3IvNzffyzedDq8N8cjXy2x0uIQHAu2lCKE
	CtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qWM8NC6XgNdNjYWEj2EKx+6jp0f22RoNFZAu4LDDusg=;
	b=j8A6ATGfKd9u0xDD11ncc7BzcCCpVHOLoiafE08zxdDnT4lmbRZjLjWsk8IQmbVaXd
	Y5FZTAE/gpcKuxP6DqLFE/AAIL4Adli3Zhzymhx93Vlh6woh8htSbdbTLXJRuPhBUjeq
	wR/0ybZxZDAHtifj4K7VD+gWPcxQRcHdTufG/vW0USqIMyMfQ1MgomZtjRsX4ed8vpQy
	kfwSm5dsNzcieiBCxmxa2Gx3BlBJCLDMCjh23J+9LehcM+0A/X2wJHf6yU8KizQjcX1u
	RqKlI2QR4y0Sn9a4tWEPPC3itnXhn84dV7Mmrl0VW/mYS/KZwbn6CF6LG5noHB564tQH
	idYA==
X-Gm-Message-State: APjAAAWnXErgWRAkJI2IMe8jcTy6ZjjalFkpatNzE8Y8O03cu7r7Sh7z
	jOb/yg2ndc4ZXgSfdxvNa3w4s9rIVfaMB8rVsvM=
X-Google-Smtp-Source: APXvYqzaQTkMGROJRpOusf3zKzKHyjqq/CPLha9LZtHNe1Vsp0NI3KpPNhlFPy8TZiY7+/7wKthMo1cSAFbObOlrGQA=
X-Received: by 2002:a05:6e02:687:: with SMTP id
	o7mr22409721ils.224.1571584115591; 
	Sun, 20 Oct 2019 08:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
	<CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
	<311c58c4bbfdd575f4b0c3123d8f833482f580d1.camel@linuxfoundation.org>
In-Reply-To: <311c58c4bbfdd575f4b0c3123d8f833482f580d1.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 20 Oct 2019 17:08:23 +0200
Message-ID: <CALbNGRR7rL5TcRGiDgjW4-v8UrL7j3tcT86jio8_qTmZ2fBL-Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sun, 20 Oct 2019 15:08:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 20, 2019 at 2:32 PM <richard.purdie@linuxfoundation.org> wrote:
>
> Feeling suitably responsible for this breakage, I looked into it. The
> following two patches, one for meson in OE-Core and the other for dconf
> in meta-oe seem to address the problem. I'm not entirely sure they're
> correct but they don't actually change the library binary so its
> probably fine whilst upstream sorts it out.
>
> If they look ok to you I'll submit them "properly".
>
> Cheers,
>
> Richard
>
Had exactly the same idea for dconf: in the discussion they did
link_whole->link_with for libdconf_common which is wrong and was just
meant as example.

As soon as I finished bisecting do_rootfs issue (reported) I will try

* dconf-patch
* dconf+meson patch

and report.

Thanks for taking care

Andreas

