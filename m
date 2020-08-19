Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.98163.1597872184641551400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 14:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ftml.net header.s=fm1 header.b=Rdh8NGDC;
 spf=pass (domain: ftml.net, ip: 66.111.4.28, mailfrom: fdk17@ftml.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A511C5C012C
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 17:23:03 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
  by compute3.internal (MEProxy); Wed, 19 Aug 2020 17:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=FMSdrmYcOwbYElIMAovrT1/RJU33asz
	PsetLVcsq5j0=; b=Rdh8NGDCQAr7xYcGgQ6Xr8aooLO1mMf8wt4L0JL47ixjWQE
	4PL0WaSbq/stmz7ByDT56f947ZQElUTmVo6fGxq2Fk42O/qXEKkel/laZH2zeMyD
	kRSOWOb8lQCqX2EoEF2pmBEmUR/FJIOOH+r5R6FyDM57pz4pRVpXbyR3JOQcrwyI
	DCnsZLV4nCi6YgysdJfJJ7PjuDLfDJtgzov/JNprO5DTkD+HIgpo2OVq0R2yKdYG
	vEIKbGtQaoQq8dJH/9BgsAvg5PJE910Wv4FcPsFED2UogmO05he5QnRYIk3F+76P
	KsI5eYcfsVAoNsKkgN0zp/otycupwrPpxQF+o2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FMSdrm
	YcOwbYElIMAovrT1/RJU33aszPsetLVcsq5j0=; b=hkuy8a3P5DTG3BqkbN0gJD
	10Cgwa1AqEXyfd65TGw7/1PAcb6oABgChhxiLYJ5/WWVaac4GqETjYStnU78J3A/
	CXyxMDlVLB2LVMu2aZp9yJsqXt+8o1chQe5t/L98LfhsOFMpzm3TyzwoFDNsWUv9
	vU0f26kPHe422CkDmvjVI+Sp83IMcvMqZPOLnwYyE/OqLPYFBnezOcODsQMVNSLY
	KaRXs8sxLm+3mOeVIvtR0tpuaEzPi0WveGHGxAhVJPrSYcATbMA5cr/3opjUHsq2
	RfaLlzxo7M5SH6OvBKrIemgUk1wQxcmQHQPv8jmdCbdontbmQJ5266kYaKb5PMxw
	==
X-ME-Sender: <xms:N5g9X6pVkQg6T4EPsghMJ32TAE1BA1VfNnL3UkhK2ee1XFhB8uq9ZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsegrtderreerredtnecuhfhrohhmpedfhfhr
    vgguuceurghkshhikhdfuceofhgukhdujeesfhhtmhhlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeelveeludeigfelkefhfeffffevfeefveetvdeljeeutdejtdetkedujeekiedt
    ffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehf
    ughkudejsehfthhmlhdrnhgvth
X-ME-Proxy: <xmx:N5g9X4pRhuXg2JqQTkhofrwc9RmLY4jKl58NLSmxhuoO51_2lHXhSw>
    <xmx:N5g9X_MLCza003_Xa-1WO_LLSLRKCfFs10mX031cw2gdEALfiK3skw>
    <xmx:N5g9X57UV_KkplD0nN5MRqKMhQ6-foLljywQYvLQ-QFbctgCGUm6Ew>
    <xmx:N5g9X0JrELhcO60NE1lcvDwaHDxGICmYwVRnIwhjw_wWzI3woybs_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5C5D818014A; Wed, 19 Aug 2020 17:23:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-191-gef79d59-fm-20200818.001-gef79d590
Mime-Version: 1.0
Message-Id: <94e7e62a-7589-4914-aa8c-1cf394343812@www.fastmail.com>
In-Reply-To: 
 <CAMjhiJhwiAH4Wuvdom5VkD1aL=2wAEHg1n9Pb-QVsaO=qk6cQw@mail.gmail.com>
References: <162C17C3E9BAC6AE.7353@lists.openembedded.org>
 <CAMjhiJhwiAH4Wuvdom5VkD1aL=2wAEHg1n9Pb-QVsaO=qk6cQw@mail.gmail.com>
Date: Wed, 19 Aug 2020 17:21:23 -0400
From: "Fred Baksik" <fdk17@ftml.net>
To: 
 "chris.laplante--- via Openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] -mmusl missing in SDK / CMake MUSL toolchain
Content-Type: multipart/alternative;
 boundary=3ef31ac6a5294a128f6ee25d731a62e7

--3ef31ac6a5294a128f6ee25d731a62e7
Content-Type: text/plain

On Wed, Aug 19, 2020, at 5:02 PM, Leon Woestenberg wrote:
> RFC:
> 
> During the creation of the environment script for the canadian cross
> SDK in toolchain-script.bbclass,
> for a MUSL C library target, the OVERRIDES contains libc-glibc instead
> of libc-musl.
> 
> OVERRIDES=task-generate-content:linux-musl:x86-64:pn-meta-environment-qemux86-64:qemuall:qemux86-64:nodistro:class-cross-canadian:libc-glibc:forcevariable
> 
> This can be easily inspected by adding these lines to the script
> creation (Thanks to Richard for the suggestion on IRC).
> 
>         echo 'export TARGET_CC_ARCH=${TARGET_CC_ARCH}' >> $script
>         echo 'export OVERRIDES=${OVERRIDES}' >> $script
> 
> This append at the top of toolchain-script.bbclass is thus without effect:
> TARGET_CC_ARCH_append_libc-musl = " -mmusl"
> 
> This works:
> 
> TARGET_CC_ARCH_append_linux-musl = " -mmusl"
> 
> (notice linux instead of libc, as linux-musl stays present in OVERRIDES.)
> 
> I have a (minimal) test case here. Run make in the cloned repo.
> https://github.com/likewise/oe-musl-sdk-cmake
> 

FYI,

Sounds like you ran into the SDK / musl problem

sdk: compiler targets glibc, even though rootfs uses musl-libc
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13459

Using TCLIB=musl results in SDKs producing incompatible binaries
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13766

--3ef31ac6a5294a128f6ee25d731a62e7
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div><span id=3D"sum=
mary_alias_container"><span id=3D"short_desc_nonedit_display"></span></s=
pan>On Wed, Aug 19, 2020, at 5:02 PM, Leon Woestenberg wrote:<br></div><=
blockquote type=3D"cite" id=3D"qt" style=3D""><div>RFC:<br></div><div><b=
r></div><div>During the creation of the environment script for the canad=
ian cross<br></div><div>SDK in toolchain-script.bbclass,<br></div><div>f=
or a MUSL C library target, the OVERRIDES contains libc-glibc instead<br=
></div><div>of libc-musl.<br></div><div><br></div><div>OVERRIDES=3Dtask-=
generate-content:linux-musl:x86-64:pn-meta-environment-qemux86-64:qemual=
l:qemux86-64:nodistro:class-cross-canadian:libc-glibc:forcevariable<br><=
/div><div><br></div><div>This can be easily inspected by adding these li=
nes to the script<br></div><div>creation (Thanks to Richard for the sugg=
estion on IRC).<br></div><div><br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo 'export TARGET_CC_ARCH=3D${TARGET_CC_ARCH}' &gt;&gt=
; $script<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo =
'export OVERRIDES=3D${OVERRIDES}' &gt;&gt; $script<br></div><div><br></d=
iv><div>This append at the top of toolchain-script.bbclass is thus witho=
ut effect:<br></div><div>TARGET_CC_ARCH_append_libc-musl =3D " -mmusl"<b=
r></div><div><br></div><div>This works:<br></div><div><br></div><div>TAR=
GET_CC_ARCH_append_linux-musl =3D " -mmusl"<br></div><div><br></div><div=
>(notice linux instead of libc, as linux-musl stays present in OVERRIDES=
.)<br></div><div><br></div><div>I have a (minimal) test case here. Run m=
ake in the cloned repo.<br></div><div><a href=3D"https://github.com/like=
wise/oe-musl-sdk-cmake">https://github.com/likewise/oe-musl-sdk-cmake</a=
><br></div><div><br></div></blockquote><div><br></div><div>FYI,<br></div=
><div><br></div><div>Sounds like you ran into the SDK / musl problem<br>=
</div><div><br></div><div><div><span id=3D"summary_alias_container"><spa=
n id=3D"short_desc_nonedit_display">sdk: compiler targets glibc, even th=
ough rootfs uses musl-libc</span></span><br></div><div><a href=3D"https:=
//bugzilla.yoctoproject.org/show_bug.cgi?id=3D13459">https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D13459</a><br></div><div><br></div><div>=
<span id=3D"summary_alias_container"><span id=3D"short_desc_nonedit_disp=
lay">Using TCLIB=3Dmusl results in SDKs producing incompatible binaries<=
/span></span><br></div><div><a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D13766">https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D13766</a><br></div></div><div><br></div></body></html>

--3ef31ac6a5294a128f6ee25d731a62e7--
