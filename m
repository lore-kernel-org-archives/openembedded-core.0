Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 949467CA63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:20:33 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id i2so2377305ite.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 02:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lMdkr+bpbuKsJ1BmSga7udG2XKkzOb03oDHX2jkPGyI=;
	b=VOip5sqSlttI3La6fOfZTdNGSqNKIUJWYIwvZOOLk13vaNsSJqg0jfLzzzXfZnwM+p
	RJDYybsi5pGvDG8xdGJwY5xlVFV0h4mbuDzm92bem7iq5YCHlL7UVqLh3Pbf3VHPHWLY
	a3eG/vpujp7slXmuFJlEH4lZtSfdT2spAStgB7OgHTmbcBhelhGdqZBxTMNfPBGpmiKa
	Qd83MmO+fdLdrUOjV4645HvKss6DtpLnRcjzbI68Ibb7eg9sJ3IN1u0be0PVVPC9bK0U
	9CxNjJimj6WiRlH5Ce5C+zduy0uZnyxkpy8LONxuPlLVxoCPT6td/HmydAzILpEQD6ec
	NdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lMdkr+bpbuKsJ1BmSga7udG2XKkzOb03oDHX2jkPGyI=;
	b=ClGxS/viT9epzYJyuCmUX2/+7CSKbO7TVhuj5OUsLS+WJ1XlRZzRUdlDIs/IqUGt1P
	QcygBYoQrh5qXmWmscaSsnQwRwoIDdgBQrpTxsx7lYWabl8iAp3/BJk5ZspVq1nbKC5v
	APtAuDeTv3ThTPPvlR73pWaNPU3SpBUeK2K+J4blzf57HGQ/1mTb8aCEmD24vx5kWtot
	q4YdW9tG++Hf1HMLPp2al70XehQ8vvRafy2NIm/Jt4cujOo0YfhsBGTf4A5colpXVwem
	JIbAwLKTVkx92y3E8V1Ym5GF4tgILpl4b78kwuyfXqnQWeF6sL9JJ4/cEV/33SUku93G
	fKQQ==
X-Gm-Message-State: AHQUAuYQAGgRqDzk9DyyLth+aQ/js9gC6FoMiF9VpP7VYKRWS7Wv5cBr
	U5v0ljQ0VT8d39L5X6LdYKXCM0gXyR1u3AYqJVZkIQ==
X-Google-Smtp-Source: AHgI3Ib4XAD5f5w+yygVtTYmxME9LHhSIEAtDK+/S2yi2YvgNFC3ix5Kuv9211XQKb1v6JqjDT3xoxOVLuNW2D6/TH8=
X-Received: by 2002:a02:ac81:: with SMTP id x1mr1892335jan.31.1550830834621;
	Fri, 22 Feb 2019 02:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-4-alex.kanavin@gmail.com>
In-Reply-To: <20190220201026.70803-4-alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Feb 2019 10:20:23 +0000
Message-ID: <CAJTo0LYg8nKGjS76BJUBr6e9we46_pouYzatstrzvLP3CJT9sQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] glib-2.0: convert from autotools to meson
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
X-List-Received-Date: Fri, 22 Feb 2019 10:20:33 -0000
Content-Type: text/plain; charset="UTF-8"

packages/corei7-64-poky-linux/glib-2.0/glib-2.0-doc: PKGSIZE changed
from 21195094 to 117168 (-99%)

Documentation is no longer built.

Ross

