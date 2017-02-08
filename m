Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id C56E371AEF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 12:23:51 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id k15so163451813qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 04:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a4jofXWvzHsMo98z22B21ypBU3OgGCVKbN5lK4NbyDs=;
	b=WwVIzrhwC9+/39kRkRlZZiYZNmtK40Z/50BoU6zekRQMwHufn1mqTxBRxm5hI+ZQqz
	5NUQRbTiYCVq9EUo0/fJHBNQft03UiMDck2xkvsoIZ8xBHMTkQcEJv+vocTomgTBotnI
	JPvYyff36KUa/qQYenKuf+mYyzs1F63tqsCap8c8rg3Ss/HqbH3CN+rarzrlCsnfd72u
	N1zVwi4wmCyiKbKshxU4ECJxBKdS9nseTvZ1e72Ekj8V4X7yBhFRppkIsj3rS/U1rMa8
	xUAnm+5EMESPm+eIeooK8z9HIdT5TG2ztuSQzDXFstb57vRzf0Q8B2xCGg43KTIw0WAN
	Pvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a4jofXWvzHsMo98z22B21ypBU3OgGCVKbN5lK4NbyDs=;
	b=r0M0aPH6zz78gdslc7hSlW9wJpUgj1aKOt4wvDBXx9U/bKboZI8+afJLwCVt9ekyJl
	LRW9a9omx+uQ+owE0Hi1z9uFOxxLqez+zUdcQAalJYRYk0i4wKwpQwJWmGuQ7q1bACBU
	c2ro1+Cc49tU9XpUVToNqbWcyFDWOngol1KFrJnVyro2Q6lF4THXH+c5AZxVTK0O7BfN
	LqOFIkpCtjj+3smVpNABsqhbiGBiLAb1UvOHQSa9N0vlBZ8hC4OZyEdhb6RHdx1bc4PG
	FxkizWk7eTEMaY4dkpR8HVghCgfF+7VgtWua5q9i+kf5W8qI76M77Y141VLjGJ/mNtN5
	jz1A==
X-Gm-Message-State: AMke39liZht0Y0Wn/efaro84m98yAA/OOL/XdZYn/I67/fvN0OMxC152hEFGyVli3b40wY1sAbLLPjtUE8ffs8Wz
X-Received: by 10.237.36.208 with SMTP id u16mr20921977qtc.105.1486556631830; 
	Wed, 08 Feb 2017 04:23:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 04:23:31 -0800 (PST)
In-Reply-To: <CAJTo0LYzb9LSgTraY=Jg-wOe7fcEHdqUZdbFHt32LCyzVSQgDw@mail.gmail.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<924e2b236ebe29d99cf635ff079ba234693f5cc2.1486523726.git.hongxu.jia@windriver.com>
	<CAJTo0LYzb9LSgTraY=Jg-wOe7fcEHdqUZdbFHt32LCyzVSQgDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 12:23:31 +0000
Message-ID: <CAJTo0LbZbBr7Z5ZnWEXqFjVJXf2eSaQLPtp7S5yOOtavodBXsg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] gpgme: 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 08 Feb 2017 12:23:52 -0000
Content-Type: multipart/alternative; boundary=001a114104cefac3e5054803ef92

--001a114104cefac3e5054803ef92
Content-Type: text/plain; charset=UTF-8

Also looks like the gpgme-pthread library has entirely disappeared:

packages/corei7-64-poky-linux/gpgme/gpgme-pthread: FILELIST: removed all
items "/usr/lib/libgpgme-pthread.so.11 /usr/lib/libgpgme-pthread.so.11.14.0"
packages/corei7-64-poky-linux/gpgme/gpgme-pthread: PKGSIZE changed from
245371 to 0 (-100%)
packages/corei7-64-poky-linux/gpgme/gpgme-pthread: PKG changed from
libgpgme-pthread11 to gpgme-pthread [default] - may indicate debian
renaming failure

Ross

On 8 February 2017 at 12:20, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 8 February 2017 at 03:17, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> - Drop gpgme.pc, it is duplicated with pkgconfig.patch
>>
>> - Rebase pkgconfig.patch to 1.8.0
>>
>> - Split cmake config to ${PN}-dev
>>
>> - Update LIC_FILES_CHKSUM, because copytright year changed.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>
>
> I think we need to split out the C++ bindings to a separate library
> package:
>
> packages/corei7-64-poky-linux/gpgme/gpgme: RDEPENDS: added "libstdc++
> (['>= 6.3.0']) libgcc (['>= 6.3.0'])"
> packages/corei7-64-poky-linux/gpgme/gpgme: FILELIST: removed
> "/usr/lib/libgpgme.so.11.14.0", added "/usr/lib/libgpgme.so.11.17.0
> /usr/lib/libgpgmepp.so.6 /usr/lib/libgpgmepp.so.6.3.0"
>
> Maybe add a ${PN}-cpp package for the library?
>
> Ross
>
>

--001a114104cefac3e5054803ef92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also looks like the gpgme-pthread library has entirely dis=
appeared:<div><br></div><div><div>packages/corei7-64-poky-linux/gpgme/gpgme=
-pthread: FILELIST: removed all items &quot;/usr/lib/libgpgme-pthread.so.11=
 /usr/lib/libgpgme-pthread.so.11.14.0&quot;</div><div>packages/corei7-64-po=
ky-linux/gpgme/gpgme-pthread: PKGSIZE changed from 245371 to 0 (-100%)<br><=
/div><div>packages/corei7-64-poky-linux/gpgme/gpgme-pthread: PKG changed fr=
om libgpgme-pthread11 to gpgme-pthread [default] - may indicate debian rena=
ming failure<br></div></div><div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 February 2017 at 12:20=
, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span c=
lass=3D""><br><div class=3D"gmail_quote">On 8 February 2017 at 03:17, Hongx=
u Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" tar=
get=3D"_blank">hongxu.jia@windriver.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex"><div id=3D"m_6314229121899742642gmail-:2cj" class=3D"m_6314229121899=
742642gmail-a3s m_6314229121899742642gmail-aXjCH m_6314229121899742642gmail=
-m15a1bb9e34def075">- Drop <span class=3D"m_6314229121899742642gmail-il">gp=
gme</span>.pc, it is duplicated with pkgconfig.patch<br>
<br>
- Rebase pkgconfig.patch to 1.8.0<br>
<br>
- Split cmake config to ${PN}-dev<br>
<br>
- Update LIC_FILES_CHKSUM, because copytright year changed.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;</div></blockquote></div><=
br></span>I think we need to split out the C++ bindings to a separate libra=
ry package:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">packages/corei7-64-poky-linux/<wbr>gpgme/gpgme: RDEPENDS: added &quot=
;libstdc++ ([&#39;&gt;=3D 6.3.0&#39;]) libgcc ([&#39;&gt;=3D 6.3.0&#39;])&q=
uot;<br></div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/<wbr=
>gpgme/gpgme: FILELIST: removed &quot;/usr/lib/libgpgme.so.11.14.0&quot;<wb=
r>, added &quot;/usr/lib/libgpgme.so.11.17.0 /usr/lib/libgpgmepp.so.6 /usr/=
lib/libgpgmepp.so.6.3.0&quot;<br></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Maybe add a ${PN}-cpp package for the library?<=
/div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div><div class=3D"gmail_extr=
a"><br></div></font></span></div>
</blockquote></div><br></div>

--001a114104cefac3e5054803ef92--
