Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id B9D86731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 11:15:10 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id n6so202999953qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 03:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BBuVj3wWcXnYBIGuIyp82vKt1U0VEdVU+0H5xJwLbAM=;
	b=v04S36XCsTMGKtxjsB+H64xOoQ+UdZIlk555QEjltCk4NSxzrBKS7gAuf2FEXz8M3N
	aRFQhVQK5bKgxwgJFm7DJ7nRCsqTIK1s97QOiVkPbMNtTo6WTWf11Tb3p7AvphI64yjW
	Ibr1Tn69G4lkLAIqyOrIBAHFvB7w336H0pgqb7WuuS0Vp0JLsWhPPzT46esng/7T4Qrl
	6lUMb+0sBgR8iQxu0zpM38eRKPsHwp2g55ZiPGqlgq8U2t9+h1iZ4wfIdhTcPwCYhZQJ
	AfnfVxZkdKTWN4AMmLgd/rY3N2Hsv+nzcXzaq2QwfOzmaOsj6ubfJHxhalT8EKFQ+XRL
	XBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BBuVj3wWcXnYBIGuIyp82vKt1U0VEdVU+0H5xJwLbAM=;
	b=dVpbYBca3SKJpj5sl8X1F1yT58aqzm0Zk/BZQHusGloZXxGqFZXk8MFWFBshpqyv+p
	eQXqi0YzvQgLgLRHugyAZFH3si/cdYk9PWlgamrZv2Xur3X2tJkxZtyjyOVeglq2ioSm
	F0kT5tKjkU+RmB/a1zkqDmFeKslAaYEqP12To9Y3RruMDXp+9EacW+1G1u8G3d7Hg4HQ
	SKkOE/PZYnRSCsf0p9uUD+4Jupnuvq1MmGK75p+TCEEVu11gw94ONC1XhNyONj4O2k05
	ME5e8CpV4CdQrvYCPNwf4kSvWmSA3V01kGHumQKWJz2Gg44buamcHNs1KTavwI77wQhy
	cX/w==
X-Gm-Message-State: AIkVDXKBOvLXB8gNtTuw3vlCymjns/HVNAhbS1UUo2WvZiGR8vvjoLoJFuGMMImx2l9cjSMeFJ36xvwWdpGxkyYB
X-Received: by 10.237.49.230 with SMTP id 93mr3785024qth.109.1482318911695;
	Wed, 21 Dec 2016 03:15:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 21 Dec 2016 03:14:51 -0800 (PST)
In-Reply-To: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
References: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Dec 2016 11:14:51 +0000
Message-ID: <CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Wed, 21 Dec 2016 11:15:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e22d761d0544294423

--94eb2c1251e22d761d0544294423
Content-Type: text/plain; charset=UTF-8

On 21 December 2016 at 08:19, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * src/gpgme.h.in (GPGME_STATUS_KEY_CONSIDERED): New.
> * src/status-table.c (KEY_CONSIDERED): New.
> * src/op-support.c (_gpgme_parse_inv_recp): Add argc KC_FPR and
>   KC_FLAGS.  Use calloc.
>   (_gpgme_parse_key_considered): New.
> * src/sign.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
>   (release_op_data): Free KC_FPR.
>   (_gpgme_sign_status_handler): Handle STATUS_KEY_CONSIDERED.
> * src/encrypt.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
>   (release_op_data): Free KC_FPR.
>   (_gpgme_encrypt_status_handler): Handle STATUS_KEY_CONSIDERED.
>
> Reference: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=
> commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027
>

Can you explain *why* we should cherry pick a patch from upstream?

Ross

--94eb2c1251e22d761d0544294423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 December 2016 at 08:19,  <span dir=3D"ltr">&lt;<a href=3D"mailto:ming=
li.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ai" class=3D"a3s a=
XjCH m1592079c20da5032">From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@win=
driver.com">Mingli.Yu@windriver.com</a>&gt;<br>
<br>
* src/<a href=3D"http://gpgme.h.in" rel=3D"noreferrer" target=3D"_blank">gp=
gme.h.in</a> (GPGME_STATUS_KEY_CONSIDERED): New.<br>
* src/status-table.c (KEY_CONSIDERED): New.<br>
* src/op-support.c (_gpgme_parse_inv_recp): Add argc KC_FPR and<br>
=C2=A0 KC_FLAGS.=C2=A0 Use calloc.<br>
=C2=A0 (_gpgme_parse_key_considered): New.<br>
* src/sign.c (op_data_t): Add fields KC_FPR and KC_FLAGS.<br>
=C2=A0 (release_op_data): Free KC_FPR.<br>
=C2=A0 (_gpgme_sign_status_handler): Handle STATUS_KEY_CONSIDERED.<br>
* src/encrypt.c (op_data_t): Add fields KC_FPR and KC_FLAGS.<br>
=C2=A0 (release_op_data): Free KC_FPR.<br>
=C2=A0 (_gpgme_encrypt_status_<wbr>handler): Handle STATUS_KEY_CONSIDERED.<=
br>
<br>
Reference: <a href=3D"https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dgpgme.gi=
t;a=3Dcommitdiff;h=3D315fb73d4a774e2c699ac1804f5377559b4d0027" rel=3D"noref=
errer" target=3D"_blank">https://git.gnupg.org/cgi-bin/<wbr>gitweb.cgi?p=3D=
gpgme.git;a=3D<wbr>commitdiff;h=3D<wbr>315fb73d4a774e2c699ac1804f5377<wbr>5=
59b4d0027</a></div></blockquote></div><br>Can you explain *why* we should c=
herry pick a patch from upstream?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--94eb2c1251e22d761d0544294423--
