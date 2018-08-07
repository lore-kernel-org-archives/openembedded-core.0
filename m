Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 166FB74553
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:10:32 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id y207-v6so27107108oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q+k4JXC5xQ+nSc9J/dqj3rc8YsZGBCLgtjdFivqrdnM=;
	b=TUuclZ9/cO5r2j60GX0y0rd+1XHVG4hANKvZE6y+9ilySehVWJGwfOMQdt1bSl8Lob
	2NMg3Q3jRXdDWQIa7PUEyZrAAJNCIcPJyyP5ibaplMCnVCGSdLA/oop0dWbHLGqgSAA5
	Nv+sXPwk5MHKex5C5A/EDE9cVZ4xn12++leo1VeXnqASHKA36uAepdzs8fOKlalWGFFu
	kNVnheak8GNqhZnEeJNvkUt9UJsX0P+6OkfVY2FLO6RC5EXx5pylEqfVDJ0/XxphvcjY
	1ZoLpHjn7BKiOZJiYtRncObvXvyVkKf0xyzr+n7mUlZHL2fgkwMB++xJQlzk4M5ITONu
	Cp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q+k4JXC5xQ+nSc9J/dqj3rc8YsZGBCLgtjdFivqrdnM=;
	b=dfCPYREZE48RnhoBhwNLAYfq/ZDQaGMo1KmlRi446DTx8shfZo6nLv0CaNOsx+6U7O
	oPgqRt10fLGhdANFHrpLKMtmSJvlVJaDPuMahHPnRSewrcsKSNVB5eLPzZD9gtJDuKmc
	87e679zxyp7hE7oB5SKtJ0VHLXFDqHyOY1T5E9Z47lRTiz6civUikQ2GnIx9AjjOJyOn
	IdWra+wSPGY3LntGlbNITpVtSyX0JRzeKj/vtKrh6A+dTLxhi0DxpxvKhnUr+hlqPQRH
	t+2A0zp2wBbztICC/+JhadDYBypNxnOdDAheNKgjB2FpAboonETPc5FNwzOJJjp8rZlR
	g8pw==
X-Gm-Message-State: AOUpUlGhKwZmQnEs1zK/0IwlgmiRHBscK813fAoSr8lN/J6bTVLLqCY7
	IkZ76uLxr5FGuiJA+mBaUakc+rUg0kIFHvfjI/6CXA==
X-Google-Smtp-Source: AA+uWPzJzY80SXnUv058th6d52HW8kMckLE755ZD2dj0bGYVhJHy5aeb44qitVsCKmCohLCtFP0/GtWaxGxLMudEelY=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr19477615oig.245.1533633033716; 
	Tue, 07 Aug 2018 02:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Tue, 7 Aug 2018 02:10:13 -0700 (PDT)
In-Reply-To: <1533630587.8352.1.camel@collabora.co.uk>
References: <1533630587.8352.1.camel@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Aug 2018 10:10:13 +0100
Message-ID: <CAJTo0La6RFY0VKfbsUoPGcV1MB_Z0DuhHKQSAs=a74q0+qRERA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Extract GPL sources
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
X-List-Received-Date: Tue, 07 Aug 2018 09:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

Have a look at the archiver class.

Ross

On 7 August 2018 at 09:29, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Hello
>
> I need to extract all *GPL* sources patched related to an image in order to publish them.
> I want to do it automatically, ie 'bitbake myimage -c extract-gpl-sources'
> Is there a mechanism to do that?
> If not do you have any idea how I can implement it?
>
> Thanks
>
> --
> Fabien
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

