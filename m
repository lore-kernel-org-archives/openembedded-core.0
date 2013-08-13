Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6B460664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:49:15 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id pa12so6486196veb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R2WE39kdXeZpdL4l0lp3YDSJDDIBhhS7vTqPeRG+Vp8=;
	b=LPXHV1Fibh17DGhaJ9OptYCzwkkbQ3GMPLP8oMk0dVR4Q4tjgTok78NnqeDI8Bc2Zl
	DJ5bm2sYfSu9B5/xt5B2gA8mPRqPp6Xm0zGeuuCo1HvuZYZ1jfFOUvJpiXG900WA8QT0
	u30aTdXZz+NhyxH5ncS2lloVbj/S3jFwOzD46UPoHKPi1WO+fDc3hAXL/kFdAIQZ9Y+P
	S9naPQVm4+xrvjFrlHYPzCmilRcKdzcAisidcRULJ+lIgserPpdHA8YdMzJskgoGvTFQ
	BTKhKUF6vMeBbO0eE12unvqojkzQxlg+pCD+LKhLwN6sPX25O7YTbdiS0JP5C1ifEC0S
	yw/w==
X-Gm-Message-State: ALoCoQnhvW4DG+KjtJnNq3dMHUbjVuZwvI3YJmK3+E8CNn6eG1dWJJtorHg3xptDq4ar0vdNY7Uj
X-Received: by 10.52.103.101 with SMTP id fv5mr3053330vdb.31.1376387355163;
	Tue, 13 Aug 2013 02:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 13 Aug 2013 02:48:55 -0700 (PDT)
In-Reply-To: <CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Aug 2013 10:48:55 +0100
Message-ID: <CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 09:49:15 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org> wrote:
> So, everyone suggested PACKAGECONFIG in here on the mailing list except Khem
> whose reply I did not get.
>
> Yet, 4964 got closed by the "team". Could anyone please give a sane
> description why and what would block the end users other than fork?

Quoting from comment 1 on 4964:

"""
Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
not sufficient to manage it's config system. It is very similar to the
Linux kernel config and we recently added configuration fragment
support to busybox from the kernel recipes:

commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Tue Feb 5 14:36:40 2013 +0800

    busybox: add config fragments

This allows you to use the default config and include only the delta
in your layer's bbappend in the form of a config fragment added to the
SRC_URI.
"""

If this isn't sufficient or is buggy, then fixing this is preferred
(it works for the kernel, so should work for busybox).

Ross

