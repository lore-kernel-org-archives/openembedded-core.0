Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id B2818782C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 22:51:21 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id q80so31346459ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HPfIQREblZDqkeWXjiM6pMCY0GuGqwOcBJg/JhUyvrs=;
	b=T6P3Pas7Qp52A85har+arpM6wW7A0HzRI7wGWi/ZWzEqqXKW+DEpSTeIR0XZauzi+6
	g6xIj9vxWCDmCV7X/7CIe6/qtqAbiqeFxS0sKsCIevjN6anRm2YeWGAtJIDOtMyPqZfi
	utv9fHIfITQtKtyQMn4dc9bLKTdj+BvGG21numJRrNz9wrsb5+TuCM+rVnm7uRd+PLKY
	zDdhnTV8WO79X/u3tyb5UtEK6cVpXS3iFYjjmKgdovuMO0M/BzBIoRGBxmYP0k6Z+PC5
	+BjywAKfb/aSw9pBHQJ+539BfTjXsWOfgyUeScmYavyYp2ZZ8m/O4WDe0UZ71OGf90fh
	V5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HPfIQREblZDqkeWXjiM6pMCY0GuGqwOcBJg/JhUyvrs=;
	b=nA1n3Y9BxJiRGE9oXvIs02MAjeWcBm6ouVEDphsbavnenCSFaC7U0b+7GFZKP/A4d4
	52D9EfhJLXSWLzO0OLEycKDqRYhLssQv0r3laKayLYZQU2Hp5tdqITg//Z99jUi5BNDO
	Jfnf82R/H70H+f057rGpqMTWFZF4+XoghZxmINono5V0AsHw7tk02wJ2dAmP8c6UsfKk
	D+f9BP6ZfjQMYRHDeSuYnFfuq/Au3xykOr7bn07Y15adBYT6AsvBi8ZDfg/3eTZGoY6A
	8+F3g8dDnax9IVZc8SQSV/v4O3fHzEwCjpZY9V67iCFj8MXu+OBykwhKn9RNWTiYS42y
	f9Yg==
X-Gm-Message-State: AHPjjUjytz+qUZR3sofUERp3gjNpmnfMZitXpmv4ML0k9UHR54lBLpui
	hapD7IUQbWWQRkd/lPq75PA9gjGX8GTDt/lPI9BJcw==
X-Google-Smtp-Source: AOwi7QATcmPv0XjeSPcdXM+USNFMPsgTsNwMRPt2J085SbQn7xade6M+LXGcFZp2QvSpWrK/Dj2Zp6Hy++oPfMvFOyo=
X-Received: by 10.37.119.21 with SMTP id s21mr13405998ybc.57.1505256682578;
	Tue, 12 Sep 2017 15:51:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.205 with HTTP; Tue, 12 Sep 2017 15:51:21 -0700 (PDT)
In-Reply-To: <2482308.N8aakNJOlD@peggleto-mobl.ger.corp.intel.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
	<CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
	<2482308.N8aakNJOlD@peggleto-mobl.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 12 Sep 2017 15:51:21 -0700
Message-ID: <CAHUNapQqFe+f-yd6H6ta+M7MaMUiEyaU2PjpNQSQn7S+Ug4hYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Tue, 12 Sep 2017 22:51:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 6:40 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Is someone documenting all of this? I'm pretty sure this isn't the only one.

Better still: an automated test (with comments including this
information, so the test doesn't get removed under the assumption the
thing it's testing is buggy)

:-)

