Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BAD287F442
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:50:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k2so7885150wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4h/wB4YGzmzdP3bHhd86PVoY21SYPsI0dXRylyI/ZuI=;
	b=hz+61r176s0PzT4vZBFvGuyuD+o51mH/eRiTeha1GlEj3r+OnpgbyP+RSpQ+gDZQz4
	gs13z8NNZW0ih6cybUbcm+ZLX8YyscOXgC3KlnAOcWX9iWo3TYgXu7dC3cZesaMQR1Wr
	7/vfhefni1Is6fShSX6rRCzCo9tmb6Nzql9uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4h/wB4YGzmzdP3bHhd86PVoY21SYPsI0dXRylyI/ZuI=;
	b=pPnsTevGTgephtYljMzWppuOAGAVm3m41BbwyfxMKAmwxOSkXP+PvbL1IcO868GHtH
	j35Ns36fAJ3Kzju/YMazZKbaHf83M2iD65U1Pn499srwH0jAKVNFAC+X5gOfvPyQRIv/
	1KHgi73xJFbekrx66KwMXHFXkFdcb46Fbnk0szHsldYaBU5Qh/SRSLNZfaDV59hF8b2Q
	TdCE6u2DNBVLm8icBfoftgQPQT6bkDuDaIyAwBy2j/3tfCGbHCEucYbpfm3bQTDQjk4s
	2XXll0g/c/BJdWnYHpfd93O57Hf2YFHaguVe+khvxVDiDvcBW+AGnBjsaGz1TPDLwPDV
	5lug==
X-Gm-Message-State: APjAAAXHJySvbNF/DVojjIU1LduuiTPYSJI3khJk7RbMK9AVEyvlSK/U
	gfTf8LEmA1Wz8AAfUEpegsJIFw==
X-Google-Smtp-Source: APXvYqwWHFR/N7BxPkqk0TFx9SAEmyR94eYqEfn59Wo/MhqjRTff1lbfR3TT12iF7cMCVm2PGmar2A==
X-Received: by 2002:a1c:110:: with SMTP id 16mr9324440wmb.88.1567806657423;
	Fri, 06 Sep 2019 14:50:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q5sm398278wmq.3.2019.09.06.14.50.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 14:50:56 -0700 (PDT)
Message-ID: <24bfa19f1db61860978894ae958aec938bd91ee1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Changqing Li
	<changqing.li@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2019 22:50:55 +0100
In-Reply-To: <c48b2c01-d4b1-c0cf-54b1-4c8a00af9ea1@windriver.com>
References: <1567485996-351404-1-git-send-email-changqing.li@windriver.com>
	<ef8f2598-6a4b-7087-2375-beac482e3924@windriver.com>
	<413ea6ab6c76a8a532b7d28303b54fe61f12cd99.camel@linuxfoundation.org>
	<761df36a-5ea2-4b07-3e78-a0b5a4276908@windriver.com>
	<c48b2c01-d4b1-c0cf-54b1-4c8a00af9ea1@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V3] dnf.py: installroot support usrmerge
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
X-List-Received-Date: Fri, 06 Sep 2019 21:50:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-05 at 14:25 -0400, Randy MacLeod wrote:
> On 9/4/19 4:36 AM, Changqing Li wrote:
> > I didn't met failure in test_parselog during test,  the whole 
> > testimage is passed.
> > 
> > Could you help to send me the link of the failure test if the new 
> > version still
> > 
> > met test_parselog failure? Thanks.
> 
> Sandy,
> 
> Richard shouldn't have to do that since many people have such
> requests and
> 
> if he helped everyone he would (and has in the past) spend/t too
> much 
> time helping people.
> 
> We should be able to setup the autobuilder locally to reproduce the
> problem.
> 
> 
> Also during the YP bug review call, someone suggested that you check
> if the
> 
> dnf install tests are running in a deterministic order. If they are
> not, 
> then that
> 
> might explain why the AB sees the problem but you do not.

It wasn't clear if the issue was fixed in the revised patch or not so I
did include this in the last round of tests and those passed. I
therefore suspect whatever the issue was did get fixed in the v3.

Of course a different patch failed (mdadm) so I've replied about that
one separately (I've confirmed which patch it was manually, it did
reproduce).

Cheers,

Richard


