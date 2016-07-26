Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 012E8606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:43:53 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id f6so14395905ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ecrzd8tzuDb1+hjijwxoJONbJlLkgcZd9E6m2E7t4Dw=;
	b=i49XJS2KVnhkCpNsqXWtJ/7iMfjbiKNlhPHNxotRKFrZIVG9Dkt/heqld41ceYcNoH
	x2gGXzFOaWmLIQoH7BIw4MczAVwysFcP/ptfz+UMa7/Qkls5jdNAfezRagePsKjQH5xK
	LnnAorVeUSi2grBbXhFmcsSgrfzYZeCbF7DSvrYumoH3N5u7BbSR6PTSm4ywAD5pQWMg
	cAw15ksuOf0oew9CQHvTz5vF5p7Bc6oKodKcJtY9H02uckEN1Kmh1ce6iaJKr27Mu/Yc
	bLbCv+gGLVG2WMoOv1KTVT6yfBP8kHcn+qxpPQo4kW+7kgRXJ+7kC+HKYaviIoLYYSc5
	F0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ecrzd8tzuDb1+hjijwxoJONbJlLkgcZd9E6m2E7t4Dw=;
	b=Gk+zJ+a1IhtOR9GUc3Y4nLLpEOeL9qxeHNQYI0bYqRZPo8Joz1CxuGinJO4/HdOY79
	5UsXYWizs1b/TzIpUjF7AvNXHBpJjCqz2oyIPKeYKXbI2EYniKtVnxwSi9lf9jcbggi5
	eXo6O/HqdrLQh5Psa+cyW5MRDQORFcbCWHEdxVcYQk+O1p/3bgoMy8VLtvXcs1u6D7eJ
	gka2TtmTCI7EI6NWYtviGVt9Z+nQmj0Dk2sTNpIFE8s6MiLq9HCtkv50CvZqk8NJYurD
	xRwIVGdjm65nt2/ELRsvck7xAvZ5UWTaB8PHpnzYtOuFwFWWGpQu1uJu9VJ8BKJM03UJ
	vwrw==
X-Gm-Message-State: ALyK8tJxkmX95klZfMlmPun7Efb2a+QCbsg0T5hw77rgYAmbK+PI2p0ugsOVJs5iHuJ0bWPm1QpkazJluP83Nvu7
X-Received: by 10.36.20.75 with SMTP id 72mr69039397itg.83.1469544233049; Tue,
	26 Jul 2016 07:43:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 07:43:33 -0700 (PDT)
In-Reply-To: <5796B3A9.4000809@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
	<9b789aaef553ad10b81868af8a32e48ed5d702ac.1469431638.git.liezhi.yang@windriver.com>
	<CAJTo0LaAduh5ep=xgK8NO1MHc0R1Cr-Hwqe8Ut1FrkCviv+Rpg@mail.gmail.com>
	<5796B3A9.4000809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 15:43:33 +0100
Message-ID: <CAJTo0LZ3oMquMKUZSJe=8KHuiS-M8VAgp=FHu56a3ECXhohAww@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libinput: fix udevdir
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
X-List-Received-Date: Tue, 26 Jul 2016 14:43:54 -0000
Content-Type: multipart/alternative; boundary=001a11446942fe35ed05388aed28

--001a11446942fe35ed05388aed28
Content-Type: text/plain; charset=UTF-8

On 26 July 2016 at 01:49, Robert Yang <liezhi.yang@windriver.com> wrote:

> I'd like to update bitbake.conf to lib/udev (no rules.d) if no objections,
> then we can drop this patch.
>

Just actually looked at what libinput is shipping.  :) This seems sensible
to me.

Ross

--001a11446942fe35ed05388aed28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 July 2016 at 01:49, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":311" cla=
ss=3D"a3s aXjCH m15624adf3faffbf9">I&#39;d like to update bitbake.conf to l=
ib/udev (no rules.d) if no objections,<br>
then we can drop this patch.<br></div></blockquote></div><div class=3D"gmai=
l_extra"><br></div>Just actually looked at what libinput is shipping. =C2=
=A0:) This seems sensible to me.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a11446942fe35ed05388aed28--
