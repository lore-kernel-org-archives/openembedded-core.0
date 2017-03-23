Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 32164719C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 15:44:27 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id i34so179033837qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t87grQoetJa0QDIG5wDcBsjyAx0/FzaSXxu00iHIXdM=;
	b=W7RjeMxzu44FGolmy3Qv7zGsxGi1BVu3+zoXnksQz1qiFQbK1CZgyXHqhF/1evWd3Q
	nrZ5izjG0B7HbjpZOUjHZrqZS0oAP4QgWQIKVouCLITIgBi36ZVm2y4zMGKuIW750xyV
	bMVUM9bJSxcCBIGqubYjL6k7A4Pskiv//pLpNReZYf30fpa9MNOL6e0GryOE+tDhllM9
	gseYSxXmBpyeeNOaPP0dQt51LBCjWlktIhNAQKF7q5LVheYkRtog26O7Wwh8DlrnfcNQ
	mA++ff1d6CSteR1zY6loUWUr98usT8W9KKdEptaQ56+dUpFlLgAtqhWIVc8rqMS53/6J
	6bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t87grQoetJa0QDIG5wDcBsjyAx0/FzaSXxu00iHIXdM=;
	b=uLbKjJpysoEMNDg7vNko/1qWeTo5ZDGOAcBYm95w4cI3RIep3cIbXm8IlaKq4hrz7o
	iieCwIByp8pVaj2ME03kjUwfzqxdpiZYQU/KMDPb6E1wlHlIPfIi1PdB5kTBUmqLFYgx
	ad3WhZq3ehO2KwzllVpgGb6nceUNxk9VIClN0DwteA+3vdRiM65EJccegjeSfJCfMdMs
	7+I7O/yTCug0lgP3eKjR7xzrlkhDT0OG1ecIRleAdv6E7hqWUq6c5A1riWXyfecfo7Ch
	e6Zctrr0hlK4/OkYDXVE2qiOXCs+YXfzk1swzUI9GqY33MiEMpQcxcdUZ9InzyZY7n5J
	uwVQ==
X-Gm-Message-State: AFeK/H1JyGo+pZRl73KH7xZXf6k2jQSDsSKQcmdzN1zAQxLa1hJByR0F1sGZEuPCdGPJOs7ew0oVm2kjwgvdzJvA
X-Received: by 10.200.33.182 with SMTP id 51mr3131176qty.65.1490283869082;
	Thu, 23 Mar 2017 08:44:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 23 Mar 2017 08:44:08 -0700 (PDT)
In-Reply-To: <CAGNsrLA5zuS=csj-G7kcRFvoPoB-8jcKBWYrXL9HrOSUkLbK0w@mail.gmail.com>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
	<CAJTo0Lan2hjh13NJMFr2=j+g5D76CSNWBCnS4F=5M3MO7B9Fpw@mail.gmail.com>
	<CAGNsrLA5zuS=csj-G7kcRFvoPoB-8jcKBWYrXL9HrOSUkLbK0w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Mar 2017 15:44:08 +0000
Message-ID: <CAJTo0LZcH8EzKCqa_A_GGr0mrhorUnYmdm+B+M6WRsAq79nKyA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 15:44:28 -0000
Content-Type: multipart/alternative; boundary=001a113c6418a1f870054b67c011

--001a113c6418a1f870054b67c011
Content-Type: text/plain; charset=UTF-8

On 23 March 2017 at 15:30, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> thanks for the catch. Actually, it has been tested ;)
> It only breaks for folks that have a bbappend (it wasn't my case).
>

            file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0028-bits-siginfo.h-enum-definition-for-TRAP_
HWBKPT-is-mi.patch
 "

That definitely doesn't parse, without without a bbappend.

Ross

--001a113c6418a1f870054b67c011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2017 at 15:30, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D"gmail-:mv" class=3D"gmail=
-a3s gmail-aXjCH gmail-m15afbca70b8d4e6b">thanks for the catch. Actually, i=
t has been tested ;)<br>
It only breaks for folks that have a bbappend (it wasn&#39;t my case).<br><=
/div></blockquote></div><br><span style=3D"font-size:12.800000190734863px">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-locale-fix-hard-</spa=
n><wbr style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12=
.800000190734863px">coded-reference-to-gcc-E.patch \</span><br style=3D"fon=
t-size:12.800000190734863px"><span style=3D"font-size:12.800000190734863px"=
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-bits-siginfo.h-</spa=
n><wbr style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12=
.800000190734863px">enum-definition-for-TRAP_</span><wbr style=3D"font-size=
:12.800000190734863px"><span style=3D"font-size:12.800000190734863px">HWBKP=
T-is-mi.patch</span><br style=3D"font-size:12.800000190734863px"><span styl=
e=3D"font-size:12.800000190734863px">=C2=A0&quot;</span><br></div><div clas=
s=3D"gmail_extra"><span style=3D"font-size:12.800000190734863px"><br></span=
></div><div class=3D"gmail_extra"><span style=3D"font-size:12.8000001907348=
63px">That definitely doesn&#39;t parse, without without a bbappend.</span>=
</div><div class=3D"gmail_extra"><span style=3D"font-size:12.80000019073486=
3px"><br></span></div><div class=3D"gmail_extra"><span style=3D"font-size:1=
2.800000190734863px">Ross</span></div></div>

--001a113c6418a1f870054b67c011--
