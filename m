Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 011586ADA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 15:39:39 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so3704656vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Uvip12ydiW/8BnEpa7noVnh3zt7CLRMbE7I71WP/cw8=;
	b=DVnNsmlVkDGqnVeNxOoPwd0eA4dZ8agGWsfLQ7e8zoQ70xpWaSwF0PmtVCLz7HTrSz
	Q1PBDglx+RQ4k9ANgbaum2o2JSDQUL65SGimnwZcZ8UsKJAHKvnFVG4Khbb8Gu+Np++n
	SlOpP9vFiPaifmWfhb3AjpQWCLZ2lILRsFIzJUhEve8yrW1s7NTtg3ebx0kxFb+NzcRn
	CUOTkDHmcle7OdQYuGaSmSuyfd9AICVwIYdHDOn+WCQUSJp5r8ihQXmuHFp0FaYbN/Qr
	zA27tb1e22J/f02vKFqOwMaFX58QgUsN1e8vEfeU1lxcWY3JNLrrvpS9uAGrua3v/bWo
	SZcg==
X-Received: by 10.52.21.232 with SMTP id y8mr7952153vde.6.1372693180632; Mon,
	01 Jul 2013 08:39:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 08:39:20 -0700 (PDT)
In-Reply-To: <137271775.y6VAVELV8v@helios>
References: <1372688477-27863-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAJTo0Laa1Y4NtDbQsGEJRaP+K31y_CF9Hmk=drvFs1GOArPBzw@mail.gmail.com>
	<137271775.y6VAVELV8v@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 16:39:20 +0100
Message-ID: <CAJTo0LbhmTyspfdQJaEXVWpZYyFSW-bWtP_Q8AJBkgTRqDiB6Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmbf/rl6wI3lidfUNkfV3r0/+DlCzn4RY6ghe6rgfpR7pryPjOCYwQyA6f0dndhlYFLHkZo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: allow building without tracepoints enabled in kernel
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
X-List-Received-Date: Mon, 01 Jul 2013 15:39:40 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 15:55, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Right, I did check the find manpage but it only mentioned that -delete deletes
> files. Testing here I see that it does work though. I'll wait for further
> reviews before sending a v2.

Actually, http://pubs.opengroup.org/onlinepubs/009696699/utilities/find.html
doesn't mention -delete, so it's possible/likely this is a GNUism.  I
retract my comment.

Ross

