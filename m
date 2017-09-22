Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id C109278235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 00:43:13 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id u205so5213545ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7fQlAy1MHqqkDyI0pWUmkrTq9RxCrNFck19WMrrNHGw=;
	b=xu3vIPAuL+YmF1deVsTkNCPKyWJ+dkqW35fqAk6u8gsPheW2ohwuiIBuiuTTdTwpMp
	Tt7jw7KW1KpAF0UTahUyLbulDa2A/E162eWH1tjaS1tS7EwyieP/s72wbQ40PadCWhw4
	3gMU11omRoS+3MggxU+mvVasKIIjRglYai+mKilUAph6zRqara9juz7cGqt/dWDEDJJL
	YV9v/H4Qdt6qiK1dUNjgoMrE3wUmYh07hlboncBO8wiF56zOZ0L295dLysYRoUkoDBMa
	FuHjTtWbddK02mpZsHc9/2bWENifiOe3c8y3vE2Coz/Cjk2DjN+6k6LkpXFaDwHocq0u
	1WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7fQlAy1MHqqkDyI0pWUmkrTq9RxCrNFck19WMrrNHGw=;
	b=VBmABuyoWntd2ERNkuRiUJXuXu+1NYaIqZUmKQnG9RvDSMogF9IGXZs1iqYDVfEikB
	pX8lBnQ+SPg/RFamqAsdOBOdimYb4/rsjjzidQYXGmgH4+Ko4sK0dM4BcVvfOfAj+6ZV
	Gm3wXE+6molTH3dergfZMoamcFqmol+RV+pFKUewT90Jv3P10Q5k0Ez7mX9i6Oc3bq9Z
	Yw91poltE1mkqUyXDTPTs6Pcvaqs2y9NcSvmiWbtNigJVhl43NKh/v0hXPCEP/BVoryD
	n/lea/7ugMs9Y+TYrpYveEjb01j3kNb5Y9U2V+KKqVCCxmgoOR7T+v6qjjTyZIXM3W4F
	Ad6w==
X-Gm-Message-State: AHPjjUiBLzh0HUjQJND5BeqsCNlU/jaWVny8WkpE/fUaXwtNAJ8s7Z/f
	GAkTYKiuNYkMU5uMJmK5LPy7pmO7
X-Received: by 10.37.162.105 with SMTP id b96mr2901949ybi.277.1506040994498;
	Thu, 21 Sep 2017 17:43:14 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177]) by smtp.gmail.com with ESMTPSA id
	k82sm1034004ywe.83.2017.09.21.17.43.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 17:43:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f177.google.com with SMTP id i197so14692616ioe.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:43:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDYzSAE4UE20X2i1ZpGbk0mFmkv2YEoC4G8dR/wmk/8kfebcs1/3SlzcjLrDPOfKrmbpSGLFHcw7fNOGmL1ML0=
X-Received: by 10.202.76.132 with SMTP id z126mr4016124oia.100.1506040992566; 
	Thu, 21 Sep 2017 17:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 21 Sep 2017 17:43:11 -0700 (PDT)
In-Reply-To: <1506033277.18640.172.camel@linuxfoundation.org>
References: <20170921140819.21292-1-otavio@ossystems.com.br>
	<1506033277.18640.172.camel@linuxfoundation.org>
Date: Thu, 21 Sep 2017 21:43:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKphgL7Dndk8PcpLnE0me_O9AyMhYkjhYbE_HCM+sYMNZg@mail.gmail.com>
Message-ID: <CAP9ODKphgL7Dndk8PcpLnE0me_O9AyMhYkjhYbE_HCM+sYMNZg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Fri, 22 Sep 2017 00:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Thu, Sep 21, 2017 at 7:34 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2017-09-21 at 11:08 -0300, Otavio Salvador wrote:
>> Upgrade to a new stable release and drop patches applied on upstream.
>>
>> For a full release notes, please see:
>> https://mesa3d.org/relnotes/17.2.0.html
>> https://mesa3d.org/relnotes/17.2.1.html
>>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v2:
>>  - update to 17.2.1
>
> The trouble is this isn't just a "stable release", I didn't check the
> patch fully enough initially but now I see this was a 17.1.X -> 17.2.X
> change.

The commit log mentions the two release notes. The 17.1 is at 17.1.9
release but should not receive more fixes. It is advised to move to
17.2.1 as it is the current release but it is up to you if we will
take this one or 17.1.9.

> When I tried building it locally I get:
>
> | checking for x11 xext xdamage >= 1.1 xfixes x11-xcb xcb xcb-glx >= 1.8.1 xcb-dri2 >= 1.8 xxf86vm... yes
> | checking for wayland-scanner... /media/build1/poky/build/tmp/work/core2-64-poky-linux/mesa/2_17.2.1-r0/recipe-sysroot-native/usr/bin/wayland-scanner
> | checking for wayland-client >= 1.11 wayland-server >= 1.11... yes
> | configure: error: wayland-protocols >= 1.8 is needed to compile the wayland platform
> | NOTE: The following config.log files may provide further information.
>
> and basically I just wiped out a round of autobuilder testing of a
> larger patchset due to this.

That's the reason for autobuilder, right? I do not spawn all
configurations here as I don't own such build monster ...

> If people want us to be more flexible about taking "point version"
> changes later into the release cycle, we really need to start getting
> better about how these things get tested and how we refer to them in
> the commit messages.

See the commit log above. You are frustrated, and I get that, but
commit log mentions BOTH!

> [and yes, the fix is trivial and included below, that isn't really the
> point though]

Do you want a v3? or a 17.1.9? Let me know what I can help.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

