Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5276C73695
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 01:31:18 +0000 (UTC)
Received: by padck2 with SMTP id ck2so11759526pad.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=G1uHXIrNThV6W1Wtz6HS9LcWqg5/8QKwlI39lXD8Akg=;
	b=s3xlzGK4ThqewNAuywqo+7uIONQqOcpHmMple+cM7s01zQP7DDUN3lPw9/gMaSdBwF
	tf1GvQTToyPbFieP4xe0zSFh0yU5t/x64C4k7rSpXiJDNl15NP+TJSg5aHr2sRwlJpx8
	nRxSM9tkWfstZgHEOSPj5QcpTZ0aoJZowIene5vshooktwt/OUicOuugdj799U4x+Ilg
	rBc5P1FP0krOHFQVpNPF4aWB+Yzm55LRxbWioXtfPO1/h7YVgpPk/mg7qjifJ0yewXzf
	4JdAKa3cy0rgYAjtgHxA0bNX4iTN2oRI8C8ypdil4RWQ4947OdG1gpHRrWm/Oum43R/H
	+AWw==
X-Received: by 10.66.66.172 with SMTP id g12mr47142773pat.74.1436578278963;
	Fri, 10 Jul 2015 18:31:18 -0700 (PDT)
Received: from [192.168.0.71] (75-128-4-81.dhcp.snlo.ca.charter.com.
	[75.128.4.81]) by smtp.gmail.com with ESMTPSA id
	xs13sm10959383pac.3.2015.07.10.18.31.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jul 2015 18:31:18 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
X-Mailer: iPhone Mail (12H143)
In-Reply-To: <CAJTo0LbJf+oDxvzQZztW9-Biz0zdLUXiWg3ks7KhVhXxGw5tZA@mail.gmail.com>
Date: Fri, 10 Jul 2015 18:31:17 -0700
Message-Id: <35ED4FEA-E9B6-4791-886C-0302E513117D@gmail.com>
References: <A7F547A4-FD07-4674-8DAB-A09FA32921E3@gmail.com>
	<CAJTo0LbJf+oDxvzQZztW9-Biz0zdLUXiWg3ks7KhVhXxGw5tZA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Perl recipe fixes and some updates
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
X-List-Received-Date: Sat, 11 Jul 2015 01:31:20 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-53EFD077-0A9F-47EF-BDA7-0EE517E2DDB5
Content-Transfer-Encoding: 7bit

--Apple-Mail-53EFD077-0A9F-47EF-BDA7-0EE517E2DDB5
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jul 10, 2015, at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
>=20
> Hi Jens,
>=20
>> On 9 July 2015 at 17:22, Jens Rehsack <rehsack@gmail.com> wrote:
>> With my client's update to fido I grabbed the tuit and did some patches: h=
ttps://github.com/rehsack/poky/commits/fido
>=20
> Can you rebase those onto master and send them to the list as attached pat=
ches (i.e. git send-email)?
>=20
If not, I will gladly help Jens on this.

--Tim=

--Apple-Mail-53EFD077-0A9F-47EF-BDA7-0EE517E2DDB5
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><br></div><div><br>On Jul 10, 2015, at=
 3:52 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.bur=
ton@intel.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div><di=
v dir=3D"ltr"><div class=3D"gmail_extra">Hi Jens,</div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 9 July 2015 at 17:22, Jens Rehsack <=
span dir=3D"ltr">&lt;<a href=3D"mailto:rehsack@gmail.com" target=3D"_blank">=
rehsack@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":r3" class=3D"a3s" style=3D"overflow:hidden">With my client's update=
 to fido I grabbed the tuit and did some patches: <a href=3D"https://github.=
com/rehsack/poky/commits/fido" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/rehsack/poky/commits/fido</a></div></blockquote></div><br>Can you=
 rebase those onto master and send them to the list as attached patches (i.e=
. git send-email)?</div><div class=3D"gmail_extra"><br></div></div></div></b=
lockquote>If not, I will gladly help Jens on this.<div><br></div><div>--Tim<=
/div></body></html>=

--Apple-Mail-53EFD077-0A9F-47EF-BDA7-0EE517E2DDB5--
