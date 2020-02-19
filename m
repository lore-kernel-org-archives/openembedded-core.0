Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80A1D613DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:30:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so1237983wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 08:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=F29iLFR076Z72yS9H8cSJdhWoIBS4PLXOhcuEoijpCw=;
	b=fVKcHj4QmfQ7s3GT40SL1O1wXWMkbPyrMALR8nExfSOgBsv4pLtrjk6x8kzAinQxZk
	NzCm374gp7Ezh5H0ag+vcr5vG33kjM9+6/ejZ1jBOwfI/EnsueHxhItVNA5RKGxn7KyA
	rG6f+pLaxvi7IVXcU6G2VzKYHzEnxg2tC1uoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=F29iLFR076Z72yS9H8cSJdhWoIBS4PLXOhcuEoijpCw=;
	b=W4g69vej3+gUlNvsZPgiGic2EKTtibB06qaJTUJ1pB1sEhajStsMaYLdyuUNd43I+L
	2z6aq59Dms2Rhp6vfedxu1hVwVWthfgdhi+H7mG9RJgzk0KyMkarXe/0ddAG174233H6
	uAYH5js9FJKiVYnkQGXDqdgt6NwMIVj/buHoPXlgo4tKkHbmvHhBCKjCNINPWmgyt4hF
	tNDvAr3nDQvVBt7isDN6RVJdVAWMdc2rwFxJbwOCkYcD+vEYxMHwjJ1a+6vaInNQAOHQ
	ZiWLrfBS2vi5Emmu563DS7jHfr3SLh/cNF37Hag51tL5AMgeptCtTQe1sLKiRtHBsjyC
	de4A==
X-Gm-Message-State: APjAAAW28K08/pqSkef24bqaN8L6oimD59+oHeg3p9YRIs6K0RSd8waG
	2CqP80XXrsVb5yvypSt5e1lTfg==
X-Google-Smtp-Source: APXvYqw/rMfZxBF5iF7V5G6OFV8zetIXyKIDd9PPGEtLEWlfsh+yefvsTITdBMj201qey6HtRxgv+A==
X-Received: by 2002:adf:f847:: with SMTP id d7mr36072696wrq.35.1582129845168; 
	Wed, 19 Feb 2020 08:30:45 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y1sm344736wrq.16.2020.02.19.08.30.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 08:30:44 -0800 (PST)
Message-ID: <e84e99dbbc52c6ef7d0dda22f1c5c386855e98a7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Branden <scott.branden@broadcom.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 16:30:41 +0000
In-Reply-To: <20200219003801.15549-1-scott.branden@broadcom.com>
References: <20200219003801.15549-1-scott.branden@broadcom.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 16:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-18 at 16:38 -0800, Scott Branden via Openembedded-core wrote:
> Add devlink support to iproute2 recipe.
> 
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../iproute2/iproute2.inc                     | 34 +++++++++++++------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 

Doesn't build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1822

(and a ton more)

Cheers,

Richard


