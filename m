Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 42839770EF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:04:20 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id d63so142051860ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YuPTyAg4iXQUrzYUfDBZuWhEQ5sFeNqzqy/siKtEtjg=;
	b=YVR8c2PqzMZoZMYQHtNyp+OFg+ffIkHR7h3Xp27ByZM6xANIqgzW3QoJDVPx3TbEjZ
	0meXSnZEXYHorve895b7hNrzNy/2ip5/Ns5z0RST6bS+dikbBzyXTMm7IqYH9zRnW9sM
	gy0OVmX8pZXsrSCFDlPNSrr4ov7o0xAnx69ZQymcVR7b0Moh/XGZXhe8o0EE2qh40jgm
	n1Uoo6H0mVAnigivpDhN+WWfHd2jvtkWLErqZ3EvJ0VHGJCNmoNJkPqQ78dfSJOyvbPm
	6Ri32J6uF1DYrdxH+34sL0EK0F/dmfdQZ4/AwDLWIpQkTXwq1uGXgq/40bNw+k0gSeo1
	RNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YuPTyAg4iXQUrzYUfDBZuWhEQ5sFeNqzqy/siKtEtjg=;
	b=QgQpwk5tzoDcnChwt7uNnJGMHyxDFV32A0nMoOoHdzdU9A+zNpZnNPNmd57R+RVF1m
	hLX8+xdLdiJvBg3eXMdjNeQqlQy//Vqkg1Xp8wekSRNCqguNDyCrU8oRQTbWLDiEGq2i
	1ffWFnTzaGcoBt79XRypemAfEAo3BKpC+qqmWJwXv7lDtPpQJOkiaJtvnrj99h6HwfcA
	v/oIrn9SS0llpryVSzBAL4vNe187BWlau9Gg8tP1uzx9fpIpn9yNrtCCx2F9tBtqwnSv
	eTgo8f2w6Ik8j6RP6oq7A+TEU9KieNvEnEONcKqcah6xDye/37uNKHuYgx3gRKMdfLau
	GvVw==
X-Gm-Message-State: AG10YOSBR/0w8UXuoEmhY6NRb/3vvL7CmdyAOgmvr62mEfcUCTQ/kyb15B99uAM0Ty1UrdC8SblScMI6nuDzpq/Z
X-Received: by 10.107.164.15 with SMTP id n15mr15517424ioe.148.1454706261614; 
	Fri, 05 Feb 2016 13:04:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 13:04:02 -0800 (PST)
In-Reply-To: <CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
	<CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
	<CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 21:04:02 +0000
Message-ID: <CAJTo0La-U-9vT_PCnbrBvXbS__v9MdwV6sUC93vr7k7s=JewPA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 21:04:21 -0000
Content-Type: multipart/alternative; boundary=001a11377682f9f3c0052b0c3155

--001a11377682f9f3c0052b0c3155
Content-Type: text/plain; charset=UTF-8

Hi,

On 5 February 2016 at 20:55, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> > Agreed - some may not want openssl at all and being able to switch it for
> > another alternative would be useful.
>
> sure. but, then I have some questions..
>
> 1. which one we default to? openssl?
>
> 2. which one we support, from configure.ac:
>
>         [choose SHA1 implementation])])
> case "x$with_sha1" in
> x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |
> xCommonCrypto | xCryptoAPI)
>   ;;
>

nettle / gcrypt / crypto are all in oe-core.  I presume that's BSD's "throw
it all in" libc.

nettle seems nice and low down the stack and modern.


> 3. is there a good way to handle 'multiple choice' with PACKAGECONFIG?
> How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?


With a comment saying "pick one of these", and nothing in the disabled case.

Ross

--001a11377682f9f3c0052b0c3155
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 5 February 2016 at 20:55, Nicolas De=
chesne <span dir=3D"ltr">&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org"=
 target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">&gt; Agreed - some may not wan=
t openssl at all and being able to switch it for<br>
&gt; another alternative would be useful.<br>
<br>
</span>sure. but, then I have some questions..<br>
<br>
1. which one we default to? openssl?<br>
<br>
2. which one we support, from <a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a>:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [choose SHA1 implementation])])<br>
case &quot;x$with_sha1&quot; in<br>
x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |<br>
xCommonCrypto | xCryptoAPI)<br>
=C2=A0 ;;<br></blockquote><div><br></div><div>nettle / gcrypt / crypto are =
all in oe-core.=C2=A0 I presume that&#39;s BSD&#39;s &quot;throw it all in&=
quot; libc.</div><div><br></div><div>nettle seems nice and low down the sta=
ck and modern.</div><div>=C2=A0=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
3. is there a good way to handle &#39;multiple choice&#39; with PACKAGECONF=
IG?<br>
How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?</blockquot=
e></div><br>With a comment saying &quot;pick one of these&quot;, and nothin=
g in the disabled case.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a11377682f9f3c0052b0c3155--
