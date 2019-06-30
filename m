Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D8C337C873
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 11:37:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z23so12993527wma.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=3xbjQF4D70KXya4pxiaaDnqbTrFGrw048MwRPY589Yk=;
	b=fJFJCZtojebdtF4je+dGdytZu8fFgzSXbzkA1wDoYJXAvQX8PAvgsAdFsJR8prxD8Q
	GGCz60GlqbScGi2gIEWv3V0caRZa5x17CTQqMfcwn7UGLR2E8oWGlUT4t80+y4GoQ6bZ
	Cvj80aWNhsp1e8hjZ9p8JfmXY2xd0xpVJUSTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3xbjQF4D70KXya4pxiaaDnqbTrFGrw048MwRPY589Yk=;
	b=Rv+R5TPPr6I4tjlq0o7f0xwF4eJgU3HBMfMmdRLqwo2IXz7u/cUltveke0iykRVAzA
	kfbR9EEh7XE6xpqq0nJXqq1w2B75VxwWIUOXZ2hc9SAEEyxu+tFSf6z1LjqN0t2Qig98
	GOLPLd0rkVlEL6vfzxQXJISqpJ2aipKvOlum1kxH2HQ/raaHiHU5aInSo/61pxenuK8m
	fu0/YRoNYMform88f9DnUhb+KXPxjA1aKkDqrvPFbXstOnU4DGt4BzbJVvOvRO3LtAiz
	sWAzINTGna0EUdvHYeaiaNdvjW1WjhgPmrfkbQywppwWohBHSyIF1LT7M3Nz+8Cwhz6h
	Wjuw==
X-Gm-Message-State: APjAAAUwcKOV2VJ0uDKBwk1J4KuZGTg7fqyfJj9eYKqcwy4boaoy9+ud
	rw6timCilZsk5pIgppCLE2joxg==
X-Google-Smtp-Source: APXvYqzGzKsKzrZaL+GeDXdA1FXgvfjSJU2TVbyEtW5paF8U/vy3tamwfkZb0ee52O81UdihkKpkNg==
X-Received: by 2002:a1c:c549:: with SMTP id v70mr13249115wmf.135.1561894673494;
	Sun, 30 Jun 2019 04:37:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s188sm7415014wmf.40.2019.06.30.04.37.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 04:37:52 -0700 (PDT)
Message-ID: <8a7b3ff3a7e7292736041893f86aaee43e970f79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 12:37:51 +0100
In-Reply-To: <20190627050049.29602-1-pkj@axis.com>
References: <20190627050049.29602-1-pkj@axis.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glib-2.0: Update to 2.60.4
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
X-List-Received-Date: Sun, 30 Jun 2019 11:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-27 at 07:00 +0200, Peter Kjellerstedt wrote:
> * For changes, see:
>   https://gitlab.gnome.org/GNOME/glib/blob/glib-2-60/NEWS
> * Remove backported CVE-2019-12450.patch.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2019-12450.patch    | 62 ---------------
> ----
>  ...{glib-2.0_2.60.3.bb => glib-2.0_2.60.4.bb} |  5 +-
>  2 files changed, 2 insertions(+), 65 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-
> 12450.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.3.bb => glib-
> 2.0_2.60.4.bb} (85%)

I worry this upgrade has introduced some kind of race:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/765

Cheers,

Richard


