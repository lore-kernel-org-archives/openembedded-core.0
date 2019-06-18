Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 826276C10F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:27:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z23so2621026wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hF6fqlw/lBSVssGqPAbMITP1Z8eDYJxHkVOJd+yZo/o=;
	b=CzSuHSk8r4Z0CckZRKpvt+MDw7PwJJ8Pn1LW/24LWYJM2vGKryrqHwWo+avjcfW1XF
	8Z6kk6ZRrftIXMt8LfMDhddxxOSaMMePPAZgE5HXZARYQJNxfiw2CjiKMsDCKNe/EUTU
	swygMEFTyLMFn8c8h3wwpvtOKmx04m9cWdQCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hF6fqlw/lBSVssGqPAbMITP1Z8eDYJxHkVOJd+yZo/o=;
	b=ml6lBEJ/KTLE5jiNVKzyzn2dxf2+FQ/0+gVl4zmyfI2791cYbOVFBkUkcWmfTMULQp
	XwcUvj4wEG3V10IilEsuZhdIha6CixffKH3jP2KejRNZPLqMo5jw6EHgi/IVe90p/E6u
	a26qcWRH8anqpUV3rQBnnPonrgRM/3bQ18otFvScH1q5twKyDw5ANzsxBh5Nv830LEBI
	myKbaAcsBHtfdIvIukvH9W9n4plt3tjyqlmGS6+KXhkwzty1ODOBAD1bEsl8OylTqfol
	yaXpHc3YniOJAVtph4QJYfCa6W6WihB9xhq1i7jAkojF8WBxzEusJC4tJ7KqsAc6z3mh
	dYrw==
X-Gm-Message-State: APjAAAX9JUbHehfva1xUXG8r6DyzQgirUOzRuFpOdk6LIr7AqPFA/7Qs
	Na/kj9YqBpvXyWDVNMngwgtga1IItGw=
X-Google-Smtp-Source: APXvYqxG4tNRxgwE8BJR5sWUGoumVUjxkskN7BUfHhWZh8dE1WQg3N0gCdWMcZmGn3AYELCvPKianw==
X-Received: by 2002:a1c:808b:: with SMTP id b133mr2708309wmd.160.1560853650281;
	Tue, 18 Jun 2019 03:27:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j132sm2573118wmj.21.2019.06.18.03.27.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 03:27:29 -0700 (PDT)
Message-ID: <eb1fd6ad347c866282810f71ad1aa72e6434ee0e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:27:28 +0100
In-Reply-To: <20190616154817.5564-2-Randy.MacLeod@windriver.com>
References: <20190616154817.5564-1-Randy.MacLeod@windriver.com>
	<20190616154817.5564-2-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [Patch v3 2/4] libcap-ng: split into libcap-ng/libcap-ng-python
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
X-List-Received-Date: Tue, 18 Jun 2019 10:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-16 at 11:48 -0400, Randy MacLeod wrote:
> util-linux's setpriv needs the libcap-ng library but
> not the python package so split the package up to enable
> this without a dependency loop.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-support/libcap-ng/libcap-ng      |  1 +
>  .../python.patch                              |  0
>  .../libcap-ng/libcap-ng-python_0.7.9.bb       | 27
> ++++++++++++++++++
>  meta/recipes-support/libcap-ng/libcap-ng.inc  | 17 +++++++++++
>  .../libcap-ng/libcap-ng_0.7.9.bb              | 28 +++------------
> ----
>  5 files changed, 49 insertions(+), 24 deletions(-)
>  create mode 120000 meta/recipes-support/libcap-ng/libcap-ng
>  rename meta/recipes-support/libcap-ng/{libcap-ng => libcap-ng-
> python}/python.patch (100%)
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng-
> python_0.7.9.bb
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng.inc

Two steps forward, one step back. The maintainers.inc entry went
missing in v3 from v2.

I fixed it.

Cheers,

Richard


