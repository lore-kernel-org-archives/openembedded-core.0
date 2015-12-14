Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 86C4B601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 21:33:08 +0000 (UTC)
Received: by ioae126 with SMTP id e126so59146003ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TUti2NPWOnCycvngNavac9m3FK24MhjeSwjhqdf6Zb8=;
	b=v/EdhayCiGVmCDEvu44r8xB9yDJIrHUWUQVWQuBhRbW5rRS678wFrJmvSbfIKgsP/E
	qXW0MSMAYk1MsScygwQ+XgyiuZLBw9XgPqZABY6mttqXjSydqte6gaPGvITTXKX43F7b
	5e15CUagBMnFaZmyW7jv4QkxymDoDDZMAEvEvBQbyA1+J/7VsYocPugbYXUXAI+1gsXa
	E09IUrBYaugsbNLHAaQYkPwgJtL4HYIsA0QpRtvoF8yvPO5E4fNQhJJB/kLNAIbnF6yC
	biNfcpTz20WedZhNbR1OgLdB4TIEtiIATP6Yfg2AP6C/Vc3cX0FX7E0ra4e9MUnPEYn+
	Fz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TUti2NPWOnCycvngNavac9m3FK24MhjeSwjhqdf6Zb8=;
	b=hlehKw6QP9QxqgbQ2YWK8j3XeMx75XsE/D4u37JCoidDLdPXcxhQ6qGbMLHfM+6Q+C
	ZCvUAOjCsC4t+uedGsutmT9LGpUXHXytIGkO5ZuABpxGR/YR4Ge5hGZxgbHTc59xnBKk
	IVd4t3/Qqbs/MiZp1Q32kXA59Sp1KN7qu12XTCmyp+4axbBzHKYV+NYunC7eOd+7Vpp1
	zk219iOacjzY++ZTlES+yz/7DxtgjuyVlMceURhlVDMQ5Tmoleq0trWMlOqnMLU9RPLJ
	1Grps31aRbc2kpbts19XlcOVc2IWCV1xGGPbNKEcwAfY6nvWDruNSQu1r38jDnf/fXHy
	nwcg==
X-Gm-Message-State: ALoCoQkGnvZafkpPPu1HNGBABcD2tVnaYWV7c9Tu8CHcLwVDdXa1bZ8AwO/SvWTuTNYA/k9eHe3ncMEJEJHyeJsn5GRqIDCD563ZwWhyqQ2YxkzOTJ/ahf4=
X-Received: by 10.107.3.144 with SMTP id e16mr29581506ioi.99.1450128789450;
	Mon, 14 Dec 2015 13:33:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 13:32:50 -0800 (PST)
In-Reply-To: <a709265f9b19eb1d4def2ea5806ecc85a06c53c6.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
	<a709265f9b19eb1d4def2ea5806ecc85a06c53c6.1450104283.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 21:32:50 +0000
Message-ID: <CAJTo0LZDTb3XS_sj67qaFOJJqFJx=o4n48GA1__GeW8Ai2ieiA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/20] cdrtools-native: update to 3.01 final
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
X-List-Received-Date: Mon, 14 Dec 2015 21:33:11 -0000
Content-Type: multipart/alternative; boundary=001a113ecf405fccd80526e26bf6

--001a113ecf405fccd80526e26bf6
Content-Type: text/plain; charset=UTF-8

On 14 December 2015 at 15:05, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +PE = "1"
>

A PE is for live, not just for Christmas.

I've changed this locally to use PV="3.01a31+really3.0.1" which should
hopefully do the right thing but disappear when 3.0.2 is released.

Ross

--001a113ecf405fccd80526e26bf6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 December 2015 at 15:05, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":z1" class=3D"a3s" style=3D"overflow:hidden">+PE =3D &quot=
;1&quot;<br></div></blockquote></div><br>A PE is for live, not just for Chr=
istmas.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">I&#39;ve changed this locally to use PV=3D&quot;3.01a31+really3.0.1&quot;=
 which should hopefully do the right thing but disappear when 3.0.2 is rele=
ased.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a113ecf405fccd80526e26bf6--
