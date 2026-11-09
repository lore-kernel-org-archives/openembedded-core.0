Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3332.1794220517165515962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 02:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LjpYfG+K;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so6663685e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794220515; x=1794825315; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uJ5Tdik2L59kuDn8fSchZEGxlZZKXa9/kkBFrUAoTK4=;
        b=LjpYfG+K4vjvOVbemuSO3zWMZM/0s19oE7LAd+JSjx9ufWY1KjV44Ii/RQ+LHQe3Qe
         l7dIY7JbbQBfzdjmqjzdqud7QpjwuvvKxdTvC1kPOim4GexwTpIXFG5F5FVvSyzA7w+Y
         O3i9JCfUGgypTHdhoGibupLooX4YkOLUmuUXBhLj0bFAviBEOQDVFYe29MOP+Klpyl85
         l0Lvxzh8Ue2JuTPv3/HJcm7xbGSEK7HUB+Z46KUGCYwx5aiX4G8iAsbRKJeYINdBVVz7
         X9lCVzFiunb/Sm0iI63Diq1pYxGlXnH5oyE2ll/GRwO5nTdMVVrFkeMsKU7qjXq1Lu8n
         nZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220515; x=1794825315;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJ5Tdik2L59kuDn8fSchZEGxlZZKXa9/kkBFrUAoTK4=;
        b=X16iN/uNqq6waRa+cPSjlHHlRYn51OgmTYxOdGwHtRYC81gDMvjYBv4GIFPVPKag4y
         HMHV3RXc7+hgGU3PBJ8i1wS1O7Y9r9W4wM2FpocSc6qG4UC3hDOUpKC6C/ixjdeXuW4X
         TqXbeNy8QoZ8h4J1YUMXV0fibEyKkDy9X8eJTuf2bUEGx+iuiLzy47VcRgPMfcOGiR94
         zBuvoevTlOMZ7jywvXAS4PfPac8SmVFDRV5Kfemdg8RkKhUlYIoBTRe44HhxpHfp1uXh
         QRhb8wsnJVJNva8C4HROVJY0csqLJGEXw/wH5u0fAQnWUzBrdbyAj+hjxnnoPRd7JmBR
         Rzqw==
X-Forwarded-Encrypted: i=1; AL+hErH9IYKiOY4tUewialKfZ6fdPNhmX3B7a5462+V/L4L/hZ+Saq9c2AI2BxOdVMIc2QHlglGdZA8qII8G7cNxuagU9g==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9Tc4OjhjhK9igBxJmtR7cRkG2/DeY8dgEjom9MJcDyl6WCFRnM
	S5so+DB2jhTqr45DsLeHVZOwY1/1GancZ1bjmcyrmMfBc/LNQmTeptXJNpKIJHxA570=
X-Gm-Gg: AYBFou1jxojufLvBr04TVKrXnm4K+Wh1f4KVWMoYlztH9v7DO40QJdY4+3/Zi0114xv
	yVIVlvEXt0H5ZwYt19ZyQvuUypYN8EaEVaGFcZJ98zPND/szr7EK6NGyle20q+pE3Bcinjq48W7
	erLKZtMomCzDwZX2jRbLYbeNc7NdphpflLqgpHYvtyDQjkeYIQgMUQ0LdbPwd+8jy66UCS3HlHq
	/nsJp2eKf7K1sudPH9/G8xWsOR+xTFmcRx6mvLeRIxDaeq/dvc6rt0V3/kzns1CbGNIu5AuP2Hv
	79RyZpOwskyLt8WHdnLZupmIg9LopbBZVT/hLiVopvFCgFpt5u30HdRbs/9lpiDcwxoOfRblQwy
	grb+csSDn8Ejm4zSQLbUF0xSceeNzLnYmvLn3LlPz9oe5KIZe+TkmWAanDhaIhPYsUVuBxRHdR8
	ayd+0iAjN7oW70Iw1Nn1AX158/a7kBY5yShUpwSwJO7Y8pE/j8Lxk701T371w1Kvf0b4QFsEpxi
	iEowGoB2Im8YcziV9RN+qah4yKLcqqKvGw724Hqo9ICSgMIiET/9+jv7uLb2pOxnS8QP2X6sqmi
	FaQ3rs7YBpcRL8Q4uPVMcdu3hs8ypr0kZDf+ppLh0T2bK7hEcsW88WCZPgP8YeVUkf+itHoveI5
	rSJJI7wpE62eRKox+5Ajcdet+eE1bBH6X/po=
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr72775455e9.5.1794220515224;
        Mon, 09 Nov 2026 02:35:15 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm239413625e9.14.2026.11.09.02.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:35:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:35:14 +0100
Message-Id: <DMQM398KNGL2.32IEK4LYGUG8M@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 3/5] bluez5: Return correct error
 when SEP is inuse
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-4-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-4-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 10:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249801

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> Reject AVDTP_SET_CONFIGURATION with SEP_IN_USE when the SEID is
> already bound to an active stream.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...turn-correct-error-when-SEP-is-inuse.patch | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Re=
turn-correct-error-when-SEP-is-inuse.patch

Hello,

FYI, I would have squashed 1-3/5 : the 3 patches fix "SEP" related
issues (whatever that is) and could be regrouped in a single OE-core
commit adding the 3 patches.

Regards,
--=20
Yoann Congal
Smile ECS

