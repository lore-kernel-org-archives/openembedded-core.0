Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3547DBB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 13:16:25 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id l10so1163003iti.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UIROdxofO36vfLbSLU3vbNK039S0kHHuf6YT385drqM=;
	b=D2mIivp090ar1MsQqzdj6TWG2M8LocigJci8v16kh0RKemhug+uPKhmsPJ7kPdYiGo
	pqCmY1o2c24aZp5y6BB148UhkfI3hG0jQeCetPY4qWiG6a8T9LM811kpKxP3gufNYMlh
	hgx76x71UOvknOuwthI3se14CKKvxz611gX0j8/tHxYj6ykqhBNll3vVxnGpUAZiChd5
	us1Ci1jLlIR4GqYWQVLYDDixO1JJRZ8ByoDwAPBCXIY63yyQ610ZOnE8Qh466gKC5slS
	KdJ6czB1tk782wTx729feCH41v7gvEwOo2wag2++Nc/ZnybN8OqPAPqInqpCgI/JbtHW
	Jjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UIROdxofO36vfLbSLU3vbNK039S0kHHuf6YT385drqM=;
	b=ogvcrAtp3LnwJoIDjVyTOILfc9VkyCd1aZIbryZsCcFFkRSnT95yPKF3i3nK6yQlAh
	pvMuzHaftk9K/lT4S90eaAyhBzJYI+H1kJr2vpQlScaqLhivPR4su5sji17BaAaoNJLA
	gxTBMGc3UtHpz8HxlMTP/dcM9RywA+zFVTSkXCuymPFk8CsWyGvpYBTx4+lEQH+6tpXG
	hwa5mOIoWajfjeLBFxZB/4f/d/2Zx3Y8AXbOBi+U5+Dy2UV0ZRmwXY0Bo2dleF5sol4y
	8h/j/ifF7Veg8jr2L+CVjlKk4Odfi+fh+5vFV2Z3tjhHZ3uQccbnJH2bOnKgCiYuK6hE
	H3Rg==
X-Gm-Message-State: APjAAAVQgcMLsAHWYxgPwKLdcMqjCOl9uG4LwVmYTC66YuKYOsx0WQWk
	uE/ShVlZy520ABGT9RMoi/ckxYi25t/XPC/FVXSeiA==
X-Google-Smtp-Source: APXvYqy61Hjxkw0V0f56nw+MRnLrEyTOtzi74F/1WbILEdukI2igxMFTtrmgiu+YcyygsdZOEgHD+3ws5mOFWz+Du40=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr3312427itw.26.1556630186541;
	Tue, 30 Apr 2019 06:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <5CC12A3E.4010702@windriver.com>
	<1556610320-114012-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1556610320-114012-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2019 14:16:15 +0100
Message-ID: <CAJTo0LZnTfeC66-BWnhhXrb6w9eRsUH-hMostVgtKLY4mxwA3A@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: fix ptest failures
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
X-List-Received-Date: Tue, 30 Apr 2019 13:16:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2019 at 08:45, <mingli.yu@windriver.com> wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * Install 7 translation packages to fix 7 ptest
>   failures such as:
>   | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
>   | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1716:test_month_names: assertion failed (p_casefold == (o_casefold)): ("nov" == "stu")
>   | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1731:test_month_names: assertion failed (p_casefold == (o_casefold)): ("jul" == "liep.")

Would be better if we had a meta-package to install 'all
translations', but we don't.

> * Increase the timeout to 15 minutes as the default
>   timeout which is 5 minutes is not enough to fix below error:
>   | Executing: glib/actions.test
>   | Test timed out after 300 seconds
>   | cleaning up pid 13050
>   | FAIL: glib/actions.test (Child process killed by signal 9)

Looks like we're working around a test case that is going to fail
because it is timing out.  Let's investigate why it is taking so long
instead.

> * There are 240+ ptest cases for glib-2.0 and one
>   case is gdatetime.test. And there are 53 sub-cases
>   under gdatetime.test.
>
>   Among of the 53 sub-cases of gdatetime.test, there
>   is one sub-case named test_month_names.
>
>   For test_month_names case, there are also 64 cases
>   against it. Comment 2 cases of test_month_names
>   as a workaround to fix the below test_month_names
>   failure as the issue also exists in the latest version:
>   | GLib:ERROR:../glib-2.60.1/glib/tests
>   /gdatetime.c:1702:test_month_names: assertion failed (p_casefold == (o_casefold)): ("\316\261\317\205\316\263" == "\316\261\317\215\316\263")
>   | GLib:ERROR:../glib-2.60.1/glib/tests/gdatetime.c:1765:test_month_names: assertion failed (p_casefold == (o_casefold)): ("\320\274\320\260\321\217" == "\320\274\320\260\320\271")
>
>   Have reported the above issues to upstream as
>   https://gitlab.gnome.org/GNOME/glib/issues/1759
>   and as the failure even exists on the latest version 2.60.1
>   until now, so comment it as a workaround until the
>   upstream fixs it.

The test is failing and we don't know why, so it should continue to
fail.  We don't get to 100% pass rate by disabling every test that
fails.

Can you drop the timeout and datetime test removal, leaving just the
translation additions?

Ross

