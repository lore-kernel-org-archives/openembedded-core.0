Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id D7264771CE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 20:33:05 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id i65so21575024ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HaLsOxnFeMQ/1+n5H9AdsTkLz6mpDnblvGlk8tlWd2M=;
	b=DWnpBjNYLKm2eJcLt0GWSUsJJj7+96VNJMoqB6+oA/UCzybzJvJfs8IMXyN1h9Vvhn
	w879656Zlk57TC/SzuxqPjYvHQTjA/s7sIUEmdAIxKE5pkXfd62z7hM4c4b8xLuU7G5f
	EzaV5sKuoBd4oOUy9tEkN9AQfPaEhLEGnw6eFOCtNGFGafC0cDefMqMeS9dfvCHrquL5
	zSYS+lC/m2aA4EMpbUfYEGiJqJk49lOVA1uA3pmyRCzLdXqZOek+rL71to0KZEpUirNE
	GjjXghGXha0UvURv0sxLQqgvXPTiGTiPzSlYazFI60SUpR56L1k3pKyhLhPheqsTsr3u
	0i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HaLsOxnFeMQ/1+n5H9AdsTkLz6mpDnblvGlk8tlWd2M=;
	b=iNJAIaor+bzmc+8vYOULoHHaU3ByhqkD8/t2fjStTgLHEe0Tk9j1Uw83uwJyqlqr+V
	9lMobS93vJf/2ewsQa2dG9x6c+83c2pvDE1h+SxBWv+xPh3+/bTMPATVPttiUSB05cas
	A6Cp3etmWrst22sSVXUf6X/7bZ9aZtXhSqcXhtNRaDU1DuBT54Ek40Xp0ZCE7gHfYmch
	/XRpv2MJehjq+jELcrVoadjRlc9hu+GRo2ysOaq+vgnnpkCaI+2DALFnJnxFjsHvmOhk
	vllpNxC8txMitntj0Rhe0zRZdWPM4X4gvSjsTkZFGYqkBa/fZgiJ570JG4N675lcPsVg
	tWqA==
X-Gm-Message-State: ALyK8tJkpRzmMJ2lGjHnXkI2vp19owU5HAd61ZmQJ2pNRZ3YjnyxRpevTFs05sMliD0Va0MrLKBoTcLzelEm5LMK
X-Received: by 10.36.2.71 with SMTP id 68mr12627022itu.38.1465158786018; Sun,
	05 Jun 2016 13:33:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Sun, 5 Jun 2016 13:32:46 -0700 (PDT)
In-Reply-To: <20160531052108.GA88947@builder0.em.health.ge.com>
References: <cover.1452235739.git.ian.ray@ge.com>
	<31c742546bd534942c5d445256e0af1aaa64b668.1452235739.git.ian.ray@ge.com>
	<20160531052108.GA88947@builder0.em.health.ge.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 5 Jun 2016 21:32:46 +0100
Message-ID: <CAJTo0LZM3QUoqtApNvqfuq+coCqPP=OKyk-neKqodMow5oSJdg@mail.gmail.com>
To: Ian Ray <ian.ray@ge.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Sun, 05 Jun 2016 20:33:06 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d0fb072105348ddc68

--001a1144b1d0fb072105348ddc68
Content-Type: text/plain; charset=UTF-8

On 31 May 2016 at 06:21, Ian Ray <ian.ray@ge.com> wrote:

> There was quite a lot of discussion in the v1 patch thread, but
> this patch was revised based on Phil's comments[*] and as such
> it seems like a good first step.
>

Doesn't the kernel itself so the initial firmware search, and if so is that
correctly informed to look somewhere other than /lib?

Ross

--001a1144b1d0fb072105348ddc68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 May 2016 at 06:21, Ian Ray <span dir=3D"ltr">&lt;<a href=3D"mailto:ia=
n.ray@ge.com" target=3D"_blank">ian.ray@ge.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D":2lt" class=3D"a3s aXjCH m1550572fee=
d9ded9">There was quite a lot of discussion in the v1 patch thread, but<br>
this patch was revised based on Phil&#39;s comments[*] and as such<br>
it seems like a good first step.<br></div></blockquote></div><br>Doesn&#39;=
t the kernel itself so the initial firmware search, and if so is that corre=
ctly informed to look somewhere other than /lib?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1144b1d0fb072105348ddc68--
