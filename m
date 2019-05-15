Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 573137DDA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 14:01:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f8so2850669wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eo01jr9Mwt1JEknnILbVebUpDD1WQdnc38S2xQ/1v4g=;
	b=hnbMfwbKHrGykcDK5ujKCHJFYBEK6IKwbS+Ya9PuqEH2sd75YR+iMembUF7wFKTg6i
	gY5KgCP18NqEIyRTkJgI0r6jXqRpztmChQKZhpsHAblHQLIQXYGU38Kl4cbWKHHzmOxm
	poGKG/C9QFI79/11kVTWydF6zm3Kkx24wRjBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eo01jr9Mwt1JEknnILbVebUpDD1WQdnc38S2xQ/1v4g=;
	b=oQb6Pu69DKfBv2Kq7gkxS/BYYULhU4fvQJdpEgmLeyNo209JWFTh8+ljfMBEyFHMHf
	JXxEy+NM0Wl4JnyR8ZJl9yxZdUkhG5e1Zd4Ja2Ue+1Tf9rKPG+Qi4756niP0tsLinPs0
	U5UKR0HyU6viqWIjzQBMLP80bCDbLAnyWKrlxbzsCakXTy80jSQ2dFSW08P8qpB/d79l
	wcnpxrHXO9XbJ0y0XtyUu/BWQWGlcK8Wsjs4soINCIgNBJ/qlkVst3uwnLUGNB00ncA6
	o2znevpqV6Nw8n///KUGhRhL/9tKUp5n/BwJM2KgzQTYvDzDzVI9Jwzr53WBBaJ7kFlG
	FLgQ==
X-Gm-Message-State: APjAAAUbMMgbAJKipFqIUnG+GYH7mIix0LvNNEBA3DN+biEc/swVi95a
	XMGXDFRKoI/btroT1pK+e2fpPg==
X-Google-Smtp-Source: APXvYqwDhI6GLUyPL333CcLpguyvJpu6pUtaaGCkSUugtubxvoU8lyA/NO7glbbz55B53zq51SW3FA==
X-Received: by 2002:adf:82b2:: with SMTP id 47mr1572358wrc.76.1557928892481;
	Wed, 15 May 2019 07:01:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm2462948wrx.75.2019.05.15.07.01.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 15 May 2019 07:01:31 -0700 (PDT)
Message-ID: <b6a1d93c02926c64d706897a6d6b239e13a32ebf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton
	<ross.burton@intel.com>
Date: Wed, 15 May 2019 15:01:30 +0100
In-Reply-To: <1557927173-27875-1-git-send-email-hongxu.jia@windriver.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<1557927173-27875-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH V2] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 14:01:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-15 at 21:32 +0800, Hongxu Jia wrote:
> If do_configure failed, output content of config.log
> to configure log, it is helpful to trace the do_configure
> failure on the build system which is hard to login.
> (such as autobuilder)
> 
> Add a knob OUTPUT_CONFIG_LOG to control config.log output
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/autotools.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
We did used to do this, it was removed:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/autotools.bbclass?id=ba837f10555998a8677eb99bfc6698e0cc1f7942

Cheers,

Richard


