Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5576F0A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 18:44:10 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so2188940qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CGfu8RgBoGQbzFfV8Z9/4dPdsuswip2En0boub0Y2P4=;
	b=eVKUITXNWwwkcYKXSQPbA962KaSQ120TaYoetrtpbRwGeQDwVOYNPLLd2upkKiCn60
	MBL8zQWkImfgeptfY9vPKEkeZ2hkblyQna1N8FWZ9u1C4GB4dIZEEByIGXvi/fbNgsBY
	ISWp2miGgijeptnOv9RaUj3swd3iOdYyQ0mfa3YpVgOJ1Iolpj6YT7RSsu1tKrk8EGN/
	C77qk3+SYeipo32UwpSgPs8n+s8b30lE1ufdYw23joZHf8/lNOOA131rb03ugBenEfn6
	vLfna7yUPsW2t5TWRRbQsrL7liXRfxTN+QGT5mCSUgdH+ngqOiEmp0ENolhaiTHo2xQO
	WRig==
X-Gm-Message-State: ALoCoQnnTMXS2AnXrNvj/KrATgwK0LuGiUb5TA0u5PJyzNkcN+4hK/TtelkogptsOIeD0ho6aw5B
X-Received: by 10.140.42.138 with SMTP id c10mr2139981qga.24.1393353851379;
	Tue, 25 Feb 2014 10:44:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 25 Feb 2014 10:43:51 -0800 (PST)
In-Reply-To: <CAP71Wjxz0e7qzU4tVZ3XEpF1oZtCErqjD4pPnETVJLnoecq3QQ@mail.gmail.com>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama>
	<CAP71Wjxz0e7qzU4tVZ3XEpF1oZtCErqjD4pPnETVJLnoecq3QQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Feb 2014 18:43:51 +0000
Message-ID: <CAJTo0LY=TinUmQ+=d0_3oc97OwZNpw4yghfvbztyVF3EcJuteQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 18:44:14 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2014 17:36, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> right. I have recently (on dora) noticed that mesa build is broken
> when using separate build dir, i have the following extra config:
>
> PACKAGECONFIG_append = " gallium gallium-egl gallium-gbm gallium-llvm"
>
> since gallium-egl needs the egl.h files generated during mesa build.
> the generated files stay in $B while gallium-egl is looking for them
> in $S (or sysroot)

Pretty sure I fixed that:  oe-core fbc7092f0ae07538d4363679b1597ba4e556d1a8

It looks like that's in Dora so we've possibly regressed again, can
you file a bug (CCing me) with the build log?

Ross

