Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8D65378427
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 13:00:02 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v205so2127213itf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GkJqTTHtjWd5dYkaG7spMbEUXK0bEhzfjsi6FEcev6M=;
	b=paAd0y4mEClA+zKcaRGqrZ883PN7eTF89rdivBrJET2FvnEijBtLrPtquDw2VG4D5K
	hear+dsV+eYLI8R3E6F5zYtJFhJEiqPsynaijrW1tNFWhP8b0Fg5muB3cmUwkdH2wtIo
	cdZkzLD7BcvPFa/TMFhYy67FtPbLlKOf5/SR1io0Yf4Lnqpp+KPnQmDtZl/CVe2mgaFJ
	PeRPdzhT2B2utH/mGCJH6UMYXD8QxVha/ovJ5dSSui/kq0zmy/fbSDjMjQv0lDV2zihf
	jMiaQrlu4TNU5J3F9xev8E5P65ALHKim67nFUHeDTkDahx7nE1hJbrWW5VoD290cFiDa
	4/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GkJqTTHtjWd5dYkaG7spMbEUXK0bEhzfjsi6FEcev6M=;
	b=PSgCTIucr/WcyVzAN++iH6fbVfJVGklPGBU72nOP4VNcroOcye+m1KzYDa+RlZ4kq4
	Rptrt4NLkRoIUPI9nxecnbZzn/KLURsWyrNLwGZJAaRMRBunwxrXlaHHNjnOJkbdCJJY
	Fr/B107GVfq6mYh173EqOpHjzjMaRzXXIG67bEu1IQkq4UeybeEMQmB8RGxTVtnm/Msd
	UNQFVePbW8BfFe1jQwkLu1t3RlEO7aMH60hzoYXP3xyVp1wk7RZn0+IXRzZizrykEdTT
	kruPSBZXGPGLhpfY8gvAUcoMyHGLrs4yAP+6ZkunWhbdXI8pN1DHtguGCrpQYy1B/FY3
	dynQ==
X-Gm-Message-State: AIVw112WzGDq6xKYiVTcXSw/OXPn2OVnFa6/AQRPn4unF9Vh9JbECWyL
	2nYx40NwyqpFvywH3jxxLHnGHiKmni6/
X-Received: by 10.36.246.204 with SMTP id u195mr655779ith.116.1500642003827;
	Fri, 21 Jul 2017 06:00:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 21 Jul 2017 05:59:43 -0700 (PDT)
In-Reply-To: <CAJTo0LZK1_ge8Q-Ernm9JYpZGX9sX5GQVR=DBHgoNf5KXYEjMQ@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
	<CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
	<CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
	<CAJTo0Lb8YFtgzfX5m+0mBo52Opc7ayzThQFuxcHDqbVKV1qmCA@mail.gmail.com>
	<CAP9ODKreV8ydJ30cWn3C-FeQ-O5uNt-6qp9vB28F1DSFfMW5eQ@mail.gmail.com>
	<CAJTo0LZK1_ge8Q-Ernm9JYpZGX9sX5GQVR=DBHgoNf5KXYEjMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jul 2017 13:59:43 +0100
Message-ID: <CAJTo0LaGekSSwecTCZ4VO5iZuru7dBqSYrUfmUBu=tk=h6jKew@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Fri, 21 Jul 2017 13:00:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c118b2692dc3a0554d3713f"

--94eb2c118b2692dc3a0554d3713f
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 22:34, Burton, Ross <ross.burton@intel.com> wrote:

> I'll bisect that tomorrow...
>

Richard discovered that this is due to enabling Vulkan, so that change has
been dropped from meta-poky.

Ross

--94eb2c118b2692dc3a0554d3713f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 22:34, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
I&#39;ll bisect that tomorrow...</div></blockquote><div><br></div><div>Rich=
ard discovered that this is due to enabling Vulkan, so that change has been=
 dropped from meta-poky.</div><div><br></div><div>Ross</div></div></div></d=
iv>

--94eb2c118b2692dc3a0554d3713f--
