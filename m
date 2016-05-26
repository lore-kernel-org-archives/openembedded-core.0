Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3923860620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 07:09:55 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b65so111048603oia.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 00:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=11QuUypTGitfHrVsDbcQWzwZI7IjszLP7c7rKxHughE=;
	b=CJisqQblHKC7wQRDnRSgmXsWFJc8vFbZxBj0cUCLnWm8ePh8yQ2ACKFAfQFBa05i+J
	/nuUt7Lks34DzPuBQs2dZSzqDAUy0AkynHCSOWPBiPUXxZ0ac0eydV4FZcnLQDQKqGlN
	eKoeu4FEmGmiIsO/oS9AkUudDie1T6CY17Ep+5ikTxgrj9uWnspRqP7nF9ENoZ6sZ/VC
	u8SlUQ5XpNYz/bXW4pzvXTqT6VRCAinYXDlbqLOuNGWSdNxYSam/bjZAQnfVe/V21FL+
	2IOlXWe2hpsQSMWdtEBJlimQx1yKRy0JhpOWmgAC9839WQkP+nW/rew2tZACqTADcksr
	vilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=11QuUypTGitfHrVsDbcQWzwZI7IjszLP7c7rKxHughE=;
	b=IwS1o1dC2SnOOglb8z7bjP1FrZBghX4BncssKY8DH3eX5bGOseLFxJEZ0OAKFdW2jY
	iIo89E3l1OwI3FTfSui3AcC1nBQstPI8CZCms4oINOhYu1ts3Nu4wyIcMF2wJ0KxiH0p
	uFv65VjjHqLExrXVnxsULjhKfIKFBFTxj1undhn3NmDMI6t215U8lhh7yLIfRB+FD98N
	BbZKD9NAyzmbviuvEuW8keCo7aH423+lE4Yne1Bqt1iLX8Gtea+5+UEr5K9UqaP13hE9
	rkybyaDVZCwQnTT/agOUacY8+qCjOXXAXkFyXYcPEI6h1N4phBAaq4DJRKdMF3MwUyu/
	XcVg==
X-Gm-Message-State: ALyK8tLzktKNyFe7jZ11aOKLPoe30GHF8RCPae5ku+qk65mnyE2E7wuIaLYlGZo+2V0hwKV7KmqfmjuSKbdzelq4
X-Received: by 10.202.206.76 with SMTP id e73mr5166679oig.173.1464246596340;
	Thu, 26 May 2016 00:09:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 26 May 2016 00:09:26 -0700 (PDT)
In-Reply-To: <52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
	<52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 26 May 2016 10:09:26 +0300
Message-ID: <CAHiDW_G9jEcP6MSB4+zGh_PPTBc87+C+5HBcGbEhFEoBNqVnoQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
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
X-List-Received-Date: Thu, 26 May 2016 07:09:56 -0000
Content-Type: text/plain; charset=UTF-8

On 25 May 2016 at 17:42,  <alexander.kanavin@linux.intel.com> wrote:
>> Change gnutls to use GNUPG_MIRROR as well: they have their own domain
>> but the ftp site is the slow, unreliable gnupg.org one.
>
> Doesn't work for gnutls I'm afraid:
>
> https://www.gnupg.org/ftp/gcrypt/gnutls/v3.4/

The tarball fetch works which I think is the important bit, they've
just forgotten to either allow directory listing or generate a
index.html for directories that deep. I've filed a bug
(https://bugs.gnupg.org/gnupg/issue2369).

I could add a UPSTREAM_CHECK_URI for the ftp site... except I can't
actually test that since the server has not really responded to me in
days (apparently a known issue for the gupnp.org people).

I'll see about using http://gnutls.org/download.html page for that but
in my opinion the patch is a clear improvement as it is...

  Jussi

