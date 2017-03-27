Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5EC77B6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 10:22:32 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i34so33177350qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f02J1GHVfWRQ8wYJpB//BpmD4CjOglg2hrVkVXfMh6g=;
	b=dpCzTRW9BT9lKU9XRqMwLIQeYNHVC6k7LvzCb3Db+mFbRKLQ8IlZR8HWSORc4+xv5Q
	WvymxcWgR+D2rJ5Xizq0sCKAJSM1KQllyhAipVL0qq05/WCzzTMkymb8tCT24Xl4txAr
	I5TFeDdCJBYg1aGNHLj3VSdKWWt986oI/0fGM70ccm2YtMT7sL6jAlDXKmCevBdHpuSJ
	e+Ll4OwqVPLBf9MSW7LjgDORU+EX2AmvrYUGnfmhoniOfL/F5QNVviXeVFVDet7lkwUf
	5BM4jFm7/wB0ZhshkPTmid+eKX2jBm3O92zOAyvHigzeleAK0TcWotcJo9FSKu9SuvfZ
	Niow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f02J1GHVfWRQ8wYJpB//BpmD4CjOglg2hrVkVXfMh6g=;
	b=bvi8CoWD70IZhudN1SVOLSkbwrPmfDoNiS/9A+Y8z9iQF6BwaGn+wE3zp1pMUHdHP4
	PLVg6znf39tdJqHhZ6e6FjoqZ73dNe2gL9LhtZ5f82wJ5uSsRCPwCujsoeUe8CEf+zbH
	E2vQcX7GfUiwG/uZFBQpG26VbRPSBmeSxaQRNL3FfND+sWvBIHBfiJzqwTmL2ke6xdrn
	r9jD5W5Woan3+aFoArf/gQzSjp3syevzZ/M3VRYRkdkQ+AP1Ts/7Qv1lcEus84rEdb0A
	J3u8ZKFZ/1pjYGzHWr5cv8b7fnyE8yEArhMdfJKKs7z/MsWYDwKFueR0N9xLfPWscxlF
	kIPg==
X-Gm-Message-State: AFeK/H2h6uoxn+HVKP7fyzF0YGCNkX/75Y/vuJqI0Kmx9Ntmb6nQ2rQOL6oLbVBswqOjKIRyvGRAS6k4O3MXyHT9
X-Received: by 10.237.42.164 with SMTP id t33mr21754675qtd.105.1490610153345; 
	Mon, 27 Mar 2017 03:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 03:22:12 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703251517250.9637@localhost.localdomain>
References: <alpine.LFD.2.20.1703251517250.9637@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 11:22:12 +0100
Message-ID: <CAJTo0LaEAF_qDSkii-VBVis4K9v+kg9kJiBWsqQZukw2N-7JFQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: another cleanup: "grep ... >/dev/null" -> "grep -q"?
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
X-List-Received-Date: Mon, 27 Mar 2017 10:22:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe22b06b7d054bb3b8c6

--94eb2c0cfe22b06b7d054bb3b8c6
Content-Type: text/plain; charset=UTF-8

On 25 March 2017 at 19:22, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   1) can most of those be simplified with "grep -q"?
>

Yes.


>   2) is there any need for "egrep" in that last match?
>

egrep is grep -E, but that regex is a valid basic RE, so that can just be
grep.

Ross

--94eb2c0cfe22b06b7d054bb3b8c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2017 at 19:22, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ii" cla=
ss=3D"a3s aXjCH m15b06ec6cef23db9">=C2=A0 1) can most of those be simplifie=
d with &quot;grep -q&quot;?<br></div></blockquote><div><br></div><div>Yes.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ii" class=
=3D"a3s aXjCH m15b06ec6cef23db9">
=C2=A0 2) is there any need for &quot;egrep&quot; in that last match?</div>=
</blockquote></div><br>egrep is grep -E, but that regex is a valid basic RE=
, so that can just be grep.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--94eb2c0cfe22b06b7d054bb3b8c6--
