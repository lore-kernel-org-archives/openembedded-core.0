Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7CC6121C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 11:27:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so1628478wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 03:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2GRBzQI1Rnd+Enq/muGn7TAebomZzD0iWAknRSJeQ6I=;
	b=EHOc3iCRroHtOD+2HQe0+ynJS0CuKUtRuCAU8FTJMmt7kRn4uaeprEnKvFekNAAwQW
	9KsZNWcjIxLFpG1Wm+h3ZQtPnWI0B+xRNJwDr8SB06VMlPEyUzBxiTr55KRQYH/LZAZa
	wd7xnZ2R3GNmco3jnC/XRnvMAMc9RT+L97a1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2GRBzQI1Rnd+Enq/muGn7TAebomZzD0iWAknRSJeQ6I=;
	b=Wl5vokpeITh7mE1aSkkx1XKaTKpFHgGe6dJSnPXiHJgL8S6vc77nyF0Kx1AgQWK4lM
	9imQ45QF55p3PqQsNUL/QWARddtZHnf1K0QXInYfVbBHZLuBopbLH1MJTciGWLXs45h0
	Vs6cHo64JUTRaeSTHVbQAwPieS2bLnWwEmlcwN+SlDW6bJhjEziVIVe/2JT3XfK/VJDP
	UFquDoL0f/xJbkR5WmkPh/PclJGHtIUhuLWPJSlOMmOTg4cthNWtpGxwEqVr13NXa44Z
	tXUP9LByMIN50kJGH3mrh1iX9qJXqr+zVrIratLf2zwzb23BWlumcrRQ9iLPOMOGiU1A
	2u6w==
X-Gm-Message-State: APjAAAXicovwbMrTc1j00EoL3vMn8M2RY+wt49+KE4iSAXoXslgM5+/d
	Sbo9z2MKOitT/pF+X2dVMt/ZVA==
X-Google-Smtp-Source: APXvYqxWTDUaizsWiXTjCR2rNigVOC0jW9wCQTnAKM+BFpl+hlYN5OjIaWzD79i2TsHHxumuAWIs6w==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr48230491wrn.135.1582284464989; 
	Fri, 21 Feb 2020 03:27:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n8sm3375050wrx.42.2020.02.21.03.27.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 03:27:44 -0800 (PST)
Message-ID: <80d58477f0a13b2218d351c61f9ca7d54491b8ac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 11:27:43 +0000
In-Reply-To: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
References: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [zeus][PATCH] openssh: backport patch to fix "cert not yet valid" test
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
X-List-Received-Date: Fri, 21 Feb 2020 11:27:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-21 at 11:29 +0800, Anuj Mittal wrote:
> Fixes [YOCTO #13796]
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Is this issue already addressed in master (maybe through upgrade)?

Cheers,

Richard


