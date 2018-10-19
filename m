Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 666B1745D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 10:51:39 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v69-v6so26483735oif.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N9Bck95fQv/Lesu9YNnOJBwzrQmaz1kCCXTLF5nlcgU=;
	b=oJhVBYfW5gPnWUJbR7+aV9dIAZIc+VFGUHu+cOFKZ7eV3FtXuLR43SDueJ9zH3ACOb
	QIYwVOxx/TcDUHAjm04xyjrKdhpv79s3Pbj/rYxtcqMWuHE2gXOyM/v3yRrJwOhe/ml9
	AKS22nAyn1xwxrTchB9B64NfVYw9f6QD9bW8KG0bzhl1I4Zn3ocL4G8UVcfzGU8twi2j
	7+4Lr8toqPnL0cqdhxGPNKU+TejxhrW8I9ehyAsTmhdpDvtfzoO1PTZabzbfJFEP4RXn
	L05Mq/PLDw49VPQPBvXTrJgXVypb5C+WVdXdI0y2l5BH7uK/rBCDZ2dHEt9CakWhIy7U
	KaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N9Bck95fQv/Lesu9YNnOJBwzrQmaz1kCCXTLF5nlcgU=;
	b=V34mvKN1VBqhOg8FtiwSAaOPzxaEGYyDsH4MdItypL/QKcya9/Gouy53BQ8DFF8Tsk
	UCz9YoqunUfs4sM/nmfEvQkU8cDGYQxd98XRXpXsTmU5jw4ngRp8/XvwEVKRfWWlYoRM
	K6TkheC3I4Aj/x0bnLg4hAE67FaQmNciMyMWK+6vIgufiCyjYIMGqAaCegu9Pu8b2ZWU
	422DS1foGe9RA/EpDAGpMrSzJU3TIhHW6TeNanZPQIz5t0aFyHyJJwQZQK0WyhoqhKar
	AmnIxNorCf+Dj7B4JpPotoY3if4Q/YKdsdjWxF3QboDzXLDEqZ58ECLIx6YNh4d0NEZv
	DNlQ==
X-Gm-Message-State: ABuFfogF3ehcnEOOusiAZWaqYGionYEVvBi/fJr20f6k4eudbtb+CYeb
	t+CzK33VrZPO1M8cjwkDdSQSaBRhTydQnnxX+5fXxYqy
X-Google-Smtp-Source: ACcGV61uLOYHJMBul479k9rkvUOrEmakSQhC5klg0SGKDWZytbnbfH1BIyYBRv+2JGv2Da0GTf/jNp2aZmGd/yW+CN0=
X-Received: by 2002:aca:f0d6:: with SMTP id
	o205-v6mr17241317oih.138.1539946300030; 
	Fri, 19 Oct 2018 03:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-4-mark.hatle@windriver.com>
	<CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
	<f9c00b0d-6006-1e02-3fa3-a1846a610840@windriver.com>
In-Reply-To: <f9c00b0d-6006-1e02-3fa3-a1846a610840@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Oct 2018 11:51:27 +0100
Message-ID: <CAJTo0LZsk7V9tSk6APAMOzS_3fkU56bk7V4KqiZW_ieQ80i9GA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Fri, 19 Oct 2018 10:51:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Oct 2018 at 16:39, Mark Hatle <mark.hatle@windriver.com> wrote:
> > Two questions:
> > 1) does qemu still need fbdev or does virtio/drm work now?  (iirc, we
> > still have a crippled qemu here)
> > 2) Can this be overridden in a config file instead
>
> I did not understand how to do this.  The alternative I see then is to make this
> a machine_arch package.. since the configuration can change?
>
> (I'm not very familiar with this part of the system.)

Looks like Weston supports this in the config file:

[core]
backend = fbdev-backend.so

Should be easy enough to ship a weston.ini for qemu machines.

Ross

