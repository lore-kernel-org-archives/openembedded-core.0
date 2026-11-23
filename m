Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51592.1795431820868442411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RImDxulH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2391201f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795431819; x=1796036619; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MY3yDLLMuYlASB7CcmoV0yES+ViZeWfO/wy+ruJRRl8=;
        b=RImDxulHfADy2uu6x0vrODZ2n4N3LYUk0E4sr/cPZh6ufQogN9/K8kRueu5HL2cbWf
         oc5VX4OJ1sQrEcrfpWCQuAdL35WRvwHJiWno2MVDZnzCpuXb1SnDR+68/TaM4Dv+lKrt
         uAQ6bTnpRy5SxOhcZcDvJSbRNMSwYKgtQQNzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431819; x=1796036619;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MY3yDLLMuYlASB7CcmoV0yES+ViZeWfO/wy+ruJRRl8=;
        b=l9p4lu31i5X+NH6BOgrS7HqF86V9Hdyy98LI9C/4a9ZQQelQ2Yj6BlamQe7H5amJfW
         foeBwKdqQDzM6hXDjAFWhSAeJZc1fiJFmm9QdML9v6r57Aska8hBES0t7d9LKv52CaCO
         WaMSeFxhAEi9kwG2O0S6C3ABmVDkSAU73V5ITJmqWSCDx4YZ6DaWYFJL7gODGEZIxyPm
         +NJkKo/4i/BTzvCbNJhS7HDiwpbhCnK+T4jdwI48LowmeF/CcwHBZ82FxfHvgShwDdUy
         DV94JaLHSw0ITL0EOkwE2VzfMG5IMpOOQKLt92kldevLnkFeFVYgsvae9zq54jBs6vES
         BPdQ==
X-Forwarded-Encrypted: i=1; AL+hErEGbppLrOtWOMPUsJ/t6ee3Gua4HzB36YOe0gFhcFOPjpVsAfwqxZnIMroi1tUVxoydI69ngDD9AYZbQlRZJ+ubyw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9jz3xdaWv6o0rjEz7nV869VLtRSNqeYMwJK1CLzkD1ZmpcW6d0
	XPkdaPzFdpHt4hSfawsIGEtJMGrT9PsGP9obKhPAr8Lwsv8WtJnGTiMixbKFzEt3LNM=
X-Gm-Gg: AZFdTZfsc6rYbcGZTuG3N37rNlBfv8biL3KD6Sl2jhi2HZVAJg9SNJkCE3E3w/0aF6n
	Zb+JNiZMu2hqG5Fx/AJJH8ykjtDN8JfoqISxnD95ATp6hb7Z0Cwt3E6ekQyXJ5IddL82aYmfdV2
	5Lx0v2V72Cg335w5mD3Dsbq6nedZRXECDnq8y5P9vqC9uQS07hrG0+1E9pEPclwXZDjtPn/jcrz
	55lROfia8zbOizBWOBq82dRQGlKfWudh7+co9pGWy5XFX0Cu2IZ8lC5NmtipRN5IZNf8n5JCndo
	pe8DkMSCxrkqN0c1YXBcJ9i6i1mTw05zZj6W9fV1ynHAaXgcJDZWPdJnZbqipu2BxpMH91wK0O/
	z9aZJtsSdIco+nh/rvgF1MEPABVagOLNzPlOF37Sdn4pvoP6A9k3IGOujylcTpxhv5lyNDydWq+
	TBT9nXaz6swRxX6vc+JgsrIBcYTPwqw2Lrj2DhHd39y0i10VEbgIYV8QkxTL2bsEhkYhL6/2+t0
	uNdIO0TissNjCMNNQmb4QuoWjVctRzZIQjg7sR1efJxx1bKwi49f97bEW+WmTPIV3F4XbT8/VJu
	HC5vmf3pu4ZUEfScAb7t0Pw+s11l22qvkaopQw6DDOhkz3N337KK6SJrVaDc0lx/Vwx5sWpsjJ0
	a3bOZQ2ohmb2fW/WFoA==
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id ffacd0b85a97d-4abb2dda518mr21312215f8f.29.1795431818842;
        Mon, 23 Nov 2026 03:03:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da? ([2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm22225115f8f.29.2026.11.23.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:03:37 -0800 (PST)
Message-ID: <d91fd9d2818a3ccb016f034b62be3613c2bec7fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/7] libxfont2: upgrade 2.0.9 -> 2.0.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2026 11:03:36 +0000
In-Reply-To: <20261119141333.34492-3-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
	 <20261119141333.34492-3-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250898

On Thu, 2026-11-19 at 15:13 +0100, Jaipaul Cheernam via openembedded-core w=
rote:
> libXfont2 2.0.10
> FreeType: always initialise strike_index
> bufio,pcf: reject negative skip count in BufFileRawSkip
> Remove support for SNF
> license: complete the XFree86 License
>=20
> CVE fixes: CVE-2026-109909, CVE-2026-109920 as per [2]
>=20
> License-Update: Update License text [1]
>=20
> [1] https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/1531de719ed=
f74ad76f21f0afcd94db450c65cce

Doesn't that mean we're missing XFree86-1.1 from the license list? At
the very least it needs to be explained why we don't need that...


Cheers,

Richard
