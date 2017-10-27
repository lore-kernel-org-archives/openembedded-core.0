Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7F64782D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 21:49:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 17so5814789pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vrHcCzyL4IehVerZLf0X14yaNlqqNW2g9ZFocuK0W2Y=;
	b=HvltNOujO4sxJia5KuU9T3FyrtkeEYAEQRd+b8ttV2V4wo2QAsljxjmAxYHNuXcvyl
	ZmWwaTqVCgj2cWmvnGvW9qknheHRvIovRO50t9WSCPG9hS5zyPxs+8v4aLkU59ys83/J
	V4wL2fZFkH5sTLnep6SJktOiYeKl0Q3VCKS/7I/bji0rvXTdji0r4UhcwasKY4XPyNGo
	roYFzRnpY0D859JCBRQTfzubB2ugRSg1iA7JBkKlLyJqIzjfQ/QOmLVLuPZinepPmkbl
	MqLBjsoXY7plv+HbIvR8OXOKFHlZ0owgNF1nMQgN0ymzJx3qJv9RD12geLjJdi2DZeUa
	Tw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vrHcCzyL4IehVerZLf0X14yaNlqqNW2g9ZFocuK0W2Y=;
	b=qjnIHCGC5gCjItQuoDH+nB2GJ3gzSXY/hpyLk74QfIABFYQPyrT0TpC7hIrMBcnBVj
	YkxklOraeu7kq54kAt1IK1V9BwWnbevxv7pjnbr6tAYkILxY8TWlpApBtxEFoizsuQsF
	/sS3tuE55dLseN5f2KDCMufDnzIrXKBcEvA9xciD1axsqyMG8QVS1eiPVhTgAEqHB9ts
	SO8uehXFpEyS5vD/EPYRk0xi3A9pQyRXzXTYKwg5peuvI685O9iID6pBLVaridW44HU9
	3xOnk94bS0lqtRMGyCpudnEey4pucUVrlfDzW9Vu+yf+7Lh8QP/B7cRVkgHbchRs4ZT5
	Kn/A==
X-Gm-Message-State: AMCzsaUPvFsKelwV5PYisifLpczUcsAsyuc5Me25tL/+enF8Ga3ThD/q
	rqVXPQMSigwLTJelpqkipuGrWH1tk0ba3mb6K0s=
X-Google-Smtp-Source: ABhQp+QNCVne3Cl+WZZmwxzQL3yoWdNCuGGDGotCGJiTy88/dqecrSIbUqKT2EjJ50A+3gwrPVU8caycjUKFwGeKyzU=
X-Received: by 10.84.175.3 with SMTP id s3mr1354431plb.440.1509140969758; Fri,
	27 Oct 2017 14:49:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 27 Oct 2017 14:48:59 -0700 (PDT)
In-Reply-To: <20171027144941.4334-1-joshua.g.lock@intel.com>
References: <20171027144941.4334-1-joshua.g.lock@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Oct 2017 14:48:59 -0700
Message-ID: <CAMKF1sp1Ge=aGNU+X7PqNy9pX5kwz1F9bi_nmtOUaq-qLqp8SA@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] ruby: fix build of ruby-native with gcc7
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
X-List-Received-Date: Fri, 27 Oct 2017 21:49:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 27, 2017 at 7:49 AM, Joshua Lock <joshua.g.lock@intel.com> wrote:
> Marsalling is broken when ruby-2.2.x is built with gcc7, backport the change

typo 'marshalling' otherwise ok

> fix  in Ruby SVN r57410 to apply to ruby 2.2.5:
>
> https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
>
> Fixes [YOCTO #12271]
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/recipes-devtools/ruby/ruby/prevent-gc.patch | 32 ++++++++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_2.2.5.bb         |  2 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/prevent-gc.patch b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
> new file mode 100644
> index 00000000000..2eaa955fba2
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
> @@ -0,0 +1,32 @@
> +Fix marshaling with gcc7. Based on upstream revision 57410:
> +https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
> +https://github.com/ruby/ruby/commit/7c1b30a602ab109d8d5388d7dfb3c5b180ba24e1
> +https://bugs.ruby-lang.org/issues/13150
> +
> +with the upstream patches intent ported to Ruby 2.2.5
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> +
> +Index: ruby-2.2.5/marshal.c
> +===================================================================
> +--- ruby-2.2.5.orig/marshal.c
> ++++ ruby-2.2.5/marshal.c
> +@@ -17,7 +17,6 @@
> + #include "ruby/io.h"
> + #include "ruby/st.h"
> + #include "ruby/util.h"
> +-
> + #include <math.h>
> + #ifdef HAVE_FLOAT_H
> + #include <float.h>
> +@@ -985,7 +984,7 @@ marshal_dump(int argc, VALUE *argv)
> +     VALUE obj, port, a1, a2;
> +     int limit = -1;
> +     struct dump_arg *arg;
> +-    VALUE wrapper; /* used to avoid memory leak in case of exception */
> ++    volatile VALUE wrapper; /* used to avoid memory leak in case of exception */
> +
> +     port = Qnil;
> +     rb_scan_args(argc, argv, "12", &obj, &a1, &a2);
> diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> index 5a645821ba0..66ba1d4b844 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
> @@ -3,6 +3,8 @@ require ruby.inc
>  SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
>  SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
>
> +SRC_URI += "file://prevent-gc.patch"
> +
>  # it's unknown to configure script, but then passed to extconf.rb
>  # maybe it's not really needed as we're hardcoding the result with
>  # 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

