Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 42FCC7E3A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:33:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id f8so4052767wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Qtf/S2HcB8tyY2pZu6v5e5LwkRHWL26XnNvjLnPIOrc=;
	b=Z8fhHH5WUrRVtVt9GohKgZ/tPuE0bbTvvj2C37ckdmFFdnh9fKMoMZoXwKD9ZlUtgb
	AWqsQhwMYJS9TP2CQceNmQiOk3sKyY6ymPB75H7ZhGVX9b9ARLM/TQr7D8aKMslt7p5c
	Pz8ha6jW419tOzqvwAm/9cSoGMBpRwHOWx0x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Qtf/S2HcB8tyY2pZu6v5e5LwkRHWL26XnNvjLnPIOrc=;
	b=lDvZTUbZOah1UC8ZGSHOsfxGEpaqVXAPA8i/nPoFjRu6ixvnkZBiOcYv7lNZ0mTGGp
	XUM8vm9fJPmANrYsRUtgga+CCBd5N4QTM6kQDZNkI0rBQ162w4lJliy+omBJh7hs7Bf9
	TkJzcV+ylNpBps1/gwI3tkwjHgzX97TOh+THgtLTySG7CdtmoHlYasCryH8ugIbaHDbJ
	ttWQcyc7I0pdEmv0jxjgzWizefN+flOwZyLm+gfX8aFLW8cvyXEs5Bj0GnEl24FkguYJ
	R4uiqccwjlacx6ouqZ0DueqDmBJ+qnwr3GTLJ7a7JRZ7rvz0BZniWVeAhSLsqL/pDpP4
	376g==
X-Gm-Message-State: APjAAAX2cZN4Ada43irAeu+Yrl9JVOv2T7fzYGH69mT6Sy382rYqUAs4
	0Hz8Do7kp0hJk2uYnyyJeYwUAA==
X-Google-Smtp-Source: APXvYqx5HYPchtoKmosNXLhgkPp/9HgIRqfkzT0aPRWQCa/KVM+kyMAkAWmS6TawfYSXFoYqresGlA==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr18459411wrt.197.1558564386028;
	Wed, 22 May 2019 15:33:06 -0700 (PDT)
Received: from hex ([85.255.236.24])
	by smtp.gmail.com with ESMTPSA id n1sm5332856wmc.19.2019.05.22.15.33.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 22 May 2019 15:33:05 -0700 (PDT)
Message-ID: <ebf8b3bb8feeef00089804b75da63f7985e6d43f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Date: Wed, 22 May 2019 23:33:01 +0100
In-Reply-To: <20190522222807.GC4732@joraj-alpa>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
	<2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
	<7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
	<20190522222807.GC4732@joraj-alpa>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Wed, 22 May 2019 22:33:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 18:28 -0400, Jonathan Rajotte-Julien wrote:
> Hi,
> 
> > I think Jonathan Rajotte might be able to help us with lttng-tools.
> 
> Finally had some time for this.
> 
> See [1][2].
> 
> [2] does bring the matter of forcing lttng-ust support of lttng-tools 
> when ptest
> is deployed. "lttng-ust" is already set in PACKAGECONFIG by default
> but is there any
> way to "enforce" the lttng-ust config & dependency when lttng-tools-
> ptest is used?
> 
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2019-May/282733.html
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2019-May/282734.html

Thanks for looking at this. It sounds like we need some runtime
dependencies as well as the PACKAGECONFIG option. I think the lttng-
tool ust option should be changed:

-PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
+PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust,lttng-ust"

i.e. force the dependency at runtime as well as buildtime.

Cheers,

Richard


