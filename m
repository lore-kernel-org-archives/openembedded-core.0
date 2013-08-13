Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 74C456B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:55:26 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so7850870pbb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZgSGyvsMZGtxkTr4Xpilu3AhTCHAf9M/6fFh5cRb0pc=;
	b=AoEJVugu7KQbTsXh2tSHi1gWPfCAADM4CS/cM/YWaDmq82qxQQRO7FI+GKWCzagl8B
	KaQfULOnrJimrpQy3edjRw1IuoISGJvjUwqsRM1RjMA+gugrpW6wkwiSE2r+n3GDO7d5
	0OD6v8iyi8wvQ1uDB6llvZaGGsDZNsKEQK/XK/tCEl2nbXJ3PrVmZkoM2vXhNYUhWkH4
	8sBSop+jYHnQOGmu42+UsYihuh1h1Zl6kTBjtiqWTDKS0cdXTwaFvvx2iUlLKHDIRVKo
	NnrlszGinpHek0rNg3XfVFiIfj3WAZZHp3Bdf8M5KfLDhFKEXRQ8PdQxwAOb9qEPlMlV
	+BKA==
X-Gm-Message-State: ALoCoQmupqy2hL0VuhY1phfvDOJon6XD/U412xdbHfkX+MV9vmx91GuLh9X9oSiQfHwiPj9VnGQY
MIME-Version: 1.0
X-Received: by 10.66.192.132 with SMTP id hg4mr3679167pac.84.1376387727312;
	Tue, 13 Aug 2013 02:55:27 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 02:55:27 -0700 (PDT)
In-Reply-To: <CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
Date: Tue, 13 Aug 2013 10:55:27 +0100
X-Google-Sender-Auth: 6Kx9JTlH3r0hSkIlK3Ul-46SzPA
Message-ID: <CAOMwXhP5bThhNkLLz8i0ddOGmv2dnwR7h=HD_jRnhO40m=VnwQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 09:55:26 -0000
Content-Type: multipart/alternative; boundary=047d7bdc93ca8f5bca04e3d13d4b

--047d7bdc93ca8f5bca04e3d13d4b
Content-Type: text/plain; charset=ISO-8859-1

So, please show me how it works for this use case. Note this is note
defconfig, and has not much relevance to the kernel which is apparently
mentioned for some reason.

diff --git a/meta/recipes-core/busybox/busybox.inc
b/meta/recipes-core/busybox/busybox.inc
index acd2bfb..0e84f4c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -66,8 +66,6 @@ def features_to_busybox_settings(d):
        busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf,
rem)
        busybox_cfg('ipv4', distro_features,
'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
        busybox_cfg('ipv6', distro_features,
'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-       busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
-       busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
        return "\n".join(cnf), "\n".join(rem)



On Tue, Aug 13, 2013 at 10:52 AM, Laszlo Papp <lpapp@kde.org> wrote:

> As we have already discussed that, it is not any clear at all without
> example. Yes, the end user does not really care about the internal
> implementation of the feature ....
>
> Please provide useful examples and tutorials how to use a feature
> especially when a user (and apparently others posting here) is such
> clueless.
>
> Oh, by the way, and I have mentioned this in the bug report as well. We
> need proper documentation, examples, and tutorials; i.e. I am not ahead of
> the day when I first read this post. ;-)
>
>
> On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross <ross.burton@intel.com>wrote:
>
>> On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org> wrote:
>> > So, everyone suggested PACKAGECONFIG in here on the mailing list except
>> Khem
>> > whose reply I did not get.
>> >
>> > Yet, 4964 got closed by the "team". Could anyone please give a sane
>> > description why and what would block the end users other than fork?
>>
>> Quoting from comment 1 on 4964:
>>
>> """
>> Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
>> not sufficient to manage it's config system. It is very similar to the
>> Linux kernel config and we recently added configuration fragment
>> support to busybox from the kernel recipes:
>>
>> commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Tue Feb 5 14:36:40 2013 +0800
>>
>>     busybox: add config fragments
>>
>> This allows you to use the default config and include only the delta
>> in your layer's bbappend in the form of a config fragment added to the
>> SRC_URI.
>> """
>>
>> If this isn't sufficient or is buggy, then fixing this is preferred
>> (it works for the kernel, so should work for busybox).
>>
>> Ross
>>
>
>

--047d7bdc93ca8f5bca04e3d13d4b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, please show me how it works for this use case. Note th=
is is note defconfig, and has not much relevance to the kernel which is app=
arently mentioned for some reason.<div><br></div><div><div>diff --git a/met=
a/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc<=
/div>
<div>index acd2bfb..0e84f4c 100644</div><div>--- a/meta/recipes-core/busybo=
x/busybox.inc</div><div>+++ b/meta/recipes-core/busybox/busybox.inc</div><d=
iv>@@ -66,8 +66,6 @@ def features_to_busybox_settings(d):</div><div>=A0 =A0=
 =A0 =A0 busybox_cfg(&#39;nls&#39;, =A0distro_features, &#39;CONFIG_LOCALE_=
SUPPORT&#39;, cnf, rem)</div>
<div>=A0 =A0 =A0 =A0 busybox_cfg(&#39;ipv4&#39;, distro_features, &#39;CONF=
IG_FEATURE_IFUPDOWN_IPV4&#39;, cnf, rem)</div><div>=A0 =A0 =A0 =A0 busybox_=
cfg(&#39;ipv6&#39;, distro_features, &#39;CONFIG_FEATURE_IFUPDOWN_IPV6&#39;=
, cnf, rem)</div>
<div>- =A0 =A0 =A0 busybox_cfg(&#39;wifi&#39;, distro_features, &#39;CONFIG=
_RFKILL&#39;, cnf, rem)</div><div>- =A0 =A0 =A0 busybox_cfg(&#39;bluetooth&=
#39;, distro_features, &#39;CONFIG_RFKILL&#39;, cnf, rem)</div><div>=A0 =A0=
 =A0 =A0 return &quot;\n&quot;.join(cnf), &quot;\n&quot;.join(rem)</div>
</div><div><br></div></div><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">On Tue, Aug 13, 2013 at 10:52 AM, Laszlo Papp <span dir=3D"lt=
r">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">As we have already discusse=
d that, it is not any clear at all without example. Yes, the end user does =
not really care about the internal implementation of the feature ....<div>
<br></div><div>Please provide useful examples and tutorials how to use a fe=
ature especially when a user (and apparently others posting here) is such c=
lueless.</div>
<div><br></div><div>Oh, by the way, and I have mentioned this in the bug re=
port as well. We need proper documentation, examples, and tutorials; i.e. I=
 am not ahead of the day when I first read this post. ;-)</div></div><div c=
lass=3D"HOEnZb">
<div class=3D"h5"><div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Tue, Aug 13, 2013 at 10:48 AM, Burton=
, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targe=
t=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">

<div>On 13 August 2013 08:32, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.o=
rg" target=3D"_blank">lpapp@kde.org</a>&gt; wrote:<br>
&gt; So, everyone suggested PACKAGECONFIG in here on the mailing list excep=
t Khem<br>
&gt; whose reply I did not get.<br>
&gt;<br>
&gt; Yet, 4964 got closed by the &quot;team&quot;. Could anyone please give=
 a sane<br>
&gt; description why and what would block the end users other than fork?<br=
>
<br>
</div>Quoting from comment 1 on 4964:<br>
<br>
&quot;&quot;&quot;<br>
Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately<br>
not sufficient to manage it&#39;s config system. It is very similar to the<=
br>
Linux kernel config and we recently added configuration fragment<br>
support to busybox from the kernel recipes:<br>
<br>
commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54<br>
Author: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
Date: =A0 Tue Feb 5 14:36:40 2013 +0800<br>
<br>
=A0 =A0 busybox: add config fragments<br>
<br>
This allows you to use the default config and include only the delta<br>
in your layer&#39;s bbappend in the form of a config fragment added to the<=
br>
SRC_URI.<br>
&quot;&quot;&quot;<br>
<br>
If this isn&#39;t sufficient or is buggy, then fixing this is preferred<br>
(it works for the kernel, so should work for busybox).<br>
<span><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7bdc93ca8f5bca04e3d13d4b--
