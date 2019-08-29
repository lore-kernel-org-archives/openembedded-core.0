Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F335D7D718
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 07:35:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 10so2564152wmp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=x+/qVJPTVEX/GI9JKovrqWUlFectR08Wy8xPG72pGJg=;
	b=LfYVL99OIin92NNUVkeDtcx/Zto6Dbd6SJQO/P/3F20Do/ESaPj2TF1IGrHNZhsBYw
	n2Xiq1gK9Wqj2Z3NMAypgdN7fn13MWW9ayjbRczygysPJBAKtog571s/zEeydPRqNWyT
	5hpKqT4Ctzbwx93B6q2yJFRnubNbrq+fL8YHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=x+/qVJPTVEX/GI9JKovrqWUlFectR08Wy8xPG72pGJg=;
	b=NH8v2NOZezr5/IYrh6iOjeCQKfbD5wabH3DAXZXNHN4+kvcGcxKWyEAYfnckR/Bz7Y
	GjpVSQcLkH8hv8mviZLV84jcbHo6h1s0aQTPWgx0/ZZxxEGCHFDifFopfqFej4oUAmUW
	0MhtcBrRQnKJLPzPIeS1HPgNXG6f3VixDI5LCbzXyZf7H4DpwGS9u5dTpRE7iPWuh4Lb
	fq77sv39Ck/WT7dUsgMuLqnKfemq7WF70VqDnErzGKkeDQyahc7YOKpEkLVD25xAhVdS
	jM2X/PPzFN3uiLXKPb5cPBvzuidxGuZdPcdDwLwsUppHu/Lteaf3BlNpJyKjnqEihf5d
	oavg==
X-Gm-Message-State: APjAAAVOv2O4yWFYDWbrs9xuAJc/SXU9tNl6/naoIqWAbpVwylVsLlmX
	e9ZbGfMGBKgPqeE+9+zax5Wz7Q==
X-Google-Smtp-Source: APXvYqztSbHyJSlezb7KNwoAUUPQsTlQt6fFcTh/CCzWjDjtv2Gd9914o2hJ8wL1kFWvZaCYyU3bLA==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr8956161wmd.122.1567064124617; 
	Thu, 29 Aug 2019 00:35:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p69sm1986853wme.36.2019.08.29.00.35.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 00:35:24 -0700 (PDT)
Message-ID: <fc1f9d118b1ab3e7dc157ce2230db6ef91d02202.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Christophe PRIOUZEAU
	<christophe.priouzeau@st.com>
Date: Thu, 29 Aug 2019 08:35:23 +0100
In-Reply-To: <CAJ86T=Vzs2X4icDoVdsysWNMeb9gB5B1reMfE8CsZTLBCf5AMg@mail.gmail.com>
References: <20190828092115.12773-1-christophe.priouzeau@st.com>
	<CAJ86T=Vzs2X4icDoVdsysWNMeb9gB5B1reMfE8CsZTLBCf5AMg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] common-licenses: update BSD-2-CLAUSE license text
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
X-List-Received-Date: Thu, 29 Aug 2019 07:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 11:13 -0700, Andre McCurdy wrote:
> On Wed, Aug 28, 2019 at 3:05 AM Christophe PRIOUZEAU
> <christophe.priouzeau@st.com> wrote:
> > Using the generic BSD-2-CLAUSE license as specified on
> > https://opensource.org/licenses/BSD-2-Clause
> 
> Fixing these kind of issues has been discussed before. I think the
> consensus was that a wider ranging cleanup is needed. The thread
> starts here:
> 
>   
> http://lists.openembedded.org/pipermail/openembedded-core/2018-June/270475.html

I agree there is probably more cleanup needed but this patch seems like
a step in the right direction...

Cheers,

Richard


