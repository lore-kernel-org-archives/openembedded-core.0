Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E12965C91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 10:33:59 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so277029qcy.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 02:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VfKHnSLtxkIQFS719EYYX0s68+8+KXnS7SvCkiWsZFU=;
	b=h1cNqjqcvfbCgzCZV/+VXbfMgoZOQWyLsF8pD4axJlAw7VRV7Nxrl5roKCyAvYzMdc
	Jt7CPu4yzbGtWjwo70uadJtc2f6+EZ60ZA87OJN4P8P1f/4cpGQytreNRKWazkSAXNxE
	Du2EgU60DQ86IaowHCdLHb0tq960hNG8x4Mbhq5pkMkKg/qSVPFn0xZG23IQ/HNkpVF9
	ta6GX2tWgukh/q9813BT9rzljqOOBINCmNkJ/Nh5iSvMViYN4tQ/5M9WuX7mcCprTIu0
	nxNJzKtyQFILl4A7Cev5abCP/FvUDkX/WfmCgsvNrXmcWvMy3ZA54x0wumxJ6s4wZSCQ
	qWXw==
X-Gm-Message-State: ALoCoQnInzFb6yoKWdfPgICXP4HbswLXhI2eG+6adN1xBKRIkf4uf32YS5bAbXidMdhme+4sE49y
X-Received: by 10.224.103.200 with SMTP id l8mr86050784qao.52.1415183639917;
	Wed, 05 Nov 2014 02:33:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 5 Nov 2014 02:33:39 -0800 (PST)
In-Reply-To: <CAGNsrLCJF8KqQhRLEVA9VhMMbs6BexPM43+cDFdYd+Qj6ky4Dg@mail.gmail.com>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
	<CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
	<CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
	<CAGNsrLAPfA4=UH0GXkPeAmOx-GbJ7pnNF3gDaRixwNhNKw41og@mail.gmail.com>
	<1415116498.23396.33.camel@ted>
	<CAGNsrLCJF8KqQhRLEVA9VhMMbs6BexPM43+cDFdYd+Qj6ky4Dg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Nov 2014 10:33:39 +0000
Message-ID: <CAJTo0LYDvuydkP7AOzoETiRnfByKzRYBXjbNNU0sqV22oyTs6Q@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Wed, 05 Nov 2014 10:34:04 -0000
Content-Type: multipart/alternative; boundary=001a1132e9d2266f5005071a1e27

--001a1132e9d2266f5005071a1e27
Content-Type: text/plain; charset=UTF-8

Hi,

On 5 November 2014 10:20, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> It explains... the issue is triggered only if libtirpc is built before ltp.
> It isn't the case when, on a clean build, you do only bitbake ltp or even
> when you build core-image-minimal before ltp, without mentioning our
> builders don't pull libtirpc either.
>
> Patch v2 on its way. libtirpc wasn't detected until this latest release,
> hence network/rpc test cases haven't been built until now and they are
> broken upstream. Until, it's fixed upstream, I added a knob to disable
> tirpc on configure like it's already done for numa. Fixing properly the
> issue upstream might take a bit longer unfortunately.
>

Thanks Fathi - the autobuilder builds so much (and fails in testing runs so
often) that unless the fix is blazingly obvious it's a far better use of
time to pull the patch and tell the submitter that it's breaking.  I'll
pull V2 into my next run (which has two failures without an obvious
culpript, annoyingly).

Ross

--001a1132e9d2266f5005071a1e27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 5 November 2014 10:20, Fathi Boudra =
<span dir=3D"ltr">&lt;<a href=3D"mailto:fathi.boudra@linaro.org" target=3D"=
_blank">fathi.boudra@linaro.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div>It explains... the issue is triggered only if libtirpc i=
s built before ltp.</div><div>It isn&#39;t the case when, on a clean build,=
 you do only bitbake ltp or even when you build core-image-minimal before l=
tp, without mentioning our builders don&#39;t pull libtirpc either.</div><d=
iv><br></div><div>Patch v2 on its way. libtirpc wasn&#39;t detected until t=
his latest release, hence network/rpc test cases haven&#39;t been built unt=
il now and they are broken upstream. Until, it&#39;s fixed upstream, I adde=
d a knob to disable tirpc on configure like it&#39;s already done for numa.=
 Fixing properly the issue upstream might take a bit longer unfortunately.<=
/div></blockquote></div><br>Thanks Fathi - the autobuilder builds so much (=
and fails in testing runs so often) that unless the fix is blazingly obviou=
s it&#39;s a far better use of time to pull the patch and tell the submitte=
r that it&#39;s breaking.=C2=A0 I&#39;ll pull V2 into my next run (which ha=
s two failures without an obvious culpript, annoyingly).</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1132e9d2266f5005071a1e27--
