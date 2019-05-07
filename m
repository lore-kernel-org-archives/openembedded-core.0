Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8550C7D533
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 09:40:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d12so848292wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tPEPVM+Rk5CBRND0Y0QROdU6zLNauh2yutooIQiSWN8=;
	b=IGAqRat8Gafju24esBOKX1NZ+jKEaRRrOH/Wn8nh2LcZ7ZPXufkPMb6NS7iOI13vWJ
	kJ0bw9fJeEcdWbuJcB6YSpNSLVAdTomqAEgNX5WTrdqjhHmZPpE5QhoJtBMuQA40kjoE
	A/Dl6WKgOuPZ+An0mwRIUa6Np44sW2HR1ZRH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tPEPVM+Rk5CBRND0Y0QROdU6zLNauh2yutooIQiSWN8=;
	b=FhAvmzuFC6jNT7AC1v0+MaO4ZD96Zkvzo91JWkPmbGLK2DU4MfhhanWt5j3GRGEsfT
	xp9Obj5qDI0G/9//phA/OkqnP2XI6OO7LvyW6IKxtUACdTw69nhWq00zZITgKYyMVH9i
	lxVLqo/trXg2TY3oM82Ap38PyAMHVfYcMRPYGKrDI1acgOyk+4IJNXu9T5eNmAR2ZqiO
	a+xZaQnZPo5ZVJ/iL/PcwEVDpAM87z17dQg1c6XPY9VgB9e6h86dUGCIAKIF3NFYNp0h
	wb3TP5cA+pEsAGHLIi4V/WLVrVVLd5p+XSca5a0XjJM4Se1CBq1Y31cBb+JmJC3k8cC3
	SeYg==
X-Gm-Message-State: APjAAAUqgrOr6ZnrnRqEPRo4hgErfi3eIaEWDLXQco/x7WhADkq+CgSQ
	9LBI0ykNoYN6/jjjSpSGBYcvNg==
X-Google-Smtp-Source: APXvYqwHLEdJKXdWVTihvvz9NFl3T4tsznpG8eYz/TOtCNuw9vyXOqdq5XQL7miH+46xSUDn417wjA==
X-Received: by 2002:adf:df88:: with SMTP id z8mr21140486wrl.209.1557222033223; 
	Tue, 07 May 2019 02:40:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y4sm10665216wmj.20.2019.05.07.02.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 02:40:32 -0700 (PDT)
Message-ID: <f5b3478bfb63651712821e2acd6bfbe664c6e1ad.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 May 2019 10:40:30 +0100
In-Reply-To: <20190506021955.26534-2-akuster808@gmail.com>
References: <20190506021955.26534-1-akuster808@gmail.com>
	<20190506021955.26534-2-akuster808@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] nss: add ptest support
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
X-List-Received-Date: Tue, 07 May 2019 09:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-05-05 at 19:19 -0700, Armin Kuster wrote:
> This belongs in the long test group
> 
> Here is a baseline:
> 
> Tests summary:
> --------------
> Passed:             9132
> Failed:             61
> Failed with core:   0
> ASan failures:      0
> Unknown status:     0
> 
> DURATION: 15134
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>


ERROR: Nothing RPROVIDES 'tcsh' (but /home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/nss/nss_3.43.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
ERROR: Nothing RPROVIDES 'tcsh' (but /home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/nss/nss_3.43.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

That is also quite a long runtime (4 hours) which is longer than
everything else we have combined :/

Cheers,

Richard


