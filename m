Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 639EB7E33C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:35:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so1646650wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LAsK3ao2jQMhkL7Pm30nh3lLq9RQRbmXoLIZ4CEta44=;
	b=TQ3yGWFTpRhxyHs9XXj1ceJYNhSDmg0SxDUQou3Pim6ybZA8z6YIYtoHH06hYp4d5q
	IB0/xXJ6BB/uVK24I5LK/iYpAZPS7ODt+70BC9gAY1f+XhdANQB7ts7rQ7SzwvMAPNTM
	UsIhCu1zotnf98h4UseDBskCIpxLbGg4yqQ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LAsK3ao2jQMhkL7Pm30nh3lLq9RQRbmXoLIZ4CEta44=;
	b=fQ9/gM57jg1fvVkXB/xHK6BYavogZrclLjXk+vNksmVKAbDH5RRqQp+71a92DkxPXQ
	4cXdTe1SaVy3uhnNERUKQTwlZpj5scZZtnIIEpFe4U/YiSp1NTHjyrBNWhTMM3yyXShd
	mmUeUQTkM4slQw1Um0V76huSKuZLc5wSXpCF9IA3lPFPDFm9RK4jXsf1QGPgVAnG8Xer
	IV+MV29hqaLqVdPlJ3YMKKl2tADTHITtI1MAG30J/iZ4FFSHUTpidGJ7I2OfnrTl93Ca
	WO3s1Uae9fzyG9jQRn0utfMcq8a+RGiBwO6Kjgx/pUVfG3CFqhK/Luzd+qP+z8kM3mlX
	rXCQ==
X-Gm-Message-State: APjAAAV19elqFqNW3Xfxam8xwLZx5hWSA+vvDUGZojY03GIvqMbvtSgd
	NgjJL1OkE8UwGbMvleXs4szNhQ==
X-Google-Smtp-Source: APXvYqy1cUFOyB21ZbsXnJFNQtj8ZXdwpNAAjqWVKVWTUlBo2VIkkqg6R8XsjUQCZtIiHOWZjxOT7A==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr34528393wrv.303.1559133346105;
	Wed, 29 May 2019 05:35:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 17sm1559412wmi.25.2019.05.29.05.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 05:35:45 -0700 (PDT)
Message-ID: <638258f243352200f2456b43bc14bd6a83c0579b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 13:35:44 +0100
In-Reply-To: <20190528143104.30168-2-sakib.sajal@windriver.com>
References: <20190528143104.30168-1-sakib.sajal@windriver.com>
	<20190528143104.30168-2-sakib.sajal@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Bash: Allow new-exp ptest to pass when run as root.
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
X-List-Received-Date: Wed, 29 May 2019 12:35:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-28 at 10:31 -0400, Sakib Sajal wrote:
> The ptest was failing as it was expecting non-root user.
> Ptests are only run as root.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>

Rather than patching the code with a patch which we can never upstream,
can we run the ptest under a non-root user?

Cheers,

Richard


