Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id F04A76AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:41:06 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id c14so1547763vea.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 03:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/GI6OYpH3lHd+MDtj4WLxMcMv5VUIyx+kEE3VhEtekM=;
	b=KNQvI8ak+HsawufVAIOXPqP+NipI39Y1UWm1smhBtWBJjZoo2r78w30k+m/F/rp8qo
	glz9tbMMEfHO5YCWjEwbLI/goaHC42Xmkcj/Z2tWNf6SxKQ/ZLWSNDUL9Vgu6Ah3wx6c
	09wriX5wkCGCkT/naxZ9ylNzuaS4TTq8QKFExlqxJ23Qh0e568BFqYseXg4g1tcbTEfj
	AK7yGRHPC4yIorFUQhFC+DwIDExjZQy3M6LUCEat8qtbFGPFvt/YfbFtG/iXLk9ZL+X3
	qGeor5ZsaOQBjxBv3mKk8Bm4INi5pjR5BnSkoUt3GLhQd1DYEDmV8YrUB6tggqnCEFvk
	fDBg==
X-Gm-Message-State: ALoCoQkKwkPoniBUtE9+h0KvZfkQVBEw20t6xEDz0M331S/5VzEzp593K9V2XDqiTGPXWpUSekK9
X-Received: by 10.58.80.103 with SMTP id q7mr674361vex.33.1389958867486; Fri,
	17 Jan 2014 03:41:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Fri, 17 Jan 2014 03:40:47 -0800 (PST)
In-Reply-To: <db9b22bb0dfe7977362d7d546e752e8d0b9eb5c3.1389955027.git.Qi.Chen@windriver.com>
References: <cover.1389955027.git.Qi.Chen@windriver.com>
	<db9b22bb0dfe7977362d7d546e752e8d0b9eb5c3.1389955027.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jan 2014 11:40:47 +0000
Message-ID: <CAJTo0LYGkR-WnyiMi_+iXLn+H2Yj21vFq6PVj=LTvx4fp2NXaw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/5] systemd: add 'less' to its RDEPENDS
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
X-List-Received-Date: Fri, 17 Jan 2014 11:41:07 -0000
Content-Type: text/plain; charset=UTF-8

On 17 January 2014 10:39, Chen Qi <Qi.Chen@windriver.com> wrote:
> The less command provided by busybox cannot interpret the control
> character, resulting in obscure output of the journalctl command
> in a systemd based image.
>
> Add the 'less' package to systemd's RDEPENDS so that the output
> of 'journalctl' looks clear to users.

Recommends, please.  From a glance at the source busybox less does
support some control characters, so maybe we should file a bug there
too.

Ross

