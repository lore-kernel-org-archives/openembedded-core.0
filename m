Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 927DF74588
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 16:16:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w7-v6so8950816wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=d6RuwZYvC0pEGUSH4XgFzKrBb9Gj3TDiPpbUSW9V+AI=;
	b=mZAQtYA9xQUTfpTf9qLRlJmJXzELyxMmQjwxPFpVmnI/+zmY2a17XAxwsn18O3cw+3
	hvmOUCYSXzN5cORKbuSJUKeNYCc3//iA6LqPhQWYQM9VRX0lRdMWXG01REUehm/5Ctkj
	UYMHWNKvwZy9AlSVfr7XX1np47fbyWXv78Ij+LArVxygZqXttEFzuxA9J/blH4L2QHjI
	6s5jRuILUw4GMpWVOToYd5qs4iva0XaoDnXlbCkfe12IZbnNza4bG0PJzUNUWvPy+uTs
	zDGCRGtLdCejEx5qRfFZVgpV5NIBsIV7E8Ju/DgRv1MiXoQZlbrFJFipLG5WsG8d3wzH
	pOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=d6RuwZYvC0pEGUSH4XgFzKrBb9Gj3TDiPpbUSW9V+AI=;
	b=XqbuFa4HY33P2OYaLQoPbS29ESMtRzwfsUsqlVNTwFDqJYOl9Wh02NJKWdA7Llb2gA
	QffJ5tFE3Gb91FKVXmKmbqNgQAzVzUyEKq1Hvr+WUVU+Sd+o+jcSJ6otIu3J0iwANEK/
	hiWMXBqI5/I0DUKrk9w+tgULVzTca+vcrGzyMaHNz9N6Wh0eSBcrhPvSYh0hRAlVNzMC
	OPqngDqPLSmvH5+ws/cLiYGn+QvkSaMjUMHHSM2uKK6Tu7paEozGf1DD10E5av2ck8JF
	zt3S9TNVAFINNJ6NHrRW5UOQ58qkhp+JkjYoGc8mWgefMFzQDFRv2wyY+AT+Zx7UnMr6
	z28g==
X-Gm-Message-State: AGRZ1gJVd7922ysjXtPnelN00GmOhEwqq1lmxkVCGub01E+q0gNwWDas
	k2t8hm+woBJNFALnOFBZ710=
X-Google-Smtp-Source: AJdET5eBED3do7H/yhXFjPFD5agpajyXyKYyBNyfVBg+JOhNCNcaPXIXKXNy5Ci3bppN5QUHsVquig==
X-Received: by 2002:a1c:6783:: with SMTP id
	b125-v6mr7034116wmc.142.1541434609287; 
	Mon, 05 Nov 2018 08:16:49 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	u8-v6sm3605891wrr.33.2018.11.05.08.16.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 08:16:48 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <61FB4CB8-B1E2-421D-B1A0-C71C4A8AE4ED@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 5 Nov 2018 17:16:47 +0100
In-Reply-To: <CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
	<CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
	<CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 16:16:48 -0000
X-Groupsio-MsgNum: 117949
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0F93202-43DE-4C91-86B8-E63FA6F854E5";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_E0F93202-43DE-4C91-86B8-E63FA6F854E5
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_615E8965-DB19-49B6-8F0C-8E4CFDB7F000"

--Apple-Mail=_615E8965-DB19-49B6-8F0C-8E4CFDB7F000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> Am 05.11.2018 um 17:11 schrieb Burton, Ross <ross.burton@intel.com>:
> 
> On Mon, 5 Nov 2018 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
>> Mining the list archive shows that we keep on getting sqlite upgrades
>> which fail like this.  Maxin reported that it was due to the
>> full-text-search code enabling itself and failing to build, so one
>> solution is to explicitly turn it off.
> 
> Did some digging.
> 
> FTS5 is enabled by default, this needs log() from libm.  If enabled,
> AC_SEARCH_LIBS is used to find log() and libm.so, and this bonus
> dependency that is needed if statically linking is recorded in
> sqlite3.pc.  Pseudo then builds, statically links to pseudo, but also
> hard-codes the link line instead of using pkgconfig so this -lm isn't
> added, resulting in a link failure on upgrade.
> 
> So that explains why the autobuilder explodes when this upgrade
> happens, but doesn't explain how it builds for everyone who submits
> the upgrade...


Thanks for the analysis. I have some minor quirks with meta-cpan I
have to fix since my last full-build for BBB in Sept 2018 - and my locally
overwritten fstab generator for recovery/app partitions fails nowadays
I have to analyze.

I think at least end of the week I can build target images again, get
more test opportunities and fixup sqlite3 and python3 and submit some
other stuff I found in meantime ;)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_615E8965-DB19-49B6-8F0C-8E4CFDB7F000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 05.11.2018 um 17:11 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Mon, 5 Nov 2018 at 11:43, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Mining the list archive shows that we keep on =
getting sqlite upgrades<br class=3D"">which fail like this. &nbsp;Maxin =
reported that it was due to the<br class=3D"">full-text-search code =
enabling itself and failing to build, so one<br class=3D"">solution is =
to explicitly turn it off.<br class=3D""></blockquote><br class=3D"">Did =
some digging.<br class=3D""><br class=3D"">FTS5 is enabled by default, =
this needs log() from libm. &nbsp;If enabled,<br class=3D"">AC_SEARCH_LIBS=
 is used to find log() and libm.so, and this bonus<br =
class=3D"">dependency that is needed if statically linking is recorded =
in<br class=3D"">sqlite3.pc. &nbsp;Pseudo then builds, statically links =
to pseudo, but also<br class=3D"">hard-codes the link line instead of =
using pkgconfig so this -lm isn't<br class=3D"">added, resulting in a =
link failure on upgrade.<br class=3D""><br class=3D"">So that explains =
why the autobuilder explodes when this upgrade<br class=3D"">happens, =
but doesn't explain how it builds for everyone who submits<br =
class=3D"">the upgrade...<br =
class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks for the analysis. I have some =
minor quirks with meta-cpan I</div><div class=3D"">have to fix since my =
last full-build for BBB in Sept 2018 - and my locally</div><div =
class=3D"">overwritten fstab generator for recovery/app partitions fails =
nowadays</div><div class=3D"">I have to analyze.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I think at least end of the week I can =
build target images again, get</div><div class=3D"">more test =
opportunities and fixup sqlite3 and python3 and submit some</div><div =
class=3D"">other stuff I found in meantime ;)</div><div class=3D""><br =
class=3D""></div>Cheers<br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_615E8965-DB19-49B6-8F0C-8E4CFDB7F000--

--Apple-Mail=_E0F93202-43DE-4C91-86B8-E63FA6F854E5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvgbO8ACgkQRJmWrtzl
Cp29hxAAh6OB5WCdOJAYHNHyNmWCIhLlfgKjkP9mjVIACA/rpQSbTebqFCbzx7Yt
g0Kgg57hTo10p3FQv3/VKRb6sTR9SEq9DfGfRMm155NrJR938k7G+Ed0whIXQO1u
VBIv4wM5NHbEV27CWXIpUQJFqVPQDkLwBIYyxS28b3LghP21Y8LwhdfQou5b6+ii
bVAdxyL+2ushLksK5nLvraKuiBCxZ13EOQmMq3TWZ8bXRzanocAe/5U2FI8moWPQ
x82GV1Rb8/3iYUx96NM2KIieBZSy4JnVBYNRFX60R+XDZBPX3Bp+h9xzhAPwtlSZ
5rMY667OiGky4Joz73umwevxFl1uMnQtGiDXRO2DwSHAyOGAruUgmqTuT3YKmU9+
8ewcs8LPF2WmMJpq9KmH6FYjWYygqFm6B7rOniVsKTTRVPUPWSVKRT4SXdWzUv1l
cKmm7+LtKLUadr0xsscsmOW2pSaUS3Xl+darS8TRUu3ohyyPpqPVtLc6FKpVk7ex
PmS9iZdfFQ/YCMwwIz7AAX58vGWYmfzDHP3hzCmKPgZR9eixd05YmXk6uXJpmyVG
LkLsj62olqIn7tVtdILKA4H4FSyDpClVY2PyCI62iJlyR1G2NKlQZBOFpWmmDqWF
ADnxMRkV3g6LGfXaFjfcoxhL1ZGmoz90W5OhU9l4iwaSlp2D2Z8=
=0iAA
-----END PGP SIGNATURE-----

--Apple-Mail=_E0F93202-43DE-4C91-86B8-E63FA6F854E5--
