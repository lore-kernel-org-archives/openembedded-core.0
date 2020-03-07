Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3974E61B0F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 15:59:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 6so5869512wre.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fTWlwnmHD3K/QMPTyW46qLPP2mwWHZCWOSa8pT4IsQo=;
	b=OlOHvvc33G8NDKzuqBQLiRIL+S+b1/W4AAy7EW9NU88dL2lAmql0I1kT2lYPXfbAVf
	4qUKKqHRpsocuumu6WptMS7fjOaFb/1eGerxptSOvyuy+nb4zm+F0ywBzYr2mqB6wc+d
	VGZVMHxrYvtyMm8dffmngNO6N8YQEydCCPVWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fTWlwnmHD3K/QMPTyW46qLPP2mwWHZCWOSa8pT4IsQo=;
	b=bxKcMGpTAYp/pYHYRJymiURnLpb3JKK4Bwbq1LizcV4Jz5kS1/0eZIQBhFmJDTjwNz
	rX+HvKt2mSJoH1d+ltltnmMQZTkP1MiVOSNWExUTTZhP/EOP/jGIVXN7upk2PIIewcCl
	4Q+62IREJIoHfjzqTsKgLcC2b/U98sju7Y3EQUHkIKn6yZAQk1VjsUEKEbK2nyr20TN9
	fV6Yzc63/AqCbjv/4U3lTAL5IJBhdVkMNsM+y0J8uUVHIG+/dlkmotct3aEdVW3HndAd
	GzLhJOMwKtlBmccuA7za+AcLciY7AzyF2ejYlYkS+dPghos1SPBXJY2gPMMsB1O+Dxbf
	rTVQ==
X-Gm-Message-State: ANhLgQ1K578I8EWrr2cIwJ3J9hSjTa990V2pH8lzilm2ZYES/iwwrBTS
	4ofUTEUxp+rJLXiHbxRWLg2XUU2T7PU=
X-Google-Smtp-Source: ADFU+vtSHJJNutiVaLr06LKCPssnP69iEgI6SXuzxrggxdWLzCIm18bpB2J1skL9f3f6mGSMb9poZw==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr10383658wrq.142.1583596786719;
	Sat, 07 Mar 2020 07:59:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u20sm17442220wmj.14.2020.03.07.07.59.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 07:59:46 -0800 (PST)
Message-ID: <3d264f5439b9216788b9bdd50996c88dd3cc0b38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Jeremy Puhlman
	<jpuhlman@mvista.com>
Date: Sat, 07 Mar 2020 15:59:43 +0000
In-Reply-To: <20200307143223.2277.46482@do>
References: <20200307140548.13517-1-jpuhlman@mvista.com>
	<20200307143223.2277.46482@do>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdyb2ZmOiBNYWtlIG1hbnBhZ2VzIGJpbmFyeSBpZGVudGljYWw=?=
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
X-List-Received-Date: Sat, 07 Mar 2020 15:59:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 14:32 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: groff: Make manpages binary identical
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/23145/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This
> is
> an automated response. Several tests have been executed on the
> proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Upstream-Status is in incorrect format
> [test_upstream_status_presence_format] 
>   Suggested fix    Fix Upstream-Status format in 0001-Make-manpages-
> mulitlib-identical.patch
>   Current          Upstream-status: Pending
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
> 

I fixed status -> Status and queued in -next.

Cheers,

Richard


