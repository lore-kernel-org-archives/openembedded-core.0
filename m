Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id F23F1615AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 12:01:14 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id 11so2771433vbe.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 05:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=SgzscEptQhWjz3BRZxoTOG1Z6ULCsMrKrGquIqh2Wzw=;
	b=FPQ/MAL0RkqDEcGIus2f7UxgonrPvuCU7S6Wrtexxuq17mCxkrmNVHj+zwKeT9myT6
	2cdQ2Zq4aan0TH13zzoalsicwh2PJfPm/b5yeM51MSJrtyulYcFQBFiW0rgwmnru0i1A
	PqcBeBNYi6aqSBtGH2/e1Co/U/IJZb+7CDJbJKadc3tkzDWf9SgI2AUdIc2bVqxumETQ
	+bseB4p+jv6euuRPV3qtXGltO4eJhNhb8gY7haCRPCUCmY/6gB4FrbFfPYGfx5av9wdJ
	6Ey64l/a9kRIRkpPM5pVy2LD/zd++jSlrhmokbfMohmGCa6wgyRoQYgZV+x0UGjTkhu+
	4H4w==
X-Gm-Message-State: ALoCoQkkkav/l7C0fBxPWSxRvPX+7QoU7LE6NTR3Yfpjj6JlW/KXTZisAzNfbcHkXAfYMyvCYNQp
X-Received: by 10.58.156.106 with SMTP id wd10mr1684714veb.7.1383307276590;
	Fri, 01 Nov 2013 05:01:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 1 Nov 2013 05:00:56 -0700 (PDT)
In-Reply-To: <CALbNGRTjgVqkBk2y53PEqiC_R13Q8TGM9TEhg31ZEZNWUYXxKQ@mail.gmail.com>
References: <1381922875-4261-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRS_SFLVAozE4jJubtmFMVdKkqsMbeWUo0h06i5e6OTpcw@mail.gmail.com>
	<CALbNGRTjgVqkBk2y53PEqiC_R13Q8TGM9TEhg31ZEZNWUYXxKQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Nov 2013 12:00:56 +0000
Message-ID: <CAJTo0LZHX0wbYi7WKD7teMhjtjWiQQQ0NcanQPXjBrreZhZ0=A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: run-postinsts fix script link
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
X-List-Received-Date: Fri, 01 Nov 2013 12:01:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 October 2013 18:42, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> and to make it clear: commit 75a14923da1ba91eddde47f0907345c19c82d6f0
> is a poky commit. So runtime postinst is broken for non-poky-boys.
> Thanks for taking care

Remember that every commit in poky comes from oe-core, bitbake,
meta-yocto or yocto-docs:

$ git show 75a14923da1ba91eddde47f0907345c19c82d6f0
commit 75a14923da1ba91eddde47f0907345c19c82d6f0
Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date:   Thu Sep 5 18:04:03 2013 +0300

    run-postinsts: move script execution from S98 to S99 in rcS.d

...

    (From OE-Core rev: 882da38f226acc40c041155218549edad461b7d7)

Ross

