Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFEE71B69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 11:18:43 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l1so22094347otj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1PnXQQ+0aizxC59JdvzMkDSRd4nBGARvqJa2B76VPzI=;
	b=PjBpLHb+9yQ8gQHc/wkQ8jpeHrW3/wP7q4QKHZNkNHXOUdTJJPQCX7gHiCONgvLtKi
	aZ/vi4+mCIPaXPEAZHFD2mqAAEupYE1Udxj+pz8mEzK+ZaRhnHEViKHC0Cx1GDXpJZrz
	cLTBkYcecIj3W0oDvTIQi/NXT5c+gVn3pj0i9/M/nDOeAgqS/F9p8brqn5hiXxJ1xuux
	Q4/0a34qJAAItlBQUoqR3K2KL938Hnwl/YoHPs1/5dINfCyPNkxRwjh08Y1NrbRN9gK6
	QaIPHsjs06X7PY+/5AtL0q7VfQy+QpvYA1veL4sXoLu2u+53rUIswz6R3yBFyzUjcv5O
	XKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1PnXQQ+0aizxC59JdvzMkDSRd4nBGARvqJa2B76VPzI=;
	b=F7PIgjvoeCFxg2y5BaSzDEPoZzs0SjtVekt+0Z6pzUx1fiws+IxVzZeuPHvRKoS1UF
	EGWSIpNi6d/WGagvUtWwMMUbCQKIcMl18i5CdJElnwuoEensMo1aDfSSLMsF8Rdh9xSY
	ZWSERw0hrjVLbfSvvzj0lQoMEdZusSFY6DJhioAB8VDYdcOq1IRGEvw9x7cvRt6gV3OF
	iXb0MOkAHt+yCVfRaFzAYnTtC7/ifK0YsopF1Ks6kzzychx6koTYjRFTpWSLEAMNCkOU
	/3qUir+mqevAmO+9SmaRDhuAr+YQNV46LxA3q/NrVi2XKFse4lq30GcazyuuCPAS6Lwc
	wTcA==
X-Gm-Message-State: ABuFfog/xxS8bSC1XtTpZPjAlWcNzN8j8KD6lULfRO4FhFvAcNknQJnA
	QLhj6/ykiazM5yzOcybxxhm26/FjdaBSt4n8diauNA==
X-Google-Smtp-Source: ACcGV62B6jMO1h9/IZPP9lKWB5zDB1149KWp4PIMzgi2RLe0IiCeayQKe/QDz01rvpC4pq40E7tSymrQrldr/y3+S1k=
X-Received: by 2002:a9d:44ca:: with SMTP id p10mr12923565otg.291.1539688724285;
	Tue, 16 Oct 2018 04:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
In-Reply-To: <CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 12:18:32 +0100
Message-ID: <CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Tue, 16 Oct 2018 11:18:43 -0000
Content-Type: text/plain; charset="UTF-8"

Right.

This was a change in Boost 1.67 onwards:

https://github.com/boostorg/python/commit/d4d41d94aecc9f8098aabd3587fcb95458451f71#diff-42dd6ec1330a7c47aaccf2ab2b8f1e02

OpenCV has a patch to "fix" (bodge) the Py2 build:

https://github.com/ros-perception/vision_opencv/pull/239

But this doesn't work for Py3.  Boost and CMake consider this change
correct and the documentation for the cmake/boost integration reflects
this:

https://gitlab.kitware.com/cmake/cmake/blob/master/Modules/FindBoost.cmake#L43

So the worst-case fix is to patch opencv to look for "python35"
instead of "python3", although this will break when we upgrade to
Python 3.  A better solution would be to upstream a patch that uses
the Python version to generate the correct name.

Ross

On Tue, 16 Oct 2018 at 11:38, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 16 Oct 2018 at 11:01, <richard.purdie@linuxfoundation.org> wrote:
> > I'm a little worried about why we're having to create these links when
> > other software seems able to expect these things by default. Is this
> > some standard packaging most distros do? I'm a little worried we're
> > creating an ABI here which doesn't exist...
>
> https://koji.fedoraproject.org/koji/rpminfo?rpmID=14904908 says that
> Fedora's boost-python3 package contains just
> /usr/lib64/libboost_python3.so.1.66.0.  Their spec file at
> https://src.fedoraproject.org/rpms/boost/blob/master/f/boost.spec is
> hairy (as one expects for Boost) but doesn't appear to rename the
> file.
>
> So the question is why does our build produce libboost_python35.so?
>
> Ross

