Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 71C646E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:44:23 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id u186so60489552ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eR3XGlqoT6CyBNFblfhkFZvNU3y1o07kCHOV5YUaulI=;
	b=as+kZ6wQN/KE33tMy/bKf0vDwx8csR+Q+htngI/DyxeydhcgM+WWUO/0pXma1w5+VX
	i8QbzUvBcIEJHXudHgcW4npkDEekSRdSYchgnvp97td3GonUwNyW2Y0aXqox0kAkj5kK
	/ciDcrN7sgdxanCFlf0+sOTvTmsvhkODbiNSwpa+Uzi1KAdrCtyRmn9BZWDpDDJDiZkO
	UT3mljdlNgKkA7XLSbsclt8swQOd9WdzC+OqTV1RhXqcjTvc+nF/K0gRdX8Bn/GCzPZd
	HCpEhDnHPESk97qNISEku0UFWOe9SWnd7s9XZ/vyPPmMeC+GelxNoBTY1M4Y+4puZEi2
	OILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eR3XGlqoT6CyBNFblfhkFZvNU3y1o07kCHOV5YUaulI=;
	b=Vb7KURqML+hvt3UjfxlbH5uFzmxmT8S1ZJDKJKgwBIwLDjG7UhHDibJEQm/mHrEOeq
	HDG9X2+DbMT3KsXknipaG75+8Jxry2A9gKtQ2liwfVZzH9rvXHa0wjuoLnsVfQ7+TiK1
	FVfpUaQAZiENMp02AwDs7PoQJ9+Orq5ajn1MvNZTSEEMpfoWDwprVZeWUz42Ve5MKwGM
	+5rPaOLCKqFibLIxyqpGM9O68RnwDl6qTTlQ41QYT5AHmbIgjVVqldqtllD6J1PZolFy
	bBSGNRtPSPV/igy+AHUWeDVyFq+6Txet0KFEY9C6TGHDqCS9DXE5MXb/ChlwArE6tffK
	/mJA==
X-Gm-Message-State: ALyK8tIac1ZtAy67Vw+K6oE9HKp4Qyl/z8xIZxl2lyl7FE5qNh6TvdT3C3qvhjJYNsLS1uGnYEhbc/bK6hxksGDN
X-Received: by 10.36.57.70 with SMTP id l67mr15462542ita.22.1468244664663;
	Mon, 11 Jul 2016 06:44:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 11 Jul 2016 06:44:05 -0700 (PDT)
In-Reply-To: <20160708163309.26556-2-stephano.cetola@linux.intel.com>
References: <20160708163309.26556-1-stephano.cetola@linux.intel.com>
	<20160708163309.26556-2-stephano.cetola@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 14:44:05 +0100
Message-ID: <CAJTo0La3k4_q_=ikvUNE+9Lsc5sAnN6M9Q3QG-kZKv4vM7wWPA@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Mon, 11 Jul 2016 13:44:25 -0000
Content-Type: multipart/alternative; boundary=001a114a9c66ae533105375c59e5

--001a114a9c66ae533105375c59e5
Content-Type: text/plain; charset=UTF-8

On 8 July 2016 at 17:33, Stephano Cetola <stephano.cetola@linux.intel.com>
wrote:

> +            unneeded_pkgs = ["update-rc.d", "base-passwd", "shadow",
> +                    "update-alternatives", "run-postinsts",
> +                    self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)]
>

The getVar() will return a string, so whilst this currently works (as all
package manager classes end up joining the passed list of packages into a
single string) I think the getVar() should be ran through split and then
appended to the list just in case the implementation changes.

Ross

--001a114a9c66ae533105375c59e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2016 at 17:33, Stephano Cetola <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.cetola@li=
nux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":1ro" class=3D"a3s aXjCH m155cb5ae0ee1ab73">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unneeded_pkgs =3D [&quot;update-rc.d&quot;, &quot;base-pa=
sswd&quot;, &quot;shadow&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;update-alternatives&quot;, &quot;run-postinsts&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.d.getVar(&quot;ROOTFS_BOOTSTRAP_INSTALL&quot;, True)]<br></div></blockquot=
e></div><br>The getVar() will return a string, so whilst this currently wor=
ks (as all package manager classes end up joining the passed list of packag=
es into a single string) I think the getVar() should be ran through split a=
nd then appended to the list just in case the implementation changes.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a114a9c66ae533105375c59e5--
