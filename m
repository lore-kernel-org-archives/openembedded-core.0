Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id A95C76A49F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:29:10 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so360755veb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 04:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lGeJjs1QZ65CyV5tiqjjap1cB40EBuo2/wwBFrAipr8=;
	b=orwDlptbDy/wCtjnUoonO3/O+0HAvkHutt3cGVm6oUYA0IU8WAPQWHywo2CqBA7FzR
	c8DSq3fb+w6I4HsKwAXVE0qz3G+U7dCnCufy7+GNZa6NqzbWKbBqpk5Hqvdi8ViCcGRX
	4DnoGXHrrEuVbbaAXF6T9E2lOZevC4I1A1vd97O9GMPhMuGx5juRUI6DY8vAzrg91G2x
	FXkr6kHt2JeLi+AIq/mEqMT/GFQa7htS+suqLQCMobApXTEftH8PJVfYg3gDQG2NgJxd
	LGdL/1uzSN3klufXyuvUkii5TjCRFNBTZoGtVUGh6MBOlfUjsjA1BueHPosI70TpkQQn
	TR6A==
X-Received: by 10.59.1.196 with SMTP id bi4mr768063ved.45.1371209351579; Fri,
	14 Jun 2013 04:29:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 14 Jun 2013 04:28:51 -0700 (PDT)
In-Reply-To: <7d251cf9fa6bcd406bb56863936275331b8b9cde.1371198970.git.rongqing.li@windriver.com>
References: <cover.1371198970.git.rongqing.li@windriver.com>
	<7d251cf9fa6bcd406bb56863936275331b8b9cde.1371198970.git.rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2013 12:28:51 +0100
Message-ID: <CAJTo0LYhzu97C38FAWA_z79pB5=Ls3J8OkMJSjQzuXC=+KK9Eg@mail.gmail.com>
To: rongqing.li@windriver.com
X-Gm-Message-State: ALoCoQnD4M6p97cdeTa0W11SSi9JoWJyxLNkG5MwsCsBMKm8EWhrysfV7jD2FKdN7RyvOOqKz9+m
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] cogl: make cogl be able to build on ARM arch
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
X-List-Received-Date: Fri, 14 Jun 2013 11:29:10 -0000
Content-Type: text/plain; charset=UTF-8

On 14 June 2013 09:37,  <rongqing.li@windriver.com> wrote:
> +Upstream-Status: Inappropriate [cogl-fixed.c disappears in cogl 2.0]

Whilst it's true that this file doesn't exist in cogl 2.0, cogl 1.x is
still maintained.  I've forwarded this mail to the maintainers and
it's been merged into both the 1.14.x and 1.16.x release branches:

https://git.gnome.org/browse/cogl/log/?h=cogl-1.14

I encourage everyone to only consider a patch "inappropriate" in the
most extreme situations, as every patch we carry means upstream
doesn't have it, and we have the cost of forward-porting it.

Ross

