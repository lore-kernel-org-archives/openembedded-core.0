Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 90B486FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 10:18:28 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id hb3so37883859igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 02:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eCShDaLV/+s7JkcfKSm0668Rr27IpaywT3wrRvWLY5g=;
	b=zQwAqEDEdRr519h8OH8rjt2xjGjf8xWmP4MK9/C0i7wTK0mh1aQUYgYfB4z4T9jkOU
	l+5p6u1KQJ1xkjjld0znYdVKmRdNok//olIHgqGFDHXFpKjyKCLwKREc3/di4FFdpmXy
	3nOhNSRWjDQ66Vp+HPVWjwbBOnakPjedOvCigNKywurGMvolQX9x5rWAX4IQf7ytNE77
	1b1zD3FxLIvEpIhjhNHVDkDpd0cksYFz8Ku2kSWPEzuwlU5kTeTlzy5ZVlE6wjuWMVnl
	lZEUbvziR8Y6xF46i2rx+jh/R2+YR1yN5YExn2/Cjf7x5L5EE1ma8+9XxByD6aGNfvZc
	/Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eCShDaLV/+s7JkcfKSm0668Rr27IpaywT3wrRvWLY5g=;
	b=N0ZYFoXEc4/BYHfc49AhAFSZ61EhLJti+r72QCHRlIroEmo20QyVrYTTZ2aYEAsPFc
	ZoAsGAdCzk+E7oST31V5qH+pNltmf2O2M8WoMpwwWKcXvwxbjcytVzDQaV5JlhTLrHmc
	ER0oG4US/2OjwY6qPsw0UFN9aZ+3qe1VsCdsEqIpamOlQuCVbZBmJYR01nLvmwj88BLb
	PfGF9KKv5DJKjemmUB0881Fgi65JAetKjV3BfINGVd/undRMJOBl3/9E7m7o2mV4W0Kh
	F55Pyqf3fjRMTI3t6XMmsJWStkI6bZbY2L73Ob+wXEaypjj7AURu1zkEuAegGsDLerHn
	t8OA==
X-Gm-Message-State: AD7BkJIpL7A8XFTAgMVyDC2RxIQdhWH3zQSPjfnHvc0c2qgb3ZVbal+qWbn7d8rDT2bBmKs6EM9embJHf/2VPcRE
X-Received: by 10.50.112.101 with SMTP id ip5mr10562250igb.52.1457345909034;
	Mon, 07 Mar 2016 02:18:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 02:18:09 -0800 (PST)
In-Reply-To: <1457322782-1973-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1457322782-1973-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 10:18:09 +0000
Message-ID: <CAJTo0Lad-rL=4e3wjimHWhyCZasaEdkQ0wuvPsMQ+uXn36y_7Q@mail.gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-lsb.bb: remove Qt 3 library from packagegroup-core-lsb-desktop
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
X-List-Received-Date: Mon, 07 Mar 2016 10:18:30 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8458392b71052d72c9eb

--047d7b3a8458392b71052d72c9eb
Content-Type: text/plain; charset=UTF-8

On 7 March 2016 at 03:53, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:

> Since with this release of the LSB 5.0, the Qt 3 library has been removed
> Ref: https://wiki.linuxfoundation.org/en/ReleaseNotes50#Qt_3_Removed
>

Whilst it's unspecified the LSB packages are mostly LSB 4.1.  If we're
going to move to LSB 5 compliance then the entire recipe should be reviewed
and updated with a clear commit message that this is what is happening.

Ross

--047d7b3a8458392b71052d72c9eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2016 at 03:53, Li Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":wv" class=3D"=
a3s" style=3D"overflow:hidden">Since with this release of the LSB 5.0, the =
Qt 3 library has been removed<br>
Ref: <a href=3D"https://wiki.linuxfoundation.org/en/ReleaseNotes50#Qt_3_Rem=
oved" rel=3D"noreferrer" target=3D"_blank">https://wiki.linuxfoundation.org=
/en/ReleaseNotes50#Qt_3_Removed</a><br></div></blockquote></div><br>Whilst =
it&#39;s unspecified the LSB packages are mostly LSB 4.1.=C2=A0 If we&#39;r=
e going to move to LSB 5 compliance then the entire recipe should be review=
ed and updated with a clear commit message that this is what is happening.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--047d7b3a8458392b71052d72c9eb--
