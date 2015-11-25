Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 26DA560291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:56:22 +0000 (UTC)
Received: by iofh3 with SMTP id h3so67115730iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HNtDDt3NerbQFzkyk3yKnUqGUDEgcVDrQAFzpDISnj8=;
	b=kOPjatauXNo2sLsBHM0t4OVDZj02aZCk7xowBtIy1HINvXplXqDj4IxvwGEPKVqEau
	Ovr8gS8i1cZotqJ1P0irg3HGLJFi4GBnWABIc5ol2t+EmoY9tjT283MBpHX0tqcEkwWu
	fW3wBf3DADXdgjM4JhjAa2QtQwrGHA6e1XkPBj9KhlH9NR08E1iO0VHKuiWqTahaJXoz
	g2gGv56RgcCl2rUNGZtV62/rW64xUVRJklcGWBGg2eZIp90Yj3/mWsIqAvTSdqoq1jG0
	oI1XYGF9xsqkyu3rDMFK6/73zQqcVgeQeCOxut/Z50ri//h8ZebVzxcsOJpgmti9PH5h
	zIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HNtDDt3NerbQFzkyk3yKnUqGUDEgcVDrQAFzpDISnj8=;
	b=OpbqvTxKlPDMl+DmjRaI+5APex7V0WOqYL3H1+H/SHHPdjlBe2R5VPAGw8gWIEGzb2
	L7BXOmpbSZQT/UqB541+dtrJbATvjEE1x2Bu+9oazjVwDeSqPS1AU4pmOLcNSQ2WSVQX
	2QxSXJQfFqlS5J2WD220P15JwjKWGNiDE1lmCk2jE25TMd6jk0iiZ7Wk0GCGFYKxwUuS
	Xl/hc92IZTwB6sydBIIEqwOmVezJZMOOwHggXeVPxCqaph0uMPFVH6okhtIbpD7fLKzL
	7oPvonsRhUz2txkHS2yE5pnNBrhGGtd2RVQbdRbd6FIe5tsMqbF6LpV4GY+Qmt5kmTxj
	7PbA==
X-Gm-Message-State: ALoCoQmNZy/5T/qsW3LOMeHGy1DQnahaNF0yC1kVRwuBfyDQFhfY0qE7igGPLZi3y9QpHUR3vTFi
X-Received: by 10.107.130.155 with SMTP id m27mr42329376ioi.133.1448488583316; 
	Wed, 25 Nov 2015 13:56:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 13:56:03 -0800 (PST)
In-Reply-To: <CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 21:56:03 +0000
Message-ID: <CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Wed, 25 Nov 2015 21:56:24 -0000
Content-Type: multipart/alternative; boundary=001a113ecd947854ea0525648778

--001a113ecd947854ea0525648778
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 21:40, Andre McCurdy <armccurdy@gmail.com> wrote:

> So would it be correct to add exactly those lines to the oe-core mtools
> recipe?
>

Yes.  Pretty much every dependency on glibc-gconv* should be guarded with a
libc override of some sort.  There's an open bug to give locale packages
virtual names so this isn't a problem anymore, I should do something about
it!

Ross

--001a113ecd947854ea0525648778
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 21:40, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bhm" class=
=3D"a3s" style=3D"overflow:hidden">So would it be correct to add exactly th=
ose lines to the oe-core mtools recipe?<br></div></blockquote></div><br>Yes=
.=C2=A0 Pretty much every dependency on glibc-gconv* should be guarded with=
 a libc override of some sort.=C2=A0 There&#39;s an open bug to give locale=
 packages virtual names so this isn&#39;t a problem anymore, I should do so=
mething about it!</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113ecd947854ea0525648778--
