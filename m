Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398DFC30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 11:36:25 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.17329.1719833779059791886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 04:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PiBd43I0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so31744221fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719833777; x=1720438577; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRm3VF1P9Boj3oQQ/fB1xLRKzWw/TsjyGXRZGwi+CRw=;
        b=PiBd43I0nso6iWAelJO9DZ8kZcFKralZ1HjLiI54Gzad8CKxmsFs8caq86bB01DiOL
         bTeE4v+xeiiCPReijBRm2PC19/24PRUCbHBgE/QUOLdxSSeyITt7uiPAHzvXF9tnsyEG
         5fpZnw9lDki/QvtRVGBOSR33YMj9cTVzK+Os4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719833777; x=1720438577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRm3VF1P9Boj3oQQ/fB1xLRKzWw/TsjyGXRZGwi+CRw=;
        b=DsK8Jt0LXS8BaQOF6WYopYZShlB2r09THR70u9zQo+/aoEzPC9E42hmQIZWzPuF6Mf
         c0hBzD8/x1IL/yMmYniEyBEXe0b4vnthKK3Wye7v2N0hdohJs8OMYyh/TfXRCkT69Gqa
         sXco/Ge2pSBfA9v/3WiCPoXVqueHpfP8I82Jau9gcF9JTWpAKhVd/g/0MTGQCNZXH/Wk
         502lvN6CQw/sX6sxDGmrj10RufWvYdL6gXV7dGgP+e1p5HFswtRdwMk6YoGj3PvPmc9E
         R2GxAz5H2ukAcaSRcgMfCS7MSMKAu8u6slRhy5nK4hdc3V2ynv9W/ROUVMmcS00MpqK1
         TayA==
X-Forwarded-Encrypted: i=1; AJvYcCXa220Cp9maY65fs62fEaLp0qSnPLXK4bIweCQjKk+VEHewHYI6QOG87VflhvmgA5tUPDdh2muAr0AuKh52BGtjOJVLjs6Z4ZAOst7Z4KA+wSNUrrSY/Glx
X-Gm-Message-State: AOJu0YzrLsYivyRFsPknvTe81xAAspuMiaArfslIdStd9OeVQdptLVsF
	iYqV0djGec5jO3iAatW4/pXmqX9MiLjuu6+EzVu924f0WAzSY18m+GFLCNCzgMM=
X-Google-Smtp-Source: AGHT+IFCPc8gIyUupjL763zIdz2B7cmZPdn8ZVuGB3yYZCU9mvWYf4/hgUTHMvrjWxqDAOHM3TNb+w==
X-Received: by 2002:a05:651c:86:b0:2ec:588d:7eb8 with SMTP id 38308e7fff4ca-2ee5e36eb67mr34621641fa.21.1719833776940;
        Mon, 01 Jul 2024 04:36:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:476a:5554:3166:a3c1? ([2001:8b0:aba:5f3c:476a:5554:3166:a3c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376f5sm150290225e9.6.2024.07.01.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 04:36:16 -0700 (PDT)
Message-ID: <acda968a19cc0e753ab7204ef6abe69bcf67f985.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/9] rust: Upgrade 1.75.0->1.76.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 01 Jul 2024 12:36:15 +0100
In-Reply-To: <25279.1719827797295861988@lists.openembedded.org>
References: 
	<CANNYZj8BGFdzu3Og12jrNLya+pA2-jQ0d+b1SG25ZUMHAaU7=A@mail.gmail.com>
	 <25279.1719827797295861988@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 11:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201301

On Mon, 2024-07-01 at 02:56 -0700, Sundeep KOKKONDA via
lists.openembedded.org wrote:
> We intentionally dropped these packages from exclude list (informed
> to Richard earlier) to see the issue fixes with latest releases.

This kind of patch series should really have a cover letter explaining
that since most people were not part of that conversation we had.

To be clear, I said it was ok to send these patches for testing so we
could understand where we stood with newer versions of rust.

I did make it clear we do need to resolve the reproducibility issue
with 1.75 for scarthgap before we can merge things though.

Cheers,

Richard

