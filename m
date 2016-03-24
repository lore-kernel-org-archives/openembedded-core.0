Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8510B60745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:58:48 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 4so69958439pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3gWfMb+4GKGbonyqCwJi1bRwY1zigEp0IW1pRZauc/A=;
	b=a2kvghgT0qsahsMJEIT7Hxs09eGs2DywNDeMiacA2Es0qm/3nc47PAOSlpN40sUa5D
	1uY0edkAg/ApI6BjY3XTi56nL5SZZmak1jBHQoate0cfryP8jOziVW9B/TwYWTWyk683
	OobuQlYKZ7JSq9Ymel3Bk/gGGfgQKnmpM7Nmo1MeOUJZqEN6iY85HrFgMHHTJRKvA5qo
	i5HW4IYDOfFAAxAOxN1K5kclhwn7OZ/3ZUakZ+/wB54dO8K3WrsVNsOxw2ZSMEkr1wBq
	nnPDGBBgjJxuxRgzflNbepNwhmWX8VGYO2cSKI/6T8Xn/F4eCKIas1Z9JGriVeIw3KEI
	UAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3gWfMb+4GKGbonyqCwJi1bRwY1zigEp0IW1pRZauc/A=;
	b=MZEsVEJbp2ZIvAZWS7OHUzqf/EA905jPmShHTOvnIcISa6X7I7ae2wI5QtLA96MDJD
	jExrpZzWS5IuiMkklNLPKQTV3oVp7d/JZCMoUBjqYGSxMvULGN2JPJvRgFFYoB+uEIw4
	GbTZLe+57IIIGAizuRh0FcDrpwLtUButzr6zrO/2liTkGeqKG41AamQR9s8oLOJIgxrI
	pSS+DpYdD8mO5fKokH7qTQDGx8/f5gb3Lv3f5uz7BBc0mg7LE3z8hAAEBaqOk8ccRD7r
	ZSOzvgLSwCY0oKJJ17DaAV6ZMaZ9fXyDC0PaiFrm0AwshfI7/U4KXLIV02EMl/bQYlcf
	k8hA==
X-Gm-Message-State: AD7BkJJnJEspDg1EnIKgF9N/cf50u6DSlhjbO/lNIZKrOSsu1D9+fVxfj6Rv7Gkq+vMmDA==
X-Received: by 10.98.79.203 with SMTP id f72mr16808156pfj.102.1458863928875;
	Thu, 24 Mar 2016 16:58:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2?
	([2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2])
	by smtp.gmail.com with ESMTPSA id
	22sm12455595pfh.48.2016.03.24.16.58.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 16:58:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458861705.2038.43.camel@pbcl.net>
Date: Thu, 24 Mar 2016 16:58:42 -0700
Message-Id: <CCAE827A-00BF-409A-9EB5-B728192D89CB@gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
	<1458844322.3476.198.camel@pbcl.net>
	<93EB73B6-E9B5-4DAE-9CCE-3D87FAD794D3@gmail.com>
	<1458861705.2038.43.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 23:58:49 -0000
X-Groupsio-MsgNum: 80125
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E8B571B-F484-44F5-AE75-D0C6C3F2F3D1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8E8B571B-F484-44F5-AE75-D0C6C3F2F3D1
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EBA66671-8852-4055-A699-110C283BD4EF"

--Apple-Mail=_EBA66671-8852-4055-A699-110C283BD4EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 24, 2016, at 4:21 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2016-03-24 at 15:22 -0700, Khem Raj wrote:
>>=20
>> > On Mar 24, 2016, at 11:32 AM, Phil Blundell <pb@pbcl.net =
<mailto:pb@pbcl.net>> wrote:
>> >
>> > On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
>> >>
>> >> Renaming armv8a -> aarch32 is going to affect almost every line in
>> >> the patch. We should probably drop the current patch from master-
>> >> next.
>> >
>> > "AArch32" applies retrospectively to all older versions of the ARM
>> > architecture as well,
>>=20
>> not really. Arm refers to aarch32 specifically when we use 32-bit on =
ARMv8
>> so atleast we are speaking same terms.
>=20
> See the glossary at:
>=20
> =
http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.aeg0014g/ABC=
DEFGH.html =
<http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.aeg0014g/AB=
CDEFGH.html>
>=20
> AArch32 state
> The ARM 32-bit Execution state that uses 32-bit general purpose =
registers, and a 32-bit program counter (PC), stack pointer (SP), and =
link register (LR). AArch32 Execution state provides a choice of two =
instruction sets, A32 and T32.
>=20
> In implementations of versions of the ARM architecture before ARMv8, =
and in the ARM R and M architecture profiles, execution is always in =
AArch32 state.

I am not saying its any different technically. But aarch32 as term is =
only used w.r.t. armv8

>=20
> p.


--Apple-Mail=_EBA66671-8852-4055-A699-110C283BD4EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 24, 2016, at 4:21 PM, Phil Blundell &lt;<a =
href=3D"mailto:pb@pbcl.net" class=3D"">pb@pbcl.net</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On Thu, 2016-03-24 at 15:22 -0700, Khem Raj =
wrote:</span><blockquote type=3D"CITE" style=3D"font-family: Ubuntu; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><pre class=3D""><font color=3D"#737373" class=3D"">&gt; On =
Mar 24, 2016, at 11:32 AM, Phil Blundell &lt;<a =
href=3D"mailto:pb@pbcl.net" class=3D"">pb@pbcl.net</a>&gt; wrote:</font>
<font color=3D"#737373" class=3D"">&gt; </font>
<font color=3D"#737373" class=3D"">&gt; On Thu, 2016-03-24 at 10:37 =
-0700, Andre McCurdy wrote:</font>
<font color=3D"#737373" class=3D"">&gt;&gt; </font>
<font color=3D"#737373" class=3D"">&gt;&gt; Renaming armv8a -&gt; =
aarch32 is going to affect almost every line in</font>
<font color=3D"#737373" class=3D"">&gt;&gt; the patch. We should =
probably drop the current patch from master-</font>
<font color=3D"#737373" class=3D"">&gt;&gt; next.</font>
<font color=3D"#737373" class=3D"">&gt; </font>
<font color=3D"#737373" class=3D"">&gt; "AArch32" applies =
retrospectively to all older versions of the ARM</font>
<font color=3D"#737373" class=3D"">&gt; architecture as well,</font>

not really. Arm refers to aarch32 specifically when we use 32-bit on =
ARMv8
so atleast we are speaking same terms.
</pre></blockquote><br style=3D"font-family: Ubuntu; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">See the glossary at:</span><br =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Ubuntu; font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><a =
href=3D"http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.aeg0=
014g/ABCDEFGH.html" style=3D"font-family: Ubuntu; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.a=
eg0014g/ABCDEFGH.html</a><br style=3D"font-family: Ubuntu; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><i style=3D"font-family: =
Ubuntu; font-size: 14px; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">AArch32 =
state</i><span style=3D"font-family: Ubuntu; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D""></span><dl style=3D"font-family: Ubuntu; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">The ARM 32-bit Execution state that uses 32-bit general =
purpose registers, and a 32-bit program counter (PC), stack pointer =
(SP), and link register (LR). AArch32 Execution state provides a choice =
of two instruction sets, A32 and T32.<br class=3D""><br class=3D"">In =
implementations of versions of the ARM architecture before ARMv8, and in =
the ARM R and M architecture profiles, execution is always in AArch32 =
state.<br class=3D""></dl></div></blockquote><div><br =
class=3D""></div><div>I am not saying its any different technically. But =
aarch32 as term is only used w.r.t. armv8</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><dl style=3D"font-family: =
Ubuntu; font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br class=3D""></dl><span style=3D"font-family: Ubuntu; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" =
class=3D"">p.</span></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_EBA66671-8852-4055-A699-110C283BD4EF--

--Apple-Mail=_8E8B571B-F484-44F5-AE75-D0C6C3F2F3D1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb0fzYACgkQuwUzVZGdMxQ/hQCfb13LK3pNgrgpIdkxT+pCrn/J
PaYAoIyT5UdB432ggnv/h9gF0HgkrCUl
=kNln
-----END PGP SIGNATURE-----

--Apple-Mail=_8E8B571B-F484-44F5-AE75-D0C6C3F2F3D1--
