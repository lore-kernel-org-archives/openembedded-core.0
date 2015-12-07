Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D563760124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:01:45 +0000 (UTC)
Received: by iofh3 with SMTP id h3so181879164iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mkgPPAdqepQp5BlcGMaj2uRHd//Y+XNQXIA7qjCm1oA=;
	b=kVPvRoZZvkNpoaxqRxqYxdZQaXv864vNB0HXdZWQ9dFTjc5+v4xuea3hPlXf5hPJhX
	FflMDPPOtXGXMAsQls/hlFnOngIAhk6dMmUbQslXSQAesDDfJ1pKTq7bsJ5riDEDZjTl
	HtG2nirQy54VQs4C6fmpPrNLpak5P0WgciVgv02pBinkF8Wl5DhNT+L2KK/zpelm0pAn
	wrYhjm71Azx4mWoCL3WhKqMNCTbCUELJ9FFC01EL/v73n6dYWCc1QNzQmYiAIuEbPLHB
	DeYz9GP7PIl6N7rtDWRNMPQu7iB9pJow5fXMF98hjcrEmW5/qnAZdfB82K9kRoUCOJ1R
	LvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mkgPPAdqepQp5BlcGMaj2uRHd//Y+XNQXIA7qjCm1oA=;
	b=c6LF+YNLmRD1dd68Ub4ms+k4vIm4TQF6jwOVLYtq1ibWtfyeo4ZMVGfneIb04QVuSi
	iKlCKYwXRDykLMnyzwdvrriWbw9JYjExBHxWlFMORREAKvGH5Ze0skScbOKsmGLM/IEc
	SZXax5AwvwhuL2XeghlHE6VxOYfwpkSXZA+c56b2OxIfmq6f9e+JT4QPwmumIg9IzfdR
	OIeSl238dygZ1c8qf0nyaAJRvCWG5CjRc68mE87eqCwgwSZr3Et2IRjX1GQTzRFRVEuy
	t6VUgvN+T+tGDUsZTr4ynjuI8Q7pDJIlXOG2SZQObhdMZn1kIGRCQ8vAO5jrr3NIMJ2X
	a8xg==
X-Gm-Message-State: ALoCoQl4uEznQPQST9AGAyrGtUCjXrnSmryV3zEy9xaPWmLUN7t8MrHIfNYYpvS9C5vClvD5brK/
X-Received: by 10.107.3.144 with SMTP id e16mr23654330ioi.99.1449496905622;
	Mon, 07 Dec 2015 06:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 7 Dec 2015 06:01:26 -0800 (PST)
In-Reply-To: <CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
	<CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
	<CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Dec 2015 14:01:26 +0000
Message-ID: <CAJTo0LYNtGDhyZLJnRum7XveZJ4eG1m6wvgTe8H3Sb9fpburUg@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Mon, 07 Dec 2015 14:01:48 -0000
Content-Type: multipart/alternative; boundary=001a113ecf4029c4d905264f4c39

--001a113ecf4029c4d905264f4c39
Content-Type: text/plain; charset=UTF-8

On 6 December 2015 at 18:22, Matt Madison <matt@madison.systems> wrote:

> Close, but not quite, I think.  It doesn't look like it addresses the
> ordering mismatch that occurs due to the -vfp include being processed
> before the -neon include, resulting vfpv4 preceding neon in
> ARMPKGSFX_FPU when both are enabled.
>

Martin's patch is in my ross/mut branch so will be in master soon, can you
rebase these patches please?

Ross

--001a113ecf4029c4d905264f4c39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2015 at 18:22, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"=
mailto:matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qh" class=3D"a=
3s" style=3D"overflow:hidden">Close, but not quite, I think.=C2=A0 It doesn=
&#39;t look like it addresses the<br>
ordering mismatch that occurs due to the -vfp include being processed<br>
before the -neon include, resulting vfpv4 preceding neon in<br>
ARMPKGSFX_FPU when both are enabled.</div></blockquote></div><br>Martin&#39=
;s patch is in my ross/mut branch so will be in master soon, can you rebase=
 these patches please?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ecf4029c4d905264f4c39--
