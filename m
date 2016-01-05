Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C65B6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:28:09 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id mw1so16632393igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MXnf/YHNVRcScI1GP1DjY5fqdxDKe5JmzEMMUPNOBl0=;
	b=p6V7ciBO0tYbEfbvCA9JhBdOgkEJlM9Bf3HKjRjFFZf8Cdlw7rJxW5+nszx/AqNxgj
	kF0T9K4toi2Zm1FOmKbp9PDgbUW24E1+rAMA9SBsCjVTEr4KLCr3xp5N23sUpJWiXUdZ
	MqAOyeFUzutDctOEdX0Kb93SkZJyXUFbe6E/v5o0LsUuCS8ZgzqaJwK5AvQg631fhRjI
	gCqkqroax5mYBRD6vsp6qQyMFdBW/M6qgyDWEAfAn8q6woFHgkS7k7s672b4z4oZJKDE
	mPXdf9wFYBkRQzZUdNodWjliH+Cs79T9Q9ATDlLfk4FQN0wnKmSyt0UZRxvup/Kc+RWC
	Fwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MXnf/YHNVRcScI1GP1DjY5fqdxDKe5JmzEMMUPNOBl0=;
	b=eup6Rr989v60zloBK0ETdUOOotFWOmQWansTEz1hVoLkAwf6U2TwHK6usz8nz1jyHc
	WMqg7YNosdXPUtFVwMoQl/CG2RM0d2FfI/giPW98CUtMGUtmgaFlnHl+qzZLYox4gTxR
	bBbjLDwEFL94taMYjO3UwGcA6+k8VAyGLjjiymbh8L6CDwQ7kkKjiskT4hhZYEhpnTBr
	4JT+wFU+swYvKm7cGsZ5nM9tbh6ehwSXzpTF9YjCzY8K1RqgENI8iC8Yz62jzvhxac+e
	TsVOJLbR7ksUG1QvCsfGPDie5gk/ym+DeI5REx4UJm/idY11agHo1WlADy4slNuTjToB
	aSsQ==
X-Gm-Message-State: ALoCoQlk7PXThPvVKscvga+xTuWcAG1llWAZysFbemIQL2ev8CYIelPORSwx2BGMto6RD1fXNfOMRBhswmfkU0KDwDkgxFgQ/WlVChY+6Q2Lah6yIr8ekIc=
X-Received: by 10.50.30.69 with SMTP id q5mr5091257igh.78.1452014890088; Tue,
	05 Jan 2016 09:28:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 09:27:50 -0800 (PST)
In-Reply-To: <568BFB09.2070203@digi.com>
References: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
	<568BFB09.2070203@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 17:27:50 +0000
Message-ID: <CAJTo0La8dENcP3_zGoygWkvySLPrN6i_B2Z-scNNZ-fVd_35vg@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 17:28:11 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0cbb9cf30528998f83

--047d7bdc1c0cbb9cf30528998f83
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 17:19, Javier Viguera <javier.viguera@digi.com> wrote:

> Is 'bluez4' a user's custom distro feature, because it doesn't seem to be
> part of the standard distro features. What poky.git at current master has
> is 'bluetooth' and 'bluez5' as distro features and those are used by
> bluetooth.bbclass to set BLUEZ variable as follows:
>

Right, the logic should be "blacklist if distro features doesn't contain
bluez5".

Ross

--047d7bdc1c0cbb9cf30528998f83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2016 at 17:19, Javier Viguera <span dir=3D"ltr">&lt;<a href=3D=
"mailto:javier.viguera@digi.com" target=3D"_blank">javier.viguera@digi.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2da" cl=
ass=3D"a3s" style=3D"overflow:hidden">Is &#39;bluez4&#39; a user&#39;s cust=
om distro feature, because it doesn&#39;t seem to be part of the standard d=
istro features. What poky.git at current master has is &#39;bluetooth&#39; =
and &#39;bluez5&#39; as distro features and those are used by bluetooth.bbc=
lass to set BLUEZ variable as follows:<br></div></blockquote></div><br>Righ=
t, the logic should be &quot;blacklist if distro features doesn&#39;t conta=
in bluez5&quot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--047d7bdc1c0cbb9cf30528998f83--
