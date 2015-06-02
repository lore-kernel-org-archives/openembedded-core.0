Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id CECE17564A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:31:11 +0000 (UTC)
Received: by qczw4 with SMTP id w4so33236258qcz.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wbdCC74gmHc3Sh8NqBvTkqI1AvquS7PV40YgkhNU2rc=;
	b=YPndxkq0bQ/dnffN8ajcewa59eD97AvkT+ZACsu8XBivN4DmEEhg5f0h8+jQh7vZKR
	ueRFAHDHfwqqJoeS5DNuGpE/GEGANp+6UByVuym+F9R8mqHjwnyeK8HktRQ5xnauUqAb
	m4HR2zcxNmVggIrB+P+UlUp9i2FJGSFgNDN8IEGS1B0FqIBIkOrZ4DVyq1nt981Ny1ab
	nVBsFB4tOvDTHf4Vi0KdGksR8Rs3UANdthZcZVgkeuBlUqBIJEG4tdr7IXRhZwmkJO/T
	hCJyUyfmVio5RhkP412MKwkAh/lVfvei+Nm2Dvz+2A38vd4rOlzw6rwys7UdfAfpGeWB
	TuHg==
X-Gm-Message-State: ALoCoQkdK3lRIeg1GfQJb8TqyUC1N0vMhwmEFh0J8vFxAph1PEotrkkiunTbrwGB8iJyMXPCG7LS
X-Received: by 10.55.18.155 with SMTP id 27mr46475714qks.36.1433241072734;
	Tue, 02 Jun 2015 03:31:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:30:52 -0700 (PDT)
In-Reply-To: <da6567b5a4f3e8de65f1c21dfc1ac9a8a52da84b.1433137188.git.liezhi.yang@windriver.com>
References: <cover.1433137188.git.liezhi.yang@windriver.com>
	<da6567b5a4f3e8de65f1c21dfc1ac9a8a52da84b.1433137188.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:30:52 +0100
Message-ID: <CAJTo0LZCmxQgwTkjCgfnhxioQwS_1_D0cDnEr7mJ9r3OMBmiZA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Tue, 02 Jun 2015 10:31:15 -0000
Content-Type: multipart/alternative; boundary=001a1147379604a95a051786714e

--001a1147379604a95a051786714e
Content-Type: text/plain; charset=UTF-8

On 1 June 2015 at 06:41, Robert Yang <liezhi.yang@windriver.com> wrote:

> -       $(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o)
> -MT $@ $(AM_CFLAGS) $(CFLAGS) >lt;
> +       $(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=.o) -MT $(@:.o.d=.static.o)
> -MT $@ $(CFLAGS) >lt;
>

Pretty sure you don't mean to drop AM_CFLAGS there.

Ross

--001a1147379604a95a051786714e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 June 2015 at 06:41, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=3D.o) -MT $(@=
:.o.d=3D.static.o) -MT $@ $(AM_CFLAGS) $(CFLAGS) &gt;lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(CC) -MM -MG -MF $@ -MT $(@:.o.d=3D.o) -MT=
 $(@:.o.d=3D.static.o) -MT $@ $(CFLAGS) &gt;lt;</div></blockquote></div><br=
>Pretty sure you don&#39;t mean to drop AM_CFLAGS there.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147379604a95a051786714e--
