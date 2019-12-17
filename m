Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 885DA6C193
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:53:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so10356225wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2PHOoNCC98NciahxcKIcmysWHM9GeSr57Sqgms7gCk8=;
	b=Dwvw8aBBB94sFd5UoY6NP0GsPGZIC4vbgSQqSCAPmDUy8hGS1bRD25e1uUfS2zevS9
	UMWkq/GnijGeqiREziAtM324PSaMgtgBlawVNc0WTYj/zMxYrTCD35m+9woALdcsJwUP
	uO95WSCkVUeLU8y7pBDFsIizD6lVq0vBcZsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2PHOoNCC98NciahxcKIcmysWHM9GeSr57Sqgms7gCk8=;
	b=MW0Q/+gLY+9Tjotx5Fz3G9dxhsJYNE3GNImp1+Ump57jSGr8cZg3rU9TsMEBf1qcJl
	3RLdzSAmABil5stcE3g2+Mhy6DBUnj4w4kmKCkcFcTWSELO0ixIQC27AFoStUwEYXQlm
	/4Pq9aizBEw3o8EE7B2c1NFqO8/Fsy6RCHs1sVOmAIC5kkujVmWEyYopahQc6WVOIFa5
	juqejUlKQOKnGTPEKVVEdu9PniDLKYnlMSNYr8udsEvqzVN6QDKOEYbP0eH+BW5LmXoB
	cecqTUob3NQ16Fu7alFQ40vizOy9iBuLCx/NEct56+wqdettrPMghWrpyqqOk7MQpicB
	ScWA==
X-Gm-Message-State: APjAAAXa2wsKugv+BVlTXANF1p73Pu0M9eRkdXJMJwM54UlVh+tDPA2w
	oyWN1xNYVrJbJYBOI6W3wVYcrQ==
X-Google-Smtp-Source: APXvYqyMtXsdqwmR0h5ui9U7qZWJnrvI5KMWQ+cQYhitVBkt9WAtYJYxPzaZUwtcIHZ3pNxMiSlY8Q==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr35752384wrq.63.1576572823316; 
	Tue, 17 Dec 2019 00:53:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f17sm2216743wmc.8.2019.12.17.00.53.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 00:53:42 -0800 (PST)
Message-ID: <72c9bb8b86bf212519cea8b444067a02cccd790d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 08:53:41 +0000
In-Reply-To: <20191212181436.1322-10-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-10-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 10/30] libtasn1: update to 4.15.0
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
X-List-Received-Date: Tue, 17 Dec 2019 08:53:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> Drop backports.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 ---------------
> ----
>  .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
>  .../{libtasn1_4.14.bb => libtasn1_4.15.0.bb}  | 11 ++++--
>  3 files changed, 7 insertions(+), 73 deletions(-)
>  delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-
> gtkdoc.patch
>  delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-
> ldflags.patch
>  rename meta/recipes-support/gnutls/{libtasn1_4.14.bb =>
> libtasn1_4.15.0.bb} (72%)

libtasn1-native fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/153

(probably host specific, centos7)

Cheers,

Richard


