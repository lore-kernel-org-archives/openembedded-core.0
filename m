Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2F99C761D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:08:22 +0000 (UTC)
Received: by qgii95 with SMTP id i95so11911146qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=U8JxOLP3XZF8Lc5nHcOOhgoL9MedKp2Hq8RQNZsctU8=;
	b=Q03lhzOdZORXcPV0AvRjuanXW96Wm449I62dOfOROEPLSAKvQyQ9k9EgoZR/pklnE4
	h3G0uIlKhaPol9edqB0zKbfHmiUzNW2/oHYXdMrGMDDQ34jJ/OngnRDlqUOPbz82nfYR
	ar+E2ymwmOQV1W9sPcACWWsG5w4guHwriK90wBKgX36hqfOBskqvIHgXzqkhWALcqRgo
	aEEuGxWWKVDdjEvm7HLaP31O4miLHO76ycsCvvEk5yRlKuir8ysNoz1tQa03s35Y/dWX
	7zuA0Up9/i0tr3qt4HLUOJGEi42fbRuwrIU2YTgU0nO3Yqcmy75W12WCkvRHdrGGk32M
	K7wQ==
X-Gm-Message-State: ALoCoQmBLDe+CN5AiBGpEcyyteF6QIjaG+WOUps56evNn9M3CGZl7u6PjoK27jB962TsZiDBlvBD
X-Received: by 10.141.28.211 with SMTP id f202mr22362190qhe.93.1437750502668; 
	Fri, 24 Jul 2015 08:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Fri, 24 Jul 2015 08:08:03 -0700 (PDT)
In-Reply-To: <55B171F3.4010009@mlbassoc.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
	<55B16CF0.80405@mlbassoc.com>
	<CAJTo0Lb9npwcdNkLbifoaR6P+QgAX76d0go8pq7ozCpEiW7k-w@mail.gmail.com>
	<55B171F3.4010009@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jul 2015 16:08:03 +0100
Message-ID: <CAJTo0LbL3bcH_EpWG_WLJhtV14f_cXF5MLVV4oeAqDd7-T0ZKQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Fri, 24 Jul 2015 15:08:25 -0000
Content-Type: multipart/alternative; boundary=001a114218c6fcf037051ba05f6b

--001a114218c6fcf037051ba05f6b
Content-Type: text/plain; charset=UTF-8

On 24 July 2015 at 00:00, Gary Thomas <gary@mlbassoc.com> wrote:

> It seems that my host python3 is broken and doesn't have a working
> 'argparse'
>   $ python3
>   Python 3.1.2 (r312:79147, Aug 23 2010, 05:17:13)
>

argparse is part of 3.2 onwards (and 2.7 onwards...).  If the script is
going to use functions that only exist in specific versions of Python then
it should really check.  Personally I'd say patching the python check to
only look for "python" or "python2" would be a reasonable workaround.

Ross

--001a114218c6fcf037051ba05f6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2015 at 00:00, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":3vv" class=3D"a3s" style=
=3D"overflow:hidden">It seems that my host python3 is broken and doesn&#39;=
t have a working &#39;argparse&#39;<br>
=C2=A0 $ python3<br>
=C2=A0 Python 3.1.2 (r312:79147, Aug 23 2010, 05:17:13)</div></blockquote><=
/div><br>argparse is part of 3.2 onwards (and 2.7 onwards...).=C2=A0 If the=
 script is going to use functions that only exist in specific versions of P=
ython then it should really check.=C2=A0 Personally I&#39;d say patching th=
e python check to only look for &quot;python&quot; or &quot;python2&quot; w=
ould be a reasonable workaround.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a114218c6fcf037051ba05f6b--
