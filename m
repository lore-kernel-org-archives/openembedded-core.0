Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4750C6093D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 20:00:48 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id x49so93593568qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SFjDPg6Kl4TzBfiKFZOa9u90RU2FicfUwnTRQaZ2KKA=;
	b=u3R+7Qx5uBWlO+1xSEtSPume/kjNyN6iHwhpDgEIKpT1uIfcgXyodl4LpJydRzskME
	fjr7r/XWUjFCMjJRO0YqqhBqPTK6RkeOdODqOAvBJm5jfmYUJPtwDVoztnRCu3IFuuAe
	sg5Ll1/fucxnTQ7dleoVX3iu/ClYy5rkI3q/VRFTWCEN0Bgr4vza5MmWJDha1Y6gLcO1
	tJtFYawVJjjLNZthBwqkY3RvP9khggLu3M8qVmVffVtcV9gB//X6+1/17QVF5jq9mZXU
	bN11TqC2PWZ540PG4a84lq0wb6M8e/efdeo3gL0K7RRWg9utXv75ve9A7KewH/zFbBG5
	OFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SFjDPg6Kl4TzBfiKFZOa9u90RU2FicfUwnTRQaZ2KKA=;
	b=Nrb/59O8ylJVeQtVzWhB60IWe487BaSHn2R+OSA/a7LE4BHflTeEaCL8FQlH6ZN7aD
	xUvPmf+X0TvrLrDQlghE3lVs/x+rZtBwCvtVfwDbaBFb7BkepQZCClDlkWXptZzMRLSZ
	WQgzjxMneOeqBQDEgmVht4llbG2V5VPVl5N1/d4oRo1+7yWi81CnaXICLids/2XW6yfY
	R5qy7Fb22lIBZDIbNjfGj/nP2FWncEttxYVgufWKP/kliMMUXTWEuA6JNi7cEUbf1GlP
	EpsS2+38AVw9pbwBopvZZTumutU3uFR+ufDKqqbIHJ8Czib/mai4Ztx53Pf4ochHLaZ0
	IPEw==
X-Gm-Message-State: AIkVDXJjWfK5x4O3XIG5KymHsr9YRILMJc8Ox6PPJaJtmOqpHMuvYIdnLJyOyTcWnuO5aCFlK0n/Xbyin94goZWT
X-Received: by 10.55.47.4 with SMTP id v4mr4695071qkh.77.1485460848712; Thu,
	26 Jan 2017 12:00:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 26 Jan 2017 12:00:28 -0800 (PST)
In-Reply-To: <20170126171129.GA19664@mbabyjoh-desk.ger.corp.intel.com>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
	<1485165540-16646-2-git-send-email-maxin.john@intel.com>
	<CAJTo0Lb8z9QbKF5qebO+54tqPe9rnZEXSd7EHMgXnK6XAZ1Lsw@mail.gmail.com>
	<20170126171129.GA19664@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jan 2017 20:00:28 +0000
Message-ID: <CAJTo0LbBJmYOPygzq5egoe8xj6N7j9rKTdcNky0yQcQPWW5JaA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Thu, 26 Jan 2017 20:00:50 -0000
Content-Type: multipart/alternative; boundary=001a114f41083734a3054704cecb

--001a114f41083734a3054704cecb
Content-Type: text/plain; charset=UTF-8

On 26 January 2017 at 17:11, Maxin B. John <maxin.john@intel.com> wrote:

> For some strange reasons, this build error hasn't occured in my musl
> test build before sending the patch.
>

I suspect it's a libtasn 4.10 + new musl thing, we had an upgrade of both
at the same time and reverting libtasn to 4.9 works.  Thanks Maxin!

Ross

--001a114f41083734a3054704cecb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2017 at 17:11, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ey" class=3D"=
a3s aXjCH m159dbc8836d4c892">For some strange reasons, this build error has=
n&#39;t occured in my musl<br>
test build before sending the patch.<br></div></blockquote></div><br>I susp=
ect it&#39;s a libtasn 4.10 + new musl thing, we had an upgrade of both at =
the same time and reverting libtasn to 4.9 works.=C2=A0 Thanks Maxin!</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a114f41083734a3054704cecb--
