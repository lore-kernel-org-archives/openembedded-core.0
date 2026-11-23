Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51453.1795429216314067051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=VnhhAHH1;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1804847f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795429214; x=1796034014; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+dP8Bg8yzEYHHgHN3haR87Cgi4RMzvrKsrchGOG4A0=;
        b=VnhhAHH15q++kcNe3ishDkwnC2VB4HI3AGE90yy0cWqBAqAqFtdOszjBH/3ges0W6L
         2txhTKEsZzQn63j2MXCk5H5LwYmN5ZFG7vAdW1UnxP/pCkbtNACRaAozF9v9tjd4lNUX
         QwWBL2X/MvwVPR5hQ7hwXSfe0fnr3AhgwSiSZML1vKduQ9OZlN/MTYw4mitrfct2j0EL
         5Fl0OxlVTSQ8ZyvvmZzHazjqJ12DHH1rb10Biz2hhZC1MJvwfbvr0Vlnt5UBmNHbiTs5
         L1I70eLxzUgS9eOYQmOsENR4neXhfAaajjx+O/GfPBkjhmVb90ONF03InPR796nVIPMS
         zLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429214; x=1796034014;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+dP8Bg8yzEYHHgHN3haR87Cgi4RMzvrKsrchGOG4A0=;
        b=1tsI2sUItavkxBBaQFZFN0B950jjl9ElD2wlJYjQj2vbQehZxiGdtYHBTB+C+ZclJb
         /KoR5TeDCig1eIiy7Um3C75K0QYwistFs3SlNsQMXve6kE+ejlyMnR8pie2mjnvku1cc
         BHhudOpGbGAfmJfFZnU0Y604zB9UUlUkfyXjrHoAA7yuISFd9IrRMf0m66RcKW2NKbYQ
         /EjfYuuuuO1rz8VSaIEKeATJQlXeLyP4YsTO9AqGL+vVx6bkZkH4+sQhgNhOn15Bg247
         6QBXztoAe9oArwVhIKCDVyaFjkShVTrL+hFfHSipHBUP23zHn4ekUTwDxmpplOKQjHZu
         s+Pg==
X-Forwarded-Encrypted: i=1; AL+hErH4wEedKvF5+XcwD0lK5yrQ4RUUhHRsZ+2t50+K0smTQNvwKfI1QgHwwuozw9G9Uk6KVZ4sxnY0FXGh4OnJdbmlmg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8kUzMngyNwGimcnOq6RLQyUHmoFvsxthBV9JPoGcE9uJPLehSk
	jA6oZQ/jlk76ylh0XLabBreVgrlBICgESeELzU+DXSBo2hVWgOpwAt3lG8xHXjkbrmQ=
X-Gm-Gg: AZFdTZfu57DjTC7c38pdf6APkQexbx6LWs3xmR9SUY0tCG9ucTkMl6beASAdMzrnpJ0
	h0jEKlLjv3l4HnGEA3VcNjXodVKBm+ghVyUfbS1qDGfVM6+MQ9Vr7tcWOx25Ew+rdpHWW4j4GoC
	E6OJuvWc1RfBBJQKe8mkYShvJBSbQW9y4U/Hm0+iJnxe6bm/xUJ3ydQolJ2WQf032zwy9iyZfea
	nv+1ZXDzuuhGFtvGb2fsYror+mn2/L4GyX1XnzS4i90s3bTDBZEgWJhE1lJONayzhLkBSv4CcVp
	Jxka0mix4if4ZkIKT2uxF2CQKZ/3DXB1T4blM7XmF2wqsMPt6zZB9e4es9YTBaY3OrRZ3XJQW6/
	98z3VvF5TeNvWClMGmGD4S2MqRf7gYamwP2/999eJVT8fxOtE09AUTFC/Baqd7rdgq/Q4yIf5p5
	uQORfRaQRbyzpCDdyLYZGt7zRuz+IXdA5XOyGu+qQxZCySOuKplwEv36UWQstztSnmsBapCMNxu
	+jPlfuPZbcYZ784A508n+VOyGW9rPOVOxFQ6PdctbB4I8URYDO2MAdsdxU+xqpngxUjuDtAHXmb
	zxC0dCZdcCa6LM79YCZdmX91kX4TERdOZ+q9JNqy27zrozxYRZ0EObpPutIrHEwu3+3Px7dJZq/
	jk0PPPOITyrENJLk=
X-Received: by 2002:a5d:5f51:0:b0:4a5:a777:b5d5 with SMTP id ffacd0b85a97d-4abb4c7aad1mr20268431f8f.55.1795429214253;
        Mon, 23 Nov 2026 02:20:14 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm21833919f8f.28.2026.11.23.02.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:20:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 11:20:13 +0100
Message-Id: <DN2IJE556MYC.3CIM6I6ENRFHK@smile.fr>
Subject: Re: [wrynose][PATCH] image-buildinfo.bbclass: add missing vardeps
 to buildinfo_target function
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
To: "Rasmus Villemoes" <ravi@prevas.dk>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261111121642.3628757-1-ravi@prevas.dk>
In-Reply-To: <20261111121642.3628757-1-ravi@prevas.dk>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250896

On Fri Nov 20, 2026 at 12:01 PM CET, Rasmus Villemoes wrote:
> On Wed, Nov 11 2026, "Rasmus Villemoes via openembedded-core" <rasmus.vil=
lemoes=3Dprevas.dk@lists.openembedded.org> wrote:
>
>> From: Rasmus Villemoes <ravi@prevas.dk>
>>
>> Bitbake does see that buildinfo_target depends on the value of
>> ${IMAGE_BUILDINFO_VARS} itself. So adding an element to that list does
>> cause do_rootfs to run again.
>>
>> But bitbake does not know that the value is a list of variable names
>> whose values are fetched, so changing one of the mentioned variables
>> does not guarantee that do_rootfs gets re-run.
>>
>> Fix that by adding all the ${IMAGE_BUILDINFO_VARS} as [vardeps] for
>> buildinfo_target.
>>
>> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 69543bcbcebef81e2797a0cf5662602876998ca4)
>
> Hi Yoann
>
> Please consider adding this one to the wrynose queue, it is quite
> similar to 99cab65285 so I believe it should be eligible.

Hello,

FYI: Not sure how but the above mail broke threading: https://lore.kernel.o=
rg/all/877bi76a1p.fsf@prevas.dk/

On the wrynose backport: This needs a blacksail fix as well. I'll
consider it for the series after the scarthgap release.

Thanks!
--=20
Yoann Congal
Smile ECS
