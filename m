Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D82B7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 09:44:39 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so3262444ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BGGdxUosAzJUXrXSKSAuq5NTIwxysHddjIYP4mjxh44=;
	b=plGjmosSXKK7vVRO7uBVJQheAjBsoZa4H0N2Enhwr/Z4ivxYaJuSkH1zZUaWKdUGhn
	7vH9pID8EL2JOexV+j2y1sUpxY+a6qUKUNt7bVUsgGoxDlwHL5huhO2ejio/26nr3b5p
	qZBRAn4j532uPiotEgd1KaVL9mndhn1hAKVp6AmG2H2n+vJNP3pTGufS30Mn5yGwigQd
	i81n9OUV0QGz2LOYA29N2tepVfRJa6Oy+hFDAi5x8yRozHqqKq2SOeAGsWXmWjIjbIyh
	MQQW4CmWPUtwJN+S7sQjZO9dTParsG3oEM+94d60UpzaAfkurET8/GTjfbjs4v7LBBC+
	RtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BGGdxUosAzJUXrXSKSAuq5NTIwxysHddjIYP4mjxh44=;
	b=lvR+NHr+7Yj4MDdNUrZCFjQaWnObSimQy8qkO8bVL+qgQRi+/KGLFpIoSpWdCRqTKb
	r0hE5YCf9R71PpegawLtDWAxdPHw8iNyNJOK1qnHBiqROb4PBXScseCVD/labRrD9bs3
	WBX67akGEC32JxIWmGQoksjbGRiNAZHmwdn5Fo8xsNPXU2bjkqc+pogOiKxUFAzdJjU1
	xKyV5xIrwjMHxCyLnRvlDdkfNFwVPZaR3hZmFlNV6rH6zify5Dg+ouKQRETASzLnYLKQ
	egSHPq8DlPjWSAyRZXniYfgH/OveI5FeQefU1jsodtehq7MbOuYIRqaK4M1bBI4Gs7e7
	if/Q==
X-Gm-Message-State: APjAAAUXw/kX4QtnJqCsakux9WFAF7+x9o3ZuuXPIM7DZAV3c9fTH/EK
	KVaLtAH2s1MUAM/7ecVb8yKIbDOFlWLVZfDQij8=
X-Google-Smtp-Source: APXvYqwWvTacBKGoa4Fz+pZFfwyIUBr8fycy9n311AaYfhxkVMobBaICLTM9J6yE3Klz0EI4ibfaX02Zy3zcLkASjXU=
X-Received: by 2002:a02:c00f:: with SMTP id y15mr42371107jai.132.1562147080415;
	Wed, 03 Jul 2019 02:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190627145917.1774-1-lemagoup@gmail.com>
	<6ab87120-92d4-7cbc-e88a-8e9261037901@windriver.com>
In-Reply-To: <6ab87120-92d4-7cbc-e88a-8e9261037901@windriver.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Wed, 3 Jul 2019 11:44:29 +0200
Message-ID: <CAEz4NHr9ZEEGM+VjemOApAR0MepPjjXdumWOQb8iHOCcdBBuQg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v5] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Wed, 03 Jul 2019 09:44:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

> This patch broke "bitbake universe --runall=fetch" totally:
>
> The line which caused the problem is:
> addtask do_populate_cve_db before do_fetch
>
> Would you please fix it? Or I can help if needed.
>

This seems related to the NVD website down problem. I sent a patch to
manage inaccessible URLs. cve-update-db will not fail anymore if the
NVD data feeds cannot be downloaded.

Pierre

