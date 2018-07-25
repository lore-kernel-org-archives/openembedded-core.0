Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B208578993
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:18:00 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id v8-v6so16187602oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i5zaFknSXExGnyKR3bIgBnj7KmHdwtYtTZDUgoP/2/Y=;
	b=OJvhrPhI6qn9K5+PRL9MRm+6Gx8tMKdyazPyv4c4cUV5vycUk75BslqmHs3UMhfEi8
	hVMpMSTwgDeFy77mRfaSzhzEi42qPPQC8PND4HiSRBDN0AgejPGqas9hzaFGnzLLStsA
	aff1hNQ00+G0G1GAhgO7R5gh8Gu+EjnUkOWYqdr1VGf81psouTC2UXjTUrosBJsC4NyO
	/KRUD7Lwtyg7EmRkx/bSLBl4u9qrx691GPXlzSBDqwT5EYb7wcoOYV5viTMktLGCraGS
	O+CvlJwQoR2tl3yESF7Z2HvsL+iySImnaKJSxxp52vdZ0PLVhYwgCcwCEilNyOy4j1Pr
	nW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i5zaFknSXExGnyKR3bIgBnj7KmHdwtYtTZDUgoP/2/Y=;
	b=mnn8MZtC28yDnny9fiXvu+/lHbFesM3lO00xQYUmNoJ9lpkXiTi06jQgQtcH7AYNqe
	bexuM9cT/KTItI7TzuyR6gw9kVDT+CbZ/QlRgrcUF27V+AkQq2bOPYxfjnWMLDf5KoUK
	7qM0U0EwueMFqfl0EfGZGV+GuKplDuSyWetBSNbsKE+SSQDe2AqWpOGFVzVudZidZcPP
	9RA0we0AFTGWGrLw8h6H5oinlx54ayKlI53X6ufDBc4R+weFxIT7Eday25DlOUn9GJZY
	MKiv02C8qcC9Uh1gDd7QzdBwZ12ny+nuBOB2M+19e06pkRKZmtUzqlobkb2waCSLwu1s
	5kWQ==
X-Gm-Message-State: AOUpUlHvf6TnO2pwm9mXb7Z5KebaGReU0SDvpo3bYd9M87Gczbp3IXk9
	MO954SdnJ0gXCVEKmbUgpgkKad+25ky4ypZ6UjvpPg==
X-Google-Smtp-Source: AAOMgpfjAJr3PwAytCfH/+aHHPLluAUbTimLa46v17YCLjaXwYwipIpkosA0F7mW5k07K+Z98t7W66Q9XU7vfjhIHoc=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr5399684oih.70.1532549881730; 
	Wed, 25 Jul 2018 13:18:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:17:41
	-0700 (PDT)
In-Reply-To: <CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
	<CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 21:17:41 +0100
Message-ID: <CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 20:18:00 -0000
Content-Type: text/plain; charset="UTF-8"

On 25 July 2018 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> My question about the change .. is why ? I really don't like cleanup
> patches on principle, and want things pinned to a bug, a performance
> issue or something else.

See a post by RP to the oe-core list a few days ago: a general cleanup
of Python code that spawns is well overdue.  In this case
oe.utils.getstatusoutpus is a wrapper that just calls a deprecated
function in subprocess, is best to pass arguments as an array instead
of string, best not to use a shell, etc.

Ross

