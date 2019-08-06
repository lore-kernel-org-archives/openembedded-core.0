Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id B9BC37F33B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 12:51:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id s3so78059031wms.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ko1HKBD/NJqcFqurze32Kp016oPxbK3vVROCWHTNxR0=;
	b=EiIRTIXPrq/imkMNWQtGdNw1lZft9FQRhEFod74C/Hmqs3GF0VXsp3ENLhymf0enm1
	wf1SBZOe2mftgjYBkFnaJOYX4BreUErXw7IBzLnbzoy1VAWL17boV/QUXDlXTPJPr9wQ
	dQpPq/s9M/mxjK1HqF7KhHi4ZjvDwXghBrdKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ko1HKBD/NJqcFqurze32Kp016oPxbK3vVROCWHTNxR0=;
	b=Gtat0n3rZuZg7XHsgdIVrgGxUmmkyejdW2XqwyfnxcL32aKkABUteNliZPpKmCxbv2
	X7MoMHUq6F1uNPPOj2b23DEgcrw1NxnAr69ZoI5d9M9ZJxbTQ45kgtN13iRk+QJU+FAe
	DR0RL8umaBOTGAfjTOLoY5DD1KJjxIVMXgsDCGXhKXK+BJdZVrAWFBQra4IMs3GbCxe5
	XMqhJ6uRhinaofkF5Ku8lv6vvaATp9WfYDUJDyLHvXXXyNvaaZx2AEUWV62zovidSW/1
	kxOa/SbT81aXEmVyQpo6srWd5Y5q93ZJrkmae3C4PI6rya8wOzL4U6iHTrXq+hTy3X3F
	sfvA==
X-Gm-Message-State: APjAAAVOfCW39pVF5KXQd7u/S7M+U/tXQ0iWeOdS73oY5BoWMusivxiw
	BptnsZxMZOWJNtXjzNhgn/Vukg==
X-Google-Smtp-Source: APXvYqw8OqJPx+EzFJeGcBsnJjDqoSqa/IGIolNU3hAMWOiKSllVirEIKI+S+vn+m4GdHyBSPDVraw==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr4713222wmc.170.1565095874315; 
	Tue, 06 Aug 2019 05:51:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v23sm78595198wmj.32.2019.08.06.05.51.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 05:51:13 -0700 (PDT)
Message-ID: <b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Tue, 06 Aug 2019 13:51:12 +0100
In-Reply-To: <CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 12:51:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 14:27 +0200, Alexander Kanavin wrote:
> Could be, yes. I will next try to untangle the file-rdeps and see why
> it fails if bash hasn't been packaged yet, and passes if it has. I
> have reproduced this on thud, so this is an old problem.
> 
> Alex
> 
> 
> On Tue, 6 Aug 2019 at 14:16, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Maybe another case of 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217#c6 ?
> > 
> > On Tue, Aug 6, 2019 at 1:57 PM Alexander Kanavin <
> > alex.kanavin@gmail.com> wrote:
> > > On Tue, 6 Aug 2019 at 13:18, Ross Burton <ross.burton@intel.com>
> > > wrote:
> > > > > Note that bash-completion files are not executable, and we do
> > > > not 
> > > > > observe this with other recipes. We might have a false
> > > > positive here - 
> > > > > can you look at the actual contents of the package please and
> > > > see why 
> > > > > _qa thinks it needs /bin/bash?
> > > > 
> > > > Also I don't see this with master.  Do you have some local
> > > > patches or QA 
> > > > changes?
> > > 
> > > Actually there is a determinism problem here. I have reproduced
> > > it with master, and the error happens if and only if bash's
> > > do_package task has not yet run. If it has already run, then the
> > > package_qa for stress-ng passes fine. I'll poke at it to see if
> > > it's a recent issue.

We now filter the pkgdata to the things a recipe can see in its
dependencies after:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=99206cb7b41be7a124ea8339bc891077f02128a2

Does that help? If not, is it because some code isn't using the
filtered copy? Or could we use this technique somewhere else?

I've not looked at the underlying issues enough to tell which code is
actually triggering it but that kind of approach should help with this
kind of problem and at least make it deterministic...

Cheers,

Richard


