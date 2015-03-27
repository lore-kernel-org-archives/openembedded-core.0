Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id E39376013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 09:56:42 +0000 (UTC)
Received: by qgh3 with SMTP id 3so112941987qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 02:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jvukaGbmxyslKU0Y9Cxbl+6OP6NN8GEq/LMUgi7DhVQ=;
	b=hH9j9EGwkoLf1qVug1R3e4hazCYK27KJVrfdada+HqG19wwQOpOG276Uy4oFFRQgOz
	lrYxPzJ0zIGPTw+bRb/z56GMQaB1x7EZgG4uGTAbH5U+cSD6s22AX0iiOtPv9FN+Caay
	NGhwMGxTuKvg3uaPjx9IKP+rbX2q/z841lsr3s/Jq5ralXJsSukvcTsGi3HRgAf6rI/P
	c8eT5U36v+0XdcGFuAamaoRny29O+QxfsLlsCzLdq6tC2ncv332Cwa5ipa+mefXxL84c
	T4OiuIYSosbAMGnm3W0HJpDYX3BAjjbxRi98Mh5pfYCNpV0N0uBT6wl6dc89xEgIWdrF
	MDjQ==
X-Gm-Message-State: ALoCoQl1LFxU3ePvhenwVUH6QQa05gmr4fbU3cp6jvOFA53sj+DdD8r37dUz7fDfBaRQfw9S3haF
X-Received: by 10.55.23.208 with SMTP id 77mr37818540qkx.21.1427450203357;
	Fri, 27 Mar 2015 02:56:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Mar 2015 02:56:23 -0700 (PDT)
In-Reply-To: <5514CF16.2020804@huawei.com>
References: <1427361482-5775-1-git-send-email-zhengjunling@huawei.com>
	<1427363666.14020.62.camel@linuxfoundation.org>
	<5513EE0B.5070802@huawei.com>
	<5513F450.1010701@communistcode.co.uk> <5514025A.4080004@huawei.com>
	<CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
	<5514CF16.2020804@huawei.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Mar 2015 09:56:23 +0000
Message-ID: <CAJTo0Latp9ifgWHDAJGb=m4tuj3ChahC4sxEOwy+pNjE0RkYSA@mail.gmail.com>
To: Junling Zheng <zhengjunling@huawei.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"peifeiyue@huawei.com" <peifeiyue@huawei.com>
Subject: Re: [PATCH] file: remove the original magic.h
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
X-List-Received-Date: Fri, 27 Mar 2015 09:56:43 -0000
Content-Type: multipart/alternative; boundary=001a11479e2e4e5ab005124226b2

--001a11479e2e4e5ab005124226b2
Content-Type: text/plain; charset=UTF-8

On 27 March 2015 at 03:31, Junling Zheng <zhengjunling@huawei.com> wrote:

> So I think the true reason is that if the magic.h exists already,
> sometimes Makefile will not generate it again.
>

In that case it's likely entirely down to timestamps.   How are you
modifying magic.h.in?

Ross

--001a11479e2e4e5ab005124226b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2015 at 03:31, Junling Zheng <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:zhengjunling@huawei.com" target=3D"_blank">zhengjunling@huawei.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50u" clas=
s=3D"a3s" style=3D"overflow:hidden">So I think the true reason is that if t=
he magic.h exists already, sometimes Makefile will not generate it again.</=
div></blockquote><div><br></div><div>In that case it&#39;s likely entirely =
down to timestamps. =C2=A0 How are you modifying <a href=3D"http://magic.h.=
in">magic.h.in</a>?<br></div><div><br></div><div>Ross</div></div></div></di=
v>

--001a11479e2e4e5ab005124226b2--
