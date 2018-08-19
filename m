Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DDBDA71BF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:36:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g1-v6so10952081wru.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fdLEnF9sv3qQehfEAAK/tQZIScUg+u/y3Mo0C+gmFmE=;
	b=RSOEUCzuKKul5qJdD7BqfnXOHoxRmteqnXv41c4CjzI11fgycBsuMwTk8pNDHKtmBO
	5mUg+JFZ78p3JwHv5QHIYb338r+Z/PmjcLTKbXFhD/jQMA10TICSXLo++Yr2UuSv0zFd
	AklC+fo7csW8bwYKd1w0RNm3JISid7Gt0KwKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fdLEnF9sv3qQehfEAAK/tQZIScUg+u/y3Mo0C+gmFmE=;
	b=StPvni30KK5cpdImV9jXjQKwsa4yfu/5/lXrTpF+QQ6rL5JEymrN3ojAevmQdKwIXx
	rbe+RDmjqw36hf+7Lv+hYdvk0pDeItjgpa3gY52mZoNnk9ayqFAPMQ+5T/a719n3Ddgg
	JnJWZMAumMpzPMD/++b0yWbZZ1tBTJRnhrkU1Vjyw5q0ETXPxyEm080Cr3fEqg2qvvHt
	A8RBinA8yB9KZnYVYlvEiagiYLo/nGAlaSPZ9DOvI1U4srqAoS/iUmp9uw1bBoJCJNfu
	tSBDjYbApym2yyxYFnZb8/nUHBkDGOrpSpjKAGu+2fUeJ08wm1xHAvs2AycYWCO5nPhQ
	R81Q==
X-Gm-Message-State: AOUpUlEd3/GUAJQyU/JWsGULHX+4HdiU17QMyGopf6b6SIzZy7Ko2sJv
	imXShXLCJ/t6VIOw8PpUhasp2Q==
X-Google-Smtp-Source: AA+uWPxhGrNkPm5rw0cWaR4LWNNwTLWHlPxv6oxdbB6MdVux/dYj4pctTNGK2snZMmUoS7q9AR1WIA==
X-Received: by 2002:adf:a512:: with SMTP id
	i18-v6mr8984335wrb.220.1534692991652; 
	Sun, 19 Aug 2018 08:36:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z101-v6sm17918227wrb.55.2018.08.19.08.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 08:36:30 -0700 (PDT)
Message-ID: <411c449a525d073ac6165ed59532e314d08388dd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 19 Aug 2018 16:36:29 +0100
In-Reply-To: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
References: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Sun, 19 Aug 2018 15:36:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-08-18 at 22:50 -0400, Bruce Ashfield wrote:
> [...]
> 
> v5:
>   - added failure catch for x86 purgatory files which changed in 4.18
>     and hence are not universal across versions
>   - added explicity bison and flex rdepends for mips64 prepare phase
>   - added mips64 files required for scripts/prepare phase
>   - added files required for missing syscall support

Tests passed so I've merged it, thanks for persevering, we finally got
there! :)

Cheers,

Richard

