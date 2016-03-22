Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C337760797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:02:30 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id u190so320230653pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=5HG7gYBPLdja13ebK1xv0ay32tR5YrLFqQvxVYEqsX0=;
	b=Gao6BkSh9QbPsb92tlAhVRBlntlb/GqD+IRwZB2fgd0C9omUgatZXiPoSpD1TNYvlM
	qyex8NpldPDxchmV0uPzHr6576ApqYnBxRacoR/vSszYeVG71KEWCbppQncPj4R1W01t
	ObzIx6ZQ2+9TgAafGDdtijd3csvAmOdFESAVo5jgNpRAmWtu7XMrf0nfiL3XCB77lY51
	XEW4UJ0yeQz5yLI6qOU2VPzA8XlBMijZl/Zbp62IFr2fiAfkrHBQ9ighjdn3rSDqbqIu
	wUA/ijrs9tb9/DYZL/jFEMIDDMqInYFEpQqMjQn6S7UdT++JlBAvyY51JNVLpIs9ZeG5
	w0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=5HG7gYBPLdja13ebK1xv0ay32tR5YrLFqQvxVYEqsX0=;
	b=AIdtzs3BB7gbXNwUPBaVoZMgbHe/n9AOgKhehOvx3zAVmu4WewZqPfImZ7OhARsVcN
	LiuN5lIn/VwKLkH5E3MzvjTLgPyKkent8ktSMnNP5iTKDPV/xW3YtTWfN1OGCfaYSOY7
	TDYi2laHZiY+6kY335XBh/qGsLcxIIYSVNnEcQsLkw9h5rhSnLblH0kwybgPQKmAG6US
	8M9wJvMv0K9NCgKgEuPVY19X+E1R54461RPBDkeP7ROZzFd8Oe4wq95zmIUo27gOX1oa
	pZ/LDzx09Vd3TE5Pnm+dPRHzdCnPYVbcoNb+BoPB9wkKKf/uh4afBUu4n0suVjQfAX5c
	ZfEw==
X-Gm-Message-State: AD7BkJKthmwgAxroNQUajWSk70YLO70SQz96eya4Cl1CpfaEuaQqonRrO8xuxT4fYSNo6w==
X-Received: by 10.66.237.1 with SMTP id uy1mr56440791pac.114.1458666151133;
	Tue, 22 Mar 2016 10:02:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:9c30:4d73:34d:3f32?
	([2601:646:8800:5a9a:9c30:4d73:34d:3f32])
	by smtp.gmail.com with ESMTPSA id
	ll7sm49664010pab.6.2016.03.22.10.02.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2016 10:02:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYKGNi1FmpQ1rRF+Wn=5Fgy1Ruv6hqKr_69s6xy4t+9dA@mail.gmail.com>
Date: Tue, 22 Mar 2016 10:02:25 -0700
Message-Id: <CE40B32B-4E50-4991-90EC-D38E2E959759@gmail.com>
References: <1458665161-14132-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYKGNi1FmpQ1rRF+Wn=5Fgy1Ruv6hqKr_69s6xy4t+9dA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Fix build with fstack-protector on musl
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
X-List-Received-Date: Tue, 22 Mar 2016 17:02:30 -0000
X-Groupsio-MsgNum: 79960
Content-Type: multipart/signed;
	boundary="Apple-Mail=_12DE9649-D906-46F7-A9FF-2406D7B27707";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_12DE9649-D906-46F7-A9FF-2406D7B27707
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FDB8807A-2E90-4218-B656-FBBD645CB44E"

--Apple-Mail=_FDB8807A-2E90-4218-B656-FBBD645CB44E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 22, 2016, at 9:49 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 22 March 2016 at 16:46, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> -SRC_URI +=3D "\
> -    file://Support-building-with-older-compilers.patch \
> -    file://AArch64-port.patch \
> -    =
file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch =
\
> -    file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
> -    =
file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
> -    file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
> -    file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
> +SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>=20
> Why change the recipe to use =3D when the .inc sets the main tarball =
already?
>=20

I guess I trusted devtool update-recipe too much. will send a v2 soon

> Ross


--Apple-Mail=_FDB8807A-2E90-4218-B656-FBBD645CB44E
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Mar 22, 2016, at 9:49 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 22 March 2016 at 16:46, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":dqs" class="a3s" style="overflow:hidden">-SRC_URI += "\<br class="">
-&nbsp; &nbsp; <a href="file:///Support-building-with-older-compilers.patch" class="">file://Support-building-with-older-compilers.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///AArch64-port.patch" class="">file://AArch64-port.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch" class="">file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///Link-libunwind-to-libgcc_s-rather-than-libgcc.patch" class="">file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch" class="">file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch" class="">file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch</a> \<br class="">
-&nbsp; &nbsp; <a href="file:///0001-backtrace-Use-only-with-glibc-and-uclibc.patch" class="">file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch</a> \<br class="">
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \<br class=""></div></blockquote></div><br class="">Why change the recipe to use = when the .inc sets the main tarball already?</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>I guess I trusted devtool update-recipe too much. will send a v2 soon&nbsp;</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_FDB8807A-2E90-4218-B656-FBBD645CB44E--

--Apple-Mail=_12DE9649-D906-46F7-A9FF-2406D7B27707
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbxeqUACgkQuwUzVZGdMxSeewCeOcb9d/9q/OsylKcizhylzA99
5moAn0y0pnyEcY6PHLHbDDUhHgMOrlwe
=rBcW
-----END PGP SIGNATURE-----

--Apple-Mail=_12DE9649-D906-46F7-A9FF-2406D7B27707--
