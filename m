Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7026188F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 00:31:42 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id c19so45460qvv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 16:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=svVvUTg2zPPNUJpy4cA/mHFfpAk+CwbJhQ7g5hbSbXc=;
	b=LXVxGnjNNY0lB5v6qucsgawxJ2nUKFySl72RWRo+d1tlgUE2UJbtlDXSTsKwuLKJYb
	wM654/XbYdTFxxUpBm+SRzwwVVj5KJvZkp5uJRHXBfv6PfnphZEAYPRTfJyoincVtcgT
	oU1S2d93YV23vdLfwXmQXP9DkEfo9ExfdaYuxPMvgVFENE8BC1LgofIpFymJDTi4HmGO
	CxW/Wrh2Zb/MD6MhjpSEB+WFvIPizsmJBlFv4vHsqaG6AUdqJhoqtTphJCUMDs18KIMU
	OVC9DFxmSrOMNatdkpcxGb5GRUBnkOkbKt7NPWYwK+vnNn3/9+EhtCrgq7YG1aiLooq/
	rrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=svVvUTg2zPPNUJpy4cA/mHFfpAk+CwbJhQ7g5hbSbXc=;
	b=nTJ7OTtGBLzRGNodhlxSfooywDj2wpPJibZAe1pGXsfVz+9Kqoxfuns2nCchqoHxc5
	JbuUVW5sr7fpZ1yGTRIhAt/h7K9YA2y7BDfDXA036ArIu7/6c8KksNZRCWIFLH85ufsB
	bCEp8Fq5Bf8By0ixYGIw/zLZHKQyq3RTp6Vdo8VG/eWG2Tbe+7DjsFW2ap7jP2YyVjhU
	mVrbvQcGZ9+OdcayfGnDbp6YtzxvY3s2x5V7oc1m3zdUVO7dSp4M4rinNQFILF9+JeFl
	2/1SC9WbPfYosb5AySr05ui0S0z0w/eOChgFmqg/qMqWi1YpXAmmVhpG99/lELnG4cOn
	H6VA==
X-Gm-Message-State: ANhLgQ0S4YeRVgfrJaswWUxCi45FHZbByb1df/KhbQjx4nQGp5tj7z1z
	rcNA9THW5XIRMLhkymTV7Hdvch2oXQpVcw==
X-Google-Smtp-Source: ADFU+vt3Dd85V7u6qvjcISH1kGsD4u0fVRFHRTsL5MimUhsWXObkMcAcMaPMSNTamecORzn5m8BnTw==
X-Received: by 2002:a05:6214:16c3:: with SMTP id
	d3mr128256qvz.244.1583281902983; 
	Tue, 03 Mar 2020 16:31:42 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
	[209.85.222.172]) by smtp.gmail.com with ESMTPSA id
	c13sm7329453qtv.37.2020.03.03.16.31.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 16:31:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id z12so5371637qkg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 16:31:42 -0800 (PST)
X-Received: by 2002:a37:551:: with SMTP id 78mr654819qkf.46.1583281901846;
	Tue, 03 Mar 2020 16:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20200303160513.17645-1-git@andred.net>
	<20200303160513.17645-4-git@andred.net>
	<aec561f0ad71112c5a86a826653123369a0ef647.camel@andred.net>
In-Reply-To: <aec561f0ad71112c5a86a826653123369a0ef647.camel@andred.net>
Date: Tue, 3 Mar 2020 21:31:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrAAyFCwOtAiQ+ziT09gwV3qp4QwmH49inXNE6NS3Hriw@mail.gmail.com>
Message-ID: <CAP9ODKrAAyFCwOtAiQ+ziT09gwV3qp4QwmH49inXNE6NS3Hriw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] reproducible: try to ensure reproducible xz archives
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
X-List-Received-Date: Wed, 04 Mar 2020 00:31:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2020 at 1:08 PM Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Tue, 2020-03-03 at 16:05 +0000, Andr=C3=A9 Draszik wrote:
> In an ideal world, it'd parse the output of xz --verbose --verbose, to ca=
tch
> all possible ways people might be adjusting the thread limit, but that's
> non-trivial.

Couldn't we just "enforce" at least two threads? It is quite unlikely
we ever use OE on a single core machine (as it'd take few years to
finish the build hehe) it seems like a reasonable assumption.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

