Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11586.1793279494151456276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 06:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xVvrehzW;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53634b8328eso19543831cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279493; x=1793884293; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9kJpQRAEs6pwG6mu/1wzoIkL/PWDH2AYug+kGnELd8=;
        b=xVvrehzW6owU/MTbq2J9J212PbTJF+EVJy+lQhYOR+NYWFtEAdHxVpheqCzx2aLZ7y
         q6B28uUK5/wX1y126OD+dKxJcjoiXIBHsHdq961w/kEpUQcPcIRgFhGeHgwJboksh5SX
         hXC1LA+YLO6WflPz8YIL1wqyEhQW5i9nWzfaSOUdgXkExlRWLWfZI+7hriVp5gxwTx0e
         ZqZMNuThPhZOKnwZLGr3b4qDN5An0xO4ec87Hi2C0G2Vs+FrpQOqHR7gnJEW+gjwodqf
         /15rr68GiyHhSmjbybEqkbpKxVUoAWLRvRyYk2ZcLhMkDoXvN8dp5LEmE9eW8AU/BICi
         t/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279493; x=1793884293;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9kJpQRAEs6pwG6mu/1wzoIkL/PWDH2AYug+kGnELd8=;
        b=jCmYxKHkJVblOLlmDizn4DZlqdSL5+r03dGTVun2JummdhCDss2CR1AAOwzTac4/Au
         NkZs/2zGEQOtN28gD8TwPpxJDqdGeQpyG6O5ghHvs7aJj0RhmzeHDvG46sNa6PHE8GGd
         KiwOlgzGJWJE5d1fHX2rRoVZNukDKBfUmMglWx3UwxIfQFqWl55B3ExSmtF/irHV5ogR
         EksZhNhHJcSNa5lEdX0KJxk7T8OFirMOJFwhuTsUt5CH4q9il2iqZ+mkA9qqbNiO+THP
         2CfoA8Ef4iPY4yeedrv8P5sUNCSU/0czTBNfJH6fvMhhiiKPrbojA0ihdwfgJ90QDAuV
         tKbg==
X-Gm-Message-State: AFq9FYIg1XLvu1SvUJUvFxJjwxi45GZ3HnMlxY5cIFQ6dVaGxbkv/ZIL
	yPrBFcEGEazdXUNJjq8e8KlQNLjaNfk8QR6jEMOzs/SiXSV4Bzc6uMgs
X-Gm-Gg: AYBFou2xvZGh8G2ahTOgDAlsvpp2ya5IuwrwpooCRN54nJSdqpCnh78U7aPiGDoQo0x
	0MKfSfgnXoANFvrtGaZAWYi8f3DeSlXehTC/RRyMmpN9dphgjAKEqmcM7HwQW0ngF6yAMBMrdqL
	H0p1ZkNCQCKPGNQSR0rcY2Jf3Ph/dqh9blsg9D/uI9Hqh9uehPj8LUpXaVeFEym3Trpux8h9SU6
	eEOlxuhkbmG+EQkY3VxSQJ9+TgvjNrQEyByzTBqAddEtEB6AQZUrKgtLlbOQbMe7k0k/NATTLXZ
	Z+5NAZT/l4K3u1D9VXUUkHcbNe1aLKvPulvMAj7ZDjVflx3k2eAxyQllKHKv3nH23TpO7i8rzR0
	YHYxKHTXt4WGfx2454anqFxnUfdnYYBxZxtvmjm0xLonQZxJ3nPUr1NummLK4jr2kjUDyfyjFl2
	QxJpJKEKC01zkHAzP6IA1hmptbhaPLJAEY1zE3cKYpBzBoAOmh1R0Jbeexy2MrVTMIt2QpJy2dN
	WPkOWmNwzQcAs/A6ixLFa9whleV7vA9fZH0Qhjfw9lBy3d1iRJgEkzWCb5XCHUwZn1+r/dRUt2/
	OXNrnfJAIQcWkATtUyYdYuMVPk8r0aAoeF8b7YY/aW5Nz2NBhFSqJiQ0LVX3fUmp36TKMO/tkaq
	P1446w3ydIbzz8tYhdxitDmx5len9xrs5Wx22HSxIVS9BX9OrsPsG
X-Received: by 2002:ac8:5d09:0:b0:533:8c7e:c6ec with SMTP id d75a77b69052e-53fcbceb535mr85125181cf.36.1793279492814;
        Thu, 29 Oct 2026 06:11:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538397405edsm130838031cf.27.2026.10.29.06.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:11:32 -0700 (PDT)
Message-ID: <6ae34604.ca480166.87e27.0c55@mx.google.com>
Date: Thu, 29 Oct 2026 06:11:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: openembedded-core@lists.openembedded.org, prasanth.r@lineo.co.jp
Subject: Re: [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME for the
 image packages
In-Reply-To: <20261029060913.1586484-1-ragaprasanth@gmail.com>
References: <20261029060913.1586484-1-ragaprasanth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 13:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248946

On Thu, Oct 29, 2026 at 2:09 AM Prasanth R <ragaprasanth@gmail.com> wrote:
>
> kernel-grub adds its scriptlets to kernel-image-<type>, but kernel.bbclass
> names these packages ${KERNEL_PACKAGE_NAME}-image-<type>. With another
> KERNEL_PACKAGE_NAME the scriptlets go to a package that does not exist,
> so they never run and the GRUB menu is not updated on a kernel upgrade.
>
> Use KERNEL_PACKAGE_NAME, as kernel.bbclass and linux-dummy.bbclass do.
>
[...]
>
> +    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"

Minor: the 'or "kernel"' isn't needed, since kernel.bbclass already
defaults KERNEL_PACKAGE_NAME with ??=. It's harmless though, so I'm
fine with it as-is.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Bruce
