Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1AC77A46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:31:28 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p22so62312999qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oQ6lUDA4XvUkzH3N4I/oIvL1U8Ao0i7BOANNwuSPVVY=;
	b=KbrYpnd2hXAW5z9/aW7HN5nVUoTIz13vv+ryl20cr0+F8QER0t8basJyPMFSUYtrhS
	jPA2a9CkzXcMzuUL8j8kMtkMt7t+ytQOQuoZwkX6GE6uk5ohm3SxiECrzWd2FD9X6MBJ
	jHA2T23UmxmLIlc36+dFk54OOdNg3VhgnzBS5OUW/x3z80ErhxGOEmqXFZgrahOlJ040
	PlZKtlFUg4HMpYEwWnaMZIj0XZtmK4hH6DE0boj5TEgat31b+n6V/kBn4CWsgMFnGA9C
	2xobTSV/o9/80vYn1JJ6efIZQB8I9IlzHodA/eK4UCy0MRomraGxcd1+p30znfia+icP
	iZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oQ6lUDA4XvUkzH3N4I/oIvL1U8Ao0i7BOANNwuSPVVY=;
	b=dtPoGYEaelifcgJ9Ubiz3ehifDdg2DDQO10+snrITynhJwb85msjBlBQFLhWv5+oIG
	n7cep8xT3mS/sRJH8W40TLRCzJgB1YCmbZ9Cs6fxv55KteS/gPtE+ZOsVq8FBKOOrovL
	EEmpVMwPxXyx7ylJmmlBk3wN5t3bL/ZJzVxjC0mSenNXXzp12ceIfZEwHYz/VlpvK/H8
	HpcS6Lzd8iAkqRizRfXV3C7UrQkFWRwdwcEOYk/GYTcYwihx1ZhkeOJVWfeu+Z8aV9+A
	z9AabI+Benii2XMQ243o7WMhNpfkYUiFWpAL4U+40GyvJ1MQMO4KAxxAc10w4x1l4LAL
	kANA==
X-Gm-Message-State: AFeK/H3r7kh/Et7roYWu2+yXQurHJXgvX3TSREVTSBIOmAUBAqxhvKjjZQ9NA44xabXexFH32/id/ZeJKY6gR23P
X-Received: by 10.55.47.4 with SMTP id v4mr24442096qkh.77.1490700689826; Tue,
	28 Mar 2017 04:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 28 Mar 2017 04:31:09 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Mar 2017 12:31:09 +0100
Message-ID: <CAJTo0LYhHdYHb8ecGCuF_L=Cf_29a0pW3_1yk7di402C3mObLA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
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
X-List-Received-Date: Tue, 28 Mar 2017 11:31:34 -0000
Content-Type: multipart/alternative; boundary=001a114f4108159baa054bc8cd54

--001a114f4108159baa054bc8cd54
Content-Type: text/plain; charset=UTF-8

On 28 March 2017 at 11:50, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>  gconf_postinst() {
> -if [ "x$D" != "x" ]; then
> +if [ -n "${D}" ]; then
>

This totally changes how the postinst behaves.  I'll leave understanding
how as an exercise to the reader. :)

Ross

--001a114f4108159baa054bc8cd54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 March 2017 at 11:50, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":23x" cla=
ss=3D"a3s aXjCH m15b148a839a153ba">=C2=A0gconf_postinst() {<br>
-if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
+if [ -n &quot;${D}&quot; ]; then<br></div></blockquote></div><br>This tota=
lly changes how the postinst behaves.=C2=A0 I&#39;ll leave understanding ho=
w as an exercise to the reader. :)</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108159baa054bc8cd54--
