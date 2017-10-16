Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1C62B60807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:01:52 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o135so496389itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iJi3S1+1Z8AVxkztCrdhiP5xSYNs9BpDLIEEZF5aj1s=;
	b=DEbprR4Ex3M8AHC/MvmkCy/iGM3QcIRWDIUPsJUpY/cjA5LScNqGCJTrpv8uU5ZmYI
	Ue/G0dIUvOF+PS8uaqCWwLUxL9jK6V8LZG03asoRc4aRh5FHOlgonnbJeFwFoLCCzROU
	4F+gLm6FKq+MkN4NGi/chgixwV0h8n6hldVh8oEGmaScBbO8hdONtQCCHrP7l5u3FY/1
	y7SHRmELMcMiKAhcI3dzFQpeDoFpeYa8+cbgBuznt1Mc3Rj00hMjNesHgQVPOV7g5Dpr
	HEd/bKQBC6K0od/22JMU3WsFxgMBRUtll16nNopKHYqE4AQWw7pjP0cBHbw24Cqj8PmO
	YEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iJi3S1+1Z8AVxkztCrdhiP5xSYNs9BpDLIEEZF5aj1s=;
	b=aysV1FK56Ufw4c3d5lVXrYp91SVD8MkKsbo4ezBQpfgCMc8zF5rCc/cLv5CdIYLKTV
	3cWkdu4rM2ujyx8ZSwY2BKz7H+/HKiSbX+mDyOcnTgMi4vt9Gb4pQxABgLkUMiRFWTeL
	gvNRFi8DE2AYSmx21WYw+CsED6WpeH/dqYyFEQJcVucrtDZMMJlEVxWayBGmXUzwtvwk
	8xdhrHkNitw2vh7qD9Kbs/fiAR6AOwEDV4rMrkdpApLEdz+azqOwtisBo9Ws/KdUxiv/
	2mDBKh46u+iqTXY5sbv32wGL78JRW7s5u2dOUFAuzq3tFaZc9x4GZAVD9FunWZ9JlhDL
	Rdvw==
X-Gm-Message-State: AMCzsaUZCHgY7lVyjTNC8/C6gIDz7I6P4/7gDqrGnJfos8lbp8jPxdGM
	MoEnDQpS1g32UrN+HgbCTA2Br3GlnObZqEmyOMnp3A==
X-Google-Smtp-Source: ABhQp+Tr9VUqOFeON5mEBx1NT9UoTBbQCRuK+FTS/hoZE8MmGDuXEQDtTldDgTmB8HmWvB/r8jkjQdh7Qkoe2u0NtXc=
X-Received: by 10.36.25.4 with SMTP id b4mr390005itb.108.1508148114111; Mon,
	16 Oct 2017 03:01:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 03:01:33 -0700 (PDT)
In-Reply-To: <CAJTo0LYu+si876jGp3fq6DG8S9bHj+VjK5xC60fQN300dT2iLQ@mail.gmail.com>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012191104.GJ9221@denix.org>
	<CAJTo0LYu+si876jGp3fq6DG8S9bHj+VjK5xC60fQN300dT2iLQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 11:01:33 +0100
Message-ID: <CAJTo0LbStdr0tCsF5gETBrHfGUt44TWpN4BOq2FXd2fXSBpiPQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] perl: upgrade to 5.26.1
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
X-List-Received-Date: Mon, 16 Oct 2017 10:01:53 -0000
Content-Type: multipart/alternative; boundary="001a1143d8269c5242055ba718d9"

--001a1143d8269c5242055ba718d9
Content-Type: text/plain; charset="UTF-8"

>
> Leo, have you tried an oe-core world build with perl 5.26?
>

So I threw this at the autobuilder.  The grid looks really bad but it's
entirely git's do_install failing:

http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=a128781a065ce3718c4db2d4629672abd0b52b91&type=commit

Ross

--001a1143d8269c5242055ba718d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><div>Leo, have you tried an oe-core world build with perl 5.26?</d=
iv></div></div></div></blockquote><div><br></div><div>So I threw this at th=
e autobuilder.=C2=A0 The grid looks really bad but it&#39;s entirely git&#3=
9;s do_install failing:</div><div><br></div><div><a href=3D"http://errors.y=
octoproject.org/Errors/Latest/Autobuilder/?filter=3Da128781a065ce3718c4db2d=
4629672abd0b52b91&amp;type=3Dcommit">http://errors.yoctoproject.org/Errors/=
Latest/Autobuilder/?filter=3Da128781a065ce3718c4db2d4629672abd0b52b91&amp;t=
ype=3Dcommit</a></div><div><br></div><div>Ross</div></div></div></div>

--001a1143d8269c5242055ba718d9--
