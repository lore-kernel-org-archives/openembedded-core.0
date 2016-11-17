Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39D2571957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 12:14:45 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id w33so128516947qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nbqLbBLygt0wdOfm/LT5TJ/YxA619czdVokTH9MmU5U=;
	b=rCw/ra/FOWWDzIChseoE8QgNxvdBzdGOovW0pOt+7reEDN3rHq+qo3lvT45gMN/Y8R
	itYiyJ0LEwNODQJjYdrSF7zOGPqzpcK59thMfxA1NJP/PMCDz/We+qacXDWSvJCiHuiy
	u/FltY/4F4aDEQdlSZGBn3ChunWtbzIhN0/aIH8/3D+PHu4TgJxr7pcZ4M2wfdv9c58+
	3SzHIRWVt9zDoi3Tl7JAKsSQ2oGVfKyPrIsd666g56XAliJdu2L4euJNbazuThCSki+D
	Ugo7IGuMjFCQvZjENLraSYzyFQvfL2wBET+aEFloDCWfp4HJ5OmWHGKMEfehUBvrSXa5
	obPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nbqLbBLygt0wdOfm/LT5TJ/YxA619czdVokTH9MmU5U=;
	b=UP7Rwq2eIDG2OaYTuuiviJqr0HUL4VNT5X5DH1Zrp1VPAgSq1jNpjKecKSNziTGrEG
	g3DDFbr4ntEdJJpwOKUyMBZoIZXFV3PBQ+jaJiyxbamm2aMmgGwBGtQG/zWQYfNzsJHp
	FOqSP67WAkS+2i9Uv6sJbTRn/z1dRgWPiTBwDmiA5LhheBqwUJJtSHqIrdnw1HrwBnDr
	opR60VhQ/a5ngvDqkLMON+JVVDNip9f6UQeggZQ/MwTkBXwvYRcb4O85B2Y8DYGvIyb0
	4tKt7AMp9tci6UD4bSDjtZrthpnPrkuym3oVfLQLjm5O2VVDoXssAcqZ7729BYJrAKUE
	Vpsg==
X-Gm-Message-State: AKaTC02v2BTFB+29KI3uOqKHPE1uoVDRgUiLuJ8VF4LFDC8kQxCsK42m1S9+i7Lpty0yQMmKIFgQIgyXJ3sOnoiQ
X-Received: by 10.237.49.230 with SMTP id 93mr1546738qth.109.1479384887207;
	Thu, 17 Nov 2016 04:14:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 17 Nov 2016 04:14:26 -0800 (PST)
In-Reply-To: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Nov 2016 12:14:26 +0000
Message-ID: <CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Test needed to verify postinst script order.
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
X-List-Received-Date: Thu, 17 Nov 2016 12:14:47 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e2b03c8805417e22f7

--94eb2c1251e2b03c8805417e22f7
Content-Type: text/plain; charset=UTF-8

On 16 November 2016 at 00:50, Francisco Pedraza <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> Will verify the following:
> 1. Compile a minimal image.
> 2. The compiled image will add the created layer with the
> recipes postinstz postinsta postinstb postinstd postinstp postinstt
> created previously at "meta-selftest/recipes-test"
> 2. Run qemu
> 3. Validate the task execution order.
> V4
>

This is missing the test that some postinsts should be happening at rootfs
time.

Also, can it permute PACKAGE_CLASSES (rotate through all three options) so
it exercises all backends.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
> ---
>  .../recipes-test/postinsta/postinsta_1.0.bb        | 20 +++++++++++
>  .../recipes-test/postinstb/postinstb_1.0.bb        | 22 ++++++++++++
>  .../recipes-test/postinstd/postinstd_1.0.bb        | 22 ++++++++++++
>  .../recipes-test/postinstp/postinstp_1.0.bb        | 22 ++++++++++++
>  .../recipes-test/postinstt/postinstt_1.0.bb        | 22 ++++++++++++
>  .../recipes-test/postinstz/postinstz_1.0.bb        | 12 +++++++
>

For clarity can all of these be squashed into a single recipe with clearer
names?

Ross

--94eb2c1251e2b03c8805417e22f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2016 at 00:50, Francisco Pedraza <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:francisco.j.pedraza.gonzalez@intel.com" target=3D"_blank">fran=
cisco.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div id=3D":619" class=3D"a3s aXjCH m1586aa8e9d4ce13a">Will=
 verify the following:<br>
1. Compile a minimal image.<br>
2. The compiled image will add the created layer with the<br>
recipes postinstz postinsta postinstb postinstd postinstp postinstt<br>
created previously at &quot;meta-selftest/recipes-test&quot;<br>
2. Run qemu<br>
3. Validate the task execution order.<br>
V4<br></div></blockquote><div><br></div><div>This is missing the test that =
some postinsts should be happening at rootfs time.</div><div><br></div><div=
>Also, can it permute PACKAGE_CLASSES (rotate through all three options) so=
 it exercises all backends.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":619" class=3D"a3s aXjCH m1586aa8e9d4ce13a">
Signed-off-by: Francisco Pedraza &lt;<a href=3D"mailto:francisco.j.pedraza.=
gonzalez@intel.com">francisco.j.pedraza.gonzalez@<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-test/postinsta/<a href=3D"http://postinsta_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinsta_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 20 +++++++++++<br>
=C2=A0.../recipes-test/postinstb/<a href=3D"http://postinstb_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinstb_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 22 ++++++++++++<br>
=C2=A0.../recipes-test/postinstd/<a href=3D"http://postinstd_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinstd_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 22 ++++++++++++<br>
=C2=A0.../recipes-test/postinstp/<a href=3D"http://postinstp_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinstp_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 22 ++++++++++++<br>
=C2=A0.../recipes-test/postinstt/<a href=3D"http://postinstt_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinstt_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 22 ++++++++++++<br>
=C2=A0.../recipes-test/postinstz/<a href=3D"http://postinstz_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pos<wbr>tinstz_1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 12 +++++++</div></blockquote></div><br>For clarity can all of =
these be squashed into a single recipe with clearer names?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c1251e2b03c8805417e22f7--
