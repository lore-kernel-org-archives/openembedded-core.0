Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE2761135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:33:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t3so11820838wru.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=uUJHm0ZpeLUe5soDhbe/lfEtUnoj2L05Rx/j1dbXwTc=;
	b=aM7DNNVaOjBsLUMr9Npqhhj28TZJFCyJ3UFX0LUQ4G3iZOZulu/rljsBBu+f0TKrK8
	KYj2o6R9JkcO2Xao3YHgutBzCyffEBwHgMWKsovqFk6NHu5tMIE/baoOlMM1pjdFlFhT
	+YdPq+m4XUUzqvm2WDMbpFHx/4qFBUGfpLO3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uUJHm0ZpeLUe5soDhbe/lfEtUnoj2L05Rx/j1dbXwTc=;
	b=lmYtQ6HmDGrS/uJ8io2hNfItRAJUvPXQx05pfs2oD3DyqlnLzAlfbNVvMlsye0IySx
	M7iFmsXoCkqVe2ZShFEa5Rzf5XzPYLz4aHmpFYIgsrDo4xWSo/DL6s3LUsd6MNDYfFHR
	XXI6UJN3JE5OyOypqX3ycFHuyhzMmH1ViwUPvkbdzd87fRPVwrb2YTUMqITnWsPtVkUz
	qVbGk8G+UHiuN1qVdShC+JCrUZ2AjDOMFmzdQT9vY833fzop5cxAZkV99IiiSRObYp6o
	Wres3XH/p1agCfpCjuCjn7Zz6n8xwItr8jP0GGweed04aQoe8XQ10W6chsrqe5PJVuzk
	B7vg==
X-Gm-Message-State: APjAAAU7Ckkgxt3x0Cj0glA6GOJiYAvJc4U6ArjvZGw+K97j4HtuDEfp
	Ivr0/S1r6IwabB1uI4tsoeKHfLLFeK8=
X-Google-Smtp-Source: APXvYqxvk62q9C1WA2aFb2MU/mcAhYrKT9L2L/t/+Vu2tMsBLdjss1Tqfd9hPm/e0vnU9NDh+1nV0Q==
X-Received: by 2002:a5d:6388:: with SMTP id p8mr5035845wru.299.1581701606177; 
	Fri, 14 Feb 2020 09:33:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 25sm8379178wmi.32.2020.02.14.09.33.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 09:33:25 -0800 (PST)
Message-ID: <fdfad35b0253070ad7ae7ded58f581a91c54984b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 14 Feb 2020 17:33:24 +0000
In-Reply-To: <a575ebda4ba94882a8e69523471b575d@XBOX03.axis.com>
References: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
	<a575ebda4ba94882a8e69523471b575d@XBOX03.axis.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Handle races between binaries and their	libs
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
X-List-Received-Date: Fri, 14 Feb 2020 17:33:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 17:01 +0000, Peter Kjellerstedt wrote:
> Shouldn't /sbin/ be treated the same way as /bin/?

I guess so, yes. I've done that.

Cheers,

Richard


