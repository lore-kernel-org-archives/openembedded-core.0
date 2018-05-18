Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2697474BDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 12:55:52 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id c203-v6so6999937oib.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6vHa0iE3kB7Nfhy378rai9nVFUgLFACiD/t3rp+GfJ4=;
	b=ukbCQpTTWT9kSDXXcpmyHbVh5E6L8rF03ic0f150RtggTBGW2lQC5Y75eLcR/LBy1P
	DuJt35rBa+BkO+jjCykA6+4LH9mQZH/A0Ru/CDmf9W0ZlLOzazxRSsFJRfDKjl7mdFdw
	HagRVPxtCUzTCA36JRNM0iAkKuOZu7IAEt0ZVcpBlrg28mLywIA4L9xdWF1CAM8XgkjZ
	F4snOBSdNCtnj4BxbxMgIpilath66PiN4fZ3Sxr305rNaogqOuqqduWB8MjFifqxhttG
	BFfDOVWpEyiE0xiP4Rj2s7fdpUE6gVcJ8w+gW6zmVYN5LZLmaYFLD4VhXTLhwhxs6Hkv
	Vaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6vHa0iE3kB7Nfhy378rai9nVFUgLFACiD/t3rp+GfJ4=;
	b=VqcfdK9pl6riviOne0i+hWjDMrQLVWz3afSxDNmD+VRF+8eeiLmdmCTD7iqLFxBwDq
	9JZQt7qF8TQA6lXFPB9N/pn/yLkBJT9p99PY0ny0myAQQYzFj0enwHzZU21yhtPXixAC
	gxO2xY/cl6UMkVX8+GMynZVPNbryvnaTCo9BP4gZRnrvPUEnPfu0TUPtKUcMOfsHk79F
	hHENMUNRpmqI++MCPyYihFvhJNF8lj5TnTeu51dP5vvIdVvgqmlfb0F1SQ7N9Wt5065B
	EjIFiMmF+QD0UYve2yTRRVjwpjXF8qCxC1kmqHxwm6GMH3e7euYguMJZChj7X/AjAc8N
	oKVg==
X-Gm-Message-State: ALKqPwcvC9Sx43YU7p/yH+GhVKEl33ZrBsEivJGh9eu9BxWHCZ68AzjK
	kuMznRzXNGj/7vOZcNosvci6eGLVyFWmvV6BDic=
X-Google-Smtp-Source: AB8JxZqG0Ubfz2qU7oeQuJ/GmugSspXya8VLyaWUkbTeW7wvyT/tCKzq/BQLfsQqQHxWzQcJoraPX0da4XJsMjUQqsE=
X-Received: by 2002:aca:5a86:: with SMTP id
	o128-v6mr5878701oib.100.1526648153776; 
	Fri, 18 May 2018 05:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.11.23 with HTTP; Fri, 18 May 2018 05:55:53 -0700 (PDT)
In-Reply-To: <20180518093356.148937-1-jibin.xu@windriver.com>
References: <20180518093356.148937-1-jibin.xu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 May 2018 15:55:53 +0300
Message-ID: <CANNYZj8mE2Tc8ydqK5i-uBCmA=kCkdqCOvPeMRuWe6-u1Tk67w@mail.gmail.com>
To: Jibin Xu <jibin.xu@windriver.com>, yi.zhao@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wget: fix CVE-2018-0494
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
X-List-Received-Date: Fri, 18 May 2018 12:55:53 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-18 12:33 GMT+03:00 Jibin Xu <jibin.xu@windriver.com>:
> +Upstream-Status: Backport
> +CVE: CVE-2018-0494
> +
> +Signed-off-by: Jibin Xu <jibin.xu@windriver.com>

Can you update wget to latest upstream release please? Yi Zhao should
have received the patch from AUH.

Alex

