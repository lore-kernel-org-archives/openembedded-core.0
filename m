Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.741.1618865191922156363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 13:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IJAVjnjV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id c15so26450023wro.13
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=nMj3v7jYNaRGErJC9WkYqiXwV9/V5IGrZBIsMuBiglc=;
        b=IJAVjnjV8OU7wrAg9npl4PnAFScjDrBjvrGP9YWHZK7G6G8snM97pDvIewQbEi6NHj
         NhPyFzCazXyXZnbnjIHfWtJOOaY6GbrjLQLpaBKEwdyxUekWovf05c6RZ+geLh8BE49K
         pyoks9KORI+0vF819Y14iFYCLGpt6FsfqIla8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nMj3v7jYNaRGErJC9WkYqiXwV9/V5IGrZBIsMuBiglc=;
        b=ae2A6Kt+OkSeQKkMnJ0Y3gxxjCd6+Jcgw533wltwwp3nPsgxPDNS40yG/DUdRiLniA
         PZQGh4Xa5O2zHZArgDOhV4FbvdYhufWrYp5yJFolWHJT4lAYO+IXRZ98wB+ZUpBl4ceR
         gFggqrbAFq2fXT4A7ialKhDwuMhf3T4sa/FIgS7145XwTVY7CMVDYjY1EPbqlBJ48sH3
         m1zInbzJZbh5UeTNXPNm/JKY0lXDRzFNehy+o0Cb+di3WpvCASGJLKWCg0UD7Vio5Da3
         a24BR4Obyp7jUETLCv3smWcl+exUYONdUnQKpnZ0DmrdydvlRF55wmG0DNpbk8MRF2n6
         PnyQ==
X-Gm-Message-State: AOAM532Ac8Wn8eeC+IHwhXsHw+9OGwZ8a6u6iIBUfRSCNcEnlwZ4lr4D
	1nFx13EjjDitwrRtBhbF18bvHA==
X-Google-Smtp-Source: ABdhPJy/cS9Y2a1quI7Cly5OPOboaYKt8lB2GUjId71U0KsNjnDAfggHBm7hwVHSaj8JTF4WMuUrng==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr16181113wrd.130.1618865190519;
        Mon, 19 Apr 2021 13:46:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e28b:7bcb:6782:eaf2? ([2001:8b0:aba:5f3c:e28b:7bcb:6782:eaf2])
        by smtp.gmail.com with ESMTPSA id g1sm16386568wrd.69.2021.04.19.13.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 13:46:30 -0700 (PDT)
Message-ID: <b1d7cef227a165fc12f8f21649edda3d13e0dc3c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] btrfs-tools: Update to 5.11.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>, Robert Joslyn
 <robert.joslyn@redrectangle.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Apr 2021 21:46:28 +0100
In-Reply-To: <cc9a601cb41a48c5b6b0f325bfb049d2@intel.com>
References: <20210418034041.108754-1-robert.joslyn@redrectangle.org>
	 <cc9a601cb41a48c5b6b0f325bfb049d2@intel.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-04-19 at 03:38 +0000, Naveen Saini wrote:
> [SWAT}
> It causing util-linux build failure on non-gpl3 build.
> 
> ERROR: Nothing RPROVIDES 'btrfs-tools' (but /home/pokybuild/yocto-worker/non-gpl3/build/meta/recipes-core/util-linux/util-linux_2.36.2.bb RDEPENDS on or otherwise requires it)
> btrfs-tools was skipped: it has incompatible license(s): LGPL-3.0-or-later
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3312

Just FYI I've a fix queued for this one to meta-gplv2.

Cheers,

Richard

