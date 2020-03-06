Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0B961086
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:00:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id e26so3920089wme.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=XjDZkmFWsRMBdRfbfjoR+EGTVA6l0A/PcUUhUaJDGRs=;
	b=aJyI9PSufYfyDJFlWpA/T5gyamLA74dCLjk2jrc1Zgfh1vLGdLnVZs1L5BbkNtFaYt
	KmhJwp05hFfjdrPP9h4f6e2Ozsg7Fetc2x0uOy8afy0yY7eCczoL8UPs5PsnFftrUrGt
	KO/J1ixh1EVXYnCarYMQ6rm/QDIwGNP5SDq80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XjDZkmFWsRMBdRfbfjoR+EGTVA6l0A/PcUUhUaJDGRs=;
	b=PUSdy10GJahEh35YukS8Av6Pwg9ogrVAIml9TwKIuFnLNvWsaHVebzjcH1qE9gwNtT
	TlGEIbT/3xaQrxfM+2JdRkb57qS1pbuuOWgTS9Rd+Yacz/6pG/FjgUAj9pj7uWX9/QVp
	3GswM/gnqWouvlW/spVI29knlvDaOlJxJEGtku0Y5piJl92ua5mGWmhsw3V+ebLZrXTM
	tg+DHHYT3kGFmbzc1zTm4vJul9GTfL3y5qi+aqSYttQcJQwx8d7muY8pFBUd32kUvV2b
	pnQsGN1qtGbct4c1ofMRLMfbSySm1xRmBla30wrJO9mfRbZUn/1yFpNvxnDztkwi6p6v
	UrdQ==
X-Gm-Message-State: ANhLgQ2uhEn77/dai8n9gltmu8trNwIrGjKzTDUdeRUfjmKU7vKp1qxy
	eQaiDpHWzIB7bDM5ZPEle7d5TMANsrc=
X-Google-Smtp-Source: ADFU+vs2kbanWJgnGSH/wVKP/WA5jiHVL+HAq/f87Pxgqnp3maP1bBNXkFQr7DuZiY4+krLIrJzhYw==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr5642874wma.122.1583532051945;
	Fri, 06 Mar 2020 14:00:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	12sm15258244wmo.30.2020.03.06.14.00.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 14:00:51 -0800 (PST)
Message-ID: <446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2020 22:00:50 +0000
In-Reply-To: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
References: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: Multilib conflicts in man pages.
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
X-List-Received-Date: Fri, 06 Mar 2020 22:00:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-03 at 15:22 -0800, Jeremy Puhlman wrote:
> Is there a preferred method in oe-core for dealing with man pages
> that conflict due to differences in multilib pathing.
> 
> For example an application lives in /usr/lib/foo/bar for one abi but 
> /usr/lib64/foo/bar in another, and
> that kind of information is encoded in to the man pages.
> 
> Some things i have seen done in the past, is move the man pages
> under 
> /user/share/man/${PN} or
> use something like mutlilib script to deal with it.
> 
> I am just curious if there is a canned, preferred way the project 
> handles those or wants to handle them?
> 
> xinit, xserver-org, and groff each exhibit  these issues.

Could we just put a placeholder into the man page so they'd be
identical? Multiple copies seems like overkill for something as
trivial...

Cheers,

Richard


