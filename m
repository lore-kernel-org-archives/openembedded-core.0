Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id ABB637142C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:49:17 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id i17so10267682qcy.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 03:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jUz7p8vPndUtO7WEylxHFc3u+M94xitxCO0TkrI8O8A=;
	b=K+rVGnH1gTKIdJS96DO9Q44bfzzfrbh9hifiiKaDa3urE8XasCF4fuD9gL45osIlRQ
	0ykY2K+c2tRpXepu/YwUEoYdBN0wc9uKv70sTT2DpL9YyLhWe7O7E5rE1MCCX5GCQAl8
	UlnO0G5ot2/qntTh7polzlwOKTnECZQMZrHIxyC/WKBjfacQK9yxqW2elShyF4c+hEUT
	PTL5BYz35Q9/2WqRzSWlBLLqqxHS1DE/BTrjNefFuqe2Q+hZjhlgjsoAydSwrSY88Uk3
	L/LAvI36HA0mVUYWhouxL1lvxwZbpfvO/0Lc6nmRqz+JhJaY95J5lYI4Igm05+GrqveO
	3F3g==
X-Gm-Message-State: ALoCoQmem9nnzEslZVxJeRkEnqiTp0Rz2Bz6a/dhZKtvrQpqxJx4EemMsKMl76+dWJKs/S3YZszh
X-Received: by 10.224.79.139 with SMTP id p11mr5345349qak.93.1409827758594;
	Thu, 04 Sep 2014 03:49:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 03:48:58 -0700 (PDT)
In-Reply-To: <d05708b323abbe3acdaf8c03379464e64b64b2e9.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
	<d05708b323abbe3acdaf8c03379464e64b64b2e9.1409764769.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 11:48:58 +0100
Message-ID: <CAJTo0LboL9K0JDdL3MinF0SSOONoeL7_WWfXoEe4dDtSTE=_EQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Thu, 04 Sep 2014 10:49:17 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 18:27, Christopher Larson <kergoth@gmail.com> wrote:
> +++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch

Missing header.

Ross

