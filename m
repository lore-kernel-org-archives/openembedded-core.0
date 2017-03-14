Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD26071AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 12:06:26 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id i34so53586986qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u0z9zja/EmKFJC1/0gfcd4y8iCw4PkQGtxCYki3w3EU=;
	b=1xoNhOteyB7mwfI70dri9k0hvgB08yXW9Oe6W3Zi/d8aTftOWfNR0add8JDLZFtDHc
	WPOo+0GUc6VBXL4Ji8ecmS1rtqKppa/c5zbC65g8BDjRgeIvK4nC+WDozrYY+aIYR9IY
	LFnOh6dFVbUhCafOOteZlC8qtEv2PB6EXWPwdnzVSdZlasdk8cZ+q48FucKNtSkYvUsE
	f/xDcupFNnn3v1xvEpLUaiQXrHLgyj11QBBJDgwIRvnxbtNOkiRSf8XA1zpzOVTFSfMi
	HoXdb1kzIa9dfTsKdNMb71YiMdE+W/fk7MvAsaxlr3FTUzAzljWarxFzxB9UuhOTnPtG
	HrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u0z9zja/EmKFJC1/0gfcd4y8iCw4PkQGtxCYki3w3EU=;
	b=Jw3mhPqv4vEZ2Z1quXJhabQyhpubo11Vl57lKCo/LJE5LTolq5WEmB3GH2JBZzUv9+
	xxjDzYxHm53hSAiLyVBPkiFuUVqyWo2dT2C8Ck9RV8pCs1IfDxQlje1nj/JrUbojKTwB
	mgOT5xY08asgmupasQAdc/Q5MRR7Lit4N7619RFzZNVukKZhNcmso17keQ/JYDagWJTo
	jKXBrpbWc91/AeFyC6SxND0G8yW0pWkza6khjoq0+bQcjnzVI6QLz2Lb9K3UibUSEIlH
	Op/cfOukdN72CdftP5zssd5CXWyd39pBcHcuMAoxDLlon58LMbGQ0isJ71Itz0tx7Fr0
	F94Q==
X-Gm-Message-State: AMke39nCl8FzaFlT7E6UcolISP0cqkpTuiAsAd2/HDPBwei1+ZbTbn5CFN/A10lxl9tsElmRyuDjA9AKSSuQ2ixJ
X-Received: by 10.237.33.69 with SMTP id 63mr36556989qtc.109.1489493187544;
	Tue, 14 Mar 2017 05:06:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 14 Mar 2017 05:06:07 -0700 (PDT)
In-Reply-To: <30b0c7a3bd07acb4f0b86ddb9076a4f443c59b50.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
	<30b0c7a3bd07acb4f0b86ddb9076a4f443c59b50.1489481108.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 12:06:07 +0000
Message-ID: <CAJTo0LZipriFRQ8oRML1=9rze9C5ghzch-v87z637emaSQg6-g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] mc: set ac_cv_path_PERL to /usr/bin/perl
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
X-List-Received-Date: Tue, 14 Mar 2017 12:06:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8571793054aafa8f0

--94eb2c0c7fc8571793054aafa8f0
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 08:45, Robert Yang <liezhi.yang@windriver.com> wrote:

> +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
>

Would it be sensible to put this in autotools.bbclass?

Ross

--94eb2c0c7fc8571793054aafa8f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 08:45, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":r7" cla=
ss=3D"a3s aXjCH m15acbff8aca769db">+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_p=
ath_PERL=3D${USRBINPATH}<wbr>/perl&quot;<br></div></blockquote></div><br>Wo=
uld it be sensible to put this in autotools.bbclass?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc8571793054aafa8f0--
