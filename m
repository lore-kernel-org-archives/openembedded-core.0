Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7CECF6D247
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:54:38 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f13so5567974vbg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CkTuUqL7mdDxj35GCceFEbnypZl0cZY+BP77G9ehBkY=;
	b=UBHKjBcucTt2rM9sWzHj7FbGwi8YM9IxTQIXtxSn8kdDXFfzkQWpxJPIoOXLvheEaE
	RAOoF9nUSd4ja0UnOygEcH4mTjJzr457r12VL5GuVUvCxWQ+KnV5hC6bVHkYPZnecVrs
	goh+CJDie54p+HAPueSmqtFj7boBmyYtQH1/7qp35edG8O5Zvc3Wswg+u6Ll/27ytmyD
	5blrn8PfZDpv+BVTUO6JUNpCME4b+Fd2NE+4BEDYLJr8biMqdij8WXzo8VSQ4QBIWaZD
	i8zdHzdLcvVYqVZRT/qZtuCpw7U+pINFZOG25pHo38nB84kjbsJg09doyEyZbl2TV5s9
	zY2g==
X-Gm-Message-State: ALoCoQkaQR5xZILw7WPKMt48EgEwpU231Ygl++f0LilxrdMfHzapZf80yxxGi0brtAuGPaYcMHpN
X-Received: by 10.52.97.138 with SMTP id ea10mr690820vdb.31.1382972080156;
	Mon, 28 Oct 2013 07:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 28 Oct 2013 07:54:20 -0700 (PDT)
In-Reply-To: <52687085.9060605@mlbassoc.com>
References: <5267D269.2020701@mlbassoc.com>
	<CAJTo0LYaqs00v5XUf+wRtaKytZy1-8VDuPcEyawYU8UXxzPUGw@mail.gmail.com>
	<526803BD.8010106@mlbassoc.com> <526804E7.3020406@mlbassoc.com>
	<52687085.9060605@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Oct 2013 14:54:20 +0000
Message-ID: <CAJTo0LYawHSPoR0zSpuG202-kp9T_=K=eMgD9GqCtH=KAU9+qQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Mesa mess
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
X-List-Received-Date: Mon, 28 Oct 2013 14:54:40 -0000
Content-Type: text/plain; charset=UTF-8

On 24 October 2013 01:57, Gary Thomas <gary@mlbassoc.com> wrote:
> I found the cause :-)  In addition to OE-core, I am using meta-ti on an
> OMAP3 target.
> In meta-ti, there is this line:
>   meta-ti/recipes-graphics/mesa/mesa-omap3-common.inc:PROVIDES_omap3 =
> "virtual/libgl"
> I added virtual/mesa to this list and it now builds again.  I'm not sure
> that this is
> 100% correct though.

That's correct - did you send a patch to meta-ti?

Ross

