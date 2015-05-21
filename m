Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id F002465D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 22:44:21 +0000 (UTC)
Received: by qgew3 with SMTP id w3so855285qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 15:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B5ZZ7v0P3nSOSNWpVR1vA3xysMAygtUJE4iJARMR2Ds=;
	b=HePIC+VBvrv+O1iMXP/tBN88B7+UKdbOs14GPAQVxQmi2LCSDNKmjlWLz4GuOiU0rZ
	IXO8o7Sy1JWwZFazo0cAkDzq0Pt3eXtN+pI0L9xLZzGabTtGCS6h8mFpqVHVUm6azcG2
	7dLY3CwBLAZ4fonndnIU3DDeZ5p3DuI/IHRcx5BYDf4AeiVx8L7RDcwp/nvmWsGocJ21
	HDD0BLiP5s+v01l+E6MpSaO+kO3dbIiinLYMV3yePHLL0XG6kqssTJOINUa+3wKzgdd2
	0JSJKMKvRL7GLaxVM0Y4gj2rE5npaJ3ZK4mLt+aKSexLmc/usGKXtfpDglRMpiEIASfF
	lxTQ==
X-Gm-Message-State: ALoCoQlVfeVwpjQT7myINlb1ulLKWUNhH/Zfg267FlRqPTj1hQu/XdfRYKbLH2cK9fbY2dd/mFfg
X-Received: by 10.140.88.35 with SMTP id s32mr6901645qgd.59.1432248262217;
	Thu, 21 May 2015 15:44:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 15:44:01 -0700 (PDT)
In-Reply-To: <08e1326f2da93780f39d97def138dd43319f014e.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
	<08e1326f2da93780f39d97def138dd43319f014e.1432199284.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 May 2015 23:44:01 +0100
Message-ID: <CAJTo0LY_7KYYKagSm+VRM8bwmc68Vt+0Vif9uep4yY9N9b-jsg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] python3-io: Fixes compilation of python3 ssl module
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
X-List-Received-Date: Thu, 21 May 2015 22:44:23 -0000
Content-Type: multipart/alternative; boundary=001a11c11d02e65bc605169f48d9

--001a11c11d02e65bc605169f48d9
Content-Type: text/plain; charset=UTF-8

On 21 May 2015 at 10:15, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> +++ b/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
>

This patch needs an explanation, upstream-status, and signed-off-by before
the actual diff.

Also, oh god, the upstream code is horrible!

Ross

--001a11c11d02e65bc605169f48d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 10:15, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":499" class=3D"a3s" style=3D"overflow:hidden">+++ b/meta=
/recipes-devtools/<span class=3D"il">python</span>/python3/fix_ssl_include_=
dir.patch<br></div></blockquote></div><br>This patch needs an explanation, =
upstream-status, and signed-off-by before the actual diff.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, oh god, the ups=
tream code is horrible!</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a11c11d02e65bc605169f48d9--
