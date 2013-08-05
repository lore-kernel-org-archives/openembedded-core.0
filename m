Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id E7F1561223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:18:49 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id i3so3101871vbh.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 10:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=guGf2O8kL81MgI3dhbpZ05eMt0UfZd4bBdCrStjdVhI=;
	b=AGosJRoAeEd+bFKs6XgZTtVwoerh2LumVFXwLTSSjcUWY392UL2r+s32mVvft00NFr
	mai12mJHuFryh5KgEen3EpJ6AnEPhMvRBNIlCcedmQBu4IR4Brz4PoBSZIb2osqIJ07i
	Fezl/piEMpfQmVv2z46gb/uU4X6t0yhEfhm9iNPWY+t5x6tT8L8p9wEadEHMiFIdTJ0p
	JtPhPjw6KOYJQ/VryyWKirsZS+hZtUU9cprroUHNm+NzhkHiXMFMKA0N9oK7FA/yUPNJ
	JlYGZt8Wf37mFA+aHLYpVqAHF87ULIoa077IexkmyvDHxX7Xd/KRnKJB1E/TGF9bxkXc
	1yKw==
X-Received: by 10.52.27.6 with SMTP id p6mr3379705vdg.77.1375723130112; Mon,
	05 Aug 2013 10:18:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 5 Aug 2013 10:18:30 -0700 (PDT)
In-Reply-To: <ac2478839baa47707462f083c300ce22cdb8e1f0.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
	<ac2478839baa47707462f083c300ce22cdb8e1f0.1375714695.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Aug 2013 18:18:30 +0100
Message-ID: <CAJTo0Lbo_v=SAxKTM8vSa_=LK295uZVjgukpsXKJ+uhAZWOq9g@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmVXbYp33ztMQwOAMPTBHOUDo6H0JEUEn1vF0IccBos7CYw3dGXQena/xFLcOrs6bV2o22w
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Mon, 05 Aug 2013 17:18:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi Cristian,

I did a buildhistory-diff and noticed more than the expected churn.
See the upstream NEWS for some important changes:
http://cgit.freedesktop.org/harfbuzz/tree/NEWS

"""
Moreover, ICU support is now build into a separate library:
libharfbuzz-icu.so, and a new harfbuzz-icu.pc is shipped for it.
Distros can enable ICU now without every application on earth
getting linked to via libharfbuzz.so.

For distros I recommend that they make sure they are building --with-glib
--with-freetype --with-cairo, --with-icu, and optionally --with-graphite2;
And package harfbuzz and harfbuzz-icu separately.
"""

We should split out the ICU package, and re-evaluate
disable_graphite.patch/submit upstream if it is a genuine problem with
the build system.

Ross

