Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id C96C47BF11
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 12:47:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y139so3974001wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 04:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lfJkOXjwdtYyZV/8SJiTGLxelOBJ/FkSF3SmmQyaSPw=;
	b=ZCqjHizm2oLZECo21YxQLt/SU4FJcntvb5BJVojWXjGhyrqRTe2nTvI2uNxvYRLnGV
	h3Z9sR/fjqO/Cfji0SWoWaHbbhVF946BFIFR9oY7VfXMYbifykDN8Q38SOIU1gE8GEc5
	9z4AUQTJd0+A8CDwotu+9yYPd2VRImm0w2pS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lfJkOXjwdtYyZV/8SJiTGLxelOBJ/FkSF3SmmQyaSPw=;
	b=XAHxOPmLqlTE4PoSuVmt5OjP8liDAhWcM9v8iMamA8HSdCmS0+W4+dHdq1ZB9vgDgI
	yh+nxb1F72PwKn2gR0L4K4DBua3v9tO4I6Gt/mlsJ05qc7G/GMc3a/Jpdp2LbrvFe2yP
	ZenNSTT9Yre1rKUCDwmiylpFAiwvo7O4FuAkrG/41X374dRtlla/+T++/t1NT2aNdG/j
	EaEds2tqnY5H7wnjZhCf07CqY9xdZe/VB9J2QuPIWzAspVe9YtRiRH6hU8lD3dmXh/tQ
	bEXUX7glo0ce999vbH85Dv9T0Dz6F2XKWz0DHLgZPOJ0KjoohOKNZAGPOHMtt6h0O6sr
	jpnQ==
X-Gm-Message-State: AJcUukekxBP3nC+B1IW3Oki9DFnZwkbbR8+1snaMh9//F39hT4LivsEV
	zZhQiaNZploXJ8Ssq57R7gD8QA==
X-Google-Smtp-Source: ALg8bN67UBTU/FA8UOyDhkFCNU9rJ/LboUmC9DjkheJZYO7MNGe6xRZzQ0dSDEM7jQttsZcjSACwYg==
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr1618763wmh.12.1546951631476; 
	Tue, 08 Jan 2019 04:47:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i192sm9256875wmg.7.2019.01.08.04.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Jan 2019 04:47:10 -0800 (PST)
Message-ID: <6af27248c02eb709ad45c6cbfbe7e464b80cd2db.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 08 Jan 2019 12:47:09 +0000
In-Reply-To: <CAJTo0Lbj10QLG-AH6YYOua1NtZfcPGKi0swnKR444bPjBrJZEQ@mail.gmail.com>
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
	<CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
	<7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
	<CAJTo0Lbj10QLG-AH6YYOua1NtZfcPGKi0swnKR444bPjBrJZEQ@mail.gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 12:47:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-08 at 12:45 +0000, Burton, Ross wrote:
> On Tue, 8 Jan 2019 at 12:45, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-01-08 at 12:40 +0000, Burton, Ross wrote:
> > > On Tue, 8 Jan 2019 at 09:06, Chen Qi <Qi.Chen@windriver.com>
> > > wrote:
> > > >         if [ "${hostname}" ]; then
> > > >                 echo ${hostname} > ${D}${sysconfdir}/hostname
> > > > +               echo "127.0.1.1 ${hostname}" >>
> > > > ${D}${sysconfdir}/hosts
> > > >         fi
> > > 
> > > Instead of appending to the file, can you put a marker on the
> > > 127.0.0.1 line and replace it inline?
> > 
> > Not so good if hostname isn't set?
> 
> hostname = "${MACHINE}"
> 
> Hostname is always set. :)

Its the kind of thing people likely bbappend and change, or set from
overrides. Which was one of the reasons I'm nervous about moving hosts
to a different package in the first place...

Cheers,

RIchard


