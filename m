Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1F682782A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 21:03:28 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 189so7442847iow.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 13:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6hitqykesPVDMCsL6IQ1Jwhp96GbrTUqLD3uxmg5sLc=;
	b=uZHUxbrVaWv525RBa+YH1TREHIID0tNi4hJULBWi7fLMyknhGUf9FQm9pKo+zOyJl9
	orc4Q2DiIqfOB95jPVVq93pZ8vfiAaJkVEudqNG2npavjh7+1xFPB1mcra50PBVF4Gjf
	Jh3/OrMiRKBnmIiwd5uyRfUM9cQBBniCs99gAZyOJgKNbDzBjKYhqgQ3SuIITTCLSoN9
	rKWHehT45rSqT24muGNxMPNSoZCIfR2Je5iQIDXlPi2oIIFlTeTBFzcza95G/sSV80Vc
	VRMg+rp0E+vEBBjoLfKZ33MCta30uV+xWxhMl7ppu7GD4194S/V2forjZ9Q0qGSpdco6
	yaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6hitqykesPVDMCsL6IQ1Jwhp96GbrTUqLD3uxmg5sLc=;
	b=QdbPrDPA2tLHutFvFsPuONYrjtzkqglxaic1oTiAPMGHv/fwsJTLIW4/8/qaUhesg0
	tpBt+2pdols3QatF2bRcjqYK7rhZ/KBNIT1W5DjIaXqEwxEJSm6KGCjhsPnAV6DeFTZQ
	jebFMUl0ulU2BcrIBO9cjudxHxRLEzX6GWACmpM2i1ulAs8afRq718AF5rjRFrkXGezn
	kGANYhR+t57ZQaHCg/xI42tAP94mJcg4BnAf95HFIRPLYdFCDzQUUAGUT6aoY5juSRw/
	fZYijLmhEO0jG6qTvJO1F8YiE2dJQwHQE+CYx2zsXrtv+DLUcWMpkocr+vnDFuuNf96B
	ANpA==
X-Gm-Message-State: AJaThX7UawhhXzgvYFa8wlMBco70AsyQ68nmU/FjYZBk0NctXmAXa0SC
	FM5rN7rZGfYQkxhudz0Z+nNjBUp4EBeyG7LGJXC3sQ==
X-Google-Smtp-Source: ABhQp+R9uEVIXYfENtG2ENFEwLdJY5QRWdHV2ukEz62Dk+B6qKX51VcnzM9UEC4gJKe9+ZKyaEEeiWpPu2mzNjWO9u4=
X-Received: by 10.107.170.166 with SMTP id g38mr2359919ioj.207.1510175010103; 
	Wed, 08 Nov 2017 13:03:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Wed, 8 Nov 2017 13:03:09 -0800 (PST)
In-Reply-To: <87e73eaa0b47df909565358db8eb6949889a607f.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<87e73eaa0b47df909565358db8eb6949889a607f.1507735448.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Nov 2017 21:03:09 +0000
Message-ID: <CAJTo0LYzzp=5vwNGD6dMaJB3+qeuCBt21VuQ2HoqgzGco4A3kg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 45/50] at-spi2-core: update to 2.26.0
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
X-List-Received-Date: Wed, 08 Nov 2017 21:03:29 -0000
Content-Type: multipart/alternative; boundary="001a11425fb406c0c0055d7f050c"

--001a11425fb406c0c0055d7f050c
Content-Type: text/plain; charset="UTF-8"

On 11 October 2017 at 16:34, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop 0001-nls.m4-Take-it-from-gettext-0.15.patch as it's now
> upstreamed.
>
> Remove --disable-xevie option:
> https://github.com/GNOME/at-spi2-core/commit/
> 644096a28a47bdf5c6e0c34c9cd5b944df059925


My bonus QA checks found this:

WARNING: at-spi2-core-2.26.0-r0 do_configure: QA Issue: at-spi2-core
depends on intltool but doesn't use it [configure-depends]

Ross

--001a11425fb406c0c0055d7f050c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 October 2017 at 16:34, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Drop 0001-n=
ls.m4-Take-it-from-<wbr>gettext-0.15.patch as it&#39;s now<br>
upstreamed.<br>
<br>
Remove --disable-xevie option:<br>
<a href=3D"https://github.com/GNOME/at-spi2-core/commit/644096a28a47bdf5c6e=
0c34c9cd5b944df059925" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/GNOME/at-<wbr>spi2-core/commit/<wbr>644096a28a47bdf5c6e0c34c9cd5b9<wbr>=
44df059925</a></blockquote><div><br></div><div>My bonus QA checks found thi=
s:</div><div><br></div><div>WARNING: at-spi2-core-2.26.0-r0 do_configure: Q=
A Issue: at-spi2-core depends on intltool but doesn&#39;t use it [configure=
-depends]</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11425fb406c0c0055d7f050c--
