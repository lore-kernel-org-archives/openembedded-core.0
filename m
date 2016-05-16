Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD3A86E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:54:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g132so16572861pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=x7f5XrZjvizk3JIqFxc4/dAwats4PDVlDFy8K3Pqcp8=;
	b=FYOayxnyG/gl0eSQ8FlAPFZvEMRi5vSvnfpFcKI536fQvcc0SrHD/qR0FbhQ75feDO
	uPiBhq8Dq4bKf+t1N0LRhpLcpoD64GQqHjfDJLwXPDBUR9S20m8x5mDqN3dzwKeCAtKF
	qB7k4dg0YeDfzD+DtYIS2jr8SKCYX4e47e/n3OXbCZmHctsz2Z89zKCexINjDU27JWy3
	m7GM/20F+YAKZY7tGFsojD5byBYNp1D5M4z2g1GfqGPgxAQMoayHUCygcIB43I3IdDpX
	mxPQZJZiKozBrCobWi+BzDLU2tLaugkdLLwVluNvW1hWm9z4fZRMEVeMMULSEn7JuDY+
	q77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=x7f5XrZjvizk3JIqFxc4/dAwats4PDVlDFy8K3Pqcp8=;
	b=X31UXTI31+H+mcrTWFcN3flNuqnMt4Mx09qPG7RjEwjnGcQWQdlBQUei3oFrMgahwE
	cUGr7mJO06Vck3AK5WjCP5LiKX6SH3JSoCbS1d6Ljkk4cj1y/8xM7NhlgDYTRk+vwatd
	kAT3a5VNptGL/vLFijTJnBJ0ziOyuMwcPLvYpSk5n9TjI5xg7qV3kMunjMNAmOt6TOQT
	DzRlY/NLsamFtd707YwQD+x1XRhJAOGj2AaPZb8D7+wOIDWxjgG+FRoJWOzuN63qB+8w
	9XeoxxqE59HJrxKGyHPxK6eVLYsHM+3Q6zBcPRd5ORrCnylXoPcNP6bE2f8AUHrqoeFo
	6/Wg==
X-Gm-Message-State: AOPr4FVdW+8ZCaa9QdE8fMA/Pld4+T9qNkwSWfK5ZSoMpUyUphjY0dT05UrwAIyLsMoifg==
X-Received: by 10.98.24.208 with SMTP id 199mr47486274pfy.160.1463428495659;
	Mon, 16 May 2016 12:54:55 -0700 (PDT)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	d78sm49091466pfb.59.2016.05.16.12.54.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:54:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id 206so71122803pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:54:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.93.131 with SMTP id n3mr48323537pfj.141.1463428493455;
	Mon, 16 May 2016 12:54:53 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 12:54:53 -0700 (PDT)
In-Reply-To: <1463412933-15923-1-git-send-email-tom.hochstein@nxp.com>
References: <1463412933-15923-1-git-send-email-tom.hochstein@nxp.com>
Date: Mon, 16 May 2016 16:54:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo8KzBjG6-6di42NhxsXiLfCpSzunRMnGSep9mLpniwfg@mail.gmail.com>
Message-ID: <CAP9ODKo8KzBjG6-6di42NhxsXiLfCpSzunRMnGSep9mLpniwfg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
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
X-List-Received-Date: Mon, 16 May 2016 19:54:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 16, 2016 at 12:35 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> sp and text demos rendering single frame. to display the
> single frame rendered needed a eglSwapBuffer to diplay to window.
> Hence added eglutPostRedisplay to display the frame.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

