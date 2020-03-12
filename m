Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E823561B02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 12:39:28 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b18so2643170edu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TDYnB4rPqoDspn0OT3+36PTcJGKTTbp00C1yaij1e78=;
	b=gOm10SVRt5/w9M4jzoIkamP5rLm4d/siWrYFeJl0pcmiXmIEWtTPa3QjkYttKwCW+X
	oEZB8mUE6JK3waaCQCy/kh0iDqp3sOm13mSdTxUENz9LDGs5EvxC52YCSgz2ikzYQXVA
	eh8vbMKaxzGE5u3kWAeFqOiBu5jYbGJMZ18GmIiyMrpEf9DKLIaCDIHebjxI0Utc468E
	GEhwOy1AL5HiDjOTmn7wkcqTIS9J3sIV1jDNvCGkE/m5vMlwKJPoPI9kbg9zHqYDJxT/
	m1HdRvcFMOsOnQTa/NdXBhGZY7db6AwfYhe00tlJRLc2JrUyGGcCpTbbmVpHdfyOpOFy
	VpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TDYnB4rPqoDspn0OT3+36PTcJGKTTbp00C1yaij1e78=;
	b=RQFssxiHo9tL6EEB2Ft5VvWuLUn3WdMCgMlrFXeNSwn2Qnc/ux9wqg0JE4xYCmc12e
	rayQC4vej/dxKuPrc+T1bJ0AZHkjsEJzdwE/rt8Z+jzJDGFrYLJGMNtFn0X7gR4MYHV7
	Ej53SyqX7OxoPgt0Un6pL4i//1ey7qTArRUlAGLqIpQZRVB3po6g2uYM/fUU9cCGioqL
	I/rAXoI2czdAqLdBMKowPtcvkKlTXYfX5qCS8KMGYhrP5CEqen1f3uc8PV0CP3hQc6Jc
	YbzNKsFRHiDuE2+eDo91T45fxQymBx5Nt+QXsEztRZRjui8OrGOuBKIpb1KkdmZ18klQ
	V1+w==
X-Gm-Message-State: ANhLgQ0prxK2ryeUruP6A6SJF8eNIcW8fQoAFMqNAmnjEVoNQ/z4caTm
	OfXUT28pDXxS+ipmAF17zgA8E+h+n17Du+W9o+rQqcXF
X-Google-Smtp-Source: ADFU+vu3lFCtLXqyeMa+Uq+a7/3YlpYjRWc8T83WTzWJzw5eiINVm9QdHNOzFBicKXI+lrbPxNjsA2WAjkSifh4/feQ=
X-Received: by 2002:aa7:c842:: with SMTP id g2mr7877716edt.234.1584016769395; 
	Thu, 12 Mar 2020 05:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <b1aa0d35-35bb-8043-fdd2-d57261eeb714@cn.fujitsu.com>
	<CADkTA4NOf2MXDkdta6o4MbEVTehSF+vY_D8ez53HjBgSzoDG6w@mail.gmail.com>
	<c82b8e9e-28e7-b703-3ffc-06e0c06e5458@cn.fujitsu.com>
In-Reply-To: <c82b8e9e-28e7-b703-3ffc-06e0c06e5458@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Mar 2020 08:39:18 -0400
Message-ID: <CADkTA4NXZ2Nyk8UWNtZ3v_Nc_xtfzt0-dpUBhubYs3ccRqadWg@mail.gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: CVE related consulting on linux-yocto on zeus branch
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
X-List-Received-Date: Thu, 12 Mar 2020 12:39:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 2:28 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Our team plans to submit CVE-related patches that are not included in
> -stable, but we found that the current version of the linux-yocto recipe
> is lower than the linux-yocto git repository. On which version should we
> make the patch.

Send patches against the latest linux-yocto kernel tree, following the
upstream kernel process. Also, consider nominating the patches for
upstream -stable as well (but we can still integrate them to
linux-yocto first).

I can generate SRCREV bumps for the actual recipes, for the stable
branches, after that.

Cheers,

Bruce

>
> On 3/11/20 8:36 PM, Bruce Ashfield wrote:
> > On Wed, Mar 11, 2020 at 2:02 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
> >>
> >> Hello,
> >>
> >>
> >> our team is currently working on CVE-related work. I would like to ask
> >> if the zeus branch of yocto has an update plan for linux-yocto in the
> >> near future. If not, can we submit a CVE-related patch for the
> >> linux-yocto of the zeus branch.
> > If it is part of -stable, then yes, it will be integrated into any of
> > the active upstream kernels. If it is in 5.2, we also have a -stable
> > process for those kernels as well.
> >
> > If it doesn't fall into those categories, then send any patches
> > (against the kernel itself) to the linux-yocto mailing list, do not
> > send them as patches to the linux-yocto recipe itself.
> >
> > Cheers,
> >
> > Bruce
> >
> >>    --
> >> Best Regards!
> >> Zang Ruochen
> >>
> >>
> >>
> >
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

