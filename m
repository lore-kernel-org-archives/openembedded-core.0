Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (unknown [209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4253965E05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 14:41:18 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id ec20so1147957lab.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tZsR8v2AzRq/m6qkeBgpDrmbcefVbHeInlR7SxoZE50=;
	b=pnb7DMewFLNictHKC8iRw6e3ct4R9nolFCJ/tcfv6C3eyLK5Cezwpg8Fxlpg0TJ9hv
	8lQndzJ/b60N/DhKDNwb35Bfea7wbVbc/HPpPHApl+dq2MpR7KrnYgAl7eUjj1HDSNqV
	Az3TQ27NUtpiWoAllBQHLyc+pCAwMJGq19QDYtClm4fosCwwyiFvfX/T/a385FCTmbKH
	RGKtNg+3/9ntECaFxe2ljz15jvpg5U5LFYRNlE9n2WWpbhWLHeBbX70rWTegJOBEgaqZ
	qF8hVhbiVaQi0+NGiLEbWowzc0nySd6NEt0J0OmcysK433MsmtAJs6sGiSAhcMIpjN9U
	8TFg==
X-Received: by 10.152.4.227 with SMTP id n3mr43662405lan.16.1400769679422;
	Thu, 22 May 2014 07:41:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Thu, 22 May 2014 07:40:59 -0700 (PDT)
In-Reply-To: <1400752550.17834.67.camel@ted>
References: <1400752550.17834.67.camel@ted>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 22 May 2014 07:40:59 -0700
X-Google-Sender-Auth: dca_WN2OSi4r8_dLv7xtH6cLZiU
Message-ID: <CABcZANkrimph3NGAFVTu7ctq8WsPBa8A8HVzzX153m6T7zyKTA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lighthttp: Use pkg-config for pcre dependency
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
X-List-Received-Date: Thu, 22 May 2014 14:41:21 -0000
Content-Type: multipart/alternative; boundary=089e013d177c27782304f9fe1b23

--089e013d177c27782304f9fe1b23
Content-Type: text/plain; charset=UTF-8

On Thu May 22, 2014 at 2:55 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> +      AC_MSG_ERROR([pcre-config not found, install the pcre-devel package
> or build with --without-pcre])


Minor quibble, but might want to adjust the error message while you're at
it :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d177c27782304f9fe1b23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Thu May 22, 2014 at 2:55 AM,=
 Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&g=
t;</span> wrote:<br>

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+ =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([pcre-config not found, install the pcre=
-devel package or build with --without-pcre])</blockquote></div><br></div><=
div class=3D"gmail_extra">Minor quibble, but might want to adjust the error=
 message while you&#39;re at it :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e013d177c27782304f9fe1b23--
