Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A30C64EC4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 06:12:04 +0000 (UTC)
Subject: Re: Yocto reproducibilty issue :: rust-llvm binary differences
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.160)
X-Originating-Platform: Windows Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Feb 2023 22:11:57 -0800
References: <24955.1677038318936477992@lists.openembedded.org>
In-Reply-To: <24955.1677038318936477992@lists.openembedded.org>
Message-ID: <17248.1677046317939376137@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dHiInZP4uSk9lnr6WeSL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 06:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177561

--dHiInZP4uSk9lnr6WeSL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Additional object files link (if needed) -> https://we.tl/t-RvgWukdcFB

poky/build-llvm-A/tmp/work/x86_64-linux/rust-native/ -> rust-native-A-obj.t=
ar
poky/build-llvm-B/tmp/work/x86_64-linux/rust-native/ -> rust-native-B-obj.t=
ar
poky/build-llvm-A/tmp/work/x86_64-linux/rust-llvm-native/ -> rust-llvm-nati=
ve-A-obj.tar
poky/build-llvm-B/tmp/work/x86_64-linux/rust-llvm-native/ -> rust-llvm-nati=
ve-B-obj.tar

>=20
> $ diff -ur rust-llvm-native-A-obj rust-llvm-native-B-obj
> Binary files rust-llvm-native-A-obj/llvm-config.cpp.o and
> rust-llvm-native-B-obj/llvm-config.cpp.o differ
> Binary files rust-llvm-native-A-obj/python.o and
> rust-llvm-native-B-obj/python.o differ
>=20
> $ diff -ur rust-native-A-obj rust-native-B-obj
> Binary files rust-native-A-obj/1mg8n9voykv9ib2d.o and
> rust-native-B-obj/1mg8n9voykv9ib2d.o differ
> Binary files rust-native-A-obj/538dmycheh7dlbck.o and
> rust-native-B-obj/538dmycheh7dlbck.o differ
> Binary files rust-native-A-obj/python.o and rust-native-B-obj/python.o
> differ
>

--dHiInZP4uSk9lnr6WeSL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Additional object files link (if needed) -&gt;&nbsp;<a href=3D"https:/=
/we.tl/t-RvgWukdcFB" target=3D"_blank" rel=3D"noopener">https://we.tl/t-Rvg=
WukdcFB</a></div>
<div>&nbsp;</div>
<div><em>poky/build-llvm-A/tmp/work/x86_64-linux/rust-native/ -&gt; rust-na=
tive-A-obj.tar</em></div>
<div><em>poky/build-llvm-B/tmp/work/x86_64-linux/rust-native/ -&gt; rust-na=
tive-B-obj.tar</em></div>
<div><em>poky/build-llvm-A/tmp/work/x86_64-linux/rust-llvm-native/ -&gt; ru=
st-llvm-native-A-obj.tar</em></div>
<div><em>poky/build-llvm-B/tmp/work/x86_64-linux/rust-llvm-native/ -&gt; ru=
st-llvm-native-B-obj.tar</em></div>
<div>&nbsp;</div>
<blockquote>
<div>$ diff -ur rust-llvm-native-A-obj rust-llvm-native-B-obj</div>
<div>Binary files rust-llvm-native-A-obj/llvm-config.cpp.o and rust-llvm-na=
tive-B-obj/llvm-config.cpp.o differ</div>
<div>Binary files rust-llvm-native-A-obj/python.o and rust-llvm-native-B-ob=
j/python.o differ</div>
<div>&nbsp;</div>
<div>$ diff -ur rust-native-A-obj rust-native-B-obj</div>
<div>Binary files rust-native-A-obj/1mg8n9voykv9ib2d.o and rust-native-B-ob=
j/1mg8n9voykv9ib2d.o differ</div>
<div>Binary files rust-native-A-obj/538dmycheh7dlbck.o and rust-native-B-ob=
j/538dmycheh7dlbck.o differ</div>
<div>Binary files rust-native-A-obj/python.o and rust-native-B-obj/python.o=
 differ</div>
</blockquote>
<div>&nbsp;</div>

--dHiInZP4uSk9lnr6WeSL--

