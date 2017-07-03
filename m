Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAFA605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:56:42 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id h134so54108160iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=kHZHr69qHLppmOrd2xlGMm2ySc75ju546rd+mUuad/Y=;
	b=zyoT9y3fn4xyfrKYVn6ZsxgTxHNLOXVZdXFR02bZkOm0j+XZW3m8fgHrwC0Rx4JACp
	uMIOmJq6vqMM80jkBWFsxBKZGk7w5ytHS35Z07mZdJSzf3NuEHHkmJxxpZQoxQ1G2eoF
	eCyZWnGpLQ2yEXJLEIILk/dAzYNZHOBOtoiuPDL6lhV7s1QqHIEjCqTnt0k73SmB9JFj
	jwqhYoMbJnLK2fXMzOaO7vruX5UNAD8M3f03rBnSadBoQt0og9n+2EnGeR84QAy7Shsp
	PgVv/nFSzx9SbwzhMl0ZuWjEpU1f4TUxrIod7QCq5MVC9rLmbub6NQRhS5QuvXuW1uxP
	k3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=kHZHr69qHLppmOrd2xlGMm2ySc75ju546rd+mUuad/Y=;
	b=SDRPQ4zPtnbEdcENl3z4yu/wP9nBNIptopC5pBnh0ptnYaz4JziqxNeir+T23vfi9s
	AX0TOR8yPeC0iCAeQReACFQjBWE7maQV1+gQCCUKEEldY88fzrHUWu7CQHFZlQKtX86W
	LrTCR1zd8N+izUvtW7WmXQ6jUXP6VunICZzjgNVv6OqKnrH8OHg65nrfmdZbmZrF/42v
	gHkl8UYcO/ScMrW8ckVcnQVVotxjE81+x+JTQ0Q4mzkBJWJmffT/2TLlY5Tvmzs7/7qJ
	9/c/yXSiNOeR9AYM98b0GelHP1cFgNeGTRa8K6u7O8EN2NOGLYFyh/RRdDLtqi9YAo8M
	H3Kg==
X-Gm-Message-State: AKS2vOyzXSXmoLogRbc/kLN5rVzwkIcQ/Ev/tUXRKa0D8vFizkdQhiFY
	ZnQnN6utXFcJIbCM
X-Received: by 10.107.12.166 with SMTP id 38mr31729791iom.151.1499075803152;
	Mon, 03 Jul 2017 02:56:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF7A.dip0.t-ipconnect.de. [93.232.239.122])
	by smtp.gmail.com with ESMTPSA id t5sm2559976ita.22.2017.07.03.02.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 02:56:42 -0700 (PDT)
Message-ID: <1499075799.5259.77.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Date: Mon, 03 Jul 2017 11:56:39 +0200
In-Reply-To: <20170630112411.11705-1-mikko.ylinen@linux.intel.com>
References: <20170630112411.11705-1-mikko.ylinen@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: fix AttributeError in mirror format checks
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
X-List-Received-Date: Mon, 03 Jul 2017 09:56:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 14:24 +0300, Mikko Ylinen wrote:
> mirrors is a list after split() and results in:
> 
> AttributeError: 'list' object has no attribute 'strip'
> 
> when the 'mirror values are pairs' check fails.
> 
> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index e8064ac483..1f74026e13 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -839,7 +839,7 @@ def check_sanity_everybuild(status, d):
>  
>          # Split into pairs
>          if len(mirrors) % 2 != 0:
> -            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, mirrors.strip()))
> +            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, str(mirrors).strip()))

.strip() is redundant here, because str(mirrors) will produce [...],
i.e. the string will never have leading or trailing spaces.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




