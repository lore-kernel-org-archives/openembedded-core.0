Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3DF60616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:54:14 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q89so5608031lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=cdjGy8ztoJ3aAa59mHIvt0VKQoO4lS0ZjfVOq24kArA=;
	b=QcYGf2o2HaZe8s0huGs3j7MsnPI4lFIbdtYXkyjwAmGgbuejaKRPxFsIcetsGpdlUs
	//2hLDrJx2ry841xlOm5aBgMN71KVllvpErvM2UEvp8K6xLvKK/NVHh/nlDkrFg4PlT1
	AxlT+PFu+XUxXPZDZFd8Z04xfjABrPCHvpehRxLKnFzsCNiTJY7KqzRe9mpkZNgX6jui
	9wZoSBaCOqWdaiqLAf6D43ibqFONIH8ej2E2AJqewZrnCf9zQjzMyCOI9PYoO5sphyQH
	AOOdwZ77PBHnl4AoB4Xau30Kv/YNv2NLagnVDU4gIsZUFXuUIn5tZ7CtZ16cbALzTpcr
	nj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=cdjGy8ztoJ3aAa59mHIvt0VKQoO4lS0ZjfVOq24kArA=;
	b=GjpoMa493e/H7up4BNlQD/GYUIaQqoVNLDHmyP4hxShJPFjAJSEEUMOsnU0Z5Sjv9k
	b2OYoOC+RnRwYAim9ZanYYawdOoIWrKmA8mhv+RocoENqy26hziA+7gvvqwAAAJXIiaV
	HJEaJYPLznqzDVykbJoybI53q4C4TbUjn6RyHSN1yzPx015RZ/Xx98SAQcc4kRnbtiMD
	3jVjj2I4kB4GEUMI1+EMY2ULAUaSwiwqgaKj87UYW0/5hjbDD6vJ9uWlMAd0C0v2aVtF
	xPkp40zR8UUFIABvV8Dy0iwDldATFidi1cHzMI3gNnHciTqrvPV9Lh2NTCY4k5OSpFgg
	fchQ==
X-Gm-Message-State: AIkVDXKyHUW0JoQp+w6mzx+nP1AKG+goP+tgSWiHxeQqokk7CtmqGzdgnnXTE/7IzMf+EA==
X-Received: by 10.46.6.1 with SMTP id 1mr7525613ljg.34.1484312054769;
	Fri, 13 Jan 2017 04:54:14 -0800 (PST)
Received: from [192.168.1.122] (81-230-13-64-no94.tbcn.telia.com.
	[81.230.13.64]) by smtp.googlemail.com with ESMTPSA id
	96sm3817177lfp.18.2017.01.13.04.54.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 04:54:13 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
	<CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
	<314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
	<CADkTA4NSnLvGX8FrFxcKXhWMDeCpn3ez=x8iraDL+RQqzZTGtw@mail.gmail.com>
	<CADQUhkSLe=KPv660z1Bjmvcth5cP2MapzyfmLLn_mKGCkQuVeA@mail.gmail.com>
	<CADkTA4NP10emxMOfnTHn6nKFv-W1=+KnJGkfmZ8t1Q5+hJbpYw@mail.gmail.com>
From: Ola Redell <ola.redell@gmail.com>
Message-ID: <ef4f3de9-8172-b30d-2f3d-2478f1f1953e@gmail.com>
Date: Fri, 13 Jan 2017 13:54:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NP10emxMOfnTHn6nKFv-W1=+KnJGkfmZ8t1Q5+hJbpYw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Fri, 13 Jan 2017 12:54:15 -0000
Content-Type: multipart/alternative;
	boundary="------------AFCCBF637E34DC51DC4C6F61"

--------------AFCCBF637E34DC51DC4C6F61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2017 02:44 PM, Bruce Ashfield wrote:
>
>
> Interesting. I think we've probably fallen off the radar of the casual 
> reader that may have
> more bitbake knowledge to explain why the virtual package 
> (kernel-modules) provides
> works with the same name and different versions, while a package with 
> the version postfix
> that rprovides the same name doesn't work with different versions.
>
I think I have a clue on this so let me try to straight it out as much 
as I can in a somewhat more structured manner than my earlier attempt, 
and hopefully with a readable formatting this time... I'll do a 
background and overview too to let new readers in. I am sorry about this 
being lengthy. I'll post a patch v4 based on the end conclusion.

Anyone with a better knowledge in package management than me (that means 
very many of you) might want to fill in or correct the below. And Bruce, 
I kept #1 and #3 separate since I see quite a difference between "meta 
packages" and "virtual packages".

In my current system I use deb packages and apt-get as package manager 
so the discussion below is apt-get centric. The *assumption* here is 
that package managers in general behave in a similar way to apt-get, 
when it comes to the details below.


Background

My use case is that I want a kernel module packaging that allows me to 
upgrade my kernel and kernel modules using a package manager such as 
apt-get without the kernel modules for the older kernel being removed. 
When I perform an upgrade today (either dist-upgrade or upgrade on the 
package "kernel-modules") the old modules are removed. My motivation is 
that I want to be able to fall back to the older kernel and its modules 
if necessary.

The "kernel-modules" package is called a "meta package" in the code. 
Even though it is an empty package (therefore "meta"), it is a package 
in its own right with a package version based on the kernel version used 
to build it. It has dependencies to all kernel module packages (e.g. 
kernel-module-foo) that are built by bitbake. Hence when the 
"kernel-modules" package is installed or upgraded it pulls in all those 
modules that it depends on.

Side note: If apt-get finds many "kernel-modules" packages available it 
simply picks the one with the latest version (unless given a specific 
version). So having many "meta packages" of different versions available 
at the same time is not a problem - apt-get can distinguish between them.

Today, the kernel module packages like kernel-module-foo are named the 
same regardless of what kernel they belong to. Hence kernel-module-foo 
for kernel-x is the same package as kernel-module-foo for kernel-y, just 
with another version. Therefore, when the "kernel-modules" package is 
upgraded, the new version of kernel-module-foo is installed while the 
older version is removed (you cannot have two versions of the same 
package installed at once). That is the problem.


Alternative solutions

My original suggestion (#0) was to just postfix the kernel module 
package names with a kernel version string (creating 
kernel-module-foo-<kversion>) just like what is done with the kernel 
itself already today. Note that this <kversion> has very little to do 
with the actual version of the package. <kversion> is just 
KERNEL_VERSION, nothing else. This solves my use case but causes other 
problems as Bruce pointed out. Existing recipes with dependencies to 
kernel-module-foo will break, and even worse, will have to be updated 
for every new kernel version.

One alternative (#1) would be to add the postfix and also add empty 
"meta packages" for all kernel-module packages, such that the meta 
package "kernel-module-foo" would depend on 
"kernel-module-foo-<kversion>". That would work great (presumably - 
untested), just like the "kernel-modules" meta package, but would add a 
lot of new packages to the already time consuming build. It would also 
make the kernel-module-split class even more complex.

Another alternative (#2) is to simply make the postfix configurable, on 
or off. This would work fine but it would also add to the complexity of 
the kernel-module-split code as well as adding another (rarely used) 
code path, with the effects that has on stability.

A third alternative (#3) is to add the postfix and let the kernel module 
packages RPROVIDE the shorter named package. Hence 
kernel-module-foo-<kversion> would then provide kernel-module-foo such 
that recipes can still depend on the kernel-module-foo which is now a 
"virtual package". A "virtual package" is more like an alias for the 
real package and is not a package in its own right (unlike the meta 
package). With this solution one would also be able to install 
kernel-module-foo using "apt-get install kernel-module-foo" but only if 
there is only one provider available. Hence, it would not be possible to 
"apt-get upgrade kernel-module-foo" to get 
kernel-module-foo-<kversion-2> since the original package 
(kernel-module-foo-<kversion-1>) is always available in an OE system(?) 
(afaik). This would not be a problem with the "kernel-modules" package 
which would depend on kernel-module-foo-<kversion> and friends.

The creation of the virtual packages in #3 would be made configurable 
such that it can be switched OFF, if one is not interested in keeping 
the old behavior. It would be ON by default.


Conclusion

The more I think of it, the more difficult it is to point out a best 
alternative. The currently agreed upon alternative is #3 with the 
virtual package, since #1 would generate such a large number of 
additional (meta) packages.

I will prepare a patch v4 and submit shortly. Since I am not a very 
experienced python hacker, feel free to help me optimize it.

Thanks,
Ola


--------------AFCCBF637E34DC51DC4C6F61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 01/12/2017 02:44 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NP10emxMOfnTHn6nKFv-W1=+KnJGkfmZ8t1Q5+hJbpYw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra">
          <div class="gmail_quote"><br>
            <div>Interesting. I think we've probably fallen off the
              radar of the casual reader that may have<br>
            </div>
            <div>more bitbake knowledge to explain why the virtual
              package (kernel-modules) provides <br>
            </div>
            <div>works with the same name and different versions, while
              a package with the version postfix<br>
            </div>
            <div>that rprovides the same name doesn't work with
              different versions.<br>
            </div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I think I have a clue on this so let me try to straight it out as
    much as I can in a somewhat more structured manner than my earlier
    attempt, and hopefully with a readable formatting this time... I'll
    do a background and overview too to let new readers in. I am sorry
    about this being lengthy. I'll post a patch v4 based on the end
    conclusion. <br>
    <br>
    Anyone with a better knowledge in package management than me (that
    means very many of you) might want to fill in or correct the below.
    And Bruce, I kept #1 and #3 separate since I see quite a difference
    between "meta packages" and "virtual packages".<br>
    <br>
    In my current system I use deb packages and apt-get as package
    manager so the discussion below is apt-get centric. The *assumption*
    here is that package managers in general behave in a similar way to
    apt-get, when it comes to the details below.<br>
    <br>
    <br>
    Background<br>
    <br>
    My use case is that I want a kernel module packaging that allows me
    to upgrade my kernel and kernel modules using a package manager such
    as apt-get without the kernel modules for the older kernel being
    removed. When I perform an upgrade today (either dist-upgrade or
    upgrade on the package "kernel-modules") the old modules are
    removed. My motivation is that I want to be able to fall back to the
    older kernel and its modules if necessary.<br>
    <br>
    The "kernel-modules" package is called a "meta package" in the code.
    Even though it is an empty package (therefore "meta"), it is a
    package in its own right with a package version based on the kernel
    version used to build it. It has dependencies to all kernel module
    packages (e.g. kernel-module-foo) that are built by bitbake. Hence
    when the "kernel-modules" package is installed or upgraded it pulls
    in all those modules that it depends on.<br>
    <br>
    Side note: If apt-get finds many "kernel-modules" packages available
    it simply picks the one with the latest version (unless given a
    specific version). So having many "meta packages" of different
    versions available at the same time is not a problem - apt-get can
    distinguish between them.<br>
    <br>
    Today, the kernel module packages like kernel-module-foo are named
    the same regardless of what kernel they belong to. Hence
    kernel-module-foo for kernel-x is the same package as
    kernel-module-foo for kernel-y, just with another version.
    Therefore, when the "kernel-modules" package is upgraded, the new
    version of kernel-module-foo is installed while the older version is
    removed (you cannot have two versions of the same package installed
    at once). That is the problem.<br>
    <br>
    <br>
    Alternative solutions<br>
    <br>
    My original suggestion (#0) was to just postfix the kernel module
    package names with a kernel version string (creating
    kernel-module-foo-&lt;kversion&gt;) just like what is done with the
    kernel itself already today. Note that this &lt;kversion&gt; has
    very little to do with the actual version of the package.
    &lt;kversion&gt; is just KERNEL_VERSION, nothing else. This solves
    my use case but causes other problems as Bruce pointed out. Existing
    recipes with dependencies to kernel-module-foo will break, and even
    worse, will have to be updated for every new kernel version.<br>
    <br>
    One alternative (#1) would be to add the postfix and also add empty
    "meta packages" for all kernel-module packages, such that the meta
    package "kernel-module-foo" would depend on
    "kernel-module-foo-&lt;kversion&gt;". That would work great
    (presumably - untested), just like the "kernel-modules" meta
    package, but would add a lot of new packages to the already time
    consuming build. It would also make the kernel-module-split class
    even more complex.<br>
    <br>
    Another alternative (#2) is to simply make the postfix configurable,
    on or off. This would work fine but it would also add to the
    complexity of the kernel-module-split code as well as adding another
    (rarely used) code path, with the effects that has on stability.<br>
    <br>
    A third alternative (#3) is to add the postfix and let the kernel
    module packages RPROVIDE the shorter named package. Hence
    kernel-module-foo-&lt;kversion&gt; would then provide
    kernel-module-foo such that recipes can still depend on the
    kernel-module-foo which is now a "virtual package". A "virtual
    package" is more like an alias for the real package and is not a
    package in its own right (unlike the meta package). With this
    solution one would also be able to install kernel-module-foo using
    "apt-get install kernel-module-foo" but only if there is only one
    provider available. Hence, it would not be possible to "apt-get
    upgrade kernel-module-foo" to get
    kernel-module-foo-&lt;kversion-2&gt; since the original package
    (kernel-module-foo-&lt;kversion-1&gt;) is always available in an OE
    system(?) (afaik). This would not be a problem with the
    "kernel-modules" package which would depend on
    kernel-module-foo-&lt;kversion&gt; and friends.<br>
    <br>
    The creation of the virtual packages in #3 would be made
    configurable such that it can be switched OFF, if one is not
    interested in keeping the old behavior. It would be ON by default.<br>
    <br>
    <br>
    Conclusion<br>
    <br>
    The more I think of it, the more difficult it is to point out a best
    alternative. The currently agreed upon alternative is #3 with the
    virtual package, since #1 would generate such a large number of
    additional (meta) packages. <br>
    <br>
    I will prepare a patch v4 and submit shortly. Since I am not a very
    experienced python hacker, feel free to help me optimize it.<br>
    <br>
    Thanks,<br>
    Ola<br>
    <br>
  </body>
</html>

--------------AFCCBF637E34DC51DC4C6F61--
