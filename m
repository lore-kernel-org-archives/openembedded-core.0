Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2129C771CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 14:28:26 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f81so55784342iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 06:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=L/2iOcEs0hs/sf7wDbbjgxK8MtTHMMGqxPqOHD8EqUE=;
	b=VJAHh5Xxl3wcftFh+eK2NnGuHnNdh8q7Hkp+7kWnNDIgZK8gD3AyldI6asymVL3Gxi
	X0Cu8d26cMOalwvKTJAu+Sq8kEgS0NsDaZGelEYYUMIooOeiNLipIe2+/DJzL9XKImXH
	Gb+N56ogfGWmZmdtozFXr4TkDMF3ohPPzfLcj//2bt9XRxiOkCrYV7WCU7td0GScUzB+
	mvKm2YxhzKXB9vyeUEZe5EVoxuKrNJOdn5LHSG5J39Uijkm5JaWTw8GpT4atYVl62Kg2
	rX97E5aOcNX1DhFZMgggedu770z3PDwIGe2DpDvVYIljOCa9WXvAgONCqCTL3lZAHXnt
	qNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=L/2iOcEs0hs/sf7wDbbjgxK8MtTHMMGqxPqOHD8EqUE=;
	b=c1KXR3hWWLP2K85a4JNWR3DdnjkqpitpYy1ELtOTZ49UczvI/t2FSW9+t0Dn4j6gnJ
	Fz/sGBymh41dvatNahumY0vgqNlLgDInBLwGsceARYzv742fqH/PFJK3B70iMN3gZE5w
	3Tm7Ph0e3ugFwbPtC45gJwWVkGrWk4tkgYEHDrF/ESCRu87JYxAA7bO+fPEKSfZnAVjJ
	38TTGoCdScR7qi1IBjLeOmeRjKihs/UooGtuOBiQmzujwcMD1Qa28u0dy2AUa7hE677e
	p4kcIzvYF78/YJc/ckLF7ShbJIdb0ohOQ5ozwwfpv6rmLPgLYxvd1jWoISMbMEWWg8Jp
	eVxw==
X-Gm-Message-State: AG10YOSTB4+ddqiTp3HIB56fC7D4f5E/xe/VlKzzLN+7yEUJ88XF4p1907r489j+eE94v1QIeLjovinBx9mUmu//
X-Received: by 10.107.3.154 with SMTP id e26mr4009382ioi.99.1453991306745;
	Thu, 28 Jan 2016 06:28:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 06:28:07 -0800 (PST)
In-Reply-To: <56AA1A5D.8@linux.intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
	<20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
	<CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
	<56AA148C.2050104@linux.intel.com>
	<20160128133948.GA22967@mbabyjoh-mobl.fi.intel.com>
	<56AA1A5D.8@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 14:28:07 +0000
Message-ID: <CAJTo0LZWYe4=Ar5v+mFfoVAFOd_H6d3bJoEXHSCpD+jwv3G4sA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 14:28:29 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a586fd2052a65bb67

--001a113ec10a586fd2052a65bb67
Content-Type: text/plain; charset=UTF-8

On 28 January 2016 at 13:40, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Most of the times, it is hard to do a bitbake world for every upgrades.
>> (regular build, x32, musl, uclibc and possibly one more architecture
>> combinations)
>>
>
> Yes, of course. It's often a waste of time watching world builds, so it's
> a personal judgement call, but at least when there's a possibility of
> potential API breakage, that should be checked and the easiest way, if you
> have a bunch of updates and don't feel like disentangling their downstream
> dependencies, is to run 'world'.
>

If bluez5 works then the API can't have broken that much...  once it's in
mut the autobuilder can give it a stress test anyway.

Ross

--001a113ec10a586fd2052a65bb67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2016 at 13:40, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Most of the times, it =
is hard to do a bitbake world for every upgrades.<br>
(regular build, x32, musl, uclibc and possibly one more architecture combin=
ations)<br>
</blockquote>
<br></span>
Yes, of course. It&#39;s often a waste of time watching world builds, so it=
&#39;s a personal judgement call, but at least when there&#39;s a possibili=
ty of potential API breakage, that should be checked and the easiest way, i=
f you have a bunch of updates and don&#39;t feel like disentangling their d=
ownstream dependencies, is to run &#39;world&#39;.<br></blockquote></div><b=
r>If bluez5 works then the API can&#39;t have broken that much... =C2=A0onc=
e it&#39;s in mut the autobuilder can give it a stress test anyway.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113ec10a586fd2052a65bb67--
