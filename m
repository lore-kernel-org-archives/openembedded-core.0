Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3FADE6E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 13:43:32 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id n6so378722618qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 05:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mxgYfsTOvo5fDH7OxlGK5mAy2ucN9hdjXB1iF8FKoL0=;
	b=GZ95Zq+BIstUHPrl2RuV4r8kJCSeBxFK26R9+5XxHONfLvb78PkT06pVu73852vYqN
	/4HJTABMnnrMDpaHOmS54lp3wKUcIHyS6oh5Mb7l1Pwd5RGtyyBILEbZtjRPU5Cn20nf
	S72udL7ktgaP18kliruUlYTjqHMf9ByJmWzJbf2eSUfL/BaVyaVRQ8a8615NnSdeWmem
	8PLdL7jbQTAMTxsnEzKZL9eCFG2xnNndgXldJbR//L/xsfUOlaN4IMvY/OBXhxyLEwHp
	wtqbAOGiyNQZrowBwFxppkC/DRsfH4+pUzd0kYUSPWR91LJzV9v9b4HzVIEc3D0MW/hS
	hQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mxgYfsTOvo5fDH7OxlGK5mAy2ucN9hdjXB1iF8FKoL0=;
	b=SKs5G0rlUj+/Eaz77RPP8iDyNKgE0Z3F7l0N2N3nnB5K0oOLqNuuiMLlG1qtaGu0F7
	8TjNCWvcR5igoZjXvmkpe3giCDGJiwGspFd/xhwHdkW9TCtmPBCUcQ1t15z2RkLo3Xzg
	pfLxS7MQk+vd3/gKISEBieqtLxa0Yflc9DlryKjqjsR8MnZ/65JHx5g+UlUg8rmuyLRy
	Y/ugFkF+7oKjAGQqGHyGtZJ0Wt8Gs55U4rAqWRvUWmVaI46Q5O8w7WqJld2CJS2Jr9eA
	QHrdzvPF5Qh7llOR7WvXg+ze1Ku22L8DN19aLD3HdCCZCwazd2mFBcYBbxsncpYpkqVh
	vdvA==
X-Gm-Message-State: AKaTC02nxLdND9RT8QaEhNMLa51ZoHDWeYzUt0kUFuejWql7vubwFWPq+SLBqdkdj0M2PLfDO/JL+0AaFeAFx8tc
X-Received: by 10.200.57.54 with SMTP id s51mr58172693qtb.68.1481118213944;
	Wed, 07 Dec 2016 05:43:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 7 Dec 2016 05:43:13 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612070835310.2008@ca624034.mitel.com>
References: <alpine.LFD.2.20.1612060948001.9434@ca624034.mitel.com>
	<CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
	<alpine.LFD.2.20.1612070835310.2008@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Dec 2016 13:43:13 +0000
Message-ID: <CAJTo0LaBM4=MenpQ=NGVfk1nCstNgKMph7RYCj-n3WxBTQhcMg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the closest alternative to red hat's ABRT in OE?
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
X-List-Received-Date: Wed, 07 Dec 2016 13:43:33 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8038ebf054311b530

--001a113a01e8038ebf054311b530
Content-Type: text/plain; charset=UTF-8

On 7 December 2016 at 13:37, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   and pretty sure i asked this before ... is there some reasonable
> equivalent to "sosreport" for OE?
>

For people who don't run Fedora, you might have better luck saying what
functionality you're after.

Ross

--001a113a01e8038ebf054311b530
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 December 2016 at 13:37, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1g7" cla=
ss=3D"a3s aXjCH m158d982b8834b526">=C2=A0 and pretty sure i asked this befo=
re ... is there some reasonable<br>
equivalent to &quot;sosreport&quot; for OE?<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>For people who don=
&#39;t run Fedora, you might have better luck saying what functionality you=
&#39;re after.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a113a01e8038ebf054311b530--
