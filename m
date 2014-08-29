Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id A96C87070B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 10:54:00 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id fp1so197823pdb.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 03:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Z/L6EO+DxeQCIfz4F8MwIr03kX9DGPITCRXDMWi6V08=;
	b=F7OVMzLtvJRYHY3ZCmZCpY+fc5e702LKqdgZfB/qjzbxXgW7+XLLVut0Xd8VK/Nm4t
	5/EuH8wX99hsw0+4AagiRTfKd+R+u5/Gid8FQJIjZkBM6LEZ++7AqRNMjQ3pdnKkVnYl
	S7nwQBwjFZULWq6Z9V4sV9tuohz+kCyMYCVlpARjJjVdGF8I9eNxqkw5qjzRfto2WlJ+
	4TC8rfjbjIl+pCk8H+Mzo04TT6PJUjlFWLVI4+3Kt82qD450PxJt+pCvKXfHItreIN9p
	N/+Vd5TQoy4tNnstPZ11yrHPWlOhFxcxeqEObyPEn0T/jXnp9hMQgXg/gU3S2i0Xwrfp
	+YQQ==
X-Gm-Message-State: ALoCoQkxVJi85la2XhrtUDgLofOuURgo3CjWrDtdUkOYeMTq/LjLwGmSoWb7YHZcKSjmuEvAtj49
MIME-Version: 1.0
X-Received: by 10.69.18.65 with SMTP id gk1mr14311603pbd.68.1409309641846;
	Fri, 29 Aug 2014 03:54:01 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Fri, 29 Aug 2014 03:54:01 -0700 (PDT)
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
References: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
	<33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
Date: Fri, 29 Aug 2014 11:54:01 +0100
X-Google-Sender-Auth: VGLg6My6g1aH6h22AbF-zMH4sq0
Message-ID: <CAOMwXhNCtMkkpSvCtd4c7r26FVEtxsr4-605acjRMgicTm-rAA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest-runner: return 1 instead of zero if any test fails
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
X-List-Received-Date: Fri, 29 Aug 2014 10:54:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 7:42 AM, Stoicescu, CorneliuX
<corneliux.stoicescu@intel.com> wrote:
> Hello,
>
> From my experience with ptest, there will always be a few tests failing, so we will always get exit code 1.

Ptest is not only about meta-core, you need to remember that. My use
case is actually quite different: running ptest only on my binaries,
and I will trust the rest of the system. For me, it is critical to see
if there is any issues in my system. This patch resolves that use
case, but even for Yocto, you really oughta aim for fixing your tests,
either with "known failure" or correct means.

> Should this better return exit code 0 if the individual tests performed correctly(weather they passed or failed) and 1 if there were any errors during the running of the tests?

I do not understand this question. This is what the current change tries to do.

