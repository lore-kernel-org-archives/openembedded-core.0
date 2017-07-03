Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB21671AD4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:44:47 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id v143so59407217qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3qBSYSGKDGHtlh6HBharfxo3I69cjwxeewNUasp+PpQ=;
	b=IjFjzS8pq7zd85tPQuQvE9yXuT1aZqB1Shp/QpbULpB5au/06PlEQBCsX0BfqWL2fm
	WCkKVE7mPLdMWNcNuwRe+RGQ7pqQT2EMy3LfQLDmz/mli08Ng4+hg8uR/76wVjjQNC7h
	QccTFnHrjeQH5dKh+pllV93KVn8AGTgKIJjI/EVX3y98BrNoJTUNFpjPb9kEXZxZ2yma
	TWRTIqpViyU4oxMh3Kdogf3MnTeqC8osy3XpR2aw7Ckf/YvzWzsK7w3YXoSynxdrageZ
	pFDODwI7UYr9ErE3tXGzQVOWP5Y4AokY1jDffidOWkaN1eG9TQGdtNp8GktgHsuxy/m8
	4vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3qBSYSGKDGHtlh6HBharfxo3I69cjwxeewNUasp+PpQ=;
	b=Ap+ICGBUKeJcLJY7gPvfnK3hjYQkwFuJQRVRVMN9NHvxWnZVu4jW0uqZLu1L8w30I0
	BzwSyZrSD3IxRyVdrlKm+tIBs8xMhLlpjdFBLuk76mx0Ht5npZWG13hR5w5UPkpB2d6f
	rhb8+Xyjbe3i2mNEi+vJN2kdWSm1NyX0CmtYw5GTS1eM5Jadr0948dfE3GHRgZ8wo81z
	HB1aVAX5OwIdAo5e9lNZEVDbO7SmrEMbUFDNsSy/01oDk9vRTUjYn/EPFk3CVfs6HeaC
	RFgl4lAA8AMJqv23Gn3V0/CE4DhWU9jppJiiodcLiy5a4QpFP4HikKpW/PUKwdSmGy1r
	aeLQ==
X-Gm-Message-State: AKS2vOwdedABHG+2fqD/nSSnTCDsjWh/aPuEEzjE/QzMSfCqX98Z3HBJ
	AU/KmvJMJGaxRVSC1MG/m/Wni3nuEK4z
X-Received: by 10.55.31.162 with SMTP id n34mr38584760qkh.46.1499082288352;
	Mon, 03 Jul 2017 04:44:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 3 Jul 2017 04:44:27 -0700 (PDT)
In-Reply-To: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
References: <017fe027-8557-dada-f6f6-e112faee58d4@Net2Edge.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 12:44:27 +0100
Message-ID: <CAJTo0LYpa+Q6yVRYfriUVt+oV4fZkmSb=HAy01zVs=wT-ZxOEQ@mail.gmail.com>
To: Thomas.Thorne@net2edge.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: New Recipe for ser2net with IPv6 Support (v3.0 & v3.1)
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
X-List-Received-Date: Mon, 03 Jul 2017 11:44:47 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f84961040553684bff"

--001a1147e5f84961040553684bff
Content-Type: text/plain; charset="UTF-8"

On 30 June 2017 at 08:30, Thomas A. F. Thorne MEng AUS MIET <
Thomas.Thorne@net2edge.com> wrote:

> I am creating recipes for ser2net_3.0.bb and ser2net_3.1.bb as part of
> my testing.  I would be happy to submit the files as patches.  I am
> currently working on krogoth but could submit the patch against another
> version if preferred.
>
> I have CCed the meta-oe maintainers (on my first message attempt but not
> my second)
> as that the is the layer that holds the ser2net recipe at present.  I hope
> that was not a mistake, please
> for give the extra email if it was.
>

If the existing recipes are in meta-oe then submitting an upgrade to 3.1
(assuming thats the latest version) to meta-oe would be great.  This would
have to be against the master branch, and in general we don't like to
maintain many versions of each recipe as only one of them will be tested.

Ross

--001a1147e5f84961040553684bff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2017 at 08:30, Thomas A. F. Thorne MEng AUS MIET <span dir=3D"lt=
r">&lt;<a href=3D"mailto:Thomas.Thorne@net2edge.com" target=3D"_blank">Thom=
as.Thorne@net2edge.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":u9" class=3D"a3s aXjCH m15cf7e9311949670">I am creating rec=
ipes for <a href=3D"http://ser2net_3.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ser2net_3.0.bb</a> and <a href=3D"http://ser2net_3.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">ser2net_3.1.bb</a> as part of<br>
my testing.=C2=A0 I would be happy to submit the files as patches.=C2=A0 I =
am<br>
currently working on krogoth but could submit the patch against another<br>
version if preferred.<br>
<br>
I have CCed the meta-oe maintainers (on my first message attempt but not my=
 second)<br>
as that the is the layer that holds the ser2net recipe at present.=C2=A0 I =
hope that was not a mistake, please<br>
for give the extra email if it was.<br></div></blockquote></div><br>If the =
existing recipes are in meta-oe then submitting an upgrade to 3.1 (assuming=
 thats the latest version) to meta-oe would be great.=C2=A0 This would have=
 to be against the master branch, and in general we don&#39;t like to maint=
ain many versions of each recipe as only one of them will be tested.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1147e5f84961040553684bff--
