Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E017775C76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:38:09 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so2918946qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vhyXPk9yfZidgZM2jEfDI2Ta0zwNr+JZoY1K4j+8ioA=;
	b=JTQOiUrg7hlRyrshhtP98WwZUnQpsST06cKjpVOyUXM5S+gOS1rsKCjtRmIWwry3VA
	fdtweySjYkUQ6BQuGQpT3fFCKfuGdbk7HHOMvw9tgXdPf1Kx6J5t0qYsRdNUAe99cT4F
	zPv7T0RBvqJcq9npRJoUD5+f97J460ae1f47Vexp4hK/b5kDUGjfq7yYi6UFMLdPQtDH
	j4qye+HqGjBm7FEu+RQMlYntX8rnRmddJySs+nDnsltb0i1iqnQGe8OVHujmKJ5Bpiur
	biAwd5bq9EpqCvfdsAu3YtM97dtfDG/2tqUiVukqCXGjitVz5193F9ei9gMdR7WTXfZb
	H1ww==
X-Gm-Message-State: ALoCoQl0c2AjjKjJyerbYuFfyjVAhzWMjLZsIspBlSyurn6t5oSweaoe6sRVsJrSlzhxwlySs19m
X-Received: by 10.55.15.129 with SMTP id 1mr42170130qkp.29.1435660690080; Tue,
	30 Jun 2015 03:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 03:37:50 -0700 (PDT)
In-Reply-To: <CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
References: <1435623417-18133-1-git-send-email-juro.bystricky@intel.com>
	<CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 11:37:50 +0100
Message-ID: <CAJTo0LaCx+u8F7dZjrTveCmAHtSyYsHrDfQFJjPJc9woXTOa1g@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: OpenSUSE 13.2 configure error
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
X-List-Received-Date: Tue, 30 Jun 2015 10:38:11 -0000
Content-Type: multipart/alternative; boundary=001a1146f10073732b0519b9cd4a

--001a1146f10073732b0519b9cd4a
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 11:32, Burton, Ross <ross.burton@intel.com> wrote:

> The patch should probably only be applied for native and nativesdk builds,
> as I suspect that's going to break a target build quite badly.  Also, it
> needs signed-of-by and upstream-status (inappropriate, I imagine) tags in
> the patch header
>

Richard just pointed out I'm wrong here - apply to just native and not
nativesdk.

Ross

--001a1146f10073732b0519b9cd4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 11:32, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
The patch should probably only be applied for native and nativesdk builds, =
as I suspect that&#39;s going to break a target build quite badly.=C2=A0 Al=
so, it needs signed-of-by and upstream-status (inappropriate, I imagine) ta=
gs in the patch header</div></blockquote><div><br></div><div>Richard just p=
ointed out I&#39;m wrong here - apply to just native and not nativesdk.</di=
v><div><br></div><div>Ross</div></div></div></div>

--001a1146f10073732b0519b9cd4a--
