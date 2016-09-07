Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1C86077725
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 07:35:45 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e124so7498973ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yzCt+hvCPlXAK1XTPlIPzhEZD5Q14aPgVu3pDNlbokA=;
	b=JgtX0brD49XXY7hEXlE6Xqq+bE4pAZFHOv1DMkYiG94gUi+LfbnWH4wKbOu54G0MqA
	x4dpyl7bskqpzobV2lZodHv66IySSN02qtcv0SEeGcAs3vxQQpk+qKiDo6crqhaQOMgj
	9r75CYYtD/XnyTLQiJx7cxP8yzQjjW6idM0Uyv7sO9iVMz7TG9VDFN1cng/OPh8GE6jv
	FYjW3CTvapXPYvU2AC5fjr2Y0Sl0l5XIjTC4LCKVKX9g9YhK7GQcxenbHnRGugzRUrkF
	TeY8pU+c9/+3DH2xZDi/Q/w0Vu8GxxcVGi1kroGQDMRDCJUNoXUQDCc0zTsGAtpBLj80
	qd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yzCt+hvCPlXAK1XTPlIPzhEZD5Q14aPgVu3pDNlbokA=;
	b=KEmtqvig3g6hK/fusrVcrHNt0wN8Y5U8JDCf613JaccoxNbl7SN/MkSN3aZUy+X1Q4
	rwCYvUHpTwE4AyLGv60z/5A1okTV/wfuQLIeSjjUiZqK5YQBhIm7b8A3Ksx83w2w7zEx
	C1m7b3cbJFyRVX/IEWC0S+GRNhvtBgXw2t1ZTDivomeMbFBvdjclQ8zjVgi41ztcy30U
	k/tWTAsEamQ48tYhO7PYdrjU5mU+oH2zTFpITijxfyIa5p63WfsgCfDhWeGjMQoUOrMb
	t65JkKuhRa+UsHNStfRxJIJHqCrTeFYA25OX305dQRk3jhr4uko+0lrUJtI8oNpAtpR3
	mkTQ==
X-Gm-Message-State: AE9vXwPLqgSVK41dvN1tuI7u3Y7fDQFgbd3nEE1i3RTpXriQqk5GnIDQ+sIs7OpqkVETqDKuv2VvhdhNX4vHD26U
X-Received: by 10.36.215.6 with SMTP id y6mr4138444itg.25.1473233746305; Wed,
	07 Sep 2016 00:35:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 7 Sep 2016 00:35:26 -0700 (PDT)
In-Reply-To: <1473217080-1941-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473217080-1941-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Sep 2016 08:35:26 +0100
Message-ID: <CAJTo0LYPQrF5=7UY3Y6yT6h8f1+RLSUjy1fOBK-2-uY9QjqJdw@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland: 1.11.0 -> 1.11.93
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
X-List-Received-Date: Wed, 07 Sep 2016 07:35:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c0afc5e1eddeb053be5f66e

--94eb2c0afc5e1eddeb053be5f66e
Content-Type: text/plain; charset=UTF-8

On 7 September 2016 at 03:58, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade wayland from 1.11.0 to 1.11.93.
> 2) Delete one patch, since it is no use.
>     0001-scanner-Use-unit32_t-instead-of-uint.patch
>

1.11.93 is a release candidate, not a release, so we'd go straight from
1.11.0 to 1.12.0.

Ross

--94eb2c0afc5e1eddeb053be5f66e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 September 2016 at 03:58, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.=
fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":23v" class=3D"a3s aXjCH m1570295ff0245daa">1) Upgrade wayland from 1.1=
1.0 to 1.11.93.<br>
2) Delete one patch, since it is no use.<br>
=C2=A0 =C2=A0 0001-scanner-Use-unit32_t-<wbr>instead-of-uint.patch<br></div=
></blockquote></div><div class=3D"gmail_extra"><br></div></div><div class=
=3D"gmail_extra">1.11.93 is a release candidate, not a release, so we&#39;d=
 go straight from 1.11.0 to 1.12.0.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0afc5e1eddeb053be5f66e--
