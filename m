Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8270F6D323
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:45:58 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x16so1233610vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lQI2rCR5F4gsaFIxvLIncT2E80F4/XTNUkDrCTajwoA=;
	b=I9uX53OmGnfUh5o39mXSKNzyhyFawS/XDMnz1R2dqHEi18q4REVFRq6OA+MLyIPIO2
	fzPkJ9qF4r0YGUbyd+FYroKF4ikW7gSqaPFNEmsRT2Nb2b1xo25E+pKG4GzXEDsErz+s
	YTTKcTUXfZ0L3P3zSFn+P/bZopO6tckT8iOsvnJwx7PoyLDXUOp96HLQvLFvInEnd8UA
	Y6/fpB/KQto0rFmpSLivWV5xSl7LiyGfYXFet66u/ZalXnvVw5VinBdaBhvcwRgmtfD4
	xyyA2luwp9Y7VtNyY/n1jeWJEo+h1Ysd+iijVr3OU0/e9d3E3EtrpLhdiDlfEiM++Tnz
	AjYw==
MIME-Version: 1.0
X-Received: by 10.220.145.75 with SMTP id c11mr717751vcv.30.1382600760326;
	Thu, 24 Oct 2013 00:46:00 -0700 (PDT)
Received: by 10.52.184.103 with HTTP; Thu, 24 Oct 2013 00:46:00 -0700 (PDT)
In-Reply-To: <1381922875-4261-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381922875-4261-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 24 Oct 2013 09:46:00 +0200
Message-ID: <CALbNGRS_SFLVAozE4jJubtmFMVdKkqsMbeWUo0h06i5e6OTpcw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 24 Oct 2013 07:45:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 1:27 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> in
>
> commit fe039170236080291c0220476a5809774f82ee5c
> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Date:   Wed Oct 2 10:55:32 2013 +0000
>
>     systemd-compat-units: Use correct run-postinsts script link
>
>     OE-Core commit 75a14923da1ba91eddde47f0907345c19c82d6f0 has moved
>     run-postinsts script execution from S98 to S99 in rcS.d. run-postinst=
s.service
>     should check for this script and run it on first boot rather than
>     S98run-postinsts, which is for opkg/dpkg.
>
> the link was corrected but the mentioned commit is not available. Instead=
 of
> reverting, we use the same variable as opkg for init script ordering and =
drop
> a note in case somebody wants to change default.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
ping - or am I the only one with nonworking postinst?

Andreas

