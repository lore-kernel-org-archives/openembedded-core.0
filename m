Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id BFDD861128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:42:11 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id db9so4825908qvb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+qcx3yg9YaWNsyisS+i8GSXAS2S0ywgEsZNIp+GCOnI=;
	b=p2ytzuLqAt73WGGXC/Cj/fu9CSf6kk8K9VezknOFH8k7PmfSyQD+d25h40fuvu1HKn
	ci4h+AbISxtItCpFIvLR/HpEt/+9yLvnEV4WnVmThdKXZe5xKVSdUYrj1OB1SHOMwSbi
	OVRIEch2J8DX5tjT91DiUNzT7n8PrWSp4SJ/l2EYUG3WIhzyyt/qtBSoygAMDAHtLVMI
	SGsdyhv7hIu2fTPUX1v4eWGN+s5jKC/QN7fKl7lxxyKe26LI6n4BDNEDRTw+GFKn894w
	Ps08OqxCTh1FYf7jiRLAcLLhJT0lXsSscIrdsi/Kmk+vIfWHngPxoLULhNol0iS2IipJ
	Gxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+qcx3yg9YaWNsyisS+i8GSXAS2S0ywgEsZNIp+GCOnI=;
	b=WXlp3mtqKdm4WnIcJ7qAAI00SddYcfTfUUq9rqaRLmuYct7+U/kovGEzwaEKHISvx+
	S9P2DVBC4LL0+gPXGVS9j/IcIbXb5buWv14SE5ZLgiZjbveA6QwmLEwlYoJJNqLCSvgI
	FUVRASmzsuwXLIDYc+rdYsuW2s99Ozq5VkhYvEFcZPbjDSEhSnQ8av0KvpASiMqtA9xt
	4G9kZPgF/efHlicRxkEYamh8ifdjDYFShpu3+BnMU3BphC6JggDmR90ofGGyMJKqc7ln
	b9hN2sFi9nwCl4JlsP2bcjL7+sJpB+AoEE1XM/FOWRtkpv7bViInrrSvyni5SISDtZ+d
	txOA==
X-Gm-Message-State: APjAAAVEYmyQEH5zHLBiwiZvroQwrmIy8Q4UZJI+uU2/Kq+PcGJm5th+
	JSJI5/rYCneBbRrA5+NHd2XHKluY4WthHbZMr2A=
X-Google-Smtp-Source: APXvYqyTNVsGzOstW0LjYeMZXZwlORsQGbbsm3MDwFVCSFh78B0J+yckTxD4pWmo79fUmZjkSn8fkNF5/gKDD2lFlY4=
X-Received: by 2002:ad4:4d94:: with SMTP id cv20mr3418215qvb.99.1581709332398; 
	Fri, 14 Feb 2020 11:42:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
	<CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
	<CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
	<CAMKF1soWY20D8HwCEQK8pTsxcR8Bxc7y3aE2mnx2_XdFVJW4Og@mail.gmail.com>
	<CANNYZj-MhZhZ1QANwkQxiqCU8dtt5Mn3LzPTtqkB5-BCekDU3w@mail.gmail.com>
	<CANNYZj_bCoU-NzoKqzjTvjOr=g6LKECDPE7S7i2xpsrfYeHsKQ@mail.gmail.com>
In-Reply-To: <CANNYZj_bCoU-NzoKqzjTvjOr=g6LKECDPE7S7i2xpsrfYeHsKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 11:42:01 -0800
Message-ID: <CAMKF1sr=kyBYB2xNwT8694UVdmSKJ__QkrDzYTTkPRp5WmTDOA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 19:42:11 -0000
Content-Type: multipart/alternative; boundary="000000000000e54c27059e8e6635"

--000000000000e54c27059e8e6635
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 11:21 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I got to it finally. Normally /var/lib/rpm is absent when opkg is in use,
> but when /usr/bin/rpm is present, python3's ptest involves distutils test
> creating rpm packages (and presumably installing them too), which creates a
> database in /var/lib/rpm, which then triggers rpm tests to run and fail. So
> a check for /var/lib/rpm in rpm tests isn't always sufficient to determine
> which packaging system is in use, and there should be a stronger one.
>
> I'm fine with adjusting libsolv to not pull in rpm, but please use
> EXCLUDE_FROM_WORLD instead of PNBLACKLIST, so that just that specific
> problem is solved, rather than banning libdnf/dnf altogether from builds.
>

Blacklisting is superior since this will also catch accidental inclusion of
these packages when not using rpm backend where as EXCLUDE_FROM_WORLD will
only be effective on word target


> Making libdnf to not require rpm-enabled libsolv is not feasible sadly,
> it's basically built around that assumption.
>

Exactly


>
> Alex
>
> On Fri, 14 Feb 2020 at 13:19, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Fri, 14 Feb 2020 at 08:15, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> local.conf I have
>>>
>>> DISTRO_FEATURES_append = " largefile opengl ptest multiarch wayland pam
>>> polkit "
>>> IMAGE_CLASSES += "testimage testsdk"
>>>
>>
>> Right, I'm running this now, it's a bit tricky because I have to do it on
>> the Yocto AB. Big company's bureaucracy is causing delays in getting me a
>> build machine :(
>>
>> Alex
>>
>

--000000000000e54c27059e8e6635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 14, 2020 at 11:21 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>I got to it =
finally. Normally /var/lib/rpm is absent when opkg is in use, but when /usr=
/bin/rpm is present, python3&#39;s ptest involves distutils test creating r=
pm packages (and presumably installing them too), which creates a database =
in /var/lib/rpm, which then triggers rpm tests to run and fail. So a check =
for /var/lib/rpm in rpm tests isn&#39;t always sufficient to determine whic=
h packaging system is in use, and there should be a stronger one.</div><div=
><br></div><div>I&#39;m fine with adjusting libsolv to not pull in rpm, but=
 please use EXCLUDE_FROM_WORLD instead of PNBLACKLIST, so that just that sp=
ecific problem is solved, rather than banning libdnf/dnf altogether from bu=
ilds.</div><div></div></div></blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Blacklisting is superior since this will also catch accidental =
inclusion of these packages when not using rpm backend where as EXCLUDE_FRO=
M_WORLD will only be effective on word target=C2=A0</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><d=
iv>Making libdnf to not require rpm-enabled libsolv is not feasible sadly, =
it&#39;s basically built around that assumption.</div></div></blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Exactly=C2=A0</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></=
div><div></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 14 Feb 2020 at 13:=
19, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri,=
 14 Feb 2020 at 08:15, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">local.conf I =
have<br>
<br>
DISTRO_FEATURES_append =3D &quot; largefile opengl ptest multiarch wayland =
pam polkit &quot;<br>
IMAGE_CLASSES +=3D &quot;testimage testsdk&quot;<br></blockquote><div><br><=
/div><div>Right, I&#39;m running this now, it&#39;s a bit tricky because I =
have to do it on the Yocto AB. Big company&#39;s bureaucracy is causing del=
ays in getting me a build machine :(</div><div><br></div><div>Alex</div></d=
iv></div>
</blockquote></div>
</blockquote></div></div>

--000000000000e54c27059e8e6635--
