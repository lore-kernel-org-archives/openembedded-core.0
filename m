Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 051616D52E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 14:12:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so36692429wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2019 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kK2L6QYXwz4lwSCFemf38BbkYUA+My6m5kaqbb59/4U=;
	b=GlZF9c9jntm1xg8i6z21Krn29ubWHdylIA6AZmR57JBhnRa5juDZqEI6+QtdTR5HLj
	TPcWBg1f0101PBtBvUe7xSsrOPiiQO8H+WCiPeVLaxydYhjFssrurGoe8qbTQ5l6O/1G
	TDKVMnIAsltxSyWcN20zJEDPkcClbtLRJsos+eBAODH5kRsjKToOp16WPx5KuTKXPQPb
	a+GAqHizviEy/4dHAaDp0kzbhja+Ku4JE/ydq+JbK7P0arkQXjxUqv9CdUus0V+QF8BQ
	Dr3fZdS4HCjyEgvUWSFVXJqW20Tzt03m03Qr9f77fXI0MuCQAqJoFQl1OJ+hRol/IhO7
	3oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kK2L6QYXwz4lwSCFemf38BbkYUA+My6m5kaqbb59/4U=;
	b=B6NhWqcVDKNb2gENOnOfxprB9MvRYj8/dazHxrwa4g/S3DJmBCAEMejJaONBA8uIq7
	QXRYJHxWtdWuBxY0dVf7wfKzZe90emndnwdzpdFbN9FLcQQtJe/UORE0aAlo2GjvtQ3X
	XMtBJSkJyWLATKUQsD1HQcjl14LWD30ClVSJVkIer7clrKBoatfUvY7ISMbax1O9sItO
	hMT2oYwISqvSrKZDR7NI4c0AUrFYUngHwXbelj8mYIakd0ybQxmOlMwXGipHBpE2mcKv
	rKarW4qN2u4w5z8igUpo0kyQyse3FIW4L7ur3Musc713H+dG4WHtaqvtXck2J7UIi3sr
	2YwQ==
X-Gm-Message-State: AJcUukelTuH7lbINNg/qurLRljECA/IIohMUGvr/YbMbGVlIoeVcwnqd
	TVzs3MTMaS0s0gYTt6uf8INHUSPCpyRsMq8NGsjRM0t1gg==
X-Google-Smtp-Source: ALg8bN5fLhBawUWkY+VMx2mu5vsrYpLTdQvHSE0dYo7AB75ry8aED4gWJ5K6SQOll+oIt/xrqyxP5p1/xkgQSC+Y6Lk=
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr46371455wrj.58.1546611176436; 
	Fri, 04 Jan 2019 06:12:56 -0800 (PST)
MIME-Version: 1.0
From: Paulo Neves <ptsneves@gmail.com>
Date: Fri, 4 Jan 2019 15:12:00 +0100
Message-ID: <CAJO0J4jHWxcmKbw5_PjGGdjW45_49LFUJL50xQS8X_3zsWNnmA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Fri, 04 Jan 2019 14:12:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

I have the need to enable this services from system. What is the
current status of this circular dependency?
There was talk of coming back to this topic after the milesone but 4
years passed and there was no changes to this topic? Is it still
applicable?

Paulo Neves

