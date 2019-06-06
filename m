Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCA67DE74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:49:44 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id w190so693517itc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w4g5hCBUnbM4AJZMZtYp0IuMqzf68ftlugBTah6Vn5s=;
	b=TCU+Sbcr9BmrTHv9QGnAP76usAE+ErD3Ica/e/UggEe0KUWjdkrkHBZ5LO4HNSA71d
	8ulClaM+2ui3RkH4GE7QsK3Qpg7ui2xsjOVwgdxtjrdgMQq5jK962ZHCqVrY+r7vXeMV
	ufRMLyzW35pdWsUV34/wgXMu8XnQ1B9rt3EqIfUAhKGMjTnXejMOExBsx7a3KCNGGOXB
	/ovB62R3aFKffQKcIIOJ/vsjIXgCC03TLTwSjtZeKEY5G4b2qXnNTXROPdH0A4DU5v9+
	Q2sU3gfwyutuxFssjljDt1nHOcJBVvg6EEGJBa2V3i0rfHYrqMjIOxg25mx7pdDXuFGz
	8ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w4g5hCBUnbM4AJZMZtYp0IuMqzf68ftlugBTah6Vn5s=;
	b=EuCYyO+FX6uSmDWd0Du71S3W5KinGzYAqkrsdl8xIORVkuqA//XgwpWcOVIun3dQ0f
	FQmrANSOTHrwdejPvcMOPIaaguXetFlgpK27Rs6siPH8cggMlugT35BHuM/J0efDl4h6
	Y8sd8tf4UC9PXi71esVXjcU4UIk84I2sS3p2WbtUTBJTnHOcT75QMdv6PWiEojpo+Ih3
	ope+RH2qZOOEfpiJlrUHTwikCN1rZVNkEz6ku2OEt16jLxmfOBsxN/JUqGt1mAH/Kifb
	9peP/oF8Lyh7iGTyXeqi6tOW72po8yi9q9q2reOCPipE+f3NTd9QBO5nLUi6icEGiaPp
	Lwmg==
X-Gm-Message-State: APjAAAUMMlaonEP/gHh+xX3AuYBvcydJcmhWGG8N1jKYhR6XN8orNSjG
	vp2ifzqL1Y7SkT483qNMyUC5AC5wK2bwPmdAu0UTWA==
X-Google-Smtp-Source: APXvYqx8x4xC04CbUw0GO3biR5ZHUKogT+Az1bgmmgrzHi2oFV3iRE6RTHlNX+itwWLOCbrZaA/VgQbCsfrZeSUB8UM=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr665061itb.74.1559836185452; 
	Thu, 06 Jun 2019 08:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
	<CAJTo0La-MG7hctC+qAfJtNQ=T5grgVt7U8aQhPLKN+tahARBng@mail.gmail.com>
	<9c4ca1e9-9698-9b89-d54d-a909d5e73994@googlemail.com>
In-Reply-To: <9c4ca1e9-9698-9b89-d54d-a909d5e73994@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 16:49:34 +0100
Message-ID: <CAJTo0LYN94a9EphzPasivtUo-FNvrfCFAcWs0J9ZVnc0bpticA@mail.gmail.com>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixing python3 build for mips softfloat targets
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
X-List-Received-Date: Thu, 06 Jun 2019 15:49:44 -0000
Content-Type: text/plain; charset="UTF-8"

> > The shortlog should be "python3: fix build on softfloat mips".
> Do you want me to send an v2 for it?

Please do, with the shortlog fixed, removal of the word 'backport'
from the message, and your Signed-off-by/Upstream-Status: Submitted
[https://github.com/python/cpython/pull/13196] in the patch you are
adding.

Ross

