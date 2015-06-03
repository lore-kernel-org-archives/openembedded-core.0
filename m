Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id D10A16AC12
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 20:05:43 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so9276959qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=B3a8A9Ciq9eN6L920xcxDYtOpXg4UtQpGoF1vPlYUds=;
	b=PmL6ufmJ9lX5OHxo8XAMB739tWm8FcOGFW4JYIG8KurjVTWZkwd6GPX6ce62mMhcXr
	Me20d23JinB+eTiI0cVZ2TIfPetNUGqLwJIRsO8ijvOd/D48+dVaLJZtPhzJzPGIhha3
	pHXWkWDqa/cJi9zfwvlDOEwc9g0OsXg1yHaJyeqp1KgFdv83Ph0OjK9BtP5KkbIFrVjN
	T8C/EtVjkyJplTM1rO+XH0ueeUcHl6xy1oHg+MoeZbD3iFgiYnJ91XA7YoTxS/smpHjx
	lN4FWNjDGmv0earauWpNfnFWoTKWyRbor9211wfVnFZu+mdNzUQrxDjGGR2nvEw1CskY
	jA2A==
X-Received: by 10.140.47.71 with SMTP id l65mr22337883qga.5.1433361944619;
	Wed, 03 Jun 2015 13:05:44 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:d1e4:9e90:3fdd:134b?
	([2601:9:500:ece:d1e4:9e90:3fdd:134b])
	by mx.google.com with ESMTPSA id 20sm999167qhf.14.2015.06.03.13.05.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 13:05:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LafGz=hMpwRh7G6+NkRO8b=kB7vMjhVfXAC2OMS0EE==A@mail.gmail.com>
Date: Wed, 3 Jun 2015 13:05:38 -0700
Message-Id: <EDB67BDB-C6A6-4789-875B-57283E0F05A3@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
	<CAMKF1spaRQoh1_uEFOOFN9fOwAwEdRXC8pqusSvzfVpPs9hU_A@mail.gmail.com>
	<CAJTo0LafGz=hMpwRh7G6+NkRO8b=kB7vMjhVfXAC2OMS0EE==A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 20:05:44 -0000
X-Groupsio-MsgNum: 66284
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9EC9F063-35B4-471D-A630-3A499E594979";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9EC9F063-35B4-471D-A630-3A499E594979
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_16915921-01FD-4CAF-9B6A-52279685175E"

--Apple-Mail=_16915921-01FD-4CAF-9B6A-52279685175E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 3, 2015, at 11:56 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 June 2015 at 19:07, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> They are interdependent thats why they are together. Splitting wont
> get us anything moreover it will break git bisect
>=20
> Upgrading the Wayland protocol is independent from upgrading Weston.  =
libinput can be upgraded independently of Weston.  They have an implied =
ordering (wayland before weston, libinput before weston) but they're not =
single unit.
>=20

I have updates the pull branch. Thanks for your feedback


> Ross


--Apple-Mail=_16915921-01FD-4CAF-9B6A-52279685175E
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Jun 3, 2015, at 11:56 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 3 June 2015 at 19:07, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":s8" class="a3s" style="overflow:hidden">They are interdependent thats why they are together. Splitting wont<br class="">
get us anything moreover it will break git bisect</div></blockquote><div class=""><br class=""></div><div class="">Upgrading the Wayland protocol is independent from upgrading Weston. &nbsp;libinput can be upgraded independently of Weston.&nbsp; They have an implied ordering (wayland before weston, libinput before weston) but they're not single unit.</div><div class=""><br class=""></div></div></div></div></div></blockquote><div><br class=""></div><div>I have updates the pull branch. Thanks for your feedback</div><div><br class=""></div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><div class="gmail_quote"><div class="">Ross&nbsp;</div></div></div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_16915921-01FD-4CAF-9B6A-52279685175E--

--Apple-Mail=_9EC9F063-35B4-471D-A630-3A499E594979
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVvXhUACgkQuwUzVZGdMxRK4QCfU0QIKEPNECdV1Ab+44qiFxiW
NP4AoIuyT6Mpk0bAN6ypbNoxceeMNA1F
=hX7k
-----END PGP SIGNATURE-----

--Apple-Mail=_9EC9F063-35B4-471D-A630-3A499E594979--
