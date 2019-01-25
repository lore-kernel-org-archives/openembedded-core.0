Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9C57C2DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 15:37:56 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id u16so8862099otk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 07:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=nQJTBAJMA/eWmk4ACqjSRBBvVbGMjF62ff40mDmFAA4=;
	b=OorHCu1eYyw9vNbc/IVpa97kA18vTLwM0QmJfk2UhEPQ2kOsoNAnCkd0dv0fX+gAWW
	yVsMvPr+T0BndenNSFXAH1BgFzZ7tOPYi63u7CsfuK8wm7wPupuL/IjfnUDtH9e6qt91
	AabqaQjbzEXRXZcOP82UyNq4Pxq+LPv1U4qG/h7nSY9plsMTgwnE0ZJPu4uDZz1eUFXI
	HgkZk3nQrBmmhyS52VC7BtDykUjYvG+u3xO4vI1YDwKiI4NphnVuYQCvt0LHv80nn17d
	3QoflDlBHvkKiQNXEfYz9uv5r4GI9MFon9VHk5E2P3Uv8J65cFKirbiq4JhvuQCPos0X
	IViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nQJTBAJMA/eWmk4ACqjSRBBvVbGMjF62ff40mDmFAA4=;
	b=m6rpKoADxZ1D4XfmrwTlAKZWpB0g51YdgpAV6D9GqYIt4cbXfYfrzSU+MFY84amArN
	omZZLO2mKd+vKMvdzgmPGrfwb2DfzJrHC/OtFknKPWTbA0IswiMxcMq8YLIjlBCxeJy5
	8Y/EdyiE5DMZbvX16yW/V6sQXURHY/1lYLiac6uVv7qf5bbybJfnu+pgf9ek7V+c1BMB
	l5XimsiEkg9jXbLcnyCmNzOuFznf18DXQ4GhisaxjOtuDEtH1wQCr6cqTPWYiuHuzW55
	h5Cya9tOrpjnbUMkfBWnhwDqLozB9mbu7UZnLyzA5ZH1EcYiKhZz5fKHdZKeYIcrsyKI
	Vwsg==
X-Gm-Message-State: AJcUukeSDPcG3YogatjoGukQt94D2rjeZ2yWjNl3/mL4E8W7S7JQyc7w
	jZ/D+HqtjThsKAzi2CAZbUw=
X-Google-Smtp-Source: ALg8bN5Hrfcj7AXVl/cvzRpq/sBTmhiQHlDTpQzObUn9p4v6PL2BCZAXj6CL3RYL8OxCvdCSkYU8Ug==
X-Received: by 2002:a9d:6c44:: with SMTP id g4mr7582691otq.368.1548430677179; 
	Fri, 25 Jan 2019 07:37:57 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	z9sm1345298oiz.21.2019.01.25.07.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 07:37:56 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Jan 2019 09:37:55 -0600
In-Reply-To: <CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
	<CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 15:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-25 at 13:13 +0100, Alexander Kanavin wrote:
> There is a similar issue in multilib for target packages (a warning
> because qemu usermode support is missing):
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/214/steps/7/logs/warnings
> 
> I'm as well not sure how to handle this:
> 1. Keep these two warnings as warnings so users see them in their
> local builds, but
>  add some kind of string pattern to AB so it excludes missing qemu
> support and missing wine support warnings.
> 
> 2. Turn them into notes, which means they will go to the logs only,
> and users are not going to see them ever. On the other hand, the
> postinsts tend to
> create things like font caches and similar, which should not
> generally
> be needed at compile time (which is what SDKs are for).
> 
> I'm leaning towards option two.

I was leaning toward keeping them warnings and then suppressing them in
the cases where we know they don't work and are unnecessary (perhaps
with a variable like POSTINST_INTERCEPT_${PN} = "0" ?)

That way if a user enables a package where it's not going to run and we
haven't previously evaluated it to be OK, they will at least see the
warning. I naively think this might help reduce the number of bugs
filed, or at least make them easier to triage :)


> 
> Alex
> 
> On Fri, 25 Jan 2019 at 00:18, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > 
> > 
> > On Thu, Jan 24, 2019, 4:43 PM Richard Purdie <
> > richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-01-23 at 17:17 +0100, Alexander Kanavin wrote:
> > > > The few cases where they failed should be now all fixed. The
> > > > only allowed
> > > > exception is when building mingw32 SDKs, as there is currently
> > > > no support for running
> > > > postinst_intercepts through wine.
> > > > 
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  meta/lib/oe/package_manager.py | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/lib/oe/package_manager.py
> > > > b/meta/lib/oe/package_manager.py
> > > > index 1087144d47f..f26f597d03d 100644
> > > > --- a/meta/lib/oe/package_manager.py
> > > > +++ b/meta/lib/oe/package_manager.py
> > > > @@ -439,6 +439,11 @@ class PackageManager(object,
> > > > metaclass=ABCMeta):
> > > >                  self._postpone_to_first_boot(script_full)
> > > >                  continue
> > > > 
> > > > +            if populate_sdk == 'host' and
> > > > self.d.getVar('SDK_OS') == 'mingw32':
> > > > +                bb.warn("The postinstall intercept hook '%s'
> > > > could not be executed due to missing wine support, details in
> > > > %s/log.do_%s"
> > > > +                                % (script, self.d.getVar('T'),
> > > > self.d.getVar('BB_CURRENTTASK')))
> > > > +                continue
> > > > +
> > > >              bb.note("> Executing %s intercept ..." % script)
> > > > 
> > > >              try:
> > > > @@ -447,7 +452,7 @@ class PackageManager(object,
> > > > metaclass=ABCMeta):
> > > >              except subprocess.CalledProcessError as e:
> > > >                  bb.note("Exit code %d. Output:\n%s" %
> > > > (e.returncode, e.output.decode("utf-8")))
> > > >                  if populate_sdk == 'host':
> > > > -                    bb.warn("The postinstall intercept hook
> > > > '%s' failed, details in %s/log.do_%s" % (script,
> > > > self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
> > > > +                    bb.fatal("The postinstall intercept hook
> > > > '%s' failed, details in %s/log.do_%s" % (script,
> > > > self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
> > > >                  elif populate_sdk == 'target':
> > > >                      if "qemuwrapper: qemu usermode is not
> > > > supported" in e.output.decode("utf-8"):
> > > >                          bb.warn("The postinstall intercept
> > > > hook '%s' could not be executed due to missing qemu usermode
> > > > support, details in %s/log.do_%s"
> > > 
> > > I'm ok with this but could we change the bb.warn to something
> > > less
> > > important like a note?
> > > 
> > > The reason I say this is that I'd like to get the autobuilder to
> > > the
> > > point where its warning free. This warning is the only reason
> > > meta-
> > > mingw shows warnings now. Either we fix them or if we can't, they
> > > probably aren't warnings.
> > > 
> > > What should we do here?
> > > 
> > > (also cc'd Joshua)
> > 
> > I think the one that fails currently is updating the GIO module
> > cache. I'm not sure if this is even necessary for mingw (my guess
> > is no, since this has never worked and no one has complained). We
> > probably just need to disable it in mingw, but when I looked very
> > briefly a while ago, I didn't see a straight forward way of doing
> > that.
> > 
> > See https://bugzilla.yoctoproject.org/show_bug.cgi?id=12962
> > 
> > > Cheers,
> > > 
> > > Richard
> > > 
-- 
Joshua Watt <JPEWhacker@gmail.com>


