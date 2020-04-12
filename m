Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.1089.1586717365812809369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 11:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eHp1GcTX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id k11so7548482wrp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2020 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sBUlgi01rx7qQ7U9KFkPuYCHudpUuplgpRHfRn1zFDQ=;
        b=eHp1GcTXo106I0CslgwdYIkjVNXnIUPFtvLfHUUWelF6JhLhzqV77R/icQ6EicjUdh
         in4+PxSZ3TUHzAdCCXz4pzIKe06Zzw1h7P11fQpiFG2ri6walCjsXCBGRQfndILttzQr
         hm8Exbo8jMaa4Xc6RyR0OpSEVeiweSgw5gffE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sBUlgi01rx7qQ7U9KFkPuYCHudpUuplgpRHfRn1zFDQ=;
        b=gsuZ+lQKHtoD+waE6Wptv1+K4BoN+CPDCCxBX+EM6zK6clNtaK+IgBduYAugdFMEXm
         hL1cQ+63JAGF57mSwzGE0AsC0UEn3muHa56SKnn246LqUgPvB6c9z2zuOgJU18pBZl7/
         UgE9aNQ7+zAVSyH8AQq+NSaCHLu7sYQN5Py11saCEvm/fRy+6usw8XSxt9d6NNgO21pl
         Tvk0thvy3iUqe/ZUve33k10WYSTabF2zFeUfyrlhdcb4WLdFxRyXu2fuTglQrlJYIsEL
         F2K93ZS6ED/T/8pI4FlGVKkzwy7vL+y9NHmskC50hdq32jtHWiHJwYZjZ0gSRmPoJf1x
         A9Nw==
X-Gm-Message-State: AGi0PubTO44HUX+pt4+nmEWo0LQtH71g+cxUHfUDcK2+piZOJbCDaKEt
	Jfmvys/aVagtCg1VT3KdM3fSkg==
X-Google-Smtp-Source: APiQypL7rm/IGqzrbhX99E1Q31iJOCkmlj7NXong9vseiDgH6QOiI/+cPy1JcUvcFjGzToBz5051fQ==
X-Received: by 2002:a05:6000:114f:: with SMTP id d15mr15907483wrx.143.1586717364278;
        Sun, 12 Apr 2020 11:49:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m13sm12323092wrx.40.2020.04.12.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 11:49:23 -0700 (PDT)
Message-ID: <70c8a1acbcce2878da308fdb4fe97cd3e38fc8d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 12 Apr 2020 19:49:19 +0100
In-Reply-To: <20200412184602.GD1578@denix.org>
References: 
	<19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
	 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
	 <15FF5122E920BDAA.24006@lists.openembedded.org>
	 <20200324184323.GZ1578@denix.org>
	 <467110132be087c26851033a7b9e45972b5c0bd4.camel@linuxfoundation.org>
	 <20200324193222.GA1578@denix.org>
	 <fe9b411737f87754311de2c607656b8ac74aee86.camel@linuxfoundation.org>
	 <20200324221231.GB1578@denix.org>
	 <432926cd77d331fd98b7956c2394a447e9e4642c.camel@linuxfoundation.org>
	 <20200412184602.GD1578@denix.org>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-12 at 14:46 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 10:37:25PM +0000, Richard Purdie wrote:
> > On Tue, 2020-03-24 at 18:12 -0400, Denys Dmytriyenko wrote:
> > > On Tue, Mar 24, 2020 at 07:57:27PM +0000, Richard Purdie wrote:
> > > > On Tue, 2020-03-24 at 15:32 -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Mar 24, 2020 at 07:29:42PM +0000, Richard Purdie
> > > > > wrote:
> > > > > > On Tue, 2020-03-24 at 14:43 -0400, Denys Dmytriyenko wrote:
> > > All I could find is OE TSC minutes from 7 May 2013 referring to
> > > some
> > > related 
> > > list discussion:
> > > 
> > > https://lists.openembedded.org/g/tsc/message/369?p=,,,20,0,0,0::Created,,PACKAGECONFIG,20,2,0,72188707
> > > 
> > > (9:47:21 AM) RP: bluelightning: I think this was to PACKAGECONFIG
> > > more recipes
> > > (9:47:28 AM) bluelightning: ah ok
> > > (9:47:36 AM) RP: bluelightning: remove the need to bbappend, have
> > > people set mode config options
> > > (9:47:51 AM) bluelightning: and PACKAGECONFIG to enable deps on
> > > things
> > > outside OE-Core as well presumably
> > > (9:48:01 AM) bluelightning: (as discussed on the ml a few weeks
> > > ago)
> > > (9:48:06 AM) fray: yup
> > 
> > Well found. There is clearly more context behind that even back
> > then.
> > 
> > > I spent last couple hours digging through my archives of
> > > openembedded-core and 
> > > openembedded-devel lists around that time (Spring 2013), but
> > > besides
> > > general move to enable PACKAGECONFIG in recipes, I didn't see
> > > anything specific about crossing layer boundaries by
> > > PACKAGECONFIG
> > > dependencies, unfortunately. And it was a wild time - all the
> > > energy,
> > > extra activity, conflicts, flamewars - that definitely brought up
> > > some memories re-reading those discussions again... :)
> > 
> > :)
> > 
> > I'm sure this has been discussed, I just don't remember where/when
> > unfortunately.
> > 
> > I do believe the conclusion is right though and I believe there is
> > enough general acceptance we can document it as such. If anyone
> > objects, the TSC can discuss it but I'm not seeing that being
> > requested
> > unless there is more context to this discussion than I'm seeing.
> 
> Richard,
> 
> So, the policy issue is all sorted out now...
> 
> But how one would use this change in a multi-machine distro, when
> some 
> machines have graphics and want qt5+gl dependencies, while other
> machines 
> have no graphics and cannot build qt5+gl. Is there a way to keep
> this 
> package generic w/o making it machine-specific
> PACKAGE_ARCH=MACHINE_ARCH?

The distro could setup the package feeds so there was a package feed
with gl and a package feed without gl?

The tune files ultimately determine the default PACKAGE_ARCH but there
is nothing stopping the distro from changing that to gl and non-gl
variants...

Cheers,

Richard

