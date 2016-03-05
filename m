Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 62F8B731C5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:09:40 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id hb3so7126247igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pOtpS5w5UWd9eqgWY2NNB6L+eaa/GEK8n2CxXXbhDLk=;
	b=oKuyvl6ZbCYFTa5RXyeqf0Wa5mk6bRkb38OwEVFxL/0ZKaQ7JdMaTNS6HISXBO7tWB
	xLLQwy7IA3czrbtl40EBd2ajRWHRFVdjdaaXP90lsGSGIPS3IcKFdlzLroA1oIa83BAp
	kZEL6IwMNMaBbAwyNI83+9AgHXZ3+N2XnmpRGxx2IPN9Tx/Bd73qHxwUPIGWGH3WvJPP
	8EZ6ixrkZ7tC1MzP+4lDZuzs+fQdHyuQX+kZ87Q/B/6x2oWs+ecKZE6cUEuNJt9eI96B
	dtlQNob+ZLC9yi6TB0tQtTOJSJKjnzN+DaEJtToT1OcO1NjfqWdl3jJp8YAZ5vkllObg
	t+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pOtpS5w5UWd9eqgWY2NNB6L+eaa/GEK8n2CxXXbhDLk=;
	b=a/lJnOTjUmY4v5ic3t2hOh1HjkrWH2Q2ZdL17wdfYBM8DhrxSEEGAhjrGeT7vKTwrl
	439QnvsV0ivEB2/ESdFQhZSjb+D5rcO1J3Zbr0axDxossEOPBLfmIRLOvIrKr0WnaoN/
	vjKEvr2P84dm8GqvYfujVnFg+GU/k39zepjk4ZvGjwOW49tmR5vPqfPeBAP6Uxz+tb6H
	jA0wnLesa8KFf7y7W0nROhmgHBZwnGmgrXT36X3CwB6ZEWQRPYzvyjs7trctGXMJ6Jpi
	hDd9G/mc7ks6E4JqGcYTGAFfcrQAvz2Z4bd5hoTK5QYbRZbX/AXhWFc3p/AMqDyEEwg4
	nAzw==
X-Gm-Message-State: AD7BkJI+GMzOnFRda1/zfQF1DGkR4eX7BvIgcF/15qLRgkXbUYLsBoW3NyGcJwSARwwscflmm/82YJQmj/oQwnuG
X-Received: by 10.50.43.226 with SMTP id z2mr1671159igl.78.1457136581762; Fri,
	04 Mar 2016 16:09:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 16:09:22 -0800 (PST)
In-Reply-To: <1457131877.2804.65.camel@linuxfoundation.org>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<1457131877.2804.65.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 5 Mar 2016 00:09:22 +0000
Message-ID: <CAJTo0LZNbYcQ-6QP9XQaEPsYxWQizvezy3XXdRrfxmMUD02iuQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Sat, 05 Mar 2016 00:09:41 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4587a77052d420c43

--047d7bfea0f4587a77052d420c43
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 22:51, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> * a codepage issue with mcopy (uninative)
>

My hunch is that we need to add the utf8 gconv module to the tarball?

Ross

--047d7bfea0f4587a77052d420c43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 22:51, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1gc" class=3D"a3s" style=3D"overflow:hidden">* a codepage issu=
e with mcopy (uninative)<br></div></blockquote></div><br>My hunch is that w=
e need to add the utf8 gconv module to the tarball?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4587a77052d420c43--
