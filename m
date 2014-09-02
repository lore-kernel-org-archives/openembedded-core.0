Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9764F65C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:24:52 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id r5so7187714qcx.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GWOE7T/ue0UFdZtq1wAkaP7R7UqVRJ283+vEwgzUWc0=;
	b=R8mUxGNI13lX2z8OHkRF0B0/9jVyevYtdhv1gQ6PYXtKz3d8O6FYm8rpz53/YnDR6e
	jUKVJeFwx8BRdSgT6mL/CqcOlekPinMATRe7S5TKtaxkiVE5738YZ6C9W1clo8sxRjNF
	b0kG3esgU/OC88V/o21tQEREyK/YsWlfmpK2S3Ybug/Xx0RNXGIhkHqj7zgRA34wLdry
	AK2gBt4hCUX4nFCpcr3pUA4eJwIkwsIIQeIh6KiNFzokdFKKszs7XUx51W/XjxyVklwC
	xV7nd88lVX/1mb+1JRsK2ZzsFgA/3Rv0qucB9oOJVBEJZdRWrDyXsENrgFeevfOJi0Tf
	DdBQ==
X-Gm-Message-State: ALoCoQkN7NCYn7stCCQadCH8QXwDmIJwlgHdqu2WsXpSfWu9Q25ticVw31Qm+RyKNelutuavIKKq
X-Received: by 10.224.79.139 with SMTP id p11mr436766qak.93.1409671493256;
	Tue, 02 Sep 2014 08:24:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 08:24:33 -0700 (PDT)
In-Reply-To: <87c78f60aa3ef60a850e81fe49b0f4d33a142972.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<87c78f60aa3ef60a850e81fe49b0f4d33a142972.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 16:24:33 +0100
Message-ID: <CAJTo0LaGiH2SSi=f7mrTsLP87=4CNgBhVhx+k4grQwD5UJRQOg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/26] acpid: upgrade to 2.0.22 and add systemd support
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
X-List-Received-Date: Tue, 02 Sep 2014 15:24:53 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
> -inherit update-rc.d
> +inherit autotools update-rc.d systemd
>
>  INITSCRIPT_NAME = "acpid"
>  INITSCRIPT_PARAMS = "defaults"
>
> -# Makefile ignores our CFLAGS, so override it.
> -#
> -EXTRA_OEMAKE = "CFLAGS='-W -Wall -Werror -Wundef -Wshadow ${CFLAGS} $(DEFS)'"
> +SYSTEMD_PACKAGES = "acpid"
> +SYSTEMD_SERVICE_acpid = "acpid.service"
>
> -do_compile () {
> -       oe_runmake 'CC=${CC} -D_GNU_SOURCE' 'CROSS=${HOST_PREFIX}'
> -}

In general it would be nice if the commit mentioned "upstream now uses
autotools" to make it clear that changes to the build were
intentional.

Ross

