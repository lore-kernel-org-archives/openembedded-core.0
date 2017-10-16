Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CED9A607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 11:57:02 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id n195so890149itg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sIw2yx4eJK4QzfWfObrd9revsrTmfginDOEomhg1oNU=;
	b=SImYHVbcAxCmnS2enN1GixNXqV3zl/xInCdRqIc92wfiRCkeMtFx8Kusdv0T2txcMF
	2ZP3V7fk9oOITR2Mqnhz3/nnihyFdA+CMAVu1v/2o9CcwzqhJO+VqpyHj7EHTvY87GVB
	cRh1rXtI5FjzJAwIB4WTu0QgoqwTZAHNC7NYDZ4W8xVvXOZXx/sEJx1SLpMvovjRRYif
	JIG70hgv2SFIM1weM9F6146SOvvsarE0IRB2t1mZV8xj5afe9aH7QiQx137/P2IocjuI
	yc7HaqL266WfC/GxmDHnBbxNSA/7x1PFlNCJ1I6waeyA4EunN1NrMAY5N9eX3br7DB7r
	V2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sIw2yx4eJK4QzfWfObrd9revsrTmfginDOEomhg1oNU=;
	b=nOp90MjFNmhsU42rabjSRdTOadQPGDYrL11EbcqH3wrmeZY5jVCjaF6RE2GCxOowXV
	kXS/jMrWd74iEOwd8EQYw6YXgzVIBcG+qseuvSKVL5BSL7rwyFeuRlkk/86ArITJSynt
	oSz8EFYGGJdAgZxmm5IV/hp93WM8o5pcNGd3sXyxfPYKc875wUwIC2KjohkkPVguLp+s
	/kuhMkCMbGke2H+rQgwk9GLKS0gYKHHpeyJCqNAek17rXFsicOhDdBz7yEe6StM1A9AE
	XE5psMr6h+CUxIl7/f548yLLzgLHzjJYanbCFXuRUmIEBKXm4SyNBB7rUDitKDVuLies
	6pqA==
X-Gm-Message-State: AMCzsaUWAkQO6EvVEQ+FTDNSKSCSeQVocimlEOkKtMvobAO5jge2R1Ie
	5ZJAE/QW2TBHUui9K8+Ip7EfS8hOQ78rNs4tC54TWg==
X-Google-Smtp-Source: ABhQp+QN+FdkYl92QbtECV2e2DjizuQT7vjP3wBC2P7ZTgQyAOeh1MQ4W3OM/TzBZyxbOeZQ6LYUl3GYsUbIMMFTZQA=
X-Received: by 10.36.138.133 with SMTP id v127mr752684itd.151.1508155023961;
	Mon, 16 Oct 2017 04:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 04:56:43 -0700 (PDT)
In-Reply-To: <20171012095242.4865-1-fathi.boudra@linaro.org>
References: <20171012095242.4865-1-fathi.boudra@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 12:56:43 +0100
Message-ID: <CAJTo0LYRs2Zw-19-_nQ2=CKYe_vYcC54C7iDQrQa5SE6M8zw9w@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ltp: update to new upstream release 20170929
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
X-List-Received-Date: Mon, 16 Oct 2017 11:57:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c080086786252055ba8b467"

--94eb2c080086786252055ba8b467
Content-Type: text/plain; charset="UTF-8"

On 12 October 2017 at 10:52, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> * Update SRCREV to match 20170929 release
> * Drop patches available in 20170929 release:
>   - 0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
>   - 0038-commands-gdb01-replace-stdin-with-dev-null.patch
> * Add patches backported from upstream:
>   - 0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
>   - 0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
> * Add additional runtime dependencies:
>   - ld01, file01 and logrotate tests requires file command.
>   - quotacheck is required by quota_remount_test01 test.
>   - LTP checks for a compliant 'tar' but finds that the version from
>     busybox lacks the '-d' option.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> Changes in v2:
>  * Add patches backported from upstream:
>    - 0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
>    - 0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
>  * Add additional runtime dependencies:
>    - ld01, file01 and logrotate tests requires file command.
>    - quotacheck is required by quota_remount_test01 test.
>    - LTP checks for a compliant 'tar' but finds that the version from
>      busybox lacks the '-d' option.
>

Sorry still fails:

fcntl36.c: In function 'test_fn':
fcntl36.c:303:2: error: format not a string literal and no format arguments
[-Werror=format-security]
  tst_res(TINFO, msg);
  ^~~~~~~

Ross

--94eb2c080086786252055ba8b467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 October 2017 at 10:52, Fathi Boudra <span dir=3D"ltr=
">&lt;<a href=3D"mailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.bo=
udra@linaro.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">* Update SRCREV to match 20170929 rele=
ase<br>
* Drop patches available in 20170929 release:<br>
=C2=A0 - 0037-ltp-fix-PAGE_SIZE-<wbr>redefinition-and-O_CREAT-<wbr>undeclea=
r.patch<br>
=C2=A0 - 0038-commands-gdb01-replace-<wbr>stdin-with-dev-null.patch<br>
* Add patches backported from upstream:<br>
=C2=A0 - 0037-commands-nm-fix-typo-<wbr>INSTALL_TARTGETS-INSTALL_<wbr>TARGE=
T.patch<br>
=C2=A0 - 0038-fanotify-fix-build-<wbr>failure-with-Werror-format-<wbr>secur=
i.patch<br>
* Add additional runtime dependencies:<br>
=C2=A0 - ld01, file01 and logrotate tests requires file command.<br>
=C2=A0 - quotacheck is required by quota_remount_test01 test.<br>
=C2=A0 - LTP checks for a compliant &#39;tar&#39; but finds that the versio=
n from<br>
=C2=A0 =C2=A0 busybox lacks the &#39;-d&#39; option.<br>
<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">=
fathi.boudra@linaro.org</a>&gt;<br>
---<br>
Changes in v2:<br>
=C2=A0* Add patches backported from upstream:<br>
=C2=A0 =C2=A0- 0037-commands-nm-fix-typo-<wbr>INSTALL_TARTGETS-INSTALL_<wbr=
>TARGET.patch<br>
=C2=A0 =C2=A0- 0038-fanotify-fix-build-<wbr>failure-with-Werror-format-<wbr=
>securi.patch<br>
=C2=A0* Add additional runtime dependencies:<br>
=C2=A0 =C2=A0- ld01, file01 and logrotate tests requires file command.<br>
=C2=A0 =C2=A0- quotacheck is required by quota_remount_test01 test.<br>
=C2=A0 =C2=A0- LTP checks for a compliant &#39;tar&#39; but finds that the =
version from<br>
=C2=A0 =C2=A0 =C2=A0busybox lacks the &#39;-d&#39; option.<br></blockquote>=
<div><br></div>Sorry still fails:<br><br>fcntl36.c: In function &#39;test_f=
n&#39;:<br>fcntl36.c:303:2: error: format not a string literal and no forma=
t arguments [-Werror=3Dformat-security]<br>=C2=A0 tst_res(TINFO, msg);<br>=
=C2=A0 ^~~~~~~</div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Ross</div></div></div>

--94eb2c080086786252055ba8b467--
