Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4F960119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:41:53 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id h190so797298ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=v+Zo7tklCzrk+8f+B6pbk31zfwFt9AYCKkw6X0Hy7ew=;
	b=AjfPxAxo05wa9c79D17DMnraaqf/f73D6+qL8EMh/eE0PGPYMokEFFe3Whx4SwPK9r
	O6FNqv5FYO8JJaooECLUWYPNoGCkze6bilksUyjvGorvRsYri5ntuWzYuGYBe9Zm+nZe
	UZ0N6HWpxnBy5t13gWKg3r2TKzZy3jPVnlIgnzCWQ+WF0XN5FViVp7ufO8ngSzWgbOX8
	9dtvvf9wADtM8Q2w6jkcELHHENEVG+hI3SRi7QJnN2AAwyPn9t9AmfmmDlAtZLttf2BG
	dqPaSFywYh0RxX6T7hKTuRrSwPb4IfPBLmB5Xt/1VM2OX965bnO/oRMDfurxPlyqiPXz
	Zv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=v+Zo7tklCzrk+8f+B6pbk31zfwFt9AYCKkw6X0Hy7ew=;
	b=YNXUt/dSLXpmzENGpRFpsPcWorhHY4P6m+XFn86VcfRePq8NkSXe2qu7g2+bQc4Uvv
	ovQB10wKzYnNq9hGg1irUtXIdILtFCxtPNc331LBXLWKJRr2MTw18gnfWFMoxhWM3XWe
	2RFobmmcaIuVri4hjot6Nk8RgEASqUWOb//+3V+e/aYmB4DotmhNx5GxTGJZxm/DU4p3
	j8F4HyOJaPN2SPBcvjvQATO+JYsDFi619SqgaHD0QLI9PtYAvvuG3xtF+0kvpawuasu6
	JUcd+dWlWdxZoSh9aqYeZ/rLGVQLVYxaDPRsLTgDjdMyfJPH33Zy8qImkYUXIfv9+CZ3
	Dg1w==
X-Gm-Message-State: ALyK8tLqlTq/qs8ZDnyUuCsZpHvLKcW0bkpMLTj2cLlvK0ra2qa/5OIiDhQXRUVMwB7u+w==
X-Received: by 10.36.41.136 with SMTP id p130mr20773910itp.65.1467841314534;
	Wed, 06 Jul 2016 14:41:54 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	a17sm2609724ioa.27.2016.07.06.14.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jul 2016 14:41:53 -0700 (PDT)
Date: Wed, 6 Jul 2016 17:42:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160706214209.GA3581@openSUSE-i7.site>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
	<CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
	<1788025.i9tQxG4ZVx@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqLzVgDExTa71Ae7D_Ov1bokFii7f-tTXRr0wLnGFzO7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqLzVgDExTa71Ae7D_Ov1bokFii7f-tTXRr0wLnGFzO7Q@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 21:41:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2016-07-06 @ 02:30:48 PM, Khem Raj wrote:
> yes, clang can use the gcc runtime, I am sure
> intel compiler can use it on linux as well and so
> will others who target linux

If you build an app with clang and include it in your image, are there not any
clang-specific runtime files that are required to additionally be added to the
image so the clang-compiled binaries can run?

