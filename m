Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0F88E71A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 17:07:51 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id q130so198644164qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=75wfv/IOfW07tcKdtGfBM76ZtHTd9Sc0REUsqayMzrQ=;
	b=M0OBN6/asGvNHykcjiSZZ30w5cSmi8nr6rtiqeZsfBHcRmeWHCR9jbt9j4i4v71p+s
	a0UFYdGkMYotBFU4g7UuKrSmjZPFGGqNoj7Ggz6EBB67+kjGinwmXVUQp6Ff633tjr5e
	FWO/IgYQhI8qYPwOcecytozdQR2Nm98eO1xkVbaGrSpsCBNyQ4rxQXMkncYui3VMURFi
	Esj7vFUEfXdvZTZhWMpQTtsbJH/FIrbb+ay+rCHpnK99sd8noefc4c11dcwLmQ8mygD+
	fZxvmqBvfCG3TT0MecY15Poutz1dMBrE7Bgnv/uI2kOgZHvucu2dy7dI2bD7TGqCBSwA
	wdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=75wfv/IOfW07tcKdtGfBM76ZtHTd9Sc0REUsqayMzrQ=;
	b=Z3fUDb8v22buQgP/O8er7vDOn82xWf6919jUBfxvBT5nlndwkhzwNYlIeObtuebHAP
	qSRmLyvNXQyPILzhBambXDj7CVe72ULTto0jP9soMEQBuofqqMfFsy+1eECoz3Aei5lb
	72LzyCt803/23sGnzlBOgPPOXtNINqDj/69qZcyKmTSvJEorYrQy6PXQ9ZGIi74GNKeq
	Az0wX/gtApATy0lpvZpVLgMlSb0b76h0No93PgIBAsC7E4oox6cFJfp9uhtRpeCAdCRJ
	p9mY0EHod5hSUTSxMar+vIie3qyvtlWzDviZLebJQ0j/A/x2m/GAGqWijonIpBpY4A+A
	GQ5Q==
X-Gm-Message-State: AKaTC03Uc3y5kNM2MLkX1sXYL2XbNKegyIugFwzUwO+Yw/KuO2efF1wxAV/as2dxzST1JTpWP2CfjSB0Z3mFetTD
X-Received: by 10.55.207.78 with SMTP id e75mr65028438qkj.36.1481044072799;
	Tue, 06 Dec 2016 09:07:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 09:07:32 -0800 (PST)
In-Reply-To: <f71fad47-fad7-89f8-7b19-24840f4ff65f@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-4-git-send-email-obi@opendreambox.org>
	<CAJTo0LbCWZYmnaxDjKNr==nNvyXn0Y3nXnJanoQb5ccgZpWxpg@mail.gmail.com>
	<eab1dd56-d37f-6e3d-f8f3-f5cfa1f99a52@opendreambox.org>
	<CAJTo0LZJ8J4RGY+MEes6+9A7_kygoyR4b0kXrj+6NS=jxzdTtA@mail.gmail.com>
	<f71fad47-fad7-89f8-7b19-24840f4ff65f@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 17:07:32 +0000
Message-ID: <CAJTo0LaHUBvrC6ZF4rixY0tj3OSfJFH69H8krGkJcXT7Dysi7g@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/33] dpkg-native: hardcode SYSCONFDIR to /etc in update-alternatives
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
X-List-Received-Date: Tue, 06 Dec 2016 17:07:52 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8de1b930543007100

--001a1145b7b8de1b930543007100
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 16:37, Andreas Oberritter <obi@opendreambox.org>
wrote:

> I was asking because the result after stripping would essentially equal
> ${sysconfdir_native}:
>
> STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
>
> It wouldn't work if someone set it to "${STAGING_DIR_NATIVE}/foo"
> without adjusting sysconfdir_native, but on the other hand someone could
> just as well use "/path-outside-staging-dir-native/etc", which would
> break attempts to strip the prefix, too. I'd guess the assumption that
> STAGING_ETCDIR_NATIVE doesn't get changed alone should be safe.
>

Ah yes, I misread the order of evaluation.  That should work.

Ross

--001a1145b7b8de1b930543007100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 16:37, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2xi" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m158d500082e7c2b4">I was asking because the resul=
t after stripping would essentially equal<br>
${sysconfdir_native}:<br>
<br>
STAGING_ETCDIR_NATIVE =3D &quot;${STAGING_DIR_NATIVE}${<wbr>sysconfdir_nati=
ve}&quot;<br>
<br>
It wouldn&#39;t work if someone set it to &quot;${STAGING_DIR_NATIVE}/foo&q=
uot;<br>
without adjusting sysconfdir_native, but on the other hand someone could<br=
>
just as well use &quot;/path-outside-staging-dir-<wbr>native/etc&quot;, whi=
ch would<br>
break attempts to strip the prefix, too. I&#39;d guess the assumption that<=
br>
STAGING_ETCDIR_NATIVE doesn&#39;t get changed alone should be safe.<br></di=
v></blockquote></div><br></div><div class=3D"gmail_extra">Ah yes, I misread=
 the order of evaluation.=C2=A0 That should work.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b8de1b930543007100--
