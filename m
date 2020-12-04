Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.10074.1607057940187971592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 20:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PMVR7HHZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id p8so4044591wrx.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 20:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6uAe/XNzekFR9kxmKcdM9X+AN/LkHX9R5w1zZqomhuM=;
        b=PMVR7HHZ+YB3GZ2LlsMG0D1BQF8S9Q+tMhk8xNUWK8kMzqB52jxENJoRIr7rwOBoDy
         Dfj3pIdlU25uP0AFMo/g3yyEWZuNu/JLf8hpPay4oxSTu72x5lC8N0mZ2pA2kn8nypXB
         YANnRP5uE1Gx5xhamJ+S5Za+P/ApbOVVWJ9Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6uAe/XNzekFR9kxmKcdM9X+AN/LkHX9R5w1zZqomhuM=;
        b=BrY6HzwO6R0p439vQdBQFuHs097Wnz6piLpqimRjoj1vUxVPViYJQvPOjcf4/diXjZ
         DkQgA++189//GD8g0pDDt7839/A3PMTTYdkjY0AOl1M57D7BjwbJBJW8flrTeXdHu7JL
         s+9YTUmRfaT5fG1gT/PfQgB9wp/CbT2c6MESqiKDAj9ARF6l+WNBnziCPFUcQuV8Ncie
         vUa4lwOEkPu2qp5OrRtY2bq3qhlPy5rLzbXzgnXiNRM7r2fWmQ3J8V7vIVILShDpnEAl
         yhhM/i+wETN8PZ9n6DgCWQ2V1IyZ8KgbJ7TDvyMwzcrry+7uixequvfiZ4vCeDOmtjYC
         Un0A==
X-Gm-Message-State: AOAM531IvqTqb9jBR4vAhS5ei4t8aYkwgRinAEqv2mdb5A45Ki2OBdaD
	HX/aW4r6xQBi9IebT/kBYEqrDA==
X-Google-Smtp-Source: ABdhPJyMo5gV5E8g+A9UT5nQP6hrsctl0gsdqux76zC8/5QF8pjkmSsL+4JQ8njyy1srTgSVyEInXg==
X-Received: by 2002:adf:82c7:: with SMTP id 65mr2702546wrc.384.1607057938602;
        Thu, 03 Dec 2020 20:58:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id v20sm1549513wml.34.2020.12.03.20.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 20:58:58 -0800 (PST)
Message-ID: <6de3791839a669b2c4fad3c347045a38e412a89d.camel@linuxfoundation.org>
Subject: Re: [OE-core] commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nathan Rossi <nathan@nathanrossi.com>, Andrey Zhizhikin
 <andrey.z@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Dec 2020 04:58:55 +0000
In-Reply-To: <CA+aJhH3uckHaetL5b8wWWLEyExfQSFiBBykEeNd6=wUwcdSu1w@mail.gmail.com>
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
	 <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
	 <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com>
	 <CAHtQpK4jkSeJaWNuok13NhbD2Ghcd+DeVs5f23gSqoSaDh0Cbg@mail.gmail.com>
	 <CA+aJhH3uckHaetL5b8wWWLEyExfQSFiBBykEeNd6=wUwcdSu1w@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-04 at 10:53 +1000, Nathan Rossi wrote:
> On Fri, 4 Dec 2020 at 08:31, Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> > Hello Scott and Nathan,
> > 
> > On Thu, Dec 3, 2020 at 7:18 PM Scott Branden via
> > lists.openembedded.org
> > <scott.branden=broadcom.com@lists.openembedded.org> wrote:
> > > 
> > > 
> > > On 2020-12-02 4:19 p.m., Nathan Rossi wrote:
> > > > On Thu, 3 Dec 2020 at 05:17, Scott Branden <
> > > > scott.branden@broadcom.com> wrote:
> > > > > Hi Nathan,
> > > > > 
> > > > > Your commit:
> > > > > "cml1.bbclass: Handle ncurses-native being available via pkg-
> > > > > config"
> > > > > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
> > > > > 
> > > > > breaks bitbake menuconfig when using the upstream kernel.
> > > > Interesting. The purpose of the commit was to actually fix that
> > > > exact
> > > > use case since previously the mainline kernel menuconfig was
> > > > relying
> > > > on hardcoded paths to the host ncurses libraries.
> > > > 
> > > > Would you be able to provide the error messages you are getting
> > > > (and
> > > > anything else that can help to reproduce the failure), because
> > > > I am
> > > > not able to reproduce any failures with a mainline kernel,
> > > > linux-yocto
> > > > (with and without the below mention patch) or with other
> > > > projects that
> > > > are using cml1 (e.g. u-boot).
> > > > 
> > > > > It only works with the linux-yocto kernel due to this
> > > > > workaround which is not upstream.
> > > > > If you revert this commit in linux-yocto menuconfig will not
> > > > > work in linux-yocto:
> > > > > "menuconfig,mconf-cfg: Allow specification of ncurses
> > > > > location"
> > > > > https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
> > > > This change should not be required to have menuconfig working
> > > > when
> > > > pkg-config is used.
> > > > 
> > > > > Seems like your commit needs to be reverted or a change made
> > > > > to work with the upstream kernel.
> > > > > Or, the linux-yocto change needs to actually be
> > > > > upstreamed.  I submitted it and the upstream maintainer
> > > > > questioned why the change is needed:
> > > > > https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
> > > > The problem is if it was accepted, every kernel prior to its
> > > > inclusion
> > > > would need to be patched, as well as other projects (u-boot,
> > > > busybox).
> > > > This makes supporting menuconfig using that change for kconfig
> > > > generically problematic. This is why the pkg-config solution is
> > > > preferable.
> > 
> > As I've already said before I had similar issues with doing
> > menuconfig
> > kernel task. I took a deeper look and actually found out that the
> > recipe-sysroot-native/usr/lib/pkgconfig/ncursesw.pc in the kernel
> > recipe build folder contained the absolute path to the ld, which
> > for
> > me was taken from the SSTATE_MIRROR produced on the CI system.
> > 
> > The string inside ncursesw.pc looked like this (note the -Wl,
> > --dynamic-linker):
> > Libs:  -L${pcfiledir}/../../../usr/lib -Wl,--enable-new-dtags
> > -Wl,-rpath-link,${pcfiledir}/../../../usr/lib
> > -Wl,-rpath-link,${pcfiledir}/../../../lib
> > -Wl,-rpath,${pcfiledir}/../../../usr/lib
> > -Wl,-rpath,${pcfiledir}/../../../lib -Wl,-O1
> > -Wl,--allow-shlib-undefined
> > -Wl,--dynamic-linker=/teamcity/work/c3acfc3a6f255dcb/build-
> > output/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> > -lncursesw -ltinfo
> > 
> > I then manually changed it to match the path on my local PC, and
> > menuconfig went totally fine after that.
> > 
> > Nathan,
> > I tend to believe this issue is not caused directly by the patch
> > committed, but rather by the fact that pkg-conf files do contain
> > absolute paths pulled from shared state. At least this is what I've
> > observed for my setup.
> 
> That is indeed an issue with uninative/sstate, likely because
> UNINATIVE_LOADER (which put into BUILD_LDFLAGS) is not covered by the
> sstate pack/unpack path rewriting. But uninative already handles
> rewriting interp as part of its sstate unpack function, maybe it
> needs
> to be updated to replace instances of LDFLAGS as well? Perhaps
> Richard
> has an opinion on this.

I'd say that:

a) .pc files are assumed to be correct and sstate is therefore probably
not relocating paths in them

b) paths like that should be triggering warnings about build paths in
the .pc file. It might not be as sysroot-uninative is a bit of a
special case we probably don't currently test for?

c) that flags should be unneeded, they'd be in BUILD_LDFLAGS if we
needed them

So I'm guessing we probably need to tweak the .pc file to better handle
this corner case. Most libs don't inject LD_FLAGS into their .pc file
that I know of...

Cheers,

Richard


