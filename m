Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web10.2602.1589398270183243806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 12:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k1nzMmrn;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id k13so221697uap.13
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggm2DCaNu5I0C4Ba2+ZF1LTGmnu5xW/mpSZG07SkNjE=;
        b=k1nzMmrnQny4/qGXU8+XKiPB58VEilOFmK5x4NJ7SbLz/sn93M9YN51JHv52iC9ymY
         4644s+9YplkKO5eWlBcm3rWUiCOnmayv/VN8nM4t/aQZ/f1YQzlWspyJAlPx76qfk5wS
         EjTcQLutXCzLM+RWRPBTVxmsWWvWsyxSi729TcX+ne3YyIMTwdmM+wdMH4T7lMPXUW+9
         bylq0l0zyv0Yjy7un4/SOlCaw3YIpBiU8iRpCJ3G96naXTZz1fPNt4lsqJK4NjIiKQql
         UygVWnUK0WVBRmsHarE9oPUQV3vOsbjPmG9ZynZ29lmoy/zExnsAvA8R/yIvZe7cF1J4
         oHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggm2DCaNu5I0C4Ba2+ZF1LTGmnu5xW/mpSZG07SkNjE=;
        b=mCe5zcug72kIuvBlEPAav034y8QL1iliCqV0bRz9Y5oLjxvFOtcOVSIYn7Of1QUkiw
         BUpno0G8q5VLPU1DMkjVZN8Ln0t0KxXcQXGAXzVu9nC691iVkaqyPoP42v6/IiAK3Cz+
         19lTtR26chQlZ3kRv9zvCuo4uHtJpLarjyiqE1NVaA4mkV4yQWaVKkGDcKIU4XkskPo4
         v9g1NFMTdsp/ZK38jVz14sTSBPEaE5X/LispazqCHLp4G9uxzWkA4EtcgeIK6D8J0ySW
         yBrG/ZHllNmg+MCgw+dbJyn/MNp+H2XRyx2IpZ4y1yaKFDJfvBH1bXcMH3haxwyEjz8L
         HyaQ==
X-Gm-Message-State: AOAM530wq4+F9ApaliA+qXACPHKtL8GQfAmqFeViCu1jv3wM6ktytwa/
	vwePJSNp86rKyVp2eXDnkr+ZltL22jKWi2cvKgU=
X-Google-Smtp-Source: ABdhPJw54B2hl3kapAGOwJ4Y7vQyRFRv6g/U7/1+2aBT2omF9pzNGBGqEsx93JP4YVpR9ipr+e5/qUy2dZ1b0CWH3MQ=
X-Received: by 2002:ab0:22c5:: with SMTP id z5mr1076507uam.48.1589398269270;
 Wed, 13 May 2020 12:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200512214255.20678-1-pkj@axis.com> <CAJ86T=U-0v06iC5wm8opzJSO5a7k8a_a_NncF4N5ep6BwnBGTw@mail.gmail.com>
 <12d3b34c48784a218feef04fbc1463e4@XBOX03.axis.com>
In-Reply-To: <12d3b34c48784a218feef04fbc1463e4@XBOX03.axis.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 13 May 2020 12:30:57 -0700
Message-ID: <CAJ86T=Wf5n_PqiB9X8fYjdyYMwh=WakmVHjMfCVETKec4peZbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020 at 10:14 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Andre McCurdy <armccurdy@gmail.com>
> > Sent: den 13 maj 2020 00:20
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of
> > PACKAGECONFIG for native
> >
> > On Tue, May 12, 2020 at 2:43 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > There is no reason to set PACKAGECONFIG_class-native to the same value
> > > as the default PACKAGECONFIG.
> >
> > End users often don't know how to safely change PACKAGECONFIG from a
> > .bbappend and might try PACKAGECONFIG += "foo" or PACKAGECONFIG_append
> > = " foo" without realising that it could affect more than just the
> > target build.
> >
> > Have an explicit PACKAGECONFIG_class-native keeps the native config
> > stable for users who haven't yet learning through experience that the
> > safe way to change PACKAGECONFIG is PACKAGECONFIG_append_class-target
> > = " foo".
> >
> > So although this PACKAGECONFIG_class-native may seem redundant to the
> > experts, it helps make OE more robust for regular users.
>
> I have to disagree with this. Having just PACKAGECONFIG ??= "zlib"
> makes for a more consistent behavior between the different classes.

I don't see why a consistent configuration between the different
classes is a goal. We should instead try to keep them independent so
that changes to one don't accidentally affect the others. The
configuration for the target is determined by the functionality
required in the final image (ie something determined by the user) and
the configuration for native and nativesdk is mostly determined by the
requirements of the build environment. The requirements for the build
environment are fairly static and not something a typical user would
want to mess with.

> E.g., if someone would add a .bbappend with PACKAGECONFIG = "zlib
> bz2", with the current recipe the behavior would be different when
> building file and nativesdk-file compared to file-native (or actually
> file-replacement-native as file-native is in ASSUME_PROVIDED). With
> only the default PACKAGECONFIG, the result would be the same also
> for file-native.

Having an over-ride for native but not considering nativesdk is
certainly an issue which seems to affect many recipes in oe-core. But
the fix should be adding an over-ride for nativesdk rather than
removing the over-ride for native.

(I don't know why this problem doesn't come up more often. Perhaps
because while there are users who like to change PACKAGECONFIG values
and users who build for nativesdk the overlap between them is actually
quite small?).

> A quick grep through OE-Core also seems to agree with me. There are
> a couple of other recipes that sets PACKAGECONFIG_class- defaults,
> but then it's due to the default for, e.g., native being different
> from target. The only other recipe I could find that sets multiple
> identical PACKAGECONFIG defaults is openssl.

Yes. Unfortunately making recipes robust for users who want to change
PACKAGECONFIG values doesn't seem to be a high priority for oe-core.
Why else would default PACKAGECONFIG values be assigned with ??=
instead of ?= other than as a trap for new users?
