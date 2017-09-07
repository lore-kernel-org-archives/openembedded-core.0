Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id BEF246FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:36:03 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id q80so4111618ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x3GA4cMM0iJvnLq0CYdJcfMyEh2HH565zsfGYVAGCcA=;
	b=XOX9rKlS3fdUj/rLILJNaohlIAQ4Xjp9ZZKkaObzWzniBiD1WIWyixZlfRt21oGG9Q
	PHzyh5WzEjgIPc+5wdEublLtrHxktl9p+cgItsQf8HYNOvdY7Eqc3xlW16iVUdTk8FwU
	Q1Yimou6NaT19cbMbkiga9DxKNL1L/RWZr2EUq2zD4EpQ0hc24upPCJYkW2OifC/Zcy7
	V4G5l9f1G7Dco8TpVeQb7i/x3jxg0OUA5WD15lzk98KYYNsWl/D6oEkoAQ5RYR6OLj6C
	5rq36fg1Dw3db8hMO/jv9s1wh5+aH0DDBLnQo6Y7UZVn8wJRP7649lGHw4wdxlBa7WuV
	uaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x3GA4cMM0iJvnLq0CYdJcfMyEh2HH565zsfGYVAGCcA=;
	b=cluoOqeEaaoEGvmrRwS4GmDcoICbNZ02CJZmPSkq699J6EjU5CYYmMKQ73mruCjsVf
	BpchoMk9Apn5x6itioMNb/VajhA0r3jwepTEDyZfAJlOCDvGOb9YmcRYHvP0XssLPLYo
	ZPkmEu45RrSP2aOPwfHKIEBFRWz4qY06HrhrbLUFhQO5N6nElGg5jon+CkqHTz8J9lsy
	RAV3+LwyiYoZpfryN65lMZLZg50SczTJtxibyFmGdsgQ5C6vlpZmm9LA1Np1gPAIcGit
	zeA3WpJOcWQ8Ci1+jUHjC3uKro+++qbdrHjA7uJZXEeb48zJqv9wEURICw8hedE3cyEU
	feNw==
X-Gm-Message-State: AHPjjUi5SM6goRGzzRJ+hFZO8pfu7GWGf4YabFejSuSrNQZuh8yXs5pV
	HR66oo+zQzC4zXEkwyG8EXYDtYeG5w==
X-Google-Smtp-Source: ADKCNb6I7PG/N0UBpUru85nmAAogXkLeiBaN5RIngkzq650ZHhnzngrChdPlIomPK/exTVRtMJuntub5r0uPDCYSCPk=
X-Received: by 10.129.153.88 with SMTP id q85mr1561726ywg.315.1504776964820;
	Thu, 07 Sep 2017 02:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.11 with HTTP; Thu, 7 Sep 2017 02:36:04 -0700 (PDT)
In-Reply-To: <1504726014-12929-2-git-send-email-mark.hatle@windriver.com>
References: <1504726014-12929-1-git-send-email-mark.hatle@windriver.com>
	<1504726014-12929-2-git-send-email-mark.hatle@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 7 Sep 2017 05:36:04 -0400
Message-ID: <CAHUNapR=0VExCg6U=LBmtgVL3biW+HrspDpVNM73A_==naDy3Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: Default to tipc enabled, and include libmnl dependency
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
X-List-Received-Date: Thu, 07 Sep 2017 09:36:04 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg101002.html

