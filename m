Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3843.1794253947589932441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=foX7Nyof;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so12964945e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794253946; x=1794858746; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4JteEGSZ8rsyvcHpBGCOWGdn2vZECOSSakptVc27Dg=;
        b=foX7NyofGqiVZ2MTbdXlbHh9NI4eTEh+nn7mrMeNg0wL5VJO3oHsq7jfM4zBSFHJN/
         T1X8FOA2LdftVk7GrWNb7kQNXDGq4L7p6X1rcQvCfg24EvUjKFm9PTpF4E0dk90DMUEn
         MQy9LXIjf+5A5uxBpYm4suZyUHQUNouBDP86gfaudn4EXZ+GjxNqyIhYZQwr53NVB30G
         bJ8tnt6flffqVGBrMti+mLzOJyMFRx6sgpCoL/cfyT61vzy7reJnN/gTb455HhjGvmH8
         wNh3uPRVheMHtZkT/4gxW6uNR6uvflhUdX7qvQ4il3Rqfi5233gPxqiIyOMyAq2N3KnP
         j+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253946; x=1794858746;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4JteEGSZ8rsyvcHpBGCOWGdn2vZECOSSakptVc27Dg=;
        b=NIkrsPOdP96tuM2Dfs/7rrYFaZtQNvkNHNxOPgF0jLjDEBtFNxY+W9TyNmtb4iy3/U
         iZyN6SjcCi8YbQ+XT4XjWIUPy6cJM8NcW319lY8GRIRfF5/EaqyStFM73wSTkn9yrb0K
         4tL7QJxGYg47C21stF9/OqaZ4VZuRr0qZN6GMyOgB75GOIoy21G3aJslEg5S6fjtxki1
         SLSSzUeq6kMh+W6JGTNa5d1Sc2YHPFh3GMUFmhevWN+6jdzVXEfbJGLAHSK8hlRCFmVU
         e4ACoTQDzbWaL3TXWQh3Rn35UCah8bymdSM/CKJQZ5kvlNp8jQHtGn8Pr6tSuq3ndk2D
         xAtw==
X-Forwarded-Encrypted: i=1; AL+hErH58I+BQMrjWBGq+E+UHyVk5Cwii77Gw3PU9ww+zJw4hdgFGz++VKbU9dJ1oO2mKhQIkoYIg5hKdyupkG6rJOn9cQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9uHUD3AqApo8zWzZKqb6bxG7OlQT7NRcRvBHJrEuCKLm7uWH/5
	6BcBWGOuxRlAzgG+b0KnbmuzCB47dDAe6/X+zLOfkb4IDRCAf+vxoUZiFRzNYpN8EWI=
X-Gm-Gg: AYBFou2J6AKbBHwLW9BB8Juz4SB1c4O4cRmsW24NA81LTqiZDU6aObO+xWx6zXhqoKw
	CWx0yAAnepDoqyxYJIzCYjHRbBkMvE1TeV56b9uB5Scsv7ey0JHM1NAhwkhzyItQSgJZfLYAK3c
	GIHNwgBFHOMD6Or2FYFy3nf1dPr7+vp+zv2GLqWbRvGlMbfdtw7vJQBP/R00rhusfny0aNTs/ER
	eAeaOHU+uogZSpKpxU+7lf1YQ6oI8bCSsC+9lUcnErONUbUP/ArEu9B2BuomCVIMpEqyJFCUwIl
	E+PbIf0nyPy/YI+lqewLoxkGCAv5a+8U7o6Pyg8IQa/sZCw4zy25SgdKE2nEBIZAW2TYx0YEEZI
	iqWDzy+uXcFP/7x0IC4ACnUm9BMEvUmSl+fp6d83l4rwuQpADqeMyoE+6TbWW3k6gTQ16yrv7DA
	G0bvHAm5zs7HASnZqw9RFuVVGBSKuALNNCr0ysFQBQHzju9HJbNM4cy20ytbBiy4OXHqrMOwWXy
	Kb76d0TPw/cV9anfp4R01Zz3RJUcaM/xBkMFc2aRoI/ZcXZnS6+G1FtjYMVkOFiEiGMq/kn6i+f
	vNA5skPSLv1bD3P63xlgily5LBhP4WHH8AjKnrH9aMPI2ZOKd67b82ZbMNg15++zTDE9B10SJrj
	5qS2wkZ2L2PDppe01
X-Received: by 2002:a05:600c:6291:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ba0234f0b1mr4631385e9.26.1794253945732;
        Mon, 09 Nov 2026 11:52:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef675sm10006785e9.14.2026.11.09.11.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:52:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 20:52:24 +0100
Message-Id: <DMQXXV4EAR2S.2L62KIFZJCR0@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] recipe_sanity: Drop rename overwrite
 detection
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <anuj.mittal@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261028081905.1780834-1-anuj.mittal@oss.qualcomm.com>
In-Reply-To: <20261028081905.1780834-1-anuj.mittal@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249875

On Wed Oct 28, 2026 at 9:19 AM CET, Anuj Mittal via lists.openembedded.org =
wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Bitbake itself checks for probelmatic renames now during key expansion so=
 this
> check shouldn't be needed anymore (it dates from pre 2011).
>
> (https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKe=
ys())
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)
> Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
> ---
>  meta/classes/recipe_sanity.bbclass | 21 ---------------------
>  1 file changed, 21 deletions(-)

Hello,

Is this a cleanup? ... in which case I can't take it as those are not
acceptable under stable policy.
Or does it fix a bug/error/failure of some kind? In that case, please add m=
ore
detail about it (like the error message, the condition to trigger it, ...)

Thanks!
--=20
Yoann Congal
Smile ECS

