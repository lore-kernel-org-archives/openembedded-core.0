Return-Path: <yamane07ynct@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 767EB7F9A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 06:09:36 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id u16so15077356ilg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 22:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LScB3C1k18IDGyNYdDW5mgHYzIqZsB0IhtpVo0Q4X28=;
	b=WGXukaBNZQS4/fwnZVdiRnvLSwtDA29QLMhHZNPinS5Y/rZtZpTkdRGVGqonpwYZMM
	z8z9bqFunlRpy2lTzKe+ddKpb0RH926+M4tzU348UZ+C6DZJF7oMbv4vEtlwmr+bmXv0
	880Y4FvPyQVIZ4Lijj2xlKG/hfUKPI2Bk25/kBmU6Tod2fTvqdevuSVHHCrb4WYhIdK/
	rt8sUkKt094f7qXpIRGE7bzXNSdOPTgwdXtmm3gbpXourf6HzkzJ7P7fSAkw15dAMHFl
	ms8Tsuz2C+x9CuR70zRxmxLNDDRfIaJ/8dKztcTEHcdDU6Xp/RsTlnFcDzIdkNgYnczE
	kONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LScB3C1k18IDGyNYdDW5mgHYzIqZsB0IhtpVo0Q4X28=;
	b=o+XW2cOX1jRLvQl9lSm1frF8nme+1+NXRO7G8byBVNls6K4rcZLWOtaPksoI0wr3Cj
	vwJUrT2LwU2Ll/e6SwqwHYI8rQIqHLR7ERgIL5yaOIZJwlOkYUJ06C8fzPtoHO0Wx8NT
	5hplUp7g9UoKWosANlBeFWXQRm+vucSQvW2Lx2q1ib2IQgwa9112nKIrxTgebthhvjxR
	fk9iJNP2x6Na+VXdd17GpcUex73OiHxhYIe8dcr9VcnRkqHs/nELLgn2ChwDETu003A6
	ivfqL5bBsI9hUoOQB4ja0GbpQIunqjLv9hZEaLC0VIGKutx3VxNbAjz+ZeKbPvMkOhtw
	3+6A==
X-Gm-Message-State: APjAAAVeefhqzqjhOzcloO+jCj9T9pcrwcx4Xcr7PPFUHJdyURHlK71b
	/gaPAjJNYIVKGPU6XMQ2YVp3wFiDa2g98W7VXro=
X-Google-Smtp-Source: APXvYqxsVEEca90M7UQwNren/00hqB6mFpu7EuN2qPUeaaw05+Jx/wHyZR4HvgOOCL02Tm4MM0ybOkNnxSvSPMok2bU=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr31106451ilq.306.1575958177456;
	Mon, 09 Dec 2019 22:09:37 -0800 (PST)
MIME-Version: 1.0
References: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
	<cf16a85c-f7e7-57e8-c6c2-9ffec81e8af7@intel.com>
In-Reply-To: <cf16a85c-f7e7-57e8-c6c2-9ffec81e8af7@intel.com>
From: =?UTF-8?B?5bGx5qC55aSn5YW4?= <yamane07ynct@gmail.com>
Date: Tue, 10 Dec 2019 15:09:01 +0900
Message-ID: <CAHZ3=rpH=C1FXieMV2n-7oDveSoHdfprH8YSwxstN2YscWEPVw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Tue, 10 Dec 2019 06:09:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2019=E5=B9=B412=E6=9C=889=E6=97=A5(=E6=9C=88) 19:43 Ross Burton <ross.burto=
n@intel.com>:
>
> On 06/12/2019 10:13, Daisuke Yamane wrote:
> > This patch also helps to build with EXTERNALSRC.
>
> As this doesn't actually set B, will you be sending a follow-up patch to
> set B so out-of-tree builds actually work?
As there is EXTERNALSRC_BUILD in externalsrc.bbclass, I don't think
the follow-up patch is necessary.

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

