Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 064EC7FA30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 20:46:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t26so5259577wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sfb9Jv3UDFOcDh3i6QU6aq1AdchPIi7LbPcOrXQ3z98=;
	b=BQixVJODIM+sBjDd2O9pGHfiaYgxaW3rOsEwK4n0toUwVl8ygxN4/jMHI83z4oLFxr
	4kvrOjG1FQxcZ16pdt9VsCTVcmitdPjMc4sZlTkltj2yqu6dnx+bFB6Q+tmeyjHRs+kW
	+hQZhJzataGgNKxZzYs4zj5XQKW6LRvadvgWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sfb9Jv3UDFOcDh3i6QU6aq1AdchPIi7LbPcOrXQ3z98=;
	b=PudiYeg21GYavL2ejiMLZI7gCyGqQgBTRNE11Jctf3EXsGwdrMbWTUENQql5R4i7EL
	Jxkflq7JoA1Z9NDqTwDPi4svURgFHeNTr6pdItWHmH+F2uKEONsiOCmBmEjXBY+3gGQX
	P4iksudgznICnGINvSH8+6Trmt+iKBI/NHFoM+BcC+/N2tjO09OkoQJChnW/sD7q6dJE
	3nxi0qDaLLTY3cWy7z6g8UYc+lFoYI7E/4LyZ81Y2Mbf61J71DHGsCai/pqdggpIHEJl
	HmkSwr7oMVonuJboP31LweY6wkxpvgwJajMsZIgig6m1ZBogKu1pux3clVAeZ6R+nz43
	CDMQ==
X-Gm-Message-State: APjAAAUL2cyFyYC+wsE/ISppzedrsejPCzJQHPW4DNpjBbVukO4/lQJx
	JvnBC75/13XLmd98qtJSCz4wqA==
X-Google-Smtp-Source: APXvYqyFSMqEaKrbVphblIRJdpe1Kg0Ei9IAmdgH5P+l6j7BgDeLBOMRDLyXBgrzSX6ndyzD9aGaMA==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr12934078wme.1.1574369168641; 
	Thu, 21 Nov 2019 12:46:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a15sm5070240wrx.81.2019.11.21.12.46.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 12:46:08 -0800 (PST)
Message-ID: <b7d34d41f90f560b267015c7b43cdc96e7e5ae49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 20:46:07 +0000
In-Reply-To: <20191121182105.2803314-1-raj.khem@gmail.com>
References: <20191121182105.2803314-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd-bootchart: Add RISC-V support
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
X-List-Received-Date: Thu, 21 Nov 2019 20:46:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 10:21 -0800, Khem Raj wrote:
> This is a partial backport from upstream systemd

Partial in what regard? Its incomplete and doesn't work? or we don't
need some of it? :)

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...itecture-Recognise-RISCV-32-RISCV-64.patch | 45
> +++++++++++++++++++
>  .../systemd-bootchart_233.bb                  |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-
> bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
> 
> diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-
> bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
> b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-
> architecture-Recognise-RISCV-32-RISCV-64.patch
> new file mode 100644
> index 0000000000..5e89195915
> --- /dev/null
> +++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-
> architecture-Recognise-RISCV-32-RISCV-64.patch
> @@ -0,0 +1,45 @@
> +From 4a6ace0a965965ea15e88c3418c7158ca5cc9f8f Mon Sep 17 00:00:00
> 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 21 Nov 2019 10:12:05 -0800
> +Subject: [PATCH] architecture: Recognise RISCV-32/RISCV-64
> +
> +Upstream-Status: Pending

So it isn't a backport?

Cheers,

Richard


