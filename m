Return-Path: <patrick.ohly@intel.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 32D96719BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 16:52:52 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id h14so54804084ywa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=SONYYF9s2/ikRKu7ezJuSA+tzXeDurcOYAMT0/Fhu4A=;
	b=Ub5KMfFmVDHULhR4cywit3sPh+Cny5lIJQiI99ZykEPx+IJGHJzUUgd422hRsCpwiE
	gIoAZECtSgDNtYs1wdY/u1JAyiwBWjJ5waiRC5ZbrkqBOfgGMJ8PoW/Gh3bKlR0lQUwu
	Hvu9kljlLZNizJcefc7IAMjfggLNYAXSFyyJj/wqW5wkAX0rLVnNgTX0G5/V8s1UZZnX
	rt0xLEfUSeRFZ1k22312CQtsYg6ka5yRmoQ33EjEbpQNuDOWZyTVt/l3W60Wv+19nM0a
	YYsgt8olLT4wjWcCSUjsPJWG2q+T5DjTvci0kfrO7fwtVxBhFarnBllGnLSS1pVUBu2g
	1eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SONYYF9s2/ikRKu7ezJuSA+tzXeDurcOYAMT0/Fhu4A=;
	b=XE22mSvp0z6JJJasZbKv+YqgSzmoA/hKhrM4tHrkHu3giOuNh+M7BqsPdqrXr/G6TH
	beyA0G2am2zA3lrRcW5Zcc4BRngV5W9ticYp1sV0h8Rb1lWxMUUfAsLzEajrxYk0XswU
	rxz76Ysa0rxDkejWCqS3zRKNpB+pL1x5g/EDQd65Ko0MWozQAj9Dcj0EveNoUkbKshzN
	ImFVQeI64I1MKRV2rEti1jcdzJfj9EJutuym406sW3d+UOj8IhRqKPJCN21jQB7GD0HT
	XRDs6rzaCd3MkyGhqj/UZVOwyhEaBJxwOWsPXWU3UnOHIQ2Eoklf3WBeNyCwR5Qdzsyi
	jPXw==
X-Gm-Message-State: ABUngvdKBF8Nr4iFizJGjw3QgI4kaU959Y7QWTm7O+IOBiPwVBhZ8Jj4KkmYs7SYozpWdXRK
X-Received: by 10.107.6.160 with SMTP id f32mr3695498ioi.201.1478191973803;
	Thu, 03 Nov 2016 09:52:53 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E52F.dip0.t-ipconnect.de. [93.232.229.47])
	by smtp.gmail.com with ESMTPSA id
	k81sm3079296iod.20.2016.11.03.09.52.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 09:52:52 -0700 (PDT)
Message-ID: <1478191970.13356.103.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 03 Nov 2016 17:52:50 +0100
In-Reply-To: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 16:52:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-03 at 18:01 +0200, Alexander Kanavin wrote:
> Hello Paul,
> 
> it would be very useful if devtool offered support for rebasing source 
> patches when they fail to apply

+1 for that.

I tried it the other way around: first "devtool modify", then rebasing
using git (which only works when the recipe fetches from a git repo),
and finally changing the recipe such that it refers to the version I
rebased onto. But that version change in the recipe confused "devtool
update-recipe" considerably (as in "added all patches between the
version", if I remember correctly).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




