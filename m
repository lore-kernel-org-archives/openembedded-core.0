Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 38E2571ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 02:54:34 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id s8so68955225pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 19:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ls6K/43SvmwtX+biiy/resAP+NarfjFhOkt6wQ5dJTE=;
	b=V/ybKNv5e9rKSpqN0v3YlKzuvP60pd04r6ZdWf9z5z5Clmtb9Ijd1dgXhKNPhgGDqi
	PHblMZDNK8OL/8yGm1MuzJfxoqm/VSjIx+8RO9S9H6Q12Vw6d/nGYLjhyJ9ZgFvEpxUp
	ZJECMalSxUAsNpd9ultu4GFk2dYqMHEwAJyU7KkkZRPatO1e7WWqrSqSU9CqHUDsXk5O
	5BVjEkolgUyUzQeqFAzQdqwwGPTYGWiGYoicqql08QBgHKhQ57J13IbTTCVBLWrx4iRH
	C20jR/G6VpTU7yCfyvCSqj2i0n1zl1+GiGtix/D4VW+lPU2JqVgAoG5Rvo9aG7DVFolN
	hYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ls6K/43SvmwtX+biiy/resAP+NarfjFhOkt6wQ5dJTE=;
	b=av2j5hMCul9c4vWPk8nwM3/ctuYk5cPnHsTPoTz3xK4skwFmEGSlinVGyLIqhGe7F8
	gDE9+0yPp6s6hp9l9QT07WuL4cwIPBrXEjpeuipasoV5b/i6okLWc8g+9gFWeN7KfyHg
	V5V722BdpBGeUNXRIouuxVgbEv4Df+nVVa6rNSA+yK1YzOWSsXNZ9kcFrQBFLEjIXdoo
	iB/cyEHZffwFFbhps0hoM4TMN9LhJUgA8R16AT871pruEUiAbLW5WgzmAHxyE5gZAJCr
	BqO7o0cT/Zfgl/ar6h3wvZW8xUFDGDrgfaj2XiCijRjkbAaN+/gcyv31JQx2DINxxKOC
	nMRQ==
X-Gm-Message-State: ABUngvdvkRE/sibqOptvh9TLGIascWiNKGurBMgxcFLdUiBRRnpX2ge+wMLOGmAlyA0Eaw==
X-Received: by 10.99.1.23 with SMTP id 23mr37721199pgb.37.1477882476247;
	Sun, 30 Oct 2016 19:54:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:21ec:cda8:5c43:1476?
	([2601:646:8882:b8c:21ec:cda8:5c43:1476])
	by smtp.gmail.com with ESMTPSA id
	y77sm32337726pfi.69.2016.10.30.19.54.35
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Oct 2016 19:54:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZcHSgs+Qw1Zkrj4bUWnU-p6Ja-vg3+J8H22vxoscTrRg@mail.gmail.com>
Date: Sun, 30 Oct 2016 19:54:34 -0700
Message-Id: <F99EA06D-E6DA-4FD4-BBED-D10D157F200C@gmail.com>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
	<alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
	<CAJTo0LZcHSgs+Qw1Zkrj4bUWnU-p6Ja-vg3+J8H22vxoscTrRg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Christopher Larson <clarson@kergoth.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Mon, 31 Oct 2016 02:54:35 -0000
X-Groupsio-MsgNum: 88773
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BE09DCB8-BEDF-46F6-B071-60BCFDA78CCE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BE09DCB8-BEDF-46F6-B071-60BCFDA78CCE
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_85133FCD-2EF4-47C8-A6C4-DFD8B727F317"

--Apple-Mail=_85133FCD-2EF4-47C8-A6C4-DFD8B727F317
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 30, 2016, at 4:36 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 30 October 2016 at 17:35, Robert P. J. Day <rpjday@crashcourse.ca =
<mailto:rpjday@crashcourse.ca>> wrote:
>   fair enough ... i'm embarrassed to admit i didn't really understand
> the versioning selection so i'm going to examine it way more carefully
> now. i wonder how many recipes in oe-core are "_git" recipes that, in
> the end, just lock down to a specific version. as you say, i was a bit
> surprised.
>=20
> Personally I've been endorsing the practise where _git.bb =
<http://git.bb/> is only used for recipes that are actually tracking git =
development branches, and if it's just a release that it simply fetched =
over git via a SHA of a release tag then the recipe should be _1.2.3.bb =
<http://1.2.3.bb/> for clarity.

with a system integrators hat on I agree. With developer hat on I do =
not.

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_85133FCD-2EF4-47C8-A6C4-DFD8B727F317
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Oct 30, 2016, at 4:36 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 30 October 2016 at 17:35, Robert P. J. Day <span dir="ltr" class="">&lt;<a href="mailto:rpjday@crashcourse.ca" target="_blank" class="">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":p7" class="a3s aXjCH m15816aec4d9c0267">&nbsp; fair enough ... i'm embarrassed to admit i didn't really understand<br class="">
the versioning selection so i'm going to examine it way more carefully<br class="">
now. i wonder how many recipes in oe-core are "_git" recipes that, in<br class="">
the end, just lock down to a specific version. as you say, i was a bit<br class="">
surprised.</div></blockquote></div><br class="">Personally I've been endorsing the practise where _<a href="http://git.bb/" class="">git.bb</a> is only used for recipes that are actually tracking git development branches, and if it's just a release that it simply fetched over git via a SHA of a release tag then the recipe should be _<a href="http://1.2.3.bb/" class="">1.2.3.bb</a> for clarity.</div></div></div></blockquote><div><br class=""></div><div>with a system integrators hat on I agree. With developer hat on I do not.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_85133FCD-2EF4-47C8-A6C4-DFD8B727F317--

--Apple-Mail=_BE09DCB8-BEDF-46F6-B071-60BCFDA78CCE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgWsmoACgkQuwUzVZGdMxQSswCeOGEUoJV9oV7sw7XWqv1ENPhh
CkUAnj9q7GQnpRiYIJMfMy63KK9s3zLE
=zMZ6
-----END PGP SIGNATURE-----

--Apple-Mail=_BE09DCB8-BEDF-46F6-B071-60BCFDA78CCE--
