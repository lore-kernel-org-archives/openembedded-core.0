Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1679.1792434701448732287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=IaU3o7Jo;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=qCy14Q/p;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 729C61400026
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:31:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 14:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792434700;
	 x=1792521100; bh=MunWG4xJPFVDAeGFt1Q0c2AQOPa8C2x/PcGUUNoBOko=; b=
	IaU3o7JoN69OcIUDJIvZVIDVtnUMrMoiKFauWT56bcB4RjTegm699+UbBQBp/k5f
	B7Fslo3FM2UQvLvFoWfTsGeX2daQl0U8kTSMbH95evdJLvmiSDwb9c144zVlgBlN
	yAnvAa6v0JR+tsrYs1D+0VUzAE+YXgsyOdH7yzEtGTZqBBzLRtFMUQXeAVf+g93N
	GCLaD7q46ZR8cl5cg7AaEYXkY6jqUnOpWprvWlFKVyImoGPVuzblrFsV1+lugmpZ
	Xo6O+fXRcuzocYrM6uBpJh1OAsXpjpazPXy/DEzmgpggCF703eqVU1oaiVJt5laX
	voU11Hnu0NOy6FKfFa8myQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792434700; x=
	1792521100; bh=MunWG4xJPFVDAeGFt1Q0c2AQOPa8C2x/PcGUUNoBOko=; b=q
	Cy14Q/p1IgBi76NVjQ7r4X5ZtZCbREP2RuC1F+3tIP48kq+NV/3cIv8RxItdXxSa
	JU7CdLLz/wZmga/wHX+9EgpRK9Yf9uYpV31HkWRqk4DzfdZwKX4OpAHwC9VA5QPM
	a3dBTj8BviqT3HhbCoVGbo2SGGX3yfgATBuYfdzQN6JefVYRV6XlmsGVKjI2en/f
	+F+GZ/HihUujjRAhPN1wAaFixUiXVGKLi5DMt83n/WFyvdkmLE8359Z680oXQMu0
	u040AMHHU6/WMtJJrWv47FEoVPDmWuW8oZaa4TOcxACsC90nWqeQfT2P4CmVIojd
	elMvT13kZYB6D3Zt/dfHQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792434700; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:lNTFQInbZEGE7KgnXR+4QbhA8Ab2CyHhzKJjdy4Z+ZQKlfY
	HU5dyvrn6SB7Stppwh1doZrXGohWFz5rQahAUE8x6HZCUMe2tqNgJOaJMo1tTphH
	dBf5PE3d838mxgZ1QVnnT3dryF1ZUf/fv/M809Vu/9PdeYIxzIujnlTgOUdoCfRo
	imxWlxFmA6kWFqAlcU450r3TAZwSQ8PjeQzK2kH9Hbzy32PykxXAKiKUMonMYaIh
	aY/ex/ANrkw5ji04fve+/ORIeZMaq8/cOfbutnP8jtgCefExX/N2ngR5eIpyJ0WO
	+eBSaDVt+rkn3pdIrMrkbAegn+UCldyrqafT3Dw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:xgFMWMtQCgA0t7/D+idNYRzXjPxSlWmQ2wN/ljqtFBk=:MunWG4xJPFVDAeGFt1Q0c2AQOPa8C2x/PcGUUNoBOko=;
X-ME-Sender: <xms:DGLWah2kOdTTLhTbVzK0mkEu2-blOPiigi2S_F4Pg1Qes2cB976owA>
    <xme:DGLWavjlikheWKt9SyBBp1vHLUVcsjVjFLjCOXDdHSkYxCCkekR03X2OIbq012d2u
    OpL5E3l57RIxoroEwIdWD2c2eiLlNGRuEErid9Z2BfIhzgobtFJU6z->
X-ME-Received: <xmr:DGLWavTC3vIAH80bkGpm0on_7ogWjCPNyhH5qoQ1P0PPfbdmjtL1bVSfksvmANLZNndygNHyDOKfxp5m8NA-elRTlmly9K44QXNe>
X-ME-Proxy-Cause: dmFkZTE1V0GI2iR7juWcwEfK51MCKu9Qzn0/T1qBemEeqfashTe2z6tuj65VoIC1Kib9DJ
    uTH0boC4qbf6DLESCk3ZwQfP9D3o0Y/JBMriajvIWysO8HaeclNAJ8tMx/heWKkEd7e8Nf
    d6ZA2/sx3trftNftLToFRb8Pb078PKwtswDGIwp8dVn6XNPYX/U9k4TORboxO3EJ0qT9wE
    OnXGSiJZzmwHWF1PJnlEvFpormBA/aHBgoNRv58TqOZJfzdQEG0Th5rrYxl3fhMDEoTXvp
    bFRiMoMIj/Dig8W04yePTQDYIlxPVyoP9Ht3PNRm9skpT3wRBuqKP7IL4mAUBfdwfaOlTL
    62/cnGaedjR7MkWLgI1gnNQJZJmml+M/LkGjzBJ3ROZlrTlTrMKTyeyT62YoJJMRYsukYC
    HdPvYxNOse2Forq/4AZGe6/GYSpld+6RW8r88/rHmiBgu83ddF3cs97UC+0LOCMam50Q6/
    V+Z2QvwbfQrHoijuA/fT5/ebSUdlDArVQWV0LdBNFTxAn71PCgGKS5tPZhX3vd0JYaVimV
    CZjcD8dlDYMZpwT9wE/Po+DW3d9id8HP8YwFrY4f+8Xg+I7tic2opJY/at+V/X9Qsf1v/y
    kCg2lb0jukVFZ5TxSeOZI6e3O+fvjS2WBQx8va2jlQ6dRvLcktQK8WGZEJow
X-ME-Proxy: <xmx:DGLWaoi9usWoQwdrRjKhXf8Nz1Qzh70GvbHmqbGgsIipTgiTymfuMw>
    <xmx:DGLWan5ejAovL8HeQKwo9vW4FcZ35bp0FhLz4dNRkapoFp2yLEVENA>
    <xmx:DGLWatDwYgUFMpidu1lfMtj1NiVtwOhzoTpF6DK8zfMuVI-_ewHdWg>
    <xmx:DGLWamZyDv3A4GUD96VSo7YU_nZK8eugZv9ZTJZHY-mXeJ-uHuSxRQ>
    <xmx:DGLWat09A5HsA4JHzlFziSkxdtCGeEnLAaQCuGNYE0FIIU5I-etvZD0w>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 14:31:39 -0400 (EDT)
Message-ID: <17640d3d1899c46bf4d545843f6c5f93316ded57.camel@pbarker.dev>
Subject: Re: [wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
From: Paul Barker <paul@pbarker.dev>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <hthakar@cisco.com>, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 19 Oct 2026 19:31:38 +0100
In-Reply-To: <b27fd2e45f37d9d49e311c457d1684ba03dc3543.camel@pbarker.dev>
References: <20260917105551.76512-1-vanusuri@mvista.com>
	 <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
	 <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
	 <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
	 <546192.1789655591562202413@lists.openembedded.org>
	 <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com>
	 <4ccc62a34b7c0ff418951a62c873daa589e45683.camel@pbarker.dev>
	 <1614257.1791448822431275973@lists.openembedded.org>
	 <b27fd2e45f37d9d49e311c457d1684ba03dc3543.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 18:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248203

On Thu, 2026-10-15 at 21:10 +0100, Paul Barker wrote:
> On Thu, 2026-10-08 at 01:40 -0700, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> > On Tue, Sep 22, 2026 at 01:23 AM, Paul Barker wrote:
> >=20
> > >=20
> > > On Mon, 2026-09-21 at 15:56 +0530, Vijay Anusuri wrote:
> > >=20
> > > > Hi Yoann, Paul,
> > > >=20
> > > > I checked with the rsync upstream maintainers regarding the securit=
y patch
> > > >=20
> > > > branches and the possibility of an archive/tarball.
> > > >=20
> > > > They confirmed that v3.4.1-sec-patches3 and v3.2.7-sec-patches3 are
> > > > official rsync security-maintenance branches. They have now also
> > > > published:
> > > >=20
> > > > - v3.4.1-sec-patches4
> > > > - v3.2.7-sec-patches4
> > > >=20
> > > > These branches contain the security and compatibility fixes applica=
ble to
> > > > the respective older release lines after *-sec-patches3. Both branc=
hes
> > > > have
> > > > been tested against the refreshed stable testsuite.
> > > >=20
> > > > Regarding the archive/tarball, the maintainer clarified that they d=
o not
> > > > plan to provide release tarballs for these security branches. The b=
ranches
> > > >=20
> > > > are intended to be used as reviewable Git sources from which downst=
ream
> > > > maintainers can cherry-pick commits or construct their own patch se=
ries.
> > > >=20
> > > > Based on this, can we switch the rsync recipe to Git and use the
> > > > v3.4.1-sec-patches4 & v3.2.7-sec-patches4 branches for Wrynose/Scar=
thgap?
> > > >=20
> > > > This would allow us to consume the upstream security and compatibil=
ity
> > > > fixes directly from the maintained security branch instead of carry=
ing the
> > > >=20
> > > > large 34KLOC patch series.
> > > >=20
> > > >=20
> > > > The discussion with the rsync maintainers is here:
> > > > https://github.com/RsyncProject/rsync/discussions/1095
> > >=20
> > > Hi Vijay,
> > >=20
> > > Thanks for checking with upstream. It seems a bit of a strange way of
> > > doing things to me - I am surprised these aren't further releases in =
the
> > > 3.4.x and 3.2.x series. Or at least they could be 3.4.1.x and 3.2.7.x
> > > releases. But if this is the way upstream want to handle things then
> > > that's their call.
> > >=20
> > > We do need to discuss how this fits in with our policies on LTS
> > > maintenance. We will get back to you soon.
> > >=20
> > > Best regards,
> > >=20
> > > --
> > > Paul Barker
> >=20
> > Hi Paul, Yoann,
> > Could you please share if there are any updates on this?
>=20
> Apologies for the delays due to conference travel.
>=20
> Debian have decided to upgrade to rsync 3.5.0 on their stable release
> series, with additional regression fixes backported from 3.5.1. There is
> an explanation in the Debian rsync NEWS file [1].
>=20
> Based on this, Yoann and I think Yocto Project should do similar. This
> will need discussion with the TSC, probably next week. I'll follow up
> after that.
>=20
> [1]: https://salsa.debian.org/debian/rsync/-/blob/debian/trixie/debian/rs=
ync.NEWS

Hi,

The TSC has discussed the state of rsync on wrynose/scarthgap. It's a
difficult situation, on one hand we have a set of backported CVE patches
which are large, complex and impossible to review & maintain
effectively. On the other hand we have a new rsync release which had
known regressions and is definitely not a risk-free upgrade.

The TSC has concluded that taking the upgrade is preferable here.
Neither myself or the TSC are particularly happy about that, but it's
the least-worst option on the table. It does not mean that the stable
branch rules are being relaxed in general, the preference continues to
be for backporting individual CVE fixes or following a trusted upstream
stable branch which aligns with our stable branch policies. It just
means that in this individual case, the TSC thinks the risks of taking
the rsync upgrade are outweighed by the risks of carrying patches
totaling over 34 kLOC or leaving the CVEs unpatched.

Please submit patches to upgrade rsync on both wrynose and scarthgap. I
would suggest upgrading to v3.5.1 to align with what we currently have
on master and blacksail and to ensure that we have the fixes for the
regressions introduced in v3.5.0.

Best regards,

--=20
Paul Barker

