Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE4E17CDB1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 18:44:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x7so6960536wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 10:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=snRfkNnt4S9ALbttEiqGFMXdu9jSJeLgVDyxHWoZde4=;
	b=DMuguVq3uZUR6mEWGFnOo7TyEXgsZxL4mvdVf/nmJq3Erv4jBFHdofDCimjaIrCv33
	Dmlz3w6gWKR7kmmYWwh3TESCO1aqhbF+idxE7j1yVbINjVue0f16vnID1R10dZd8NJFU
	IhMZvn7Gdaq6njuhF5RrS9O78K0nBRmqEKwPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=snRfkNnt4S9ALbttEiqGFMXdu9jSJeLgVDyxHWoZde4=;
	b=BpQgdm4vmb135Jcc1b3KFB3+WOidGkduXJTqLATR4ECxGuzg3G3CsIQ6GoQAZyshux
	25DDXCi9IjvlUPRV+aveGAvEiLXxS1eoQ53b6fUK6R0PdBEcxAbMQgbW5yD0uKO/rQWV
	fPlFiBmBPKsAhwxT4cEKlb0Puepf6RxUcc8N1qGX6LY+NxjXyvWQrpw44hc7BG1YgEh4
	ae/3gzraP9MkmMULk9SxwvW6TZSCYdFQ7gUuPYf+ZFK/AaW2JDLF4UFSdGE47it75dUg
	u3xeFF//OD7nmvbYhCjHBL+6jvihStsaMrlDjiYXuhh0henGgUmnm5SZ6Lzr7RokYL7S
	klcg==
X-Gm-Message-State: APjAAAWO50X0vMaes9Wsudiyiil1ZxZZhHKQnzgCVD3owgw27rfKkRiJ
	U2MVolEIW/lsvktGhP6ykEHI6/FLW1Q=
X-Google-Smtp-Source: APXvYqzvosJxZhIvqQHhuFWH5ddcQ6llY6RZQsWJWw2U4nZpSLI1GMICQkn9qTPcmRcxGq/trBXCyg==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr3166548wmj.49.1551897861293; 
	Wed, 06 Mar 2019 10:44:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r15sm2920653wrt.37.2019.03.06.10.44.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Mar 2019 10:44:20 -0800 (PST)
Message-ID: <45942114f97bf1ddd1925de1ad8de5aa69640194.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 06 Mar 2019 18:44:19 +0000
In-Reply-To: <20190306184154.11337-1-richard.purdie@linuxfoundation.org>
References: <20190306184154.11337-1-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: Add oe-pylint
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
X-List-Received-Date: Wed, 06 Mar 2019 18:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-06 at 18:41 +0000, Richard Purdie wrote:
> Add an oe-pylint wrapper around pylint3 to run static analysis on our
> python
> codebase. For now display errors and exclude common warnings which
> are not
> applicable to our codebase.
> 
> The aim is to start generating this report on the autobuilder and to
> improve our score over time.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

The output of this is saved off as part of the autobuilder test result
output, e.g.:

https://autobuilder.yocto.io/pub/non-release/20190306-14/testresults/oe-selftest/pylint.log

If anyone has some time and wants to help out cleaning things up to get
better results, this would be a great and comparatively low learning
curve way to get started with helping with the project!

Right now we save errors only, ultimately we may be able to clean up
warnings too.

Cheers,

Richard


