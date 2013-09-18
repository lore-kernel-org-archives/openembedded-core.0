Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA896C722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:25:07 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so5074725vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 23:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=71EUzxAKBr1wWpFxwLNf7UZcAgjEJg5oJfwMGMfqTMU=;
	b=HYfdVg/3ehHxGinxLTw29dHWaAEYFNRFHCR6ijyDBGQO7IViJQWYQx8CzxxfGpwy1a
	CoDRgPCU7Z3xrbB5Wm83kY5/c7JyDnyxzAlMPnVfgt/We/s3C+pPIvaR9US6YF4mnGIL
	tFbmkbYruEo1pVAVYiF0hu553vDJyZYjSJi8nxbCmZ5uDKc2mz5fgOSMWRLAKghrcHnO
	Xkwtyqx1UHEtWowhiUoXffZLenBOJJ/EeDnkPy3bPI1B0pT996TK5Mqh+TA+cwlj0r4f
	gJTjLcrP9o71tkMkqtZsyjoHHW7qDeYlZ8gOvvNqtXiPn48w9xy4oC5O4PAaNhxjxAXg
	UF/A==
X-Gm-Message-State: ALoCoQlZ8XF71pkJSofc8L/OAb/QHH6UStFk2W539mkIlO5ZenLqZTTzlRRKpUZ3A1Zhci0v0YIJ
X-Received: by 10.220.46.72 with SMTP id i8mr36877150vcf.10.1379485509334;
	Tue, 17 Sep 2013 23:25:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 17 Sep 2013 23:24:49 -0700 (PDT)
In-Reply-To: <523913CD.3080104@windriver.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
	<CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
	<CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
	<5237B876.2080203@windriver.com>
	<CAJTo0LY2DZn2WBhQMZiBe1KFHnpZwT+C6u742reGvE3GLY4LnQ@mail.gmail.com>
	<523913CD.3080104@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Sep 2013 07:24:49 +0100
Message-ID: <CAJTo0LbfBNcpuW4HLP=-S+hRpPis_8mY-EWUtHw0jV9JL_Oo_Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Wed, 18 Sep 2013 06:25:09 -0000
Content-Type: text/plain; charset=UTF-8

On 18 September 2013 03:45, Robert Yang <liezhi.yang@windriver.com> wrote:
> Ah, yes, thanks, what's your opinion on my patch ? Is it OK or should it be
> re-worked ? I think that this fix is simple and easy to understand.

It should be re-worked to use the pattern in the commit I mentioned -
using .NOTPARALLEL is working around the problem that the rule
dependencies are incorrect.

Ross

