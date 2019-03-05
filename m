Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B52D7C629
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 09:37:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w17so8630079wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GFc6ZN+aTviq3+BvMs0bv9tkzXEKDxe9JWmrQjTfu20=;
	b=OC1Rc6GaGuc0VB4TVVU4V708WF9BOIGNPO2CY4dr2In1BTHd0i6DDL9ovJVybBf4mj
	g211GsO3CNm1dcatFmKnWRvexdOIkvEPf+h9ibnrrx3JznL+P3uQae+KRsUiC5FRgvwr
	o+2bThTsY5rFj/6voNiNBQCS8QVfmOhp+rzFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GFc6ZN+aTviq3+BvMs0bv9tkzXEKDxe9JWmrQjTfu20=;
	b=BxYGPxhfqZSpVOQsuTO+Rubk+ADv8nqHRhXN5y74HlcPu8x6KxFscTtiKZvTXM+Jun
	D4sU9vExk0fUNET8X2lJkVYH6PU3GmjetzZcjcIiyS0RcQsQMkiHEzxJHMLdpH9FoRr8
	J6hn8D9qaLsSInEun/VHII05QHxzAVQLFebYd2DMNu7SvhV0MgW2uGnlNkOKplmomecv
	ooz5qQPs9U7+66CxG5WsQt1NGFb/kBDIPQedqIzwOwy9HooAm5WnZHm01Z+IpaaBT+8X
	qOAPTZXYcYtWxSuVF7rqQWk6dz2S/zMKgri4ug/eMkBoUyPQEkZMMxlKMZXIxjMYKMYn
	ROLA==
X-Gm-Message-State: APjAAAWBXZx2bvRKU+weYILwWMK89GvOpC+aSq7tjsIuyEs2SJBd07Hs
	rOgu8UMTvlj3O8Ffbs10iVECX2g27pk=
X-Google-Smtp-Source: APXvYqyrARxpb8fsj+QIWKPh56Bl2zVqTZbzUSXFzGmmW9/KbF/dkKvR8tJyfOEJXanoFLnOI8g8jg==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr16959610wrw.76.1551778678993; 
	Tue, 05 Mar 2019 01:37:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y66sm7462110wmd.37.2019.03.05.01.37.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 05 Mar 2019 01:37:58 -0800 (PST)
Message-ID: <69ee81d9db563ccf8d66ad9b20203fdfb827f2fd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 05 Mar 2019 09:37:57 +0000
In-Reply-To: <CAPybu_0YHNMucF1LPdYNRAWdBChAfZHpb1B-PdDRC2enGmGsSw@mail.gmail.com>
References: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
	<d104283b569d34efec7502fe4ade89c34f2ba3c9.camel@linuxfoundation.org>
	<CAPybu_0YHNMucF1LPdYNRAWdBChAfZHpb1B-PdDRC2enGmGsSw@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Daniel Gomez <daniel@qtec.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Two recipes providing the same .so... How it should not be done :)
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
X-List-Received-Date: Tue, 05 Mar 2019 09:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-05 at 09:27 +0100, Ricardo Ribalda Delgado wrote:
> Hi Richard,
> 
> Thanks for your reply!
> 
> I tried with the following:
> 
> INSANE_SKIP_${PN} = "already-stripped"
> INSANE_SKIP_libegl-tegra = "ldflags dev-so"
> INSANE_SKIP_libgles1-tegra = "ldflags dev-so"
> INSANE_SKIP_libgles2-tegra = "ldflags"
> INSANE_SKIP_libgl-tegra = "ldflags dev-so textrel"
> 
> RREPLACES_libgl-tegra = "libgl-mesa"
> RREPLACES_libegl-tegra = "libegl-mesa"
> RREPLACES_libgles1-tegra = "libgles1-mesa"
> RREPLACES_libgles2-tegra = "libgles2-mesa"
> 
> RCONFLICTS_libgl-tegra = "libgl-mesa"
> RCONFLICTS_libegl-tegra = "libegl-mesa"
> RCONFLICTS_libgles1-tegra = "libgles1-mesa"
> RCONFLICTS_libgles2-tegra = "libgles2-mesa"
> 
> RPROVIDES_libgl-tegra += "gl-proprietary libgl libgl-mesa"
> RPROVIDES_libegl-tegra += "libegl libegl-mesa"
> RPROVIDES_libgles2-tegra += "libgles2 libgles2-tegra"
> RPROVIDES_libgles1-tegra += "libgles1 libgles1-tegra"
> 
> But then do_rootfs fails:
> 
> The following packages have unmet dependencies:
>  mesa-demos : Depends: libegl-mesa (>= 18.3.4+git0+b26488dead) but it
> is not going to be installed
>               Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it
> is not going to be installed
>  qv4l2 : Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it is
> not
> going to be installed
>          Depends: qtbase (>= 5.11.1+git0+74305ba470) but it is not
> going to be installed
> 
> 
> I am forcing the installation of libgl-tegra by making:
> 
> XSERVER += "gl-proprietary"
> 
> What am I doing wrong :)

I'd forgotten that things have hard version requirements in some of
these dependencies :(

You'd probably need to make sure your recipe has a version (or epoch,
PE may be easier) higher than the original recipe? I think that is what
the package manager is saying in the error above.

Cheers,

Richard


