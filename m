Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id A873B605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:49:20 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so27927659ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j7aZ/aq/J4tQxCnpmOvG9c75Xft+ssHLeVHmdwiSyEs=;
	b=oWWhF80rgyg5smoVNugix3LOCGGHZJeEFm5A/M3BBdzJO9nmxbhMncmHSA4RwsnZ3w
	nnMUa5S4GCmLVpkOu8/W0c2lkwMLvlJvjwcKibbwh2TUgelsyG1Uw1UEkv3NNW/aWev+
	swaOAW/pIgqt/HvjEKdegEaTN709xv28VyFCLLlniRadptW/090+fNDhfnpvvSXsAT3s
	5DYnzzC234XwN80lWNxyJM+CXG3skKGWE4hADoHkbYmEcHpuzbuICsU3buNt3zz0hGvy
	+IfqX8+CQkeHo91Lpn7Njr/eSXXigmGJcqzseaoy0emFBgz8Kzk70hHxUStqty8EsNNN
	6Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j7aZ/aq/J4tQxCnpmOvG9c75Xft+ssHLeVHmdwiSyEs=;
	b=YpS4nM6TRB0c3gZAkuHIRvvHqdBuTDYTFJiXY32H0wSBKQoacbyeLQ4WSrdl1on6h3
	HjCO+jR48PF/ShnhRarxcnTtcoICjBe+ZU9PKTU9pkzrVHLX80JeDJKSfKsAYwOg/aiQ
	yF/dSvpaeZmG2nr1//LdU+1qo4S5kOvBsKC1TkH9eW0GO4yZ1xQs1HsPfuukdD7EEOFp
	hZj+8BbZc6pPsHdkXRg7SdD9wanv2DFj+MUp3ZqSrD2rCRRKCBaKWwroxbBflIIoqIML
	+O8HFUxNKVml511vRMZswrGTJ20WUIG30xyKjPh/TElURIA/fkpWugFv2JCt0SafNIJK
	XCVA==
X-Gm-Message-State: ALyK8tKVT7Udh0Adk/yVJ8TX6mzs10VsrQtnrcCidLKamjFaKIeDVonoH2Dt4+ZERB4Yh/H36K7TjYGUWJVm9RNQ
X-Received: by 10.36.20.75 with SMTP id 72mr42961761itg.83.1469130561092; Thu,
	21 Jul 2016 12:49:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 12:49:01 -0700 (PDT)
In-Reply-To: <1468431308-23635-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1468431308-23635-1-git-send-email-humberto.ibarra.lopez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 20:49:01 +0100
Message-ID: <CAJTo0LY5sWoMHOM0yGFNh0sL_UQ8V=jgFXGWLgvigQTM1LjnRw@mail.gmail.com>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-selftest: reorganize syntax to use subcommands
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
X-List-Received-Date: Thu, 21 Jul 2016 19:49:21 -0000
Content-Type: multipart/alternative; boundary=001a11446942394d3a05382a9d85

--001a11446942394d3a05382a9d85
Content-Type: text/plain; charset=UTF-8

On 13 July 2016 at 18:35, Humberto Ibarra <humberto.ibarra.lopez@intel.com>
wrote:

> The current syntax of oe-selftest is messy. This patch reorganizes it in a
> clearer way by grouping all functions in a 'run' subcommand and a 'list'
> subcommand.
>

This doesn't apply anymore, can you rebase?

Thanks,
Ross

--001a11446942394d3a05382a9d85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2016 at 18:35, Humberto Ibarra <span dir=3D"ltr">&lt;<a href=3D"=
mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibarra.l=
opez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":6xt" class=3D"a3s aXjCH m155e5526a6bc2bce">The current syntax of oe=
-selftest is messy. This patch reorganizes it in a clearer way by grouping =
all functions in a &#39;run&#39; subcommand and a &#39;list&#39; subcommand=
.<br></div></blockquote></div><br>This doesn&#39;t apply anymore, can you r=
ebase?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Thanks,</div><div class=3D"gmail_extra">Ross</div></div>

--001a11446942394d3a05382a9d85--
