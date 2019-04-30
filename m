Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
	[209.85.221.178])
	by mail.openembedded.org (Postfix) with ESMTP id 582EA7D259
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 22:58:08 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id q189so3488564vkq.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HIOl9qgkh+Ndn/8hbGqGVk+Wqo2NuPjDfz2ncDiuM38=;
	b=jWBGUFkk0CpL1psL7Mk5tGTF60QbAkRj4k1I91E4Nt+EkzjQFs+SuNYOqr0nv6u8Kq
	NH9/x8cRyUjHarMBQiUVZPqIWgqUBW7n/JEGYoSpIE/BJTNm5zdiFGqw1r4WyVQxdDlM
	M+1JJfF8+UFAgzEUbHu4MfoevuC42vynLxsDI/bAUaNLNgERGskA3pWhh8EgXi6/tQKJ
	nrFsYtTb+N1bqfXCS7VhAIsUP3IPTPBUsYpuksmU9kRyDRE7CKA7+q9Dv6/LCJg4r6r9
	Bu0T2qIivAS445bYbq2Z6WA79WTCjIg1GI/+I0iGXJrL18r/hPwA00qqREyheaihNDQg
	Tiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HIOl9qgkh+Ndn/8hbGqGVk+Wqo2NuPjDfz2ncDiuM38=;
	b=hXXoC9Gn5NM7E2Nx2rCgsJX+au2pe2E5p33DISwYTyNFizWOPiWOHaXHIR5z5jBgw5
	O00gbTefU5QIWDYsZ+b1mIU9gNM4f5V+bwwiLgsOdIRndptcrJHKHo9NVz26dCa/sH03
	51hZMaPDkm4Yixg2/K1cKE01K8fVBF13J2UNXu3vUIEBXNI/iVoJ7EGLBafZGmS0WIPv
	CsyBQALsu0puXSNhfjekBR8ILTT7q1nlienxEA5P6L/6VUgT21tHD8MxewjEiyFQTusl
	GAJxnIeJRe2uq9kpttaPpbzc5dSmVGAXswKzjmURy9qbrYkpvLsWqwrJQBRE14ncW8hr
	pwdg==
X-Gm-Message-State: APjAAAWriT1gghpquQWVWuV3NSZL/2D805Gm+5zDvqlzJxrmFhXDueoI
	L8GDiGa7DmZyVe4Xu7NDo2yEUiMm26f1bnjy6sg=
X-Google-Smtp-Source: APXvYqwFvXHk2Ao+TIMeQETVxd6amh8KGzfH/sJrCAC3BUBWS6XwvXZXI9nnxnjeLBucVAPfTKzYTHPXAx2rx43IiAU=
X-Received: by 2002:a1f:2510:: with SMTP id l16mr28886276vkl.77.1556665089015; 
	Tue, 30 Apr 2019 15:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190430192414.43383-1-raj.khem@gmail.com>
In-Reply-To: <20190430192414.43383-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Apr 2019 15:57:58 -0700
Message-ID: <CAJ86T=XuJv62buXd69qXNQ=nteKs8GHLg2MKmL3kNd3LHih0qg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Tue, 30 Apr 2019 22:58:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 12:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Its already in RC phase now.

It looks like 9.1 final is due on Friday:

  https://gcc.gnu.org/ml/gcc/2019-04/msg00288.html

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-9.0.inc         | 120 ++++++++
...

