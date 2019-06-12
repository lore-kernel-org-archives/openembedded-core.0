Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5BA7E722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 09:34:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m24so12403941ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/XwgloDty2nkXccbMa/q5KjBwgJPjTUbug9K3iGGXWE=;
	b=QoApvSb79Qk/WuFnWnVDOVdXLAd8Imcv2LjVF/VrpXrUdwfXdLddkAgeBLC4KVTB+7
	aOeKAacAZ6XS414BVxO111Ko+y6CL0kSr0xC18HakChmMpPO1BojVegATNBtHXk4fWvf
	9KcqCrJpwjU4VR+Vo7/kDMCXUV3tpvM502hMvUZjFoqOtYKh6lLigUmHExEsh6K/n3un
	IrlhDEZkbj3Z19e7r5xq+Xg9hO5he5MYiYWQoO1Jjndy4FtqmerIhvpU2e7bTFkDtvr9
	caEj8d2taFSMZd4CKSQI7yXTVedHy90Y318l9A90lGzCxi4BM7+uz8N194JHKBpfejfu
	rGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/XwgloDty2nkXccbMa/q5KjBwgJPjTUbug9K3iGGXWE=;
	b=p40DNSMcIgc56QiqydWcv66hWJ43/rmbt+clFXR6WxZ1LTDdCBPGubmTHvBBypjY78
	A9d08Q++w4bKPHmYbkazVEg9LtMPK3GNeHu3fiMQX4L3QCrKKhrgVtN88e++vL5teHRd
	OgP93xf1qY0OR1huVTCk4KZRG+x35a4Vxb3ksQYHqbjGDvRq57NAmI5x6PaqLj9RdXPa
	L8zJ3HKvnd5MWd2M+iP/0gFuHMy5XWJzYzb66yTMYK0oE4ZS8TwW4QUfwgs/YS+XooG7
	XZf8JPej6yhcG56bFrejxt24K0ukjKxUxm/p3HT3xbQwJwwBkfqEzlk2Ti8conbvg3zi
	Xe/g==
X-Gm-Message-State: APjAAAVUlyalJJtzkDpnEDYW32eqyGH7ouXvDWWweUo4ByUyMkBeAYqs
	QFcqQ3GZqx3mdcp74W/QnyXolJqwp4riNsTxRhhONw==
X-Google-Smtp-Source: APXvYqwHPEMKox6elo/PDqm4IImar+Ow1VoomggDo2VNjDs9NdLtx4tD6AzMmpFXtCsuANkZnmN2+Wb1ATJ39Ry5R0o=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr9510607iod.25.1560332061555;
	Wed, 12 Jun 2019 02:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190612081415.4926-1-alex.kiernan@gmail.com>
In-Reply-To: <20190612081415.4926-1-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jun 2019 10:34:10 +0100
Message-ID: <CAJTo0LYqq2knoUs06-VjszcnwY0nRiSuNqS0cu0M5ibGds7iBw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Backport OpenSSL BUF_MEM fix
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
X-List-Received-Date: Wed, 12 Jun 2019 09:34:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2019 at 09:15, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> Upstream-Status: Backport [Not yet released]
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

As per patchtest, these belong in the patch you add, not the commit message.

Ross

