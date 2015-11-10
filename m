Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 15FD375EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:59:41 +0000 (UTC)
Received: by qgec40 with SMTP id c40so106036013qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RT15FZUEa2tRdeR4hKYFixOrx/5dFdEKKT6GNlx4xgM=;
	b=QiZGjhA3FP6tXILjlj7wGoprXUJi0RFIps/lvW/4KWzV4KcLdjEpZrtOifJb5qZnci
	qNQ33bam3bKHC5oZFFjteL1gt3y1yQfY7lNwu03M4zxmKFJ4VyHyvz4wPVRM8ViNtAhu
	/QWMzBLd2gqvAann5jSK1sV56ZXwvEdFhAPu21626g/LR58fVr6sPc4lsKNvfYt98Gwv
	XKK244Deww4ID/zSSkG47FchUh2Y6w8haPHLwiawIk+wfp6HdBW6Gv0k37opszk5kGx0
	GaITteAGkHVIsggEUvUOqSmc6nn0vI6rGuCkikyNXLEDq0m+vVwX4Ue/X4tSSC6X5FhZ
	8ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RT15FZUEa2tRdeR4hKYFixOrx/5dFdEKKT6GNlx4xgM=;
	b=EnoqUsn/qrCtJ+/DPTd96z67Srl9rl+WFK/Z55xyx8DXyudwyT/TziS52s8tyFs7vQ
	bY/gCyAZhq1nVkRaLhKkS7SiHacsbAF1xN8TpFgtY3OxWUoWNp8TGbyXhyyaaU2WTCW0
	MYuUaHwsVgdKqul+W+TqEt+O4A6a8rWoL/XSNIQiRuluR9UT49TA81Nonj8IzAdCGdiv
	zUPkUBr4v2Lc6UXFVTVDRUq7ZmK94qjMDHuSAmwm+L85vDVybCoXlLa1YJVad9eN2rh5
	/Qafr1/CR9NnwZPqJ3Z6IRKIFsMCCewCV1wTpnZpBUrAKhG0OBrm14l3tGXuhk+ajjjr
	55Yg==
X-Gm-Message-State: ALoCoQncoyvAb2xaAx7DBeED1+YFvBda3YeZCaWWzCtAX1fQ+TxnmBg3SuQJQgcNXmFRc8CHf3u2
X-Received: by 10.140.218.84 with SMTP id o81mr2988309qhb.22.1447149581655;
	Tue, 10 Nov 2015 01:59:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 01:59:22 -0800 (PST)
In-Reply-To: <1447131417-29782-1-git-send-email-rongqing.li@windriver.com>
References: <1447131417-29782-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 09:59:22 +0000
Message-ID: <CAJTo0LYhgrwpJpdEVf1RdR7sBi5-W=80Mef_ciXprRaS_iiBrQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: fix the ptest
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
X-List-Received-Date: Tue, 10 Nov 2015 09:59:42 -0000
Content-Type: multipart/alternative; boundary=001a113734b4c0748e05242cc48f

--001a113734b4c0748e05242cc48f
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 04:56, <rongqing.li@windriver.com> wrote:

> ++            goal = last_goal - 1 >= 0; last_goal - 1, 0;
>

Did this get mangled in application? That looks like it sets last_goal to 0
or 1 and then evaluates expressions with no side-effects or assignments.

Ross

--001a113734b4c0748e05242cc48f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 04:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rong=
qing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4pt" class=3D"a=
3s" style=3D"overflow:hidden">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
oal =3D last_goal - 1 &gt;=3D 0; last_goal - 1, 0;<br></div></blockquote><d=
iv><br></div><div>Did this get mangled in application? That looks like it s=
ets last_goal to 0 or 1 and then evaluates expressions with no side-effects=
 or assignments.</div><div><br></div><div>Ross=C2=A0</div></div></div></div=
>

--001a113734b4c0748e05242cc48f--
