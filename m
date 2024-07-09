Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC90C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:43:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.1462.1720539822714023480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 08:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P0JgbzMI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so5158155e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720539821; x=1721144621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oeNifPCyuddIyQbzFfnMb8T9Y1ZW8Y8MBP+PHkn1UT8=;
        b=P0JgbzMIZlgKRDPQqX+DSe8s/Jx7YhgHX7vPJuJ4xcg6ailKlkQfbWzfzx2kjZQ/yh
         ZS+lYRc6wR+NjPiKeTJR6BMsGdBU61fA5e7WT1TzUmsNujCo7PAlWpvr4Pak435wuG+T
         tVX/2mH+xpqWwelr+lSL3NByn3YEksDCVHSFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539821; x=1721144621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeNifPCyuddIyQbzFfnMb8T9Y1ZW8Y8MBP+PHkn1UT8=;
        b=m/lVzNKuBc1uVJgai6l4XZx7iV8/a4qsw70t6MRgSpm7TzPPF3CxmAvxhTYPyjeQE+
         /2mlPURPEHghziyMkC5Jg+m0RMdfoakQJe8VZ0WBafL03gBt2N7r5bpwV7WWOHAkeLHU
         LxUwY2xKQu8BdKfQkf/9CUdAggFrQ2aYZVh8fnX+rYsAQo27UpCdJ81J4acincvCCqdz
         vFPNJqG+cxTE9ysdDkpEAr4szw/w8JQCr5KsV8VmHB1vmAdRh6yrf5Tbow5N/G59vcp2
         Wcj1DK7upQsO53FA0USz6erBChpV9NurBZIqB1XX3Y0HEi6bHUUrMwPgfVvnlhns0oad
         xQWw==
X-Gm-Message-State: AOJu0YxYlK902sZ73kHaqO2Xj/i4ko6KdISxkzrnndRsfKw6K2kr96OU
	8agJM+E4CNkHZPJxTntxH9wgXWxqSzKxfX2qLAjH3SlTqJYjhxARV3mcH0aJIqKiB0c9wCuEH0P
	s
X-Google-Smtp-Source: AGHT+IGSwtDPTQA7Nobrr2bJ2XpQci6XHfTXnzEjs6/kJo35d2oFd0nTZ+aLTrydPyQdik/9M4IjLg==
X-Received: by 2002:ac2:53a5:0:b0:52e:9882:2cd8 with SMTP id 2adb3069b0e04-52eb9993805mr1673817e87.4.1720539820869;
        Tue, 09 Jul 2024 08:43:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb12:75be:8387:683a? ([2001:8b0:aba:5f3c:eb12:75be:8387:683a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f18c7sm213279185e9.23.2024.07.09.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:43:40 -0700 (PDT)
Message-ID: <e2968d625ce5192dba1ecc02242509f8fc24dcc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Fix missing leading whitespace with ':append'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2024 16:43:39 +0100
In-Reply-To: <20240709141043a4c14363@mail.local>
References: <20240709120209.65344-1-niko.mauno@vaisala.com>
	 <20240709141043a4c14363@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 15:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201665

On Tue, 2024-07-09 at 16:10 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello,
>=20
> Can you submit one patch per recipe?

FWIW I tweaked the shortlog prefix in master-next to mesa/dnf: which
resolves this case.

Cheers,

Richard

