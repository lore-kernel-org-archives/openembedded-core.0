Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id BEA747D035
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:18:50 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id n78so3341393itb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 03:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VfMNtm5pr9kw0e/yr6QH9r3cY5HE2HNf+Is4l8hnX5w=;
	b=iad/QMcPmnDZc+YWgD6rr8wf8wmvKlDS3tmBL3Z68VuNGtJZuENZS0NR2/n/iBn4AR
	x3f9nzNJNU0PITaCC205R4nGOWB8EfuAbAW9pkhp+JrKeOz657w6lhcyuNLvsG52RbJg
	vNP5GNhoZKZ5GDf/ZdRDPjwIPjf9IuF3ikc4E+NybJ5s+BbqXDDCIIJwyEWPbnQIAvSc
	JZsszvp97w9MyWkghKC7OEZo7OmrtX6GkpTpF9gDsuh4unr+wCua7vO6tfmFO541E+JA
	4sY7bEG3FVucYZpNsGXDf1nflemfyGxr/QkHkBq1rlkW4L/aB3XAyr2zRSiTFqiuNSql
	T7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VfMNtm5pr9kw0e/yr6QH9r3cY5HE2HNf+Is4l8hnX5w=;
	b=m9n6v6dJUXnM5/66FM98DnDr+SlkZw2lNTiR/CLsYj3NZK9yyYphwUyWmAhh7ehSTO
	czP3ukBM6nx6P6p1A4FO9OBqXNxnQ3fotIY0aFRa8hD1JFMDjZ7LLz7+EIe6V9LfDCuS
	6ZgCO6tg7iJp/AODRkokrao+NHKjVa3Q5o2ouHUHsOGaFnMk3c4LOz72lsNjuMz+yqX1
	pMGXJJr3TXcknELBln2nVupID/Ae+BBF9f7YnrOnLSKfzuSiS+KKVOHm4oeXBjfBnKxk
	n14YzwURCPSDHrNukiQtURsClQQet+Q/PpL4RW5lh/XPr9Osc6NREfxse2Sp1bp6+afd
	l+Cg==
X-Gm-Message-State: APjAAAUUYyew2+c9L+5OEPOQ63qCPf5d7mZMY5TCtEIQvxSC0xUaGDlS
	gIqzE1MXZKcHo9r8K7vUnu+U/i74WYiWNxeqTDi2+LRK
X-Google-Smtp-Source: APXvYqx4w7MSVOGmfrynr57b+ez8bW7bPaxn2xPhmNC683S3SX9/fM33thl8i936vtRKbDbRRlEzgS8LyWUi3mpvmq4=
X-Received: by 2002:a02:5bc2:: with SMTP id g185mr17536077jab.31.1554113931851;
	Mon, 01 Apr 2019 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190401022443.16656-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190401022443.16656-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 10:18:40 +0000
Message-ID: <CAJTo0LYF+JJug0EWtA8wmzKzOf6qZ-wQBu1TMmaS8M+HAtLreA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libyaml: update to 0.2.2
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
X-List-Received-Date: Mon, 01 Apr 2019 10:18:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 03:24, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> -S = "${WORKDIR}/yaml-${PV}"
> +S = "${WORKDIR}/libyaml-${PV}"

That is now the default, so can be removed.

Ross

