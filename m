Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 741337391A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 21:07:44 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so18275359igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+q0MYDpmDWLodc97N9fe6/1FEIwWWMLJ4Q/4k1cvjDk=;
	b=jSpuejbrbPln4sv9TCAi6XQjMfo+eKMQW1vPvvfurRcJZS7icRskm2Mh5pxuxaU43d
	T1gxmNn/5TVEFn/TOwbZheTSRf/Bn9+j2huDY4pd88/ONB3Sx8nzs83a2pd0HvE5TRPR
	KVCGhAuG28oSwVl7qowue/uwKc2XwmV3QcFN+R+YlvJZBVcUBkgVePJ1RTu6MfPgpWtw
	ZTtvhcSjVdrEvljaKJWEXQvMPRDpLrrC2Lb0Zj/bVcgOcnJdgiZk9H6I+u6UQDULN6r8
	x278HEPCLiWhCtZ8Pd63j71T+5pQ3U726wLgK1lEvqEIQ5VnYnp0lMujFk6eGb5hzaBl
	rA8w==
X-Received: by 10.107.129.22 with SMTP id c22mr45421302iod.81.1429218466052;
	Thu, 16 Apr 2015 14:07:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Thu, 16 Apr 2015 14:07:15 -0700 (PDT)
In-Reply-To: <552E2B02.8020105@mentor.com>
References: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
	<1428609535-15027-3-git-send-email-dmitry_eremin@mentor.com>
	<4A2072A0-6C21-4FE5-98D6-C9EEB1FA3924@gmail.com>
	<552E2B02.8020105@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Apr 2015 17:07:15 -0400
Message-ID: <CAMKF1spySBzNpT3jE6w0ta6_zsL5bXr5gfPzC3jReGkJuV-NrA@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] security_flags.inc: add more exceptions
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
X-List-Received-Date: Thu, 16 Apr 2015 21:07:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 5:10 AM, Dmitry Eremin-Solenikov
<dmitry_eremin@mentor.com> wrote:
> Would it be better to fix the layer.conf or individual recipes?

recipes even better.

