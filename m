Return-Path: <net147@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C5ADE60290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:29:03 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id v187so80211293ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BU7XolSIJHGr59xNpOUx1Kjk2b1xO0TUsFwZrZhvins=;
	b=xsHUTI552aXigpyOtOI1wx2AIq3ahJAer1liTYTTxBcmBE0JMCHKER95im80t+hstG
	wf4ZemhxQMTxTqPtqyO6nP0VVh5Sg/LpOGKWgCW8u0vLfsVK8rpXujr2+nUS9BaH/zTJ
	jwWNrJDtPkJ7rzgmk3+Gr37pX9Lg7ghfpnZYZ01HwWnBRuDc1cIcprTyfMwBHkOCK5Eo
	LcIf3hyNbRbRCpdexAELsIgokW/iobD8t29KeLEiOspn31pkhF/cWMx+OC9r4yt5Ga71
	WAoM3exvqC/7xxcD824jn9rEdSq5fT6Zjiy50CGTqF6T9qO+im+cg4rSVjEB5FBOQzr1
	YYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BU7XolSIJHGr59xNpOUx1Kjk2b1xO0TUsFwZrZhvins=;
	b=k+xKnGX2XAwhTTUXcSDvf+hrXIZbhdj1ijpSZQaZXYwnmr9IJ5xBDfMhGS0Qh+bPpN
	4f6dIcnXraJbHWO7idNnjrNk3hhEqaL+PfvIwrVzSJkXd5eIuEskTHz/v4tyGtRvlFU6
	N3gtBze/2DsDOItolO2QGthILszH84rGTzUziM48YQXd4r1ZiYdIVXUVXfRMgpaDApFY
	T1tDhFCOs7ZkVFdQ+hyFx2/usgDkGp2p27DRr/UJU+0/vYlSgm6jxrmmLUrZTam2O1JH
	EMAgTeFz3zAdbA7chX54JsTbOL4BeZg+lpstnKW7XH+KYCJBDRXjyqGS9zhoEt1j6wNT
	ppEQ==
X-Gm-Message-State: AD7BkJK6Grg5QVwi+XB9fjBu0RbfH06qM+k80d2Y01RKmZQZZP7bk4cGIfkrx0Oufv6Ds8J1n2vQXjekXC2KuA==
MIME-Version: 1.0
X-Received: by 10.107.9.193 with SMTP id 62mr13201343ioj.27.1458901744028;
	Fri, 25 Mar 2016 03:29:04 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 25 Mar 2016 03:29:03 -0700 (PDT)
In-Reply-To: <1458898011.3073.48.camel@linuxfoundation.org>
References: <1458887112-27434-1-git-send-email-net147@gmail.com>
	<1458896056.3073.45.camel@linuxfoundation.org>
	<CANwerB1wqVPz4CgP24AuUOkKkxnwakaQPYtQmgWG_Lb10z1H_w@mail.gmail.com>
	<1458898011.3073.48.camel@linuxfoundation.org>
Date: Fri, 25 Mar 2016 21:29:03 +1100
Message-ID: <CANwerB0VbgB=vP0mWjTNfMrOHSDF46btrO1L9b5zBS+eKssEVA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 10:29:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 25 March 2016 at 20:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-03-25 at 19:58 +1100, Jonathan Liu wrote:
>> Hi Richard,
>>
>> On 25 March 2016 at 19:54, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2016-03-25 at 17:25 +1100, Jonathan Liu wrote:
>> > > Python support was not being enabled because of a conflicting
>> > > --without-python configure argument in OE_EXTRACONF.
>> > >
>> > > Signed-off-by: Jonathan Liu <net147@gmail.com>
>> > > ---
>> > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> > > b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> > > index ae97759..6fd3e3e 100644
>> > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> > > @@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core
>> > > nativesdk
>> > > -python-lang nativesdk-python-
>> > >
>> > >  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>> > >
>> > > +EXTRA_OECONF_remove = "--without-python"
>> > >  EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>> >
>> > Would a PACKAGECONFIG += "python" have the same effect?
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>>
>> No, it wouldn't. It would depend on python and python-codecs then
>> fail
>> when building SDK.
>
> Ok, I still don't think the above is the right fix though as it still
> leaves things fragile, if for example I try and enable python for gdb
> by default on target.
>
> I think we may need to do something like:
>
> -PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without
> -python,python,python python-codecs"
> + PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without
> -python,python,${GDBPYTHON_RDEPENDS}"
>
> +GDBPYTHON_RDEPENDS = "python python-codecs"
>
> and then set:
>
> GDBPYTHON_RDEPENDS = ""
> PACKAGECONFIG += "python"
>
> in the cross recipes.
>
> Would that work?
>
> Cheers,
>
> Richard

The path to python is different too.
gdb-cross.inc: EXTRA_OECONF +=
"--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
gdb-cross-canadian.inc: EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"

Does it really make sense to have these PACKAGECONFIG options in a
common include?
babeltrace for example doesn't have have BBCLASSEXTEND for native and nativesdk.

I wonder if the commit should just be reverted.

Regards,
Jonathan

