Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3BF71DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:17 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id f194so12210438yba.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YnX4zcE9ZAY0uR0hH1hMNlfLWy3yyJKqloPJzhZy68s=;
	b=EW8DgKaFdQj2IkXxs40JkY7+4Tm/6++G111RR1bC4Q1S9xvjrMhcuSTg0nIFrB9rdm
	cNrXqz1Fs+L1Ud5m6OnhEDU248bxtMBjPuFqZ3V4xfzBBs7y9p3OzYPHC8fjTgwZKGKr
	9x05qVllwvzmgwHcqgyiykr3OIN50S44gklEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YnX4zcE9ZAY0uR0hH1hMNlfLWy3yyJKqloPJzhZy68s=;
	b=gCt4ITe/r6oNgxlOi4uQVSWFHCEVusempjZrKx9kQmCi0f2A1dpFQG7vxIo3ecmWvI
	aEassF/xWKXMQDuG07zBFsnFLUiiwd6159vYpEZrZ9gbjFTknuOEe2G3YwnzB5RsZtOK
	aZJf+w2TRwZDY4vXccYuARxraa6apFXwPQ2je3pxgaiTf+zEUHJvJpWIwricPu8FLFQV
	BXHmjTuer0elFegtsXp9RDeMlicroFQWaJ/foKILJV8hb/wZGQrt7YEZxtj3NdDMYOcL
	jqnIucyMPiE0IOXqXnkwMj5HgUgV9LYSbRuJGTQ5vlkvNRmL876cza+yz3CTABQinpsf
	D2PA==
X-Gm-Message-State: AIVw110IMmZpKOyFSuypwsKKCyj4CsExHAb0FOZAunJFVvG+iZ2/4NGa
	XhugDzqoA2ylDX5I
X-Received: by 10.37.126.69 with SMTP id z66mr15178701ybc.132.1499257699007;
	Wed, 05 Jul 2017 05:28:19 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	l190sm108765ywe.78.2017.07.05.05.28.18
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 05 Jul 2017 05:28:18 -0700 (PDT)
Date: Wed, 5 Jul 2017 08:29:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170705122909.GT9889@bill-the-cat>
References: <20170705111311.13943-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170705111311.13943-1-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: naresh.kamboju@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 05, 2017 at 02:13:11PM +0300, Fathi Boudra wrote:

> * Use a list and re-order alphabetically to make it easier to read and
>   update.
> * Add missing runtime dependencies:
>   - acl (getfacl/setfacl commands are required)
>   - attr (getfattr/setfattr commands are required)
>   - iproute2 (required for netns tests)
>   - curl (curl command is required)
>   - util-linux (ipcs command is required)
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

