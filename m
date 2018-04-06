Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 423AB750F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 09:06:09 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id r184so253060vke.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cLyoEjA78SuA20jSV5CK3fbh7y2oI7eFGql6vz/0+CY=;
	b=MH38BDGjxp8XRhpc+WEibMehWp5co0S/jy/vQo4lYZ9A3FCxdpQenbh8Zr0uEzl3j/
	FIOqxa8Ugv5kPkG+xw9Q0p0NTNtXIcow1X9buQ1IW4rzI8mCoMb+n2znfW+2f4we3Iiz
	8zJGbEigUVW6/YLIAYNuBhpv6oYZyKeGfLscwjt3i9+2+0hDte/MXFc9aHfQ9tq7r6Ey
	oic09OY17RPqIPIhd8u8JW3CIKJ4fcW9LDw3RN+IENe+E2AqoH3faIXcF78BdWDStlc+
	my1CiG740fw8Mv+H0/ZlKjULeMW4o4O2F2Z2JJIVi/4qkjjV/rRT0lDAX6TbCA4X3NIy
	L/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cLyoEjA78SuA20jSV5CK3fbh7y2oI7eFGql6vz/0+CY=;
	b=j8gtkJcraXBr+gwhn0qgZVZpm/9d0q3vNcE0/bCVOfHTPBZ+vG1a7C+28QwqQUmuWK
	4JmjNQuTnThnX6aOifKKUypbgvfNFR27w+f/G+lV7uyob67rFF+VPrHVEOghySxzjvAJ
	jWOztmusFi8PbP4Tml/cuJw1M73TxrMaDcBD+C+yktgoKpAPTM0ML1edAAe77q5XUris
	Nkq8ka8CpvLLQWRC/QwB5IQPEPauz1RKpTutT4Pk08NEY34k54nE3LDsMQFNPhS9AyIi
	VCarWKo1+Zwug0kJ3pD6EMkZcb6ZY5SPJDlUtX0IFEIIXroPwr+zbuCN8jI/65ZX4PzR
	Aeww==
X-Gm-Message-State: ALQs6tCEwzX38nAQrvuCZDdWmqni/GrIGRwbDJp5oDfkxThz4Tq6hclv
	+NFQaixCxSFkdu0CnA6r3ydyJl58e5y1uTbjyObrZ2Ot
X-Google-Smtp-Source: AIpwx49exbKXgtyBG+2HMqxG7sl12skNRn1LqFPlNjZzdCwAGAx+6COcyo445TlK5/S/PXaJEbwtUC8kzQp2rwgLhAI=
X-Received: by 10.31.162.6 with SMTP id l6mr13674102vke.47.1523005570547; Fri,
	06 Apr 2018 02:06:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Fri, 6 Apr 2018 02:06:09 -0700 (PDT)
In-Reply-To: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
References: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Fri, 6 Apr 2018 14:36:09 +0530
Message-ID: <CAPGMVzGFyEiAD3XQuqWYOkomDiAht3Y+jQ=j7Yz_Q1N5Zj1EYQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	"bmwcarit/meta-ros" <meta-ros@noreply.github.com>, "bmwcarit/meta-ros"
	<reply+0166d8af28c94d998a94f8bd02e5dbf7dee27d85a84e804992cf0000000116d0c5d292a169ce126349f1@reply.github.com>
Subject: Re: [oe] [meta-ros] ros build error on poky
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
X-List-Received-Date: Fri, 06 Apr 2018 09:06:10 -0000
Content-Type: multipart/alternative; boundary="001a1143ea660607a305692a5e95"

--001a1143ea660607a305692a5e95
Content-Type: text/plain; charset="UTF-8"

i understand that this isnt specific to ros queries but i do have posted
the same at the ROS mailing-list and to ROS maintainers and the issue is to
be yet resolved perfectly.

Thanks

Rajath C S,
9964182112,
Bangalore - 560060

On Fri, Apr 6, 2018 at 12:34 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> 1. i'd like to know does the process being followed in this link lead us
> to installation of ROS-kinetic / indigo or others, hope i am clear..? that
> is want to know if the process of including and compiling meta-ros layer
> for yocto equal to install ros on ubuntu i mean in literal sense
>
> http://wiki.ros.org/hydro/Installation/OpenEmbedded
>
> 2. Is the wxwidgets_2.9.5.bb recipe important because i am getting the
> below error when 'bitbake roslaunch' is used
>
> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-ros/
> recipes-extended/wxwidgets/wxwidgets_2.9.5.bb                          |
> ETA:  0:02:07
> Traceback (most recent call last):
> bb.data_smart.ExpansionError: Failure expanding variable CXXFLAGS[:=],
> expression was ${@oe_filter_out('-fvisibility-inlines-hidden', ' -O2
> -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/
> jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-
> linux/wxwidgets/2.9.5-r0=/usr/src/debug/wxwidgets/2.9.5-r0
> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/
> build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot-native=
> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/
> build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot=
> -fvisibility-inlines-hidden', d)} which triggered exception NameError: name
> 'oe_filter_out' is not defined
>
>
> Thanks
>

--001a1143ea660607a305692a5e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>i understand that this isnt specific to ros queries b=
ut i do have posted the same at the ROS mailing-list and to ROS maintainers=
 and the issue is to be yet resolved perfectly.<br><br></div>Thanks<br></di=
v><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajat=
h C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></di=
v>
<br><div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 12:34 PM, Rajath C S =
<span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"=
_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div><div>1. i&#39;d like to know does the p=
rocess being followed in this link lead us to installation of ROS-kinetic /=
 indigo or others, hope i am clear..? that is want to know if the process o=
f including and compiling meta-ros layer for yocto equal to install ros on =
ubuntu i mean in literal sense<br><br><a href=3D"http://wiki.ros.org/hydro/=
Installation/OpenEmbedded" target=3D"_blank">http://wiki.ros.org/hydro/<wbr=
>Installation/OpenEmbedded</a><br><br></div>2. Is the <a href=3D"http://wxw=
idgets_2.9.5.bb" target=3D"_blank">wxwidgets_2.9.5.bb</a> recipe important =
because i am getting the below error when &#39;bitbake roslaunch&#39; is us=
ed<br><br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-ros/<=
wbr>recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_2.9.5.bb" target=
=3D"_blank">wxw<wbr>idgets_2.9.5.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 0:02:07<br>Trace=
back (most recent call last):<br>bb.data_smart.ExpansionError: Failure expa=
nding variable CXXFLAGS[:=3D], expression was ${@oe_filter_out(&#39;-<wbr>f=
visibility-inlines-hidden&#39;, &#39; -O2 -pipe -g -feliminate-unused-debug=
-types -fdebug-prefix-map=3D/home/<wbr>jarvis/poky/openembedded-core/<wbr>b=
uild/tmp-glibc/work/i586-oe-<wbr>linux/wxwidgets/2.9.5-r0=3D/usr/<wbr>src/d=
ebug/wxwidgets/2.9.5-r0 -fdebug-prefix-map=3D/home/<wbr>jarvis/poky/openemb=
edded-core/<wbr>build/tmp-glibc/work/i586-oe-<wbr>linux/wxwidgets/2.9.5-r0/=
<wbr>recipe-sysroot-native=3D -fdebug-prefix-map=3D/home/<wbr>jarvis/poky/o=
penembedded-core/<wbr>build/tmp-glibc/work/i586-oe-<wbr>linux/wxwidgets/2.9=
.5-r0/<wbr>recipe-sysroot=3D=C2=A0 -fvisibility-inlines-hidden&#39;, d)} wh=
ich triggered exception NameError: name &#39;oe_filter_out&#39; is not defi=
ned<br><br><br></div>Thanks<br></div>
</blockquote></div><br></div>

--001a1143ea660607a305692a5e95--
