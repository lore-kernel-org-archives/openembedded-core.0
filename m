Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id CDBD47E671
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 10:07:59 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s7so15544521iob.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RqwXjjHrtRNo5Y9c38uHExSF5HiQ+plz0n28yN7qnKk=;
	b=XqrxuFZ+NrQ0ax4yi4ZWLKAZY3FTAIfzuY2SMCU9Gr+j+nSPGkqgVabXmsvmgn/3IH
	VXKt77sqOKpTQP83iFUhQEpdjB1WIVMkxqOPdUnyv8KEpVhXIBYM9KOFbt7pfsr/g7rB
	Ba2nFu4hSx0sh17rm9UB8pFIhi3r1VQE+N1Rb3HUHuv8xNJAPuD0kSx84zzHwGGNO58v
	UBygTyg/80VGGX/QWPLZ/4rTJ+knUhsvfO+xYmF6hjLTGpAS5oQTWkG7wgpmAWuNJICh
	HEZP1Pxz1eVG3+IpE0g4687JGUJaVrY94P1rOYly2GaMVPEoBlxTun8uwhTrbAQIfFIN
	O8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RqwXjjHrtRNo5Y9c38uHExSF5HiQ+plz0n28yN7qnKk=;
	b=bvnM24MQNwTJIf8IRSgpRfhEi9ICz7UMPwYTD7L+4jkjf+mpzjTIrwwv6dlC6C4P0h
	6PhggLh/feTQPCTfZQyR4p0rafxfipd48DszVIEaS5cItr+C8due48EnssvcuM0odNvq
	9i+fx0Jgx+1NhvW1QTycokcmUkmuo5CXpbGeimyjdRdp/4P7P6J84gtt5FjS2up2jhue
	kL2XbO6+LOCPVeZDKvEjT3NS8z5U4SSwRpOCf6F8myLPgbSq7/y8fZ/YPq9ZzIDwebZn
	fCyQwxrvJGm2eGhl7n689jpnEwOXqr9pj7gRyoD44QG05FJlxHCQjtJ/InXsateojC4F
	H+EQ==
X-Gm-Message-State: APjAAAUFd/gD/lEFkf1NZRo1/i1YEq0SVllpFujIbu/9OXWFq3Q5uEyH
	/kmX3NP+902c5yF/1PcyGsNShQ+LK6bapxIbDmnJEe1L
X-Google-Smtp-Source: APXvYqye3AJNouizrxZ+rc3xZsrcTde6leLNTJUYKgKuOHwT3xv+hA167HvbSSK58R8ajCC9ILz4uuJQaW33c2VxDEs=
X-Received: by 2002:a5e:9701:: with SMTP id w1mr11258208ioj.294.1560420480926; 
	Thu, 13 Jun 2019 03:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <1560413184-99289-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1560413184-99289-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jun 2019 11:07:49 +0100
Message-ID: <CAJTo0Lbkn3Lty9JV14KDmAvdY0eWiPqqGVAxo+ByP=DA6jsEwQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] diffutils/run-ptest: support to run at arbitrary path
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
X-List-Received-Date: Thu, 13 Jun 2019 10:08:01 -0000
Content-Type: text/plain; charset="UTF-8"

Are you going to fix all of the other recipes?  Very few recipes let
you run the tests from an arbitrary directory, and assume that you're
in the test directory already.

Ross

On Thu, 13 Jun 2019 at 09:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> 1. Run run-ptest at arbitrary path
>
> 2. Fix large-subopt.in1 not found
> ...
> |diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in1:
> No such file or directory
> |diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in2:
> No such file or directory
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/diffutils/diffutils/run-ptest | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/diffutils/diffutils/run-ptest b/meta/recipes-extended/diffutils/diffutils/run-ptest
> index 695c5e8a7b..ad467d9bd0 100644
> --- a/meta/recipes-extended/diffutils/diffutils/run-ptest
> +++ b/meta/recipes-extended/diffutils/diffutils/run-ptest
> @@ -1,3 +1,4 @@
>  #!/bin/sh
>
> -make -C tests check-TESTS
> +abs_ptestdir=`echo "$(cd "$(dirname "$0")"; pwd)"`
> +make -C $abs_ptestdir/tests check-TESTS abs_top_srcdir="$abs_ptestdir"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

