Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 37613779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:27:20 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id o143so957726ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=lpeg7RgqmDhQwJ7rzux0PpSlLDdNLcj4Ijh+IiKx/qE=;
	b=DhrWDO1CYsdV5SkT5eVPIskOuog1vUyiQiK70cd0RqAqP9+eySFKLEXkei2H/1Q3GG
	SO5x+R1xPV1l1F4CxfTdG9jd+nb9zXuTmUnBTIGSFRArkDb2nZyPQhqNVIalrFtEBQMZ
	PQpHXk3cuf7IR43/uob/Je3wlrummvLJ7BUZ4FUW7ACsKdHFAryOlfEjdEe+sFzAHqEq
	HAXAquez94Lmnvr+3IR575IsJfCRJNOgup1TlMBSjWhY7skGqlKuqi1udd0ENZz1QYIZ
	jls1sMMw5JxsHsJGRaFa7wACaI1d+rfL3IAo4jbmRwCjH6ea2fcLqqmYEmjKm9Q6grmB
	O1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=lpeg7RgqmDhQwJ7rzux0PpSlLDdNLcj4Ijh+IiKx/qE=;
	b=Ti3YKuSf9vkgxVWcJilGmRKPypgnIsLm77Ks8h64LULHnF7RTqen0oYvKiUlCagjsr
	t3K8lScvi683rjf/NQjv2fY1IESjRXHU1p1yG7eGV6WT1bWDroE18F4gi/uLpkWw8ZZ7
	okQzCDxEahGUG3mq8kZXkZ5Eu0x12A8WIV5Dyg+5fx33CTXHs7rzyY+n+qcZp//HOVl4
	CYd2Id/ypeOAX9lg5CSFOcgs3M7x7YaNiG5jj8PepHlHxHebuoJ0FyiurbkqMs51qzu1
	BiBe8dCjXoNNACxiZn76jGOT9+JUq8yk7enqgRuqCgukDun9MIoK9DMaI090mzMm+Wvl
	Hn9Q==
X-Gm-Message-State: AHPjjUiaEvY6VxKYOCSCiVwRy22oOSQe4gyk6V3BXf24jeRib5BlJ8za
	WS604nIAb1baDvMihBPUAjEY1BYc
X-Received: by 10.37.12.196 with SMTP id 187mr6190220ybm.48.1506695241807;
	Fri, 29 Sep 2017 07:27:21 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	t17sm1843818ywg.81.2017.09.29.07.27.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 07:27:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id 125so2267304oie.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 07:27:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAzHsMZZIYHFzhjmaD0Vqizdv9a5/jBL7WYnJh+v5fKrBkzECZBKBE1gvMulSe6zgAE33sDatwtN/yJzRcAdEU=
X-Received: by 10.157.41.100 with SMTP id d91mr3226025otb.426.1506695239996;
	Fri, 29 Sep 2017 07:27:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Fri, 29 Sep 2017 07:27:19 -0700 (PDT)
In-Reply-To: <1506694551-4487-1-git-send-email-matt@madison.systems>
References: <1506694551-4487-1-git-send-email-matt@madison.systems>
Date: Fri, 29 Sep 2017 11:27:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqrAFnbS2RqQSxSB9gX4Ban5sDjof4SjMw_yc7aEqZrpQ@mail.gmail.com>
Message-ID: <CAP9ODKqrAFnbS2RqQSxSB9gX4Ban5sDjof4SjMw_yc7aEqZrpQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Fri, 29 Sep 2017 14:27:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 29, 2017 at 11:15 AM, Matt Madison <matt@madison.systems> wrote:
> When building for a target whose architecture matches
> the build host's, the second pass through make.bash
> to build the shareable runtime would also overwrite
> the target's static cgo library with host-compatibile
> binaries.
>
> Fix this by running the host-side build once and
> target-only passes of make.bash twice, for static
> and shareable.  This ensures that what gets installed
> is target-compatible.
>
> [YOCTO #12136]
>
> Signed-off-by: Matt Madison <matt@madison.systems>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

