Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id D7758722E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:22:59 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id q1so7090827lam.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 01:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=CGvvYjZxFJdtJBn/lWWphdv5R0Wl8uH4GaJ3LWsbXAc=;
	b=Ks8l4P9gdvh05A8hoNtc+mBoMOXI94H7aEHlfy8p1v+02Hko2TCPW/q+8m/U2XT5ik
	/41s33vmCe40yXR8+tsU7LZEfnorVPPf9ZwPISnFT7M9LNAPilO7sBXQWqwYli59yMGb
	8Qtdfijtp6C2LQfqinpGXBI9uYRYTbewmGx8ZbejjDf/wFYRcYLd6BnlgAyR9G3aGs1b
	BlA/bj75Kx9+1nC3vuStKiOtQwvRXBq0HDs5XEsfnouFFYUAGGLOsci27VTK5xZXMb6P
	sj5Vob0MAVUuZpm/xAo4ds6jounyKlHVeYSEDO6yvjGUQVs6QFTi3KtaO2t2dDh5YcEv
	vmIA==
X-Gm-Message-State: ALoCoQlnoEd6is1UX6vC+6U6qA9MCw8Ag7RHf+xfPm3L/94wlrEialDgEebEETbcf5GvhSOBo3wZ
X-Received: by 10.112.142.201 with SMTP id ry9mr2926792lbb.4.1421227379427;
	Wed, 14 Jan 2015 01:22:59 -0800 (PST)
Received: from ad.chargestorm.se (81-232-163-241-no29.business.telia.com.
	[81.232.163.241])
	by mx.google.com with ESMTPSA id j19sm5706773lbl.23.2015.01.14.01.22.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jan 2015 01:22:58 -0800 (PST)
Date: Wed, 14 Jan 2015 10:22:56 +0100
From: Anders Darander <anders@chargestorm.se>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20150114092256.GA7518@ad.chargestorm.se>
Mail-Followup-To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1421110587-23245-1-git-send-email-armccurdy@gmail.com>
	<20150113083517.GA9496@ad.chargestorm.se>
	<CAJ86T=XRTEYnzfPWJPR_AY9rUvE0QrH+4Wy6jZd2Qx6v-Ehx=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XRTEYnzfPWJPR_AY9rUvE0QrH+4Wy6jZd2Qx6v-Ehx=Q@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] logrotate: fix missing acl and libselinux dependencies
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
X-List-Received-Date: Wed, 14 Jan 2015 09:23:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andre McCurdy <armccurdy@gmail.com> [150113 19:47]:
> On Tue, Jan 13, 2015 at 12:35 AM, Anders Darander <anders@chargestorm.se> wrote:
> > * Andre McCurdy <armccurdy@gmail.com> [150113 01:57]:
> >> +# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
> >> +# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?

> > It might well be worth adding autotools support right now.

> >>  DEPENDS="coreutils popt"

> >>  LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
> >> @@ -21,6 +24,9 @@ PACKAGECONFIG ?= "\
> >>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> >>  "

> >> +PACKAGECONFIG[acl] = ",,acl"
> >> +PACKAGECONFIG[selinux] = ",,libselinux"

> > The problem with these two lines, are that you're not explicitly
> > enabling and disabling those two features; thus our builds won't be
> > deterministic.

> Currently the configure task for logrotate is a no-op, so the normal
> way of constructing a configure command line via PACKAGECONFIG doesn't
> work.

Yep, that's why I suggested moving to autotools etc...

> We do however need to include acl and libselinux in DEPENDS if enabled
> - which wasn't happening before and is what the patch attempts to fix,

> There are no floating dependencies since acl and selinux are enabled
> explicitly during compile, by options passed on the make command line
> via EXTRA_OEMAKE.

Ok, I missed that one as it was outside of the patch.

Then I presume that there's no need to disable those features when
they're not enabled? Right? If so, it should be fine for the moment.

Cheers,
Anders
-- 
Anders Darander
ChargeStorm AB / eStorm AB

