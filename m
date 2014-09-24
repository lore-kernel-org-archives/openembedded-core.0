Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id C734D6FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 10:50:48 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id e89so5358715qgf.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 03:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R0vQNVLuepdvZgSIt2LY2zygJuCBm7rrmqyIvACLKpY=;
	b=YlRhZxew24JU+pD5hnLBjQBWxNBOwoY/eI/F5wg42e/+O5V/I5VAbrI1lMsAI7J9Z9
	AXibvLqJiw6GJGUEQ1BLR11z9l3CSK3z9LUQauUa6A0gHm3u8AXWIWe8u7Uqf4nB5JmY
	oCZc1itD1s1/t0HyrNDjxZGepsM7YX6T+IFE2hQDpGWLAZAZEkZBhNmSd0JZusAyTVJ4
	FQk7hGD06jp6ru/rHW8bgoU+vPWVNKyq7xVdYNeW/+EurPhNJObQa5LNbSvTqZKolF7X
	q0jrpkmPLAeu3NdlgIfsV7j5h7xyakxw0S20SqZ+TGUidKnpr+YK7wcReLpfxUKL8mu2
	pC4w==
X-Gm-Message-State: ALoCoQmUX9+g33AfW8TA31q/0jzuU71ulNnE0LwJ3zvMeuSGRfBc4cwAxwPzUSBkPi0ZdrbZzWPa
X-Received: by 10.140.27.139 with SMTP id 11mr6848758qgx.59.1411555848946;
	Wed, 24 Sep 2014 03:50:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 03:50:28 -0700 (PDT)
In-Reply-To: <54228BD8.2060908@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
	<1411504641.4189.2.camel@ted>
	<CAJTo0LZCcE0PysOXErBHaoyOU=izE88MkS5tLNB1q1ZGuijiiw@mail.gmail.com>
	<54228BD8.2060908@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 11:50:28 +0100
Message-ID: <CAJTo0LYQYT41Ev2fkj2mQnFVEMUVGNpoFpaFA5krRzZUk=jiSQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Wed, 24 Sep 2014 10:50:56 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 10:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> I am afraid moving the postinst to texinfo.bbclass will cause some
> potential issues:
>
> - It will be invoked many times if multiple packages installed.

Sure, we could make it a trigger in the future.

> - We could not use a generic way to name pkg_postinst.
>   Such as texinfo recipe, we need pkg_postinst_info.

Many classes extend the postinst scripts, so this isn't a problem.

Ross

