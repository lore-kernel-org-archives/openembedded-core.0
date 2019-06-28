Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DEDA07EA97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 16:58:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so7004237wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xRs0tZAwaaYT4JaUVRZVYiVf8UerOjiTShS/wF40wPk=;
	b=J/hwEmfKncehFZqV5flPFffUoXrhKAB7PEfuoHl+dS4ghbFZfYP4Qnz1n9q6ysf7SM
	iC/CfAESrXIt2+uhn7SZRZDh/AYleSN1Na524yB9k07dP1T4w0nnI8KXBYkp5m6f6MGR
	ic+iszqWTaE2mJcYfWPgkz/nYbDkFtcaSqCgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xRs0tZAwaaYT4JaUVRZVYiVf8UerOjiTShS/wF40wPk=;
	b=N9wPdWCwpOY06a5QbKEaXQXvnvGSyR/7PLbIbPwcKZt+cOYXzlh6/R9op3BOXM4k56
	YSRnyjL4ZRCAb87Ae3YkbWJJWOTYQPuYVKJXkoNQ/SffWeR++u+/uVXUxCkZ3e5kP4iS
	6ZVB2xYm0at5v2CB0N4wwpXccKki5KAUfrYu1cWqcjrLEG+54/smapjMJtzmyGxuXj6f
	iHWR1pW4T9tsYAgQi+2EOzIdpqAb5qJejh5gRY8nDXflVu2Iq8zdQSJx3HRhPzBethPU
	jZh8rlXSVGg1s+WWvs1LQOay8tmECIc4PwmYHXe1bCsAFUChrcIlnbtdgKeFDWldsRCc
	pNFA==
X-Gm-Message-State: APjAAAW9uz2arA/ubQoWtiCNfgoE2ZIstVLunl+C4Tnxl02XRB8KFvhp
	8MbeeMQNDG+YBtYsGaLWFa8Msg==
X-Google-Smtp-Source: APXvYqzdR19zlnhumlKYtAqNZDnAutIPTaalQwf/5vtiMAqYdCr7VU0YDJxW/qULcnbicBRsembgcg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr8866786wro.170.1561741081576; 
	Fri, 28 Jun 2019 09:58:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11sm2248263wrm.53.2019.06.28.09.58.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 09:58:00 -0700 (PDT)
Message-ID: <343e1b128636193717015cd16ac87e688007eef5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Luca Boccassi <Luca.Boccassi@microsoft.com>
Date: Fri, 28 Jun 2019 17:57:59 +0100
In-Reply-To: <3fe59bbe44185ac5436afc8d48d2c2e313686ae9.camel@microsoft.com>
References: <81618ab958486def551d22764d960944fb09b73d.camel () linuxfoundation
	! org>
	<3fe59bbe44185ac5436afc8d48d2c2e313686ae9.camel@microsoft.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Sinan Kaya <Sinan.Kaya@microsoft.com>,
	Anatol Belski <Anatol.Belski@microsoft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Fri, 28 Jun 2019 16:58:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 16:52 +0000, Luca Boccassi wrote:
> 2019-06-27T13:18:54.5592415Z [WARN] [15902] Reading package lists...
> 2019-06-27T13:18:54.5592628Z [WARN] [15903] Building dependency tree...
> 2019-06-27T13:18:54.5593124Z [WARN] [15904] Some packages could not be installed. This may mean that you have
> 2019-06-27T13:18:54.5593526Z [WARN] [15905] requested an impossible situation or if you are using the unstable
> 2019-06-27T13:18:54.5593893Z [WARN] [15906] distribution that some required packages have not yet been created
> 2019-06-27T13:18:54.5599962Z [WARN] [15907] or been moved out of Incoming.
> 2019-06-27T13:18:54.5600415Z [WARN] [15908] The following information may help to resolve the situation:
> 2019-06-27T13:18:54.5600834Z [WARN] [15909] The following packages have unmet dependencies:
> 2019-06-27T13:18:54.5601383Z [WARN] [15910]  target-sdk-provides-dummy : Conflicts: bash
> 2019-06-27T13:18:54.5601724Z [WARN] [15911]                              Conflicts: coreutils
> 2019-06-27T13:18:54.5602246Z [WARN] [15912]                              Conflicts: coreutils-dev
> 2019-06-27T13:18:54.5602590Z [WARN] [15913]                              Conflicts: perl
> 2019-06-27T13:18:54.5603147Z [WARN] [15914]                              Conflicts: perl-module-strict
> 2019-06-27T13:18:54.5603989Z [WARN] [15915]                              Conflicts: perl-module-vars
> 2019-06-27T13:18:54.5605346Z [WARN] [15916]                              Conflicts: perl-module-warnings
> 2019-06-27T13:18:54.5606090Z [WARN] [15917] E: Unable to correct problems, you have held broken packages.
> 
> Same config worked fine in sumo.
> 
> Any suggestion on how to fix it? Is it possible to enter the working
> directory to run apt manually, so that I can dig further into the
> dependency issue?

Sadly such "enter a shell" functionality has never been implemented so
that isn't possible.

The message is basically saying that there are conflicted providers of
some things the SDK is trying to remove (like bash, perl). Its likely
the dummy recipe isn't providing something which it needs to which
would then stop the other provider being pulled in.

How to isolate what that is, I'm less sure about, there isn't an easy
way. I've just done it from package inspection in the past.

Cheers,

Richard


