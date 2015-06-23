Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8091A65C9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:31:32 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so7657460qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pfuuSJqxfVE7SswjR/gvlYPZ/SylAQCuOOHBhAzeh9c=;
	b=FYKYwhYRMKyPLboRywO/Ds/VT93XDcyu9YFAwpPtdgub60V180VuMuI1gDHc5ZdYfo
	WWuOeSAmFvfnsDjctSOUCLc8OeuB2kC0kYti6F4NOb4muvA734a1eX99srpvW6DkrYlz
	8Ak9VskgBRRSvUsIk7+1rQHi7xzDy6r08m4Ve0Y8JjUtjaRqjAYN+osKatjjG0Z050WV
	r+WEgbt62WJZbCFx5mfOiTs2TuB6GdwX+ITkC0dm74KwvVHFaQBh8032YDTeDgHjoFLp
	Bj5U0ImrN4N1ytNcffHffJGkSYmYpPCewNCEwjODOR+VBDnp2ea4GCvP7d67f/eJarES
	IoQA==
X-Gm-Message-State: ALoCoQn/BDYmIllSzRlut2HKIqHAS1YSaXxkEHAex9tPuQGsl1+Ry5xnnB+RaKeory7epCPCPSaH
X-Received: by 10.55.18.102 with SMTP id c99mr41188238qkh.58.1435077093657;
	Tue, 23 Jun 2015 09:31:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 09:31:14 -0700 (PDT)
In-Reply-To: <1434595386-11377-1-git-send-email-rongqing.li@windriver.com>
References: <1434595386-11377-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 17:31:14 +0100
Message-ID: <CAJTo0LZPX-hrN_rQ=pwWRJ4T1zYRzcTs77j=2iP7rw427njHSg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>,
	Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: upgrade to 1.0.2c
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
X-List-Received-Date: Tue, 23 Jun 2015 16:31:36 -0000
Content-Type: multipart/alternative; boundary=001a1143728064aaf2051931ec70

--001a1143728064aaf2051931ec70
Content-Type: text/plain; charset=UTF-8

On 18 June 2015 at 03:43, <rongqing.li@windriver.com> wrote:

> upgrade to fix the CVE: CVE-2015-1788..CVE-2015-1792 and CVE-2014-8176
> remove a backport patch
> update the c_rehash-compat.patch
>

This doesn't apply to master since some more patches were added, can one of
you please rebase and re-submit?

Cheers,
Ross

--001a1143728064aaf2051931ec70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 June 2015 at 03:43,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":10d" class=3D"a3s" =
style=3D"overflow:hidden">upgrade to fix the CVE: CVE-2015-1788..CVE-2015-1=
792 and CVE-2014-8176<br>
remove a backport patch<br>
update the c_rehash-compat.patch</div></blockquote></div><br>This doesn&#39=
;t apply to master since some more patches were added, can one of you pleas=
e rebase and re-submit?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a1143728064aaf2051931ec70--
