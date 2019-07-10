Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD3477EF04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 12:57:44 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 16so1963048ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1lwUZj6GzssFSocj4wD9bS0ibtIwxluDQyWu+/a63sM=;
	b=PvQIGZroI28CfwZRNUczfCM7fzhQncROCkp7RVhZoNer+by0K+T3HqkFDl551bfrke
	uc6VRoSvwGrbUXWA3rRmQ1xFVNni3dkODOzY0LHarXZq9MGLwTU4nhxtHK+pGojXtgkd
	8JvT4Q8DFHyvmjj9OCeEvWUw38L33/Uz+d2GVyX+7rjk1/UPlXDMZw4dbxaUe+Q5kANE
	u7BA4e32nSeX320pD9XS3O6URNscBIv2+o6YCKnxmveKIQGRv0KKTcioyZFipiFY8ry8
	YGmKbzryC5tvvwSAU8LlYKiT2B0xh9H0Q/L4wsOZwo86DNmkB7f1SXtdHlK94yk5LiNs
	uhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1lwUZj6GzssFSocj4wD9bS0ibtIwxluDQyWu+/a63sM=;
	b=aJgx7grzZaN+l++R/FZ4bsWK9Br7raUxZltp/VXonkDB7t6ftc5TwFtoHVObGUzqfa
	FQzyH9e4SU3npiRlbmu8Cp0d9XR6hM2K8NEQT3rc0XHQGQLaRRlyEehU5In0RmN+Obd0
	1QZyfvhp4OZjbWZ3VCdGJXIP4PxySiH4ixIfrf0H5L0KItf/o4dAWHmpgvTeJ4ZV1qYy
	YNKPN2fAYDx+kz95XeWQhHR1SGtM4tvC+XQa5ub5W9r4i8oiETB/z2YaIxQO7bTyHrYp
	u7JNX00bGYXSRezVETyCRzhKb9W1AvwZBLK6uuhNJMr8aNJtJkUk6hqsesphMHxVAh2H
	Weew==
X-Gm-Message-State: APjAAAXbm8vt6Jg1LVWt2TpcCqgbXPQe3LIAckThUteulzIxoYdwaIvG
	OG/Way1G4gtpmngsPo+aSXdcmdcDBydOGKEdVao=
X-Google-Smtp-Source: APXvYqzkQ2cg0dQu5KMusF71iQkaGiXumv7RP89z60/P01FWc4q+MlBqTiLZcZeM7KweUPWZr/J0iXl0RxmYwcAOzSs=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr17693965ljh.104.1562763465177; 
	Wed, 10 Jul 2019 05:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <e5194d279637f6cb6aaa5e5fd1d2f6657aba522d.camel@linuxfoundation.org>
In-Reply-To: <e5194d279637f6cb6aaa5e5fd1d2f6657aba522d.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 08:57:34 -0400
Message-ID: <CADkTA4Pd6hst7zJAcYafa_61h5OoWtHH=O6frawnw4XOEHLVzQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: config warning from linux-yocto 4.19
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
X-List-Received-Date: Wed, 10 Jul 2019 12:57:45 -0000
Content-Type: text/plain; charset="UTF-8"

That should have been covered in this patch I sent:

commit 95e9df0b5cb5179271c78499dc60c3c0df0a5622
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri Jul 5 11:15:37 2019 -0400

    linux-yocto/4.19: update to 4.19.57 and -rt22

    Updating the linux-yocto 4.19 recipe to the latest -stable and -rt
    releases.

    We also integrate a configuration change to support ptests on scsci
    targets:

      scsi-debug: include core scsi support for standalone inclusion

    The -stable changes comprise the following commits:
---

Is that applied and yet we are still seeing the warning ?

Bruce

On Wed, Jul 10, 2019 at 4:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> I think/hope this is just a kernel config srcrev update but could you fix:
>
> """
> WARNING: linux-yocto-4.19.44+gitAUTOINC+ad235db461_c12bc1a098-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
>
> ---------- CONFIG_SCSI_DEBUG -----------------
> Config: CONFIG_SCSI_DEBUG
> From: /home/pokybuild/yocto-worker/qemuarm-lsb/build/build/tmp/work-shared/qemuarm/kernel-source/.kernel-meta/configs/v4.19/standard/qemuarma15/features/scsi/scsi-debug.cfg
> Requested value:  CONFIG_SCSI_DEBUG=m
> Actual value:
>
> No reference to SCSI_DEBUG found
> """
>
> please? :) We're fairly warning free on the autobuilder now so this one sticks out badly!
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/804
>
> (its qemuarm with poky-lsb)
>
> Cheers,
>
> Richard
>
>
>
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

