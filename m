Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id D611D7C314
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:09:30 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id g194so7908023ywe.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 01:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PbWVLbOsIAXnPLRqRct7wS+2zDwrAW8AZo3kNPmLWlU=;
	b=LjIthbP5Zqr1MnTipYodLB5pNkgdNJZJTtHxPSUwVvU8MR1VfIdi3yDS/aKObX6n5R
	r9BiODLEjYLf7PTa9Q6YqR+W/vNdaNDIZ7D9DiNuaPQBQRY4bH9vlZhTkSGcTRWoN1Kr
	GYcXlwTK2RSVOgnWy7x2EQzhZAEtQ+eZyalEFXqk+RO4a/UqWKgTd/vqzvyk1pl0qz9x
	MyZdA0Mlnytf7ApKSEbplpa2MH0KJNkfB6xf7ZAticCfNhXrsiCPHiFlFvBfc7KwhnGR
	2gvZSSz503FAfXCAQW75I+ZUmdhI1GaQ+ztI0a1LCsrPZeoK63pHjbIo1+KUG9w9bHgh
	gOVQ==
X-Gm-Message-State: AJcUukfgfWZg1dNNOIGdcQprm46+gOhJQ76ScWh6YCvr1LR6jQkbKHDw
	4FDU1J7YrDvAiTMTmN0WoGYvTMaH
X-Google-Smtp-Source: ALg8bN7KUs5Rw/2TmD/j7JIDEUi2hrlFWdbtwn3UWRcZIThv5KDxJIu7VnGlz+DMXLFdpfkiIb++0A==
X-Received: by 2002:a81:9b01:: with SMTP id s1mr24365424ywg.469.1548752971517; 
	Tue, 29 Jan 2019 01:09:31 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	t129sm14020310ywe.11.2019.01.29.01.09.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 29 Jan 2019 01:09:30 -0800 (PST)
Message-ID: <f0832d94631be75951e2c4d24f68099e04650771.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 09:09:28 +0000
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Tue, 29 Jan 2019 09:09:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Wed, 2019-01-16 at 12:51 +0000, André Draszik wrote:
> v4:
> * update patch 06/15
>   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> * update patch 07/15
>   * introduce update_files() helper function
> 
> Cheers,
> Andre'
> 
> 


