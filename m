Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id DFA7E6A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:59:53 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id ox1so6137816veb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lFJPpG7vpCo69Zh0LWf1/R7mRloa3eaq95G3TRcor/I=;
	b=n/c26ZI3JSi7E0a6TJT0vyEEwx8tw6vO05UpHgSMvyacRE+9fn5dZEdRdbxDhvYrmr
	LSBTsU7UTaINbPCW0hCenmYK6FPf0SZp6RRk8SeTYuqg19d+TJ0bZJ6ZXg1NHHp2i6mk
	NBqORSRiCzPCmOL8MhVU+3XR2fHU+8KKZJRLa2uhYn9bWF1UYXiqYOhXfG9ovB4feI2+
	8SrQVGJWNLuJn/7k2WXQ2YO1SP6hjmfslO9zHkS8ihMHi+THsxEZBsv67S4mtFkqKItz
	PCWFNppwvzBrHY3qLvClVx1LeE5wApVfxX4394GgqS3Xie/TouM21c8knDjXzJECNkCP
	veUg==
X-Received: by 10.52.31.230 with SMTP id d6mr9258869vdi.43.1374587994172; Tue,
	23 Jul 2013 06:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 06:59:34 -0700 (PDT)
In-Reply-To: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 14:59:34 +0100
Message-ID: <CAJTo0LYwTk-eP9CCY_TR27Xq_tHUPZ4wVVw9DPObJP04dOSGwA@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
X-Gm-Message-State: ALoCoQnm+oziMBk5K6VSIuswaNdi2mZiqIbe9ph1yWmPl9t3TYjeVIpXX7YTe1xf2+3JbqrfPVEV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: Remove systemd_unitdir if systemd is not in distro features
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
X-List-Received-Date: Tue, 23 Jul 2013 13:59:54 -0000
Content-Type: text/plain; charset=UTF-8

On 19 July 2013 12:53, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> If systemd is not supported DISTRO_FEATURE than there is no need to
> package related service files.

When this is merged can you follow this up with a series to remove all
of the conditional installations in oe-core?

Cheers,
Ross

