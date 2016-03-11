Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id E27F673232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:01:19 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id ig19so16096114igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H30QWbcZYNjzA/53qsqGyDdtQCqcUuCDWNrofNH4+VA=;
	b=HiRKwTW7Ujf8YbVMFrBCIfCAFSRTpq13E2wZO2VQtY1z1fyUqqfomfPKjx9Qs6rBGM
	NXwH5qQaEeLrbglOtDjfZtL50LT0C8SnvH7G82vEueoXENFZ5l7VaXZlb2EPp3F55K9z
	RTLvbvaqnJ3y8kSGubZW1AQFKFkzkZ6NIvrSIUgRmsS5D0NRTeNXx6afHOWudQhuh44O
	NtFiz7PEdNwu1ABBXaphPDJrtZxqGR4H0IqiFlb/Sdc3sLQ2a9rCjMVxJbrNgmSlrFfR
	/SBpYFG67S8MlUizG2mwPh+wK+DuD15r04vy75jMkBasaHZc15PJeLTD2uHkKN8Cy6nK
	szyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H30QWbcZYNjzA/53qsqGyDdtQCqcUuCDWNrofNH4+VA=;
	b=bK/Uwid9LbgSmGcsYTkUDnHQQZqlDThGMxUEVDhSFXe6ty0PNCbcx1cudKYR2Fp/Vr
	o7VdeSuV0IJObSSYLVlFpIEmmGepco6B95hxiQZtjPQGhThoJ4AIDGCj0HY4lAhzZEKY
	p5TQbY5inP6ZGS0I3PT6JNe9s3X6I9DEeSodbITmXv+89fuwqMHhncOVAYhx3OYo65oR
	u2Si+llAVtnwn21+TpHsZq7tBuWo9xn9UpqN+TrLLzgL+oH6u4Z/FfxaGFzNrYf8TS1F
	9f9cYsCRI7JtqGqAg8pCgtYSKozx6sEwVTDfioDeGOXNbr+LA/uWAZgqvzeYEbRRORlB
	r8+Q==
X-Gm-Message-State: AD7BkJIWZvZUQnLhVUSf/3GlOz+tEiG+MTkXGk6li4yAaI2NeLwkrXW9YfbKcx1sMT59G1naTm5Qn45e+wwshAK0
X-Received: by 10.50.150.41 with SMTP id uf9mr4716081igb.64.1457715679867;
	Fri, 11 Mar 2016 09:01:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 09:01:00 -0800 (PST)
In-Reply-To: <95245B46D926B348AEB132E99037C59B36A9FE73@ULM-DC01.bmw-carit.intra>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
	<CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>
	<7AB4B008-780B-4619-A914-7A00D132FCF0@gmail.com>
	<95245B46D926B348AEB132E99037C59B36A9FE73@ULM-DC01.bmw-carit.intra>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 17:01:00 +0000
Message-ID: <CAJTo0LZND6-QdyFzQdo4v_-z6VcmYG8KjOSanAQ=SH=8eg0gUg@mail.gmail.com>
To: Helio Chissini De Castro <Helio.Castro@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 17:01:21 -0000
Content-Type: multipart/alternative; boundary=001a11345c0c4872bd052dc8e12f

--001a11345c0c4872bd052dc8e12f
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 16:24, Helio Chissini De Castro <
Helio.Castro@bmw-carit.de> wrote:

> If i change recipe scope, need to be on each gcc_${PV}.inc.
> But they include gcc-common.inc on top, which states LICENSE = "GPL"
>
> So, gcc_${PV}.inc is already overriding the original license. If you think
> is ok, i can do that on gcc_${PV}.inc
>

No,you're right - your v2 is the best patch.

Ross

--001a11345c0c4872bd052dc8e12f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 16:24, Helio Chissini De Castro <span dir=3D"ltr">&lt;<=
a href=3D"mailto:Helio.Castro@bmw-carit.de" target=3D"_blank">Helio.Castro@=
bmw-carit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div s=
tyle=3D"direction:ltr;font-family:Tahoma;color:#000000;font-size:10pt">If i=
 change recipe scope, need to be on each gcc_${PV}.inc.<br>
But they include gcc-common.inc on top, which states LICENSE =3D &quot;GPL&=
quot;<br>
<br>
So, gcc_${PV}.inc is already overriding the original license. If you think =
is ok, i can do that on gcc_${PV}.inc<span class=3D""><br></span></div></bl=
ockquote></div><br>No,you&#39;re right - your v2 is the best patch.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11345c0c4872bd052dc8e12f--
