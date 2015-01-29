Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 30F1160132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 15:33:20 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id rd3so40316319pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 07:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wimw/ayoXbsk1mkXhtim0pepsZLb9/hR+/6bzOKhKos=;
	b=sk+Qw/9uloMLb1xsvbIp4POzwA8uilzP7AfeRmCt7sWwM5Z4Z3OZ5tU1mbNBUj7iHj
	k3/USVckuiSAsbUxXjmtZmEiUGgYoKrsk0jghVl+pkEGpNj2rcE32mqLv+Nl9AYrZ0KS
	7x1wXls6NKVPW9MwMSzHsytup7c724B2ovOZx3ShCc/vNwsMSgnz8iKPd3BsoJcbscYj
	2XlQM9mo/ohbwdkhGx6aOnrOy5auzlpUYyORgcdOAUlVtMjCdCCF+28qWB+juVsIW/vB
	YDWdvC/d+KZqTXmU7IfYHerJPwzsYeI+T6MiLo3osMa20d4ZjJyI6ppF8gyX0/KgKUQl
	0FzQ==
X-Received: by 10.68.222.40 with SMTP id qj8mr1481484pbc.51.1422545602119;
	Thu, 29 Jan 2015 07:33:22 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:3835:5cc2:4b2a:c996?
	([2601:9:3580:84c:3835:5cc2:4b2a:c996])
	by mx.google.com with ESMTPSA id fu1sm8094989pdb.80.2015.01.29.07.33.20
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Jan 2015 07:33:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYmsTWJjH4-n-n2EvP60pOSNABkMF0sXMCY_6UdBKJuXw@mail.gmail.com>
Date: Thu, 29 Jan 2015 07:33:19 -0800
Message-Id: <E6CE412F-F02E-4565-AB38-442AA629FF43@gmail.com>
References: <1422507259-14758-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYmsTWJjH4-n-n2EvP60pOSNABkMF0sXMCY_6UdBKJuXw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Backports fixes to 216
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
X-List-Received-Date: Thu, 29 Jan 2015 15:33:28 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E2B7033F-87A1-484A-A649-060F4E7C7B2D"

--Apple-Mail=_E2B7033F-87A1-484A-A649-060F4E7C7B2D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 29, 2015, at 2:59 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 29 January 2015 at 04:54, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Fix systemd-timesyncd assertion
>=20
> when networkd is disabled then we now do not
> create /run/systemd/netif/links but timesyncd needs it. So lets
> manually create this file when networkd is disabled so timesyncd
> can still function
>=20
> When enabling systemd-timesyncd we need systemd-timesync user
>=20
> Backport patches to enable timesyncd when resolved and networkd
> are disabled
>=20
> replace the resolv.conf symlinink patch with a proper backport
>=20
> Awesome, but the patches need you to add your Signed-off-by tag.
>=20

They are straight back ports and have original authors sign-offs
so someone can bug him/her in case its needed :)
secondly I have added upstream-status which will make it easy
for someone working on systemd to get an idea about the patch.
none the less I will send a v2.

> Ross


--Apple-Mail=_E2B7033F-87A1-484A-A649-060F4E7C7B2D
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Jan 29, 2015, at 2:59 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 29 January 2015 at 04:54, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1ym" class="a3s" style="overflow:hidden">Fix systemd-timesyncd assertion<br class="">
<br class="">
when networkd is disabled then we now do not<br class="">
create /run/systemd/netif/links but timesyncd needs it. So lets<br class="">
manually create this file when networkd is disabled so timesyncd<br class="">
can still function<br class="">
<br class="">
When enabling systemd-timesyncd we need systemd-timesync user<br class="">
<br class="">
Backport patches to enable timesyncd when resolved and networkd<br class="">
are disabled<br class="">
<br class="">
replace the resolv.conf symlinink patch with a proper backport</div></blockquote></div><br class="">Awesome, but the patches need you to add your Signed-off-by tag.</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>They are straight back ports and have original authors sign-offs</div><div>so someone can bug him/her in case its needed :)</div><div>secondly I have added upstream-status which will make it easy</div><div>for someone working on systemd to get an idea about the patch.</div><div>none the less I will send a v2.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_E2B7033F-87A1-484A-A649-060F4E7C7B2D--
