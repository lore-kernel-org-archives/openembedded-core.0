Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8E116010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 23:11:16 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u15so392363otq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=G/QzzSLTEYjqcIxRDszbuZMSDIWqAD8jaOLQs+Ols2Q=;
	b=jxrXBEZbR0v9QMCGMi78vaS32+Qjn+Xl7Zmj4259B9HU8fNIcJd4oAU1sP529uDVVo
	fwa/y/wwnc7tXReJs7vR7kJ3T+nYMDmFxW83ob0gvmuSUAbm619ibHSZI4BLE7FR438/
	fr77RiYPhjzPbR0Vgu4XR10l83yJrIWRKKnW1mh/tcjqO6A2Erwh7mePDG/MI7nySZVb
	Mgr7KOl8EDuUGim/6QxEdMOBYmhJv0lhjpDhQdQP5TQUOxOu/17nMZ/+2PiTU9qvhaHl
	oMtyOp/g9uT6xl7MHMGX5NiZqC5QkhjCSmCFxiXCvEYZEOi1uKmVEIN/3dYiTKBfzpXB
	LwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=G/QzzSLTEYjqcIxRDszbuZMSDIWqAD8jaOLQs+Ols2Q=;
	b=QUkXOWotXQZy9N4EICoWIq+uZkSt3ydkfuhDfr6iTRB09ljsH8S5KXMSU3GZHmn3RM
	e0xWrl2Qqt93dQL1cD5zsfLhzX3CLH8icOrSJUb7E7cHMHtjeskbF0DI2XhIVGE9Vqtq
	dIw1wGalfTeUAtFpJEBkU/mzHOLwwDy8dgR2ZICf+FRJL8pbH02dFLHghMNkZf2gS4tw
	hTD1dGVeP1xHzGge7j1SQkasMrwbA+SRvBo+YhRaMfJqYMEMW0VfaoNUvZh6blRTeChx
	BwC2VvVnzJLWGulvvKscL+7CKDA50Dy8TLLItHE8AlvS1S7xS1SboS+k8uMCwkON/XO/
	BzuA==
X-Gm-Message-State: APjAAAV5pOcm7mhnSNTur9Vb2cZrFAdajxW/9TVKsbNzsMEc097tbxU5
	qwbxvQTYFpsnkPnwAb2w8n47Cr1n6MnC4Q==
X-Google-Smtp-Source: APXvYqypPH1B7JIVhpNyAcwCQjQWAIAeWkDHkZ/v+xq9xrIop25XcIewTVXlx+E9ZDR1MDgVokVIhQ==
X-Received: by 2002:a9d:4e10:: with SMTP id p16mr3655728otf.65.1553037077038; 
	Tue, 19 Mar 2019 16:11:17 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
	[209.85.210.52])
	by smtp.gmail.com with ESMTPSA id t3sm162509otb.14.2019.03.19.16.11.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 16:11:16 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f52.google.com with SMTP id f10so414430otb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:11:16 -0700 (PDT)
X-Received: by 2002:a05:6830:16c3:: with SMTP id
	l3mr1389075otr.145.1553037075639; 
	Tue, 19 Mar 2019 16:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190319163652.24216-1-otavio@ossystems.com.br>
	<20190319163652.24216-2-otavio@ossystems.com.br>
	<254384af-50d5-f2db-3da9-5d3877775151@gmail.com>
In-Reply-To: <254384af-50d5-f2db-3da9-5d3877775151@gmail.com>
Date: Tue, 19 Mar 2019 20:11:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoZyorqyK8_rHH=OaYrJb1KqFE+hv8hFqv=0tU-tBqZMw@mail.gmail.com>
Message-ID: <CAP9ODKoZyorqyK8_rHH=OaYrJb1KqFE+hv8hFqv=0tU-tBqZMw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 2/3] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 23:11:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Armin,

On Tue, Mar 19, 2019 at 7:18 PM akuster808 <akuster808@gmail.com> wrote:
> On 3/19/19 9:36 AM, Otavio Salvador wrote:
> > License-Update: copyright years updated
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> > Changes in v5: None
> > Changes in v4:
> > - new patch
> I don't see a patch and V5 does not mention removing patch
> >
> > Changes in v3: None
> > Changes in v2: None
> If none why V listed?

The update can be applied; the c_rehash I am not sure as even though
it is correct it changes the behavior so I'd wait for more time and if
someone complains we do that.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

