Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E3AF260424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:21:24 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id l6so900783qcy.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TG08eniNSGKxafpf8JtJHaccqWZBj1yXdoOBA9EVK9c=;
	b=Ez20JVuMsKJYmUQJJcu1qKjIvkLeERs90noZmYXYQF5QTqiweB/8eteh1yAuHpZRt6
	EyIPWvvEOqhjYKfF50/sSaoKRfKkAnkYHRWMzqFElYwofCoSY7A4n0CZmGfeY8q7cOGW
	eurx2St6yHuesRf2mvlKrQaOqnkCTnuAQaOpryDEgM7BXPW1NufP2t/+h1rfKQInzvzn
	JqGmWoOBb/GiTgWKszku2LBLjSKJMVtgYohZ8lg1JiPRsvVpvSP4KSyaV2vG31yXllLg
	3NrjwWRLQcWTk+dANGHuueCYaMF38/W5rGKYZeyhWMD4s8uXFlrZ4IO92Nz0VvajYbty
	KiOA==
X-Gm-Message-State: ALoCoQnq/DjTgU+sXP2FqXb+ZLAcVKRozed/hLK5yUZ8Zw5erUszkXjuLrHrdye4okcWDKI8sCi7
X-Received: by 10.224.64.201 with SMTP id f9mr16427005qai.64.1408015285819;
	Thu, 14 Aug 2014 04:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.134 with HTTP; Thu, 14 Aug 2014 04:21:05 -0700 (PDT)
In-Reply-To: <452f76082d13b3d1c7f9930c8754553c336bd176.1407951966.git.pkj@axis.com>
References: <cover.1407951966.git.pkj@axis.com>
	<452f76082d13b3d1c7f9930c8754553c336bd176.1407951966.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Aug 2014 12:21:05 +0100
Message-ID: <CAJTo0LZy_BEMGRO4pcjaJYfdtmq24TJ3+iLAmWjYXDh9Bz4wRw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev
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
X-List-Received-Date: Thu, 14 Aug 2014 11:21:35 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2014 18:46, Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:
> +PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"

Don't you need to depend on gudev here aswell?

Ross

