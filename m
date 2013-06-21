Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5747B605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 12:24:43 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id p14so5774845vbm.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 05:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Pb65aW+di+GSA/dVkO43Uq9iztUo6as1q8NXVw/zt6U=;
	b=EX7Q8f46A+sRDJr3j3lP8ho3xCNL2qUGNdqLG7T7GKyyawhPQIvBIYghk0dHoF1k41
	2+tH04cUIHRCLT5H0pyCO7i4Y9K94Vj7UFnxtFJH6wMRPvzUhbs0Y1NEajcPv63Q78v1
	LOnTTAYfeKzgjs0yB0i/29gDLHV58hWKO1B+V/SIM8ZFfEQ5QzFMBRl3jo4NOq8UfXQ6
	5QtQ42bGQ0ZsjE4xrKZsPWGB63SPeYR1hZF1hN7dovq2QWzqwdNLOy6dkd2kNEYwOI1G
	b6SrunkwXAH2wxrxiaS+7Cs4WE+psaIt0TPHQidG0ygQ1yEqgmXY2S2oy5A2/YG2aJen
	PcUQ==
X-Received: by 10.220.248.137 with SMTP id mg9mr5268652vcb.38.1371817483783;
	Fri, 21 Jun 2013 05:24:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 21 Jun 2013 05:24:23 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-Q2CTJomTKexEatwa77CyrJVoTHscZcCimDRpvA8+cw@mail.gmail.com>
References: <cover.1371781463.git.jackie.huang@windriver.com>
	<178fedbf79c6a303d0db3ef7af6b1b81b6b3342a.1371781463.git.jackie.huang@windriver.com>
	<CAJTo0LZ-Q2CTJomTKexEatwa77CyrJVoTHscZcCimDRpvA8+cw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jun 2013 13:24:23 +0100
Message-ID: <CAJTo0LaYn4DqqL0wiJAYkv8K88N8Ek0+8yG7TiDVZ1Wp0o1drw@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQme0lzRURTh7NQ3dO4Ze/B220LP/x21g37XEV2WkGr6J7qPL+4zgzR1RvuJZBc0u3mgyI1l
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] libxml2 CVE-2012-2807
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
X-List-Received-Date: Fri, 21 Jun 2013 12:24:44 -0000
Content-Type: text/plain; charset=UTF-8

On 21 June 2013 11:06, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 June 2013 03:28,  <jackie.huang@windriver.com> wrote:
>> +Upstream-Status: Backport

I'm now going as far as NACKing this.  The fact that a 2012 CVE
against a package that is under active development hasn't obviously
been merged raised a flag, so I spoke with upstream (crazy, I know!).

Basically libxml 2.9.0 introduced a new buffer system, and the patch
is Chromium is actually a simplified version of that code.  Thus, if
we have libxml 2.9.0 onwards we don't need this patch.

Ross

