Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A34B7DAF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 17:03:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z24so11930425wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ffLREhw4/A/9jbYZtOegmpyAkhYUwetBIxcFbpYHANQ=;
	b=KKJiw4yvhRG4OUEZBYW9nqM+cysyTWEdY6iofh8cRErJ7sG+fber+r6XZBQjSEFHoo
	9/0FbrxyMqVX1nbO3ZzUqdwpP5S7+Kwpu4IZgZOul+mUOk9H6IbVK743N+ALCk4LJv6i
	wkMo3sN7bgtYy5oSdpZxBNnuex91cgAuuUuws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ffLREhw4/A/9jbYZtOegmpyAkhYUwetBIxcFbpYHANQ=;
	b=YMj/IqDrUoACJscPCB7TJMduDwi9ARMYXMvIEa3ojp23En9HbBMJfDcnMQ1yzs2hLl
	Paz7pSYpzcFOVynkAKSteCZZl15GfGNRnz6PqkURVYbiHBgCKVdgfG3T0LiPmYQUkRAd
	gG44TqBhvyVzBGpZSSTuzUXf6lLh1KVpGABCEH6fayx7iA5NrNONxat9iNyTdcnetmxJ
	7DTlIg+REssfRbN+u6bEbLsSOTmrpl2xP+jvOQQjoA5etj9FoOq0LeafUDGHqRkuVdHQ
	w/GwKXt+HRr15QgOjYNR5XDTb7yLUiwg3z3WGUVFAeSoL/yiZev8GW6jgG7/De9HPOUf
	javQ==
X-Gm-Message-State: APjAAAWbLFGlec/3VJ2TxRAnzhhPZ2ztuFCuGnR9Qy0ivwgt3biFWa9o
	KDaKJSr6wNAsuBGojybxFUPsQQ==
X-Google-Smtp-Source: APXvYqyr6jQOt6TrDqrLHHRajTLvpfApSy69NXOEDva2klnKQT8CwL1v33OFe1NpIwn1KUo5c6yqVg==
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr11799897wme.16.1555088609157; 
	Fri, 12 Apr 2019 10:03:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z84sm10891667wmg.24.2019.04.12.10.03.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Apr 2019 10:03:28 -0700 (PDT)
Message-ID: <7e6be2702bcadf7c5e60fec0dcc668a5ffd881f4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 12 Apr 2019 18:03:27 +0100
In-Reply-To: <acc766373fca400587d0d779dd9f2550@XBOX04.axis.com>
References: <20190403122626.18451-1-pkj@axis.com>
	<866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
	<4788506b5c7f4fb4a369916b5500c373@XBOX04.axis.com>
	<acc766373fca400587d0d779dd9f2550@XBOX04.axis.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Fri, 12 Apr 2019 17:03:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-12 at 15:51 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Peter
> > Kjellerstedt
> > Sent: den 4 april 2019 16:08
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>;
> > openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] useradd.bbclass: Make sure
> > users/groups
> > exist for package_write_* tasks
> > 
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: den 3 april 2019 14:48
> > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>;
> > > openembedded-
> > > core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH] useradd.bbclass: Make sure
> > > users/groups
> > > exist for package_write_* tasks
> > > 
> > > On Wed, 2019-04-03 at 14:26 +0200, Peter Kjellerstedt wrote:
> > > > If the populate_lic task and any of the package_write_* tasks
> > > > need to
> > > > run, but the package task can be restored from the sstate
> > > > cache, then
> > > > the fetch task, which is a dependency of populate_lic, will
> > > > wipe out
> > > > the RSS including any users/groups that have been created. This
> > > > results in that the package_write_* tasks are run without any
> > > > user/group information, which causes them to fallback to either
> > > > use
> > > > the root user for any unknown users/groups (rpm) or to use the
> > > > numeric
> > > > UIDs/GIDs (deb/ipk). Neither solution will yield correct
> > > > packages.
> > > > 
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > ---
> > > >  meta/classes/useradd.bbclass | 18 ++++++++++++------
> > > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/useradd.bbclass
> > > > b/meta/classes/useradd.bbclass
> > > > index 124becd082..e32315a1af 100644
> > > > --- a/meta/classes/useradd.bbclass
> > > > +++ b/meta/classes/useradd.bbclass
> > > > @@ -4,7 +4,7 @@ inherit useradd_base
> > > >  # target sysroot, and shadow -native and -sysroot provide the
> > > > utilities
> > > >  # and support files needed to add and modify user and group
> > > > accounts
> > > >  DEPENDS_append_class-target = " base-files shadow-native
> > > > shadow-sysroot shadow base-passwd"
> > > > -PACKAGE_WRITE_DEPS += "shadow-native"
> > > > +PACKAGE_WRITE_DEPS += "shadow-native shadow-sysroot base-
> > > > passwd"
> > > > 
> > > >  # This preinstall function can be run in four different
> > > > contexts:
> > > >  #
> > > > @@ -144,7 +144,10 @@ python useradd_sysroot_sstate () {
> > > >      task = d.getVar("BB_CURRENTTASK")
> > > >      if task == "package_setscene":
> > > >          bb.build.exec_func("useradd_sysroot", d)
> > > > -    elif task == "prepare_recipe_sysroot":
> > > > +    elif (task == "prepare_recipe_sysroot" or
> > > > +          task == "package_write_deb" or
> > > > +          task == "package_write_ipk" or
> > > > +          task == "package_write_rpm"):
> > > >          # Used to update this recipe's own sysroot so the
> > > > user/groups are available to do_install
> > > >          scriptfile =
> > > > d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
> > > >          bb.build.exec_func("useradd_sysroot", d)
> > > > @@ -161,13 +164,16 @@ python useradd_sysroot_sstate () {
> > > >          os.chmod(scriptfile, 0o755)
> > > >  }
> > > > 
> > > > -do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
> > > > -SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
> > > >  SYSROOTFUNC = ""
> > > > +SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
> > > > 
> > > > -SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
> > > > +do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
> > > > +do_package_write_deb[prefuncs] += "${SYSROOTFUNC}"
> > > > +do_package_write_ipk[prefuncs] += "${SYSROOTFUNC}"
> > > > +do_package_write_rpm[prefuncs] += "${SYSROOTFUNC}"
> > > > 
> > > > -SSTATEPREINSTFUNCS_append_class-target = "
> > > > useradd_sysroot_sstate"
> > > > +SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
> > > > +SSTATEPREINSTFUNCS += "${SYSROOTFUNC}"
> > > > 
> > > >  do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
> > > >  do_populate_sysroot_setscene[depends] +=
> > > > "${USERADDSETSCENEDEPS}"
> > > 
> > > This may be a bigger problem that just package_write_*.
> > > 
> > > This feels like a bad thing to do since there may be other tasks
> > > which
> > > also rely on the user information being present. This probably
> > > only
> > > fixes one corner case but there are likey others :(.
> > > 
> > > Possible solutions might be:
> > > 
> > > a) To wipe out all sstate tasks if we're rerunning do_fetch
> > 
> > How to do that? With some pointers I hope I can whip up a patch
> > to do this instead.
> 
> I would very much like to have a solution for this in Warrior. If 
> the solution provided by the patch above is not acceptable, I need 
> some help where to look for how to solve it by wiping out the 
> sstate tasks if do_fetch is being rerun.

Warrior rc1 is in the process of being built so its likely too late for
that. I am very nervous about changing key pieces of the core of the
system so close to release too which I admit is why this hasn't been a
top priority. If people haven't run into this and there aren't tests
for it, how big of an issue really is it?

I'm sorry but I don't know the answer to your question without spending
20 minutes looking at the code and trying to figure it out. I'm
struggling to find a spare 20 minutes at the moment :(. I know this
isn't the answer you want but it is what it is.

I really am totally slammed with some other issues going on which are
complicating things even more too.

Cheers,

Richard


