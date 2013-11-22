Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 076046BE67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:42:46 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hz11so768535vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0mzdCDAvCsWhFKqSHhcTjzyGyh2ZX2wEF/pLMR3c6IY=;
	b=EiBSdTUz5CadWKuxSoY6i6yROA+7cKm3/4uzY9G8MpQwjsOyuZy28FhcYbFg8LSf0U
	x/ERiVG8kcrdXFTMDLgrnl9xopToshSsIyNXaYMZiXVQlk/V6JrBxrzzqoecQygg1lav
	sjEDh7B3QHtqR4iIzy9k+1LK6ccUfV4iBevML+8tJflLPwu9shDLa9zd0BzfNaVGT9I/
	HrKoJoI9eQSxqyLOMJXgnpPDSSXlYykICLVJBcPlmkTOPuYK/tyoB1CzYxlkX+TYSb3f
	Q+J+NQVzbmgOjemGdaaOWYeUbxUdbx0ID6G19wRMkZh5kuArimmCJLJ4g0raQX26KpaP
	ZJsQ==
X-Gm-Message-State: ALoCoQlzpEjpsOFafQ/rxSqTow+M1vpKOdNMnW+OSk6Mu0fQe6Wjny774wIPY/hAdAiugr1rBFvE
X-Received: by 10.220.144.80 with SMTP id y16mr11432513vcu.4.1385127766078;
	Fri, 22 Nov 2013 05:42:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 22 Nov 2013 05:42:24 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1311220812240.14584@oneiric>
References: <alpine.DEB.2.02.1311220812240.14584@oneiric>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Nov 2013 13:42:24 +0000
Message-ID: <CAJTo0LZ3ye-nX837bnTh9QiQw6ZvrQBgNNp_dyTqPP5jBi9w2A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an easy way to see the actual files that went into a package?
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
X-List-Received-Date: Fri, 22 Nov 2013 13:42:47 -0000
Content-Type: text/plain; charset=UTF-8

On 22 November 2013 13:15, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   if i use "bb show" to examine the files that go into each package
> (eg, for "zlib" here), what i get is the collection of wildcards that
> will, of course, still be processed when sequentially creating each
> package:

"bb contents [packagename]"

(known issue is that it doesn't display empty directories)

Ross

