Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3E8C6612C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 17:12:26 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id n128so101857226ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HXeSHKCWk1Qzk106m8TUvuFHlZ29BlYQFSXBsiVUNNA=;
	b=Mujc7O1hMFOUn3NWlVWJLBI//RZm1ZUQWBLzYh/DBBrN5u7JVjtVWWZQOr1UdtpCwp
	9TOYSr1HlBvf6vTWo1FfbMGgu3YmcITW5n6/2XWwiGxDeDqQNA9ZqoZMC7CFH6F/O8Us
	eNYXhCsqzBYKNFHlFRQb21TNIfBuC7CyT03pwqIX+q7s8tB86WQuJibbQpTD1sx5XP92
	FNEVTPYMUCu+F2csRYfk03arI15GznpG5/EApmpqvpfJyu53tb8ecsZOF7erQnRM/36j
	JvnllTYlrFZbRHFqJUwF75xJcMW8BLuys7IL80dsaRGmZN/ZnEnhaodvwxSehYGysF7c
	phmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HXeSHKCWk1Qzk106m8TUvuFHlZ29BlYQFSXBsiVUNNA=;
	b=farx6fWjhKP6lwKZIYwopg3zONKK7jyZ14vP8glNSXTpmOu/2y7JV3jQTvrhz855aL
	FKPcR8wpauOzfShzy3vPXn9hFg/X/kiEiJ5cIIK6cY7NwQz1jgVzLpKemwJiRFQ6eyAU
	jd7wwjjx9qqBaBfsdPFkKD1ZI44Ur5gY8ZOk8kHX+3Aym0sk4Xocp/20Q1gIo5j8Eprk
	SZSeajkS5Oo7W1rgH/lEg9fg2IO6W8FYxSY50j8wCgNmX5H8GFRh7ynoGM/z1/NWx31c
	J+ffTAOkULY2Ql2n6fZDHusDXMS9FWCHsYgecHx0dCnwB3r6RPz3n12yokKR0nrsrNUk
	rAUg==
X-Gm-Message-State: AEkoousVpzO1Hs1U0FM1NY8VqpXetAg6gKKzTy2XUqNuFiza62HlL0/sOEKxyOrk+RAXz13m+1Nm2PmEquvbPL/D
X-Received: by 10.36.121.206 with SMTP id z197mr6563730itc.22.1472145146965;
	Thu, 25 Aug 2016 10:12:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 10:12:06 -0700 (PDT)
In-Reply-To: <EFF516A8-3F18-4735-B2B9-EB285AE19F87@gmail.com>
References: <cover.1472060412.git.mariano.lopez@linux.intel.com>
	<2ea1073b1b15da51334a47814732d809fc1d4a3a.1472060412.git.mariano.lopez@linux.intel.com>
	<CAJTo0LYmUmp8+KBwdJUYqNDHmxLjG+YUCviE4e+pmXOJGpjJ2g@mail.gmail.com>
	<EFF516A8-3F18-4735-B2B9-EB285AE19F87@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 18:12:06 +0100
Message-ID: <CAJTo0LZ6-mTh_bxQooreSNuZYtxZx6oupSqP6G5TM76h98YhmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Aug 2016 17:12:26 -0000
Content-Type: multipart/alternative; boundary=001a114aa8208b1f4b053ae88068

--001a114aa8208b1f4b053ae88068
Content-Type: text/plain; charset=UTF-8

On 25 August 2016 at 17:57, Khem Raj <raj.khem@gmail.com> wrote:

> this change is needed with musl, so it may not cause issues per se but I
> agree using append is better here
>

It's needed for compiling with gcc6 too.

Ross

--001a114aa8208b1f4b053ae88068
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 August 2016 at 17:57, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>this change is needed with mus=
l, so it may not cause issues per se but I agree using append is better her=
e</div></blockquote></div><br>It&#39;s needed for compiling with gcc6 too.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a114aa8208b1f4b053ae88068--
