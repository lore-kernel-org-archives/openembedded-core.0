Return-Path: <naresh.kamboju@linaro.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE2A76087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:25:42 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id i83-v6so9426968lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ijEFbsv8a3eOnM9bOgKkA6Gp7yo88wAbFEE+6PrfGxs=;
	b=hBbOWSnC3yTkitahWiZF4MZ3g4HxEsx/AGDT3sgLc1OKK+GOngvUJeaFkRfW3uG54u
	jNccaQCE1XQMTd8mSRM6nxythB8Bo6HCA+ELmqxnJKYdwG4gZbNjUumW32H0K8M6001k
	pa+StS26IYghX+8roUh1zzmGS1430Tn74SwPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ijEFbsv8a3eOnM9bOgKkA6Gp7yo88wAbFEE+6PrfGxs=;
	b=FPQ6ck2oCh7N7Vsa/PYy/uBF157oVlaK61OTRbyskXB61JyWg/oPDqSqrp4x4fbAq5
	0B4yCmiSM/kVMT8tw8aJ5jJxfQCR1haF2fWi4Lo51DMUY1ugBvr6RqsBXoyLA/JZWf2K
	nxxYnguoEXw9B8L2imo9FnqS8CC19jNLD71SX2B4cQ9runwsWVVvRWJdmy5WxJklhkDe
	NTKAR5gkb5P3Gzdyl8BiowbiZvYVnGQp6L2atsl/Kvs2dvFTyWVp0rmaQtyshGJmJLFg
	EozZ6ZQCNQxwalYzrqxgdMLBs8Qitu1HXzwVLupwOF6Ijxqp+3Uqa7Cch/DIeteFvjny
	2VPg==
X-Gm-Message-State: APt69E0qrbYpEqblBJYOyB4BQtbybTdn26xRgqr/2zJG/1BYbMFRfKl3
	3bJ/962twP6/Yhywx7+OEjFhQUXSLFQQ94HYLbJBig==
X-Google-Smtp-Source: ADUXVKL9H+T+1Z7y1Rf/OHTbJ8lieqGA4394u+jdEVx/jx9Ednq9SEW3Q18UmkaGgUMKo3BZPHWvr6JBuBNWc1pyyAI=
X-Received: by 2002:a2e:9789:: with SMTP id y9-v6mr1947097lji.52.1528982742797;
	Thu, 14 Jun 2018 06:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ee14:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 06:25:42
	-0700 (PDT)
In-Reply-To: <283c5cb8-ec62-99a4-156c-8748a46f6ea1@linux.intel.com>
References: <1528788854-29279-1-git-send-email-naresh.kamboju@linaro.org>
	<283c5cb8-ec62-99a4-156c-8748a46f6ea1@linux.intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Jun 2018 18:55:42 +0530
Message-ID: <CA+G9fYsWa39v6fRLoJJr3pbHPZY3RHjEpmugsM4MPkZBkUsy6w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ltp: fix cve-2017-5669 test case
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
X-List-Received-Date: Thu, 14 Jun 2018 13:25:42 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 June 2018 at 23:10, Saul Wold <sgw@linux.intel.com> wrote:
> Can this be backported to both Rocko and Sumo?

This can be backported to both Rocko and not sure about Sumo
(I did not work on Sumo branch).

>
> Or is this a case to update LTP in those older releases?

Latest LTP + this fix patch (upstream accepted).

- Naresh

