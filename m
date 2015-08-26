Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 569D9734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:16:20 +0000 (UTC)
Received: by qkfh127 with SMTP id h127so116619697qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 03:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l4urlK5ur66qZ+LWC6Txg9qf0u4kDtee+jNdb/qv2tk=;
	b=lre7D0e+Ymau7+LTFq7YhQGWvHQUn0aXsjClkpZMUgFBfJpftp5BADo67uPxYSklSb
	CUqEykB/HdH2G5EWoBIq8Y29Fz/nK7J2zydFYGxY09uHp2kBDrcNwTrIH+Chisl5OjPK
	/znDQgApkSKJjVdeXTXrbSv6ZOZqkJByTrUcXH8xF7OTBIc0KESYYBCZS+nvoABflz8A
	/zNmhe9M9pNltbGQB5MxgJ1RkxDhPlnh1SDXMatRNnAbN2oa0pwUqS+OjqAyywmkrYzI
	ZBb8mRej33pE4w1l4I682+AzhTUHVCzUDIDXb84HzPHgwlsKPe2G0yy04ntzxNH1GHDW
	2wAw==
X-Gm-Message-State: ALoCoQmhMlUKToTf9AZBF8v0/wy2Um5eHV4bhgy2pm+rFrYNOYit6wnKKFgGH7xA83VKjtZJoXrj
X-Received: by 10.55.53.193 with SMTP id c184mr73399961qka.62.1440584180105;
	Wed, 26 Aug 2015 03:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 26 Aug 2015 03:16:00 -0700 (PDT)
In-Reply-To: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>
References: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Aug 2015 11:16:00 +0100
Message-ID: <CAJTo0LZsddTKL-4ZikhvnFrsLr3EmOG2QAKyx8JFB4m7fXbKtQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] perf: fix the install-python_ext
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
X-List-Received-Date: Wed, 26 Aug 2015 10:16:27 -0000
Content-Type: multipart/alternative; boundary=001a11476f145342a6051e3424c9

--001a11476f145342a6051e3424c9
Content-Type: text/plain; charset=UTF-8

On 26 August 2015 at 06:58, <rongqing.li@windriver.com> wrote:

> +export PYTHON_SITEPACKAGES_DIR
>

Why do you export this and then use \$(PYTHON_SITEPACKAGES_DIR), isn't just
using ${PYTHON_SITEPACKAGES_DIR} directly so the expansion is performed by
bitbake neater?

Ross

--001a11476f145342a6051e3424c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 August 2015 at 06:58,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qp" class=3D"a3s"=
 style=3D"overflow:hidden">+export PYTHON_SITEPACKAGES_DIR<br></div></block=
quote></div><br>Why do you export this and then use \$(PYTHON_SITEPACKAGES_=
DIR), isn&#39;t just using ${PYTHON_SITEPACKAGES_DIR} directly so the expan=
sion is performed by bitbake neater?</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f145342a6051e3424c9--
