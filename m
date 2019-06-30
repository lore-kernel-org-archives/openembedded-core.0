Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1FA77E966
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 12:39:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so10801946wru.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MfwQS3rrb1qzDnmwGIf3ACF08Fxzrhhm4oq+fLqNdu8=;
	b=SpMFpkqUT2szqK3WntjkPwNMpy4qSNwD08w2uSZs1zKWLMd/Z7+ZzRGGR8X8Oa6I3W
	yKyaQcIkka8EnB8GufpqesBGrjgIpnHWPThcptfO2HwVE9V3rCF+/XPugRlkDI9XM+Pu
	p2gbK6aSECfmgPmGHxdzQVKf5oi1gItUQavFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MfwQS3rrb1qzDnmwGIf3ACF08Fxzrhhm4oq+fLqNdu8=;
	b=NP0k/g9+uovsbbbSyyuH4xz1iVcxjvgyNXaeboDkrPDmnLaioJNjFxIYu32LbEUryp
	uYmA8XXAe2+l/2qxrhR5Oj50/VWyCcLf8BROFYCi47qYavVtNqeMtxLnXKOP12Cbw/Pq
	29z1RtXF7mTsif8UR/slFmoBRW80TwXxTS/0vTQZZZ9fvD5+tRxHujGdwz+j8MQwFUVa
	dmi1UyewjFD1HQM2qU7oNgi1SF8Yhf/LDsMy4XI1Ri+ZYvp6yt/Ug7DgFJrlAxkyhfrN
	0TQJvTYXSu+CZtYo/w4AuvRvsV2caTM23GbmAP/3uqJDNUyklCQ3riXcNE5SKf6LNToN
	auDw==
X-Gm-Message-State: APjAAAXrX+39DEXoKzRlBGGSlQm3lPond/Ta+eAEb82UuiX4qEOfTMA2
	7qlNepdvW7giq+BkMAb2N0RBIA==
X-Google-Smtp-Source: APXvYqwJCIx3NKdqV/oUT45WXcdBuJ8sblFQDuBfKvLmKkQ006KEeXlRlWNzXGlRnNnTGInQYeZmew==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr2995766wrs.330.1561898386546; 
	Sun, 30 Jun 2019 05:39:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l124sm9691039wmf.36.2019.06.30.05.39.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 05:39:45 -0700 (PDT)
Message-ID: <fdd91893e63f4b37a75a81767094a26bc1696575.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 13:39:44 +0100
In-Reply-To: <8a7b3ff3a7e7292736041893f86aaee43e970f79.camel@linuxfoundation.org>
References: <20190627050049.29602-1-pkj@axis.com>
	<8a7b3ff3a7e7292736041893f86aaee43e970f79.camel@linuxfoundation.org>
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
X-List-Received-Date: Sun, 30 Jun 2019 12:39:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-30 at 12:37 +0100, Richard Purdie wrote:
> On Thu, 2019-06-27 at 07:00 +0200, Peter Kjellerstedt wrote:
> > * For changes, see:
> >   https://gitlab.gnome.org/GNOME/glib/blob/glib-2-60/NEWS
> > * Remove backported CVE-2019-12450.patch.
> > 
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  .../glib-2.0/glib-2.0/CVE-2019-12450.patch    | 62 ---------------
> > ----
> >  ...{glib-2.0_2.60.3.bb => glib-2.0_2.60.4.bb} |  5 +-
> >  2 files changed, 2 insertions(+), 65 deletions(-)
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-
> > 12450.patch
> >  rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.3.bb => glib-
> > 2.0_2.60.4.bb} (85%)
> 
> I worry this upgrade has introduced some kind of race:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/765

Sorry, this is caused by the meson changes.

Cheers,

Richard


