Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7186060E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:17:28 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id q130so16258087qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S4adXvMPNGv/tKmTN0T6lRezgTmLndpeuzLNcUcqjIA=;
	b=HZYre7GFfsnN96bIrAdbf+v1cMG9NrEnSmF2z9hh+SbacJHrFUvzSmpEWITeJbPZ2/
	JPk6MzeJyOAafJdCBZUw+t/oW9pD66fof6RMVOHq1v45FlqYi/sDETyQY/m2ppddypdg
	9WLuJyyHkNaM4Akx1TZkk1o+sxx6lrPvanjFIIZU1RsVoXaxCDq2m72bCsIHzfnbiLmr
	IgZ2GbE92EVzYZGO6yDWYPpLpp6YPY1uvvWheo5/mdxYoDqOvVpWj93z1sF2Vifnx20M
	8SZmik12r7rMaF6MQnZntkssk0W1B9az/WPwK8bc60Dn9G7XN42NjeZ6Yl3FuGgWdO0h
	FZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S4adXvMPNGv/tKmTN0T6lRezgTmLndpeuzLNcUcqjIA=;
	b=VipwmbHi4LTyB6H8pkA5+CmFZEK31eDicMpBPkBCn8MZGanRmowtM52AkYSN/g3gE2
	sj1rhy6oMQZXMSq8UPEfS9VpZdevuA25GjWQsU574BBCsDY49W866gj55SJVA20o02fS
	CnOIB9xXlSbJzeT6kgn03Vfp3XVQSsShQS3mA5nv3FuR6dNTMXUAyY/NnwS+EqH9Rtpx
	Z6m+nUi70djRdWd8BP3EORjJcg0FWs1TE5kbkJBuQ3tzDbh9+zuGSGOGydq0eF1inDI9
	qdTJh3xx5xJdQBENCwdrKQKrHycororXYttoixS4dSsiSZWgrl95Hrx2oga05xOYZhhu
	/WZA==
X-Gm-Message-State: AKaTC00lLhM8n8lVd7r8K0uI+R0VEBc7thKKAO5lhPO2dCt/DJiNU+xFX9+NwnIr4APjn5E2p1QX8FbDl4/TAoM8
X-Received: by 10.55.39.88 with SMTP id n85mr2719176qkn.244.1479910650152;
	Wed, 23 Nov 2016 06:17:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 23 Nov 2016 06:17:09 -0800 (PST)
In-Reply-To: <1479899811.31880.37.camel@intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Nov 2016 14:17:09 +0000
Message-ID: <CAJTo0Lbhudo3jb7OkeJdRoOeLxd0ZO23tYvgiMvsyJAPyF2sjQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Wed, 23 Nov 2016 14:17:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b169a41fc0541f88c77

--94eb2c094b169a41fc0541f88c77
Content-Type: text/plain; charset=UTF-8

On 23 November 2016 at 11:16, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Wait a second, are you really suggesting that OE-core should have a
> default root password in its default configuration?
>
> That's very bad practice and I'm against doing it this way. Having a
> default password is one of the common vulnerabilities in actual devices
> on the market today. OE-core should make it hard to make that mistake,
> not actively introduce it.
>

Agreed.

Ross

--94eb2c094b169a41fc0541f88c77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2016 at 11:16, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D=
"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":gn" class=
=3D"a3s aXjCH m15890fad36613c54">Wait a second, are you really suggesting t=
hat OE-core should have a<br>
default root password in its default configuration?<br>
<br>
That&#39;s very bad practice and I&#39;m against doing it this way. Having =
a<br>
default password is one of the common vulnerabilities in actual devices<br>
on the market today. OE-core should make it hard to make that mistake,<br>
not actively introduce it.</div></blockquote></div><br>Agreed.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c094b169a41fc0541f88c77--
