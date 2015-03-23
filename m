Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 70AA06AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:35:22 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so194981260pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=em06L4t9Zd4gS3PCdthUYbuUHFpvnKLEqx5xtUxLL1U=;
	b=fQJ5ixBfjiULLZ7MnbnzAy85rf30sgiYtWqonXS6InnouB2YB+oatQU91RrqPtFDro
	P0fo/To/EWT5atBjf3XfWtnhAPoWFWar6Mi10hivbsHZATOXNzkywJyqtNGQMHkQ2EON
	VY4d7GyBEQXcr8GacRMFiXekKLT506uD9bZWBDCWWnjzWZtGVpw9CvsLQ4CiXDWIOsZH
	9vLKG3yIQN7ptGi+vU2EfYAY2ydpny1AWmlyyKo4FRQ6lCPKf8Ms3WBVstsO5h4FszFn
	ublcF0CcSLQeD2EKUu70jIGNe1mei7je5Gb5H5O2PKVVIk+nqXwXETXnz8h/3ZnfCjH6
	5/ZA==
X-Received: by 10.70.101.226 with SMTP id fj2mr174446057pdb.23.1427124923748; 
	Mon, 23 Mar 2015 08:35:23 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:94ea:12e4:3a6e:e534?
	([2601:9:3580:84c:94ea:12e4:3a6e:e534])
	by mx.google.com with ESMTPSA id hk6sm1319718pdb.83.2015.03.23.08.35.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Mar 2015 08:35:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lam6E9+75RYCL8bneDVysbPTUdc8iZKN7QEwb3jAK-KFA@mail.gmail.com>
Date: Mon, 23 Mar 2015 08:35:20 -0700
Message-Id: <A8967493-D647-4676-8AE0-7819E6CA5602@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
	<1425057596-28243-3-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lam6E9+75RYCL8bneDVysbPTUdc8iZKN7QEwb3jAK-KFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Mon, 23 Mar 2015 15:35:23 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F35030AB-2659-456A-9E94-3D5630BE5F05"

--Apple-Mail=_F35030AB-2659-456A-9E94-3D5630BE5F05
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 23, 2015, at 8:30 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Hi Khem,
>=20
> On 27 February 2015 at 19:19, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> use static storage class instead of extern for inline functions
> and remove duplicate definitions as a result
>=20
> There's now a master-next-1.9 branch to start collecting all the =
patches for when master un-freezes.  This doesn't apply anymore, can you =
rebase and re-send?
>=20

Please take them from contrib/kraj/master

> Ross


--Apple-Mail=_F35030AB-2659-456A-9E94-3D5630BE5F05
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 23, 2015, at 8:30 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">Hi Khem,</div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 27 =
February 2015 at 19:19, Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":638" =
class=3D"a3s" style=3D"overflow:hidden">use static storage class instead =
of extern for inline functions<br class=3D"">
and remove duplicate definitions as a result<br =
class=3D""></div></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">There's now a master-next-1.9 branch to start collecting all =
the patches for when master un-freezes.&nbsp; This doesn't apply =
anymore, can you rebase and re-send?</div><div class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>Please take them from contrib/kraj/master</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"">Ross</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_F35030AB-2659-456A-9E94-3D5630BE5F05--
