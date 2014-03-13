Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6246E7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 16:47:12 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so1269563qac.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B1V06RW9Av8+4fmq7WHt3wR1Auymj/D8eyRPuE6WWEc=;
	b=DZ4cQn7U76Vi5792XPAixuDFeI9yOa4zCuGc8oTTzKRWdnvtbdHkYviLri1W8p3yG8
	H87o6IbFYKKyY5YnVI1sBtcqX1f6qGO30HwpOS8XckYIC3G3CiZ1vgkU+RQMRCJDFDwK
	9c1/ycllZ1L1q73h69Y2sk1loRkii9Dg+KOJpNKXIA6H/pg89S+ObXwgrPooJNS/NUkA
	4P35JEFnUGZGefsdPs6uRUc598lfdvsrn3CgZF7MZ3jdQh9chGMems1YgvmZnBIfBhoz
	5tCW9MpkA3+QQkBdudAsZMHT4KQEXiRN9YUoCV0MOpS9+AuRPvdjFy3WZp30jgdJAJBH
	IB8w==
X-Gm-Message-State: ALoCoQkHZ7tebI0yMepV0hCLwyS8ZOROSUw7zZwmMg4aBHedRNr8Q855l7oUeEbkJyWcp3BNRGOp
X-Received: by 10.224.45.197 with SMTP id g5mr3765719qaf.52.1394729233118;
	Thu, 13 Mar 2014 09:47:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 09:46:53 -0700 (PDT)
In-Reply-To: <5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 16:46:53 +0000
Message-ID: <CAJTo0LbpZ=aSRwcu8TAZsqXKb+jmtCqgj07YAm7kdrLUawQkRg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] patch.bbclass: do_patch: unset TMPDIR from environment
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
X-List-Received-Date: Thu, 13 Mar 2014 16:47:14 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> We need unset it after we use it, otherwise it would affect the env
> after we run "bb.build.exec_func('do_patch', d)", and will cause
> unexpected errors.

This assignment has been there since October 2012, so what are the
problems that this causes?

Ross

