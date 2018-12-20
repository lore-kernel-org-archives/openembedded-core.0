Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 945D76B50A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:19:49 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d19so75986qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 17:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ymr5Lc9ZB+Emk5lU8mclfnEJTz27uHN3p+Q+Fy6ZOho=;
	b=ZkwPWYy9ZvIn+VDQI+MvlBdSBi/B1RkyiVPPUlz0biYNOji23D91+UrW1gaPGLK6tp
	563N0Jemp0hRXtf/2wLRXyLxUQ/gTDE0OY7d30Cst0GR2WVCgKsdATMegKkV5tV7nIUF
	Lv+rrBUwaoZf3qq0iozGkkvuWidYHYVg8p6GcyXkPE2vhx6XAnkblU1hmc7jO+fOjI1o
	0O/sc88zZRquN1APfdGyKq6AucO7AtWGeMR7KkOh5/6kQ1ELrx3tLoIc1I8q+nkTgwMT
	f0eLDBYNo5OZje4H7//aeUU8Q+PI/nJDeOVLTkKeN9/8gkCQ9e7KOCySOmKE7rmZvofb
	yJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ymr5Lc9ZB+Emk5lU8mclfnEJTz27uHN3p+Q+Fy6ZOho=;
	b=JzvdCXCpfjnjV3AMCJdL4drfqynF+71OKmHmC374QMgkcmLYL1pCQZZY1DUqWQx0cv
	ziMSM7eDQ4no2yhItGm1iX7teRC5cOKd/qfzF4uYY7kj6oSmidyy03WLSDTzh5zq05V5
	iI9vt7Tgs43tnokZXqL1EVd/Fr4EJtlV3ZyYEXpbv4XtkzMPRN+pyPxUwb4Ka8Ccg9vp
	eV7iB4lZ+G/+bTA3NvyXA9VEaJKnoYEDb6LHV0nNem9MKT6mR/oFmJ8fjNYTcg8rXiIU
	7/gQnaS+KhIfuDSh7EAJiDNfKXHkmqXZn0u2TtT2Oel9VcfElXXA9VYF58VDm7mYYvan
	Ltgg==
X-Gm-Message-State: AA+aEWaJ1Ax/aeIAhZwaq07ApfS7UAFlCEg6QZi5wPqf1vPWy2zDowrC
	UvJQDsVboBG0LuZ7S4SfQtupA73yltisic3DP/o=
X-Google-Smtp-Source: AFSGD/VMPPqL+yO1HrHdvs8ez7w9WBGgPQndduCQied9ji+I7DOqCb9tOHFJ+kw6yrEXcQ4vp3XW5yXEY3o7+PzkYQ8=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr23838747qvq.55.1545268790202; 
	Wed, 19 Dec 2018 17:19:50 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
In-Reply-To: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 17:19:24 -0800
Message-ID: <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>,
	James Feist <james.feist@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 01:19:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2018 at 5:07 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 19 Dec 2018 at 00:42, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> > I wonder if this is something they would be interested in upstream.  I=
=E2=80=99ve copied
> > the oe-core mailing list for possible comment.
>
> Thanks for forwarding this to us.  The class is very simple and just does=
:
>
> PACKAGECONFIG_CONFARGS +=3D " AR=3D${TARGET_PREFIX}gcc-ar \
> RANLIB=3D${TARGET_PREFIX}gcc-ranlib"
>
> That's quite an abuse of PACKAGECONFIG_CONFARGS, I'd recommend just
> setting AR and RANLIB directly in the class, they'll override the
> defaults in bitbake.conf.
>
> That however leads to the question of should we just change the
> defaults? Does anything break if we use gcc-ar instead of ar?

Dont think that is a good idea in general since gcc-ar is a wrapper
around normal ar
passing --plugin=3D/path/to/lto/plugin/so and that may not be right
thing to do always.

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

