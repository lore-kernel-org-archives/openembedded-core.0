Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF5C361BEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:22:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m3so3045390wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bm2unIrz4fZfrkvroKdj19Qr+uPoJ1MhGGSpM1k7l+g=;
	b=KtaPNwExEg/b8CshGx3cIC5KYGpwAFGwoQEuCMUZdKfWaWBMocVHIe2Npz92JFy9MM
	TXiqHTPYGMGlMWIEvP/WFQsk47NXTZDNjjihEfJtZBkZhmmavvHVsxYnZczrs3zpWxFi
	MS8WBW5tbjbg007YIcDtGCekRLkN/ULAuo9DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bm2unIrz4fZfrkvroKdj19Qr+uPoJ1MhGGSpM1k7l+g=;
	b=G6QnN0XSxwCD4v09mUBPBuLng9+3hY8ym3hnSn4j9tlZanJMbRJFTvyKP8ivO6uT5a
	dmDHQMCzB9Bpl+N1SkB08oALoabzDRDL2GkjAxEZEboUh4YVfvrV3filZGYXUtP0zw4D
	twFVn0leI9eJN+y9IlPGl80mKwGiHUrV3gBHBUZ21Qj6O4NUKuNoIN5mLlfyVtZ6jpp0
	0tnUz25v7en4pI0TXmqUqzhjCylEm/dpR4FoO0jG726dSTJnEBchT5gcBJqsnUNQeZJO
	6N4UqxXKgQOs6eaOhRa2xsSJQZuXhMvg7HEhSgBwKclRN2FdJ5Oyn7r5o6PAPQzjL76c
	avog==
X-Gm-Message-State: ANhLgQ13zZ72dlQLWrROmReaYNbHoA4N9Pdb4RLtbs1pWUbHjZM4JeNG
	B3wOhzrMdLTtVAN7tnaCLGJ1oDMDtC4=
X-Google-Smtp-Source: ADFU+vsdM/MtKLSxZokgnjsCKWHMykVAm02thrsmau/4IH/RUnGa2ge66m4k7SEqOqOCodVpKEdexg==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr4634160wmj.0.1583947348405;
	Wed, 11 Mar 2020 10:22:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c26sm8924166wmb.8.2020.03.11.10.22.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 10:22:27 -0700 (PDT)
Message-ID: <c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Kral <sk@typedivision.de>, openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 17:22:26 +0000
In-Reply-To: <20200311163730.78078-1-sk@typedivision.de>
References: <20200311163730.78078-1-sk@typedivision.de>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Wed, 11 Mar 2020 17:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 17:37 +0100, Stefan Kral wrote:
> Add the option --json-result-dir to oeqa core context to enable
> testresults.json creation for test runs via testexport.
> 
> Eg. oe-test runtime --json-result-dir .
> 
> Signed-off-by: Stefan Kral <sk@typedivision.de>

Out of interest are you actively using testexport? I've been wondering
if we should remove that support as it does complicate the code a lot
and ironically, isn't well tested.

Cheers,

Richard


