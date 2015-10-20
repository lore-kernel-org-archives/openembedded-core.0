Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id B68A876FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 07:48:05 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so7742365qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 00:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xfQ5I3ruLtO+DoUZuk4iwBXP4wDweGTq/EKTl/+Zl0Q=;
	b=ZDw+W7DBh6+g/A85iYisODgXXeIScwqBzP0rblORM4fWTOc2lt1DZwyyKgJ8ZsxKWo
	sB/KiowIRk0bsbf6HwXtJxZEr9U0k8xpOIq2sBm7EkvYAHda3jjUfYUZWVoCkwyw3Vee
	+qK+ZjD01lFha3QZ7lDKzAbmtyYe8ZLYuwAOYzuAcbms3JyKZmTS1D4my0Q/z7ODZ8dP
	ktsasNmyYxn1vDef/NiWlwL0HxvEjM/s/q+4xu95kN7iyfYiLQPURqYP9uuRTPBxBKyH
	kpzIG793R0v/jdr8hIfLh6gHeKTVTMd2PEQDFFdjkx5oRe4qNnE48YqB/ECO1kmQSJxk
	obJA==
X-Gm-Message-State: ALoCoQlzT67ElpiPHOpLLBPdeFSrI/A+DJnBhNGC4UUvC2Fj+7xzS42eWSdZfNjv/QVRsHmrA3nr
X-Received: by 10.140.218.84 with SMTP id o81mr2056679qhb.22.1445327285035;
	Tue, 20 Oct 2015 00:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 20 Oct 2015 00:47:45 -0700 (PDT)
In-Reply-To: <75DA7EE8-0981-47CA-BF96-22F6F2596CC1@gmail.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
	<1445291743-6618-5-git-send-email-ross.burton@intel.com>
	<75DA7EE8-0981-47CA-BF96-22F6F2596CC1@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Oct 2015 08:47:45 +0100
Message-ID: <CAJTo0LYtBwfqdSCX17is3p+Hm02_y=WxuA1EA-dzDyUBwuLbHg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Tue, 20 Oct 2015 07:48:10 -0000
Content-Type: multipart/alternative; boundary=001a113734b468bd810522847be7

--001a113734b468bd810522847be7
Content-Type: text/plain; charset=UTF-8

On 20 October 2015 at 04:21, Khem Raj <raj.khem@gmail.com> wrote:

> It already has file in DEPENDS which means native version will get
> file-native on dependencies, right ?
>

Yes, but file-native is in ASSUME_PROVIDED so that won't get built.

If this series (when fixed, I re-broke file-nativesdk in V2)  gets into
jethro I plan on revisting it again in master to stamp out the root cause,
but the race on file in the sysroot causes occasional build failures which
are getting tiresome.  This is the least-invasive way I can find to fix the
races without re-engineering lots of code.

Ross

--001a113734b468bd810522847be7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2015 at 04:21, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":25g" class=3D"a3s" sty=
le=3D"overflow:hidden">It already has file in DEPENDS which means native ve=
rsion will get file-native on dependencies, right ?</div></blockquote><div>=
<br></div><div>Yes, but file-native is in ASSUME_PROVIDED so that won&#39;t=
 get built.</div><div><br></div><div>If this series (when fixed, I re-broke=
 file-nativesdk in V2) =C2=A0gets into jethro I plan on revisting it again =
in master to stamp out the root cause, but the race on file in the sysroot =
causes occasional build failures which are getting tiresome.=C2=A0 This is =
the least-invasive way I can find to fix the races without re-engineering l=
ots of code.</div><div><br></div><div>Ross</div></div></div></div>

--001a113734b468bd810522847be7--
