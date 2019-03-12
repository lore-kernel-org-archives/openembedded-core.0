Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 409F86C227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 10:30:36 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id d125so2094463ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xeq6LbJGPnsyiKCZh05xYfhD3V3g1azAUSBfvt/8p+4=;
	b=aykMMucfWddveazwrAOv403z+i/uLnS4+49pxbrcDOHiW/c1mSW9V//Q7iuj2xGgJY
	OzQgVq+Zhr0RXWSOPNIJWOXjomWZnwQTXUY9wPzGSnU269advzgCKpJsj29Jf4UpDYbv
	K5tAAXOsTLIaVvqMKuGWdm+m1JyfINTInJ17Ky/sBHbahEY9H8vCvTqzzIWCA81xvEut
	CbZBgFjL7uepdcb/c4kb04kKshQCtOGGGNLeVgidCQHh8wPSx8vWWZfYJC1VZQjV8Lfn
	FMNriHN24zs7RSc37Rt5G/ALDAVi/nZz/iCdU1XC+OtpfwBjRq2IaO/C94JAn6TYfkoD
	arJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xeq6LbJGPnsyiKCZh05xYfhD3V3g1azAUSBfvt/8p+4=;
	b=JsTSC63K38k6DtwwySIt02JRopzG0gsv1Fc2Vsujb7Y4X1JyQkiU6msVvEMObNtDjF
	o5QIoHKK9MH7vNtD07oFF6rrCDR9VB/EmH7jRlB6M14acFI9anDhmC0qso/lzVDEvWCp
	oDUUy1kOinterqxEmdl67+odUllbjtg6YQTt0MZ+JKpuR1OeQmNKko5U3/mAJ8u3rKTR
	YNtJKnTfZiUgtSwOAJmmfnuO3cehuXaTKf/FgxPxh6MIJ3PuMo1Q216i20k9Yf4FqBt7
	vq8NCYV/kNJ3nZq0ZxUhiIMSWrrlNOiZdHwd1sQq35DYe6qru0kekdJWGcqR8L67iVEK
	oAnw==
X-Gm-Message-State: APjAAAXKgFaxLpUGbWSEH1Kpq2s8I8zp4/ZPGzr27WZYMHVNv80bV6qi
	bTAjOvHGo7bAxOgOI+1Cicvui1LOr/JP4AAt1/dvkg==
X-Google-Smtp-Source: APXvYqy9PgKt7Ux7d4Tnv5jVx8rB/K9tfP914RHXnm6DfITWwKtJXDpES3edUiFR+jNJ7oYJSq5pYwrC0uunfEWrjlA=
X-Received: by 2002:a24:2ec2:: with SMTP id i185mr1522614ita.62.1552386638089; 
	Tue, 12 Mar 2019 03:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <1552046342-45875-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1552046342-45875-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2019 10:30:27 +0000
Message-ID: <CAJTo0LZw_kKeyQarwrKwRUpHUd0_FFDHFDxMXYFBQeOP_0vokA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo-c: fix for do_package_qa
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
X-List-Received-Date: Tue, 12 Mar 2019 10:30:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2019 at 03:05, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> Fix the following QA Issue:
>
> ERROR: nativesdk-createrepo-c-0.12.1-r0 do_package_qa: QA Issue: nativesdk-createrepo-c rdepends on nativesdk-python3-dev [dev-deps]
> ERROR: nativesdk-createrepo-c-0.12.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Fixing or working around?  Why does createrepo-c depend on python3-dev?

Ross

