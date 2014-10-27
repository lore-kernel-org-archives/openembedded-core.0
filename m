Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA9E70A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:20:48 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id z11so2054471lbi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 04:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0fYw7ri2qEyiLxv6BDHmNoyNDvtmLlGEb7tJtplt8mM=;
	b=Qr43UV/WC7DNzZdXC0Da4GMhvGY/TUzC7znJw5VYMM2JxhFqgSt3e+FgbUVyPaLXV3
	4vyZohcJYN0l//cwtGRRRsPiH0f0i3sPPdwdKr9pbBiaEJtHQCmMnPMtnHmExa8jCsyp
	wUdSqvqD7saeCT40rV+3JL2Je3n1e3xrb0h8CGCX7cjZGy+n+LbaLmDOkiGY0qkYbUIQ
	99m4CRzRVqpB+Jfxkwgs/4qCG48qqn6zKtZMh89SpH7yu//PwPBMdi9kZdLVugOXD86v
	hMKjgPh8saBafXr73ZqwdKyaItBWIFNYFbExRuBJkbkebGTvtOzmFLP24HzU+FymZHn5
	IRXw==
X-Gm-Message-State: ALoCoQmkxDTQgueMDI4XQb6QKKBV380erTIjDGokMitpnWsH3qmBP1E1GJnQfd/vcI9rGIyW1/Xe
X-Received: by 10.112.239.12 with SMTP id vo12mr22983070lbc.81.1414408846730; 
	Mon, 27 Oct 2014 04:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 04:15:05 -0700 (PDT)
In-Reply-To: <1414128766-13586-1-git-send-email-rongqing.li@windriver.com>
References: <1414128766-13586-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 11:15:05 +0000
Message-ID: <CAJTo0LabeHw9JreZLyVuyjkANL38yf8A3NXXmTHLDLZZAWyeCg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nfs-utils: debianize start-statd
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
X-List-Received-Date: Mon, 27 Oct 2014 11:20:50 -0000
Content-Type: multipart/alternative; boundary=001a11348490e07f74050665b88e

--001a11348490e07f74050665b88e
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 06:32, <rongqing.li@windriver.com> wrote:

>  .../files/nfs-utils-debianize-start-statd.patch    | 39
> ++++++++++++++++++++++
>

ERROR: Command Error: exit status: 1  Output:
Applying patch nfs-utils-debianize-start-statd.patch
patching file utils/statd/start-statd
Hunk #1 FAILED at 4.
1 out of 1 hunk FAILED -- rejects in file utils/statd/start-statd
Patch nfs-utils-debianize-start-statd.patch does not apply (enforce with -f)

Please rebase this, there's been changes in master.

Ross

--001a11348490e07f74050665b88e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 October 2014 06:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":3j9" class=3D"" style=3D"overflow=
:hidden">=C2=A0.../files/<span class=3D"">nfs</span>-utils-debianize-start-=
statd.patch=C2=A0 =C2=A0 | 39 ++++++++++++++++++++++<br></div></blockquote>=
</div><br><div class=3D"gmail_extra">ERROR: Command Error: exit status: 1 =
=C2=A0Output:</div><div class=3D"gmail_extra">Applying patch nfs-utils-debi=
anize-start-statd.patch</div><div class=3D"gmail_extra">patching file utils=
/statd/start-statd</div><div class=3D"gmail_extra">Hunk #1 FAILED at 4.</di=
v><div class=3D"gmail_extra">1 out of 1 hunk FAILED -- rejects in file util=
s/statd/start-statd</div><div class=3D"gmail_extra">Patch nfs-utils-debiani=
ze-start-statd.patch does not apply (enforce with -f)</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Please rebase this, there&#=
39;s been changes in master.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div></div>

--001a11348490e07f74050665b88e--
