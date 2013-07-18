Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6D61B6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 17:08:06 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so2546449vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 10:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=A4FQwjmgvxJy8ew2/0Szy6BPFC1GdhDGWya6vFxJ2ak=;
	b=B8ZJUzW7P+9YY7t3dJ1QgY+V6Pifj33zoIQFXh19/k7zE/MFZZUWPGCOB55nET7zN3
	+yyBThbP5fgkywCswGichboglvWsTksaf5sM7dK2Pw8aq/W9s1g796PZ36xdXQAqdcxh
	12Ct+9qSOm4whz6xdtRR5f95PdjoFqnyDsTFZYQZhaADeu7lbDaB2IbP1QHvfE3Ncwqf
	cxYKxx2jkVH/XdZzstD3fSQqgdB53Bm4TLAGMvC//zdez7Mkbe1TiZP53B7cPCh22SVq
	X6Wjq1hSTK0nDCMDuSjD1ddohk/Pnu4zJRPzEdn+scIBMkU6yjdss5GgQ1XaSPGUT4h0
	73iw==
X-Received: by 10.52.164.227 with SMTP id yt3mr3658902vdb.107.1374167286753;
	Thu, 18 Jul 2013 10:08:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 10:07:46 -0700 (PDT)
In-Reply-To: <7a265612fe08a636afc61a659ac5fadd22b0a7bd.1374116641.git.Qi.Chen@windriver.com>
References: <cover.1374116641.git.Qi.Chen@windriver.com>
	<7a265612fe08a636afc61a659ac5fadd22b0a7bd.1374116641.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 18:07:46 +0100
Message-ID: <CAJTo0LZDaf+dFDYk0gt-nf0dO1K5YG6nn7RnHbibDpo51_v8kA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQk9I/0rzVhFxZwOphD3rh7yz6ElPFhFC6d0ApM0DAhz8mpaBvKiqxA0bbhvcEYnXcc1uqkQ
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox-syslog: respect /etc/syslog-startup.conf in systemd
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
X-List-Received-Date: Thu, 18 Jul 2013 17:08:06 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 08:05,  <Qi.Chen@windriver.com> wrote:
> 1. The configuration file, /etc/syslog-startup.conf, is ignored.
>    This is really confusing, as we are used to the behaviour of
>    changing the configuration in /etc/syslog-startup.conf for the
>    syslog service. This is actually a weekly test case.
> 2. The /etc/init.d/syslog is installed, but it has no real usage in
>    systemd based systems.
>
> This patch solves the above two problems by changing the busybox-syslog.
> service file to let the /etc/init.d/syslog script start syslog service.
> The /etc/init.d/syslog file is actually a wrapper in this situation.

(2) can be solved by not installing it (and there's work on-going to
make the init classes delete scripts that are installed as
appropriate).  I don't like this solution for (1) to be honest - I'd
prefer to see the logic in a central wrapper that the service (and
probably the init script) could invoke.

Ross

