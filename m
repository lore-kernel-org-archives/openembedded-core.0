Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7249665CB6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 15:00:10 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id l7so31538445qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H6FafaadQfoctN33PbjGRaNnSZHuaP49CGd4Ywn2Iik=;
	b=G1UlJ6ycNWdhoXI4NOWXAPKQQaOAm2MZiHAs2FMEkYk5gEdYXQmJjyRa3MMlL8+Jgp
	8zbbe/qx16Y70XeVl3IHdeUypQSpMgOheaGlm5tFm5iDBJpYb3mPT6YB8s2yLgz+y1nS
	dTbIFU1evCYo0YWSYAwf0kEi18iySNNCk+4pEjcOkM03SNFrpCeXhTdyMxL/NYjye66O
	77ySh+h3EnEfyKCP0pPxj6mJrF8xySeLE+9FeDaVQbeeOKdHupzhTHVo3k4odbGyrS7Q
	/rzYoks90CpwvW+Yn9XfHjdDse2PeBkFMtWqXHS0JJBDUnnYhW1eF7+8mhg5+NCw21aH
	aeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H6FafaadQfoctN33PbjGRaNnSZHuaP49CGd4Ywn2Iik=;
	b=mxAksXUPV6LYZDI14jSVpWu43bEfLYix4LkwkQ6WG/zlwE0BXga6TFzvX+vwKPhOeB
	mJ4Hue97dg5YbU1oBaTDDDNEWzj5jmInEs7k4PI1S0Z+ULMcNRD1GPno4FdTvucePGWr
	bu3DFcUzoqKLb//dYpXZCB7Grbr7qJM2yNA1NFiq/6okvxBdfwYbnmmCMZVRLf3TktVD
	KX4f62vQxBHRMcI0JgbGSq6A1FyRn9Q7ohEzwXLSjMbdCmUpUTwzSSqKbUhhbYeDX2pc
	rCtjB5W0eQtHI8T7h4rZYIGFI3vwZFHyGAya6KYZTH6u+D+4FatVTe+WUXe/msw5LkHW
	SVHQ==
X-Gm-Message-State: AIkVDXIEUhju/V/Onv8nosUY8KlJ0sGksDvlfqKInqkanLRTt52TSE/AN7Jw23ITOpg90Lzg90aET8myDwgtlsc7
X-Received: by 10.237.39.148 with SMTP id a20mr7810886qtd.65.1483714811295;
	Fri, 06 Jan 2017 07:00:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 06:59:50 -0800 (PST)
In-Reply-To: <46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 14:59:50 +0000
Message-ID: <CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Fri, 06 Jan 2017 15:00:11 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d846c1ed05456e4640

--f403045ee6d846c1ed05456e4640
Content-Type: text/plain; charset=UTF-8

On 26 December 2016 at 08:10, Chen Qi <Qi.Chen@windriver.com> wrote:

> +       cp ${B}/src/stage1flex ${D}/${bindir}
>

Can this not just use the flex from flex-native directly instead of having
to install the stage1flex?

Ross

--f403045ee6d846c1ed05456e4640
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 December 2016 at 08:10, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":777" class=3D"a3=
s aXjCH m1593a2e26ecad7ee">+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/src/stage1fl=
ex ${D}/${bindir}<br></div></blockquote></div><br></div><div class=3D"gmail=
_extra">Can this not just use the flex from flex-native directly instead of=
 having to install the stage1flex?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--f403045ee6d846c1ed05456e4640--
