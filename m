Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E36C78447
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:03:16 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t22-v6so2573457oih.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a2G6ELU1yJa7zs4kmHakrPGvqwNVeKTxn7irmcKtDwQ=;
	b=VVqeVilQP6ulfPH2qenGicUZpHpXwBqd2/47krh7c5kYhSecjBuoHyzLk3aoq7Ypyz
	lpT0wfOZrq4gEBRUbSsonqI/1Q9dDFO6AHfujVwlF7jZ5GVTf/UAZ2EGpyhAhkuFwWlj
	8uZk86sMV/XNrhTcjho9SiebUMQMxdYnw7chN0uRPUjkDGXvRmnHVNX1cXxQ4RZFhMrF
	/7GMnwkT8g/DeenBmsQl73sjo3U/6EXEMFjbUV+6CdP6POPggNp3Mh8GdVcyPBNqK89L
	SUlTdDU2dh07mcdOWZ1csekkzJjS48MjBznXeQ3cXIfn8DAKo0L6q3plnPRbjwXOxcBx
	hjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a2G6ELU1yJa7zs4kmHakrPGvqwNVeKTxn7irmcKtDwQ=;
	b=m6ThIe7aSi7s1rmGW2z75QjsAMdER2VQkRw8jaugj7f5MivMX2WtoQom2ykGUrNMQs
	7Sk0SnzIuZgkzYLqGkWEjiGZB06HvM/bMAeFo5UWPD7sNUFPNy9xhp6xcI5MDChWAe5+
	+0JyVYCyx2IWoc910gKnvmG7ytU5IgT1rnG6W+NzA3AhUXbPArotR7KJh89okrXae7HT
	jx/ZIIdGSZHqNLViYOidXJvIa8fHj0jQL5QA5B7gVyXYC5WTIxsUpubpDkdMfkDAbqdH
	BauqjR0aR0LAkhhirCYUpy1ZFcWjihfSit+R0yhr90JM0XJMoFOYk7BVL/sYy0MkbLII
	deqw==
X-Gm-Message-State: APt69E0I0syoIAXqpwp9yYCWMbVJLcCQa6/fXcoV0LnXq1cizwbiqNsj
	6i/BVZSWpA6++uBEg+Sqc4dX1FRyMNwA2TKKPcU=
X-Google-Smtp-Source: ADUXVKI48uayEG6qrnVRR5WTJMlcluMEq8Pujry6uYR9a45IVh2CNA1lYyEknwaZy+2jWIslv/uXsHKT3KpcwZdoIww=
X-Received: by 2002:aca:41d6:: with SMTP id
	o205-v6mr15287597oia.38.1528214597384; 
	Tue, 05 Jun 2018 09:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 09:03:16 -0700 (PDT)
In-Reply-To: <20180605154815.18009-1-dev@sashko.rv.ua>
References: <20180605154815.18009-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jun 2018 19:03:16 +0300
Message-ID: <CANNYZj9w7MLYD1BcfM3_SWYZqtTJcvyd8vU6Q_mKjRkZ+Tc3WA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 16:03:16 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-05 18:48 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:

> +UPSTREAM_CHECK_URI = "https://salsa.debian.org/iso-codes-team/iso-codes/tags"

This is needed only when taking source from tarballs, and the contents
of the tarball-containing directory cannot be listed due to web server
configuration (but the tarballs are referred to from some other
webpage). The upstream version checker downloads the webpage, and goes
over html links in it to determine which of those links point to the
tarball, and of those, which is the latest tarball.

When taking the source from git, the upstream checker lists git tags
directly from the repo clone, sorts them and picks the latest.

You can also fine-tune how the latest version is matched against the
tarball filenames through UPSTREAM_CHECK_REGEX, or against git tags
through UPSTREAM_CHECK_GITTAGREGEX but it's not needed here.

Alex

