Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B73807EF24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:05:45 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k18so2201081ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xqAorZ9VGn9r1iEMgn/Ss8pJG+/nPRT0XDBXfS8QjD4=;
	b=gyWXCV1NF6MjpSMF5/GS29nM+/Nd8NwDxzD6uNhPaCHu5UPU4iP9d1apRMtrRQz4wN
	VAzu2h+Zbq788ThqcQccpdxA56SilcAz55/aFBR+FNyOqOtqFY+SEc9mJh6GAsA6ybRb
	3ter0N9rbE6JONkegeoLfSxu1kIXRVoZROBkuXS697ElPaLWc8FnaLjSP2kKP5P8ABe7
	ALHPj91rtsbyzcPZpHPN4PftTd1n60WfL/6CyoNcUgMlFUFyFpu4ZmfNcDWWS4ZzHq+k
	r4WJxZkCw5PoxNfK2KXMiLdw5x3Xe+yxOFWsm+c+P6fiQtfV/WFMVH5Zl2zC2orfHIHP
	VJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xqAorZ9VGn9r1iEMgn/Ss8pJG+/nPRT0XDBXfS8QjD4=;
	b=JCNQ5lUJPsky4+/FVvCyZivNCG8MEWXvfjET60yGg26l5kguBoxdsvAC2UgEPlegDQ
	tLbhD/dOCz91CwpBuvDFK6LHyCEZf7njtZE+eDaOR3RVb77oxyaFCht0oD3+t5U0OuRD
	7K4DYG/M0QwsSEtiBgetLQL4gUnywB19xRu+UnIkqidjJnEsy6GRkVmIDwTCGkSivDVu
	8d/zbTbtdUJ1ZUfQuwVrQGBAft4Mt/AcaDCV1D7iDXnOotrI4qf/z8s70/eKGMiDxcLl
	X+9H60eJmH8boCzey0HFXRyl/8xWE/BchNfYt31KOBzJL+nrqjMM0vKvZbfOucqREnB4
	neFQ==
X-Gm-Message-State: APjAAAWLNkt6pmV7u00zX8y+Gt41/b3FyYbyZw1f5MzplTLAjsXDDH1d
	XflibDAZfvcabOQNslj5pAZLXQvIpgjBGLU3rh0=
X-Google-Smtp-Source: APXvYqwEUCH+/FwrcFnSimrqO3NmwJvInHkldAgdnnZjrtnuQxvY8XNu50SEjoyOmslmObvithO0SGjnMl6zNUjHsVQ=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr17514329ljj.185.1562767545903; 
	Wed, 10 Jul 2019 07:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <e5194d279637f6cb6aaa5e5fd1d2f6657aba522d.camel@linuxfoundation.org>
	<CADkTA4Pd6hst7zJAcYafa_61h5OoWtHH=O6frawnw4XOEHLVzQ@mail.gmail.com>
	<443f1b7d40c32f1645c448cc778cb682b3b2446a.camel@linuxfoundation.org>
In-Reply-To: <443f1b7d40c32f1645c448cc778cb682b3b2446a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 10:05:34 -0400
Message-ID: <CADkTA4M2o64KTOQN0mvV+SES5W9A66graYe1-X_FhWMN-suPVQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Jul 2019 14:05:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 10, 2019 at 9:37 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-07-10 at 08:57 -0400, Bruce Ashfield wrote:
> > That should have been covered in this patch I sent:
> >
> > commit 95e9df0b5cb5179271c78499dc60c3c0df0a5622
> > Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Date:   Fri Jul 5 11:15:37 2019 -0400
> >
> >     linux-yocto/4.19: update to 4.19.57 and -rt22
> >
> >     Updating the linux-yocto 4.19 recipe to the latest -stable and
> > -rt
> >     releases.
> >
> >     We also integrate a configuration change to support ptests on
> > scsci
> >     targets:
> >
> >       scsi-debug: include core scsi support for standalone inclusion
> >
> >     The -stable changes comprise the following commits:
> > ---
> >
> > Is that applied and yet we are still seeing the warning ?
>
> No, I think I've missed some patches, which would explain a few things.
> I'll go digging....

I relayed them through gmail .. which normally works, but it shows up
in my mail as non-obviously gone to the list when I both relay via
gmail and read it in gmail.

So let me know if they have in fact gone missing and I'll resend.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

