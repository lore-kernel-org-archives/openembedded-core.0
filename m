Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (unknown [209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6E465E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:30:11 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x13so7820555qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 02:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0V7VCU9bYQWlShxGc+Ba2fcH3AzOzYtbDLe5TzP9hf8=;
	b=jnt9uS0bdyBlE0Rg+9w0l5auJrzPe1RKWLx7ud6uOgoG/Wp+BAXjjY6xB7/irZP89R
	Ti0Sh7KbTTogKStzEl/GE39dO7adRvsFuwjU2RRN70unvx2don3Sn/rT8x78meQoqkJf
	anwtjhdd0e0fx75YbmIKekOKhpb2WMDny9HH+BY9oljbgU7D7EQoEWDlW5zOgjE6/2ua
	qjSoN0UvU9Krvj1aVFh/rMmL8FTQlniT3YdPO6adjgAwzMHJfy3aK4tbfWnJJ+pbPBKk
	HDZE9ppjlLfxKieSoD1cEuhJzr3pMuZGVWZFgEe6CzYkVhPleWW/lmehWIGXi5DPhbAC
	Is0Q==
X-Gm-Message-State: ALoCoQkIvoEWiucwCkZ85qf4bLPB3slxupPbdRRbf0vBIrH3iZQjka42CCCcV7fIMpLJcJ/qYzQZ
X-Received: by 10.140.109.70 with SMTP id k64mr4369555qgf.92.1400837412872;
	Fri, 23 May 2014 02:30:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 23 May 2014 02:29:52 -0700 (PDT)
In-Reply-To: <1400833868-27473-1-git-send-email-wenlin.kang@windriver.com>
References: <1400833868-27473-1-git-send-email-wenlin.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 May 2014 10:29:52 +0100
Message-ID: <CAJTo0LYb9vqXFTLwEczYzafcAPv8yuo8isK00ViPvOF=YsFPsw@mail.gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: fixed bash build error
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
X-List-Received-Date: Fri, 23 May 2014 09:30:15 -0000
Content-Type: text/plain; charset=UTF-8

First, bash builds fine for me, so can you elaborate on what the
situation that causes the failure is.

The patch is missing upstream-status and signed-off-by.  For build
fixes I'd hope that there would be communication with upstream.

On 23 May 2014 09:31, Wenlin Kang <wenlin.kang@windriver.com> wrote:
> +--- bash-4.3-org/aclocal.m4    2014-05-23 15:28:54.252565146 +0800
> ++++ bash-4.3/aclocal.m4        2014-05-23 15:33:19.924570133 +0800

aclocal.m4 is overwritten in do_configure when we run autoreconf so
anything changed in that file will be lost.

Ross

