Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 830A36080F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:19:19 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id f6so279415744ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GgA0b/ZZm/4ATBZjtHzJYTHOyfgVtf7y8Pbz9MArgkg=;
	b=lFaCWbmCr6kCTrOem496PNbm6EZeseN8FKUN1LbGNWu+URk372N9oKHyfoe7WNoX25
	p3Q7Pov611brJHaje3nPeCb+uUfFZL6LeQd0u07O+Cma3vyp8JQMI3uZsBelWAX0jiHv
	/jw3J1yx6CpGF+l23S56e+not4/yy2XBKYB9rO1YkDwQ+A4vAkuBt117yhiFHSi2gxRl
	LbxsFcvHOs1v7g4QQ8tRRG0BBQ/7Ndi5zNqiBSyxt+sZVVYrH2oRJTzwHa8hjUFM8rpC
	WPqGXCZNUrkGg6YH07ESFcRpcs9RvsnatxLxX0AGHEGhuUN+GUdr6EN/liKVA59apm/w
	9TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GgA0b/ZZm/4ATBZjtHzJYTHOyfgVtf7y8Pbz9MArgkg=;
	b=aynA0IrA4iORDEfHbU2Ns2FAaZoZqlV/y2fD/SuDYoP661+QxzQTEv0YrxdHGU+Efu
	Yg7AvXlm6vF7ASKXugd4ppWs7P0VYd/xX82Mmoglu44RzmVHyu4RLbh+kNH/BQQuxFWn
	IS2OJb9+dgGRfezcJv5/CcppqNZ/10WwF5wLRc6ilfMATK8GgX2+yYO5+uQLPirjLruG
	ovXtZODaxVMFh1oRG5GedYxcV9DreMUi1iC+3bg/oF9Fp3slhN8gNHpw4T/lrgVIxTI1
	BkiXr4msyrRLL73YyCoNkeBT/jdKZyv57Il4XMc7b8SATA9UkGo7qd21UWemt8VmF9c2
	YLVw==
X-Gm-Message-State: AEkoousgDi75B63qR9hxgGZGfo3SxeLF9ecW2zMffOPm9cBwl0EcTYbncHPOLSsVfm3mE8VKLqAOqDIogg9nqIAq
X-Received: by 10.36.57.211 with SMTP id l202mr66036494ita.22.1470165559763;
	Tue, 02 Aug 2016 12:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 12:18:59 -0700 (PDT)
In-Reply-To: <DCF70298-25BA-4206-8B13-7FA3E198978C@seebs.net>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<579FFCEB.6090200@windriver.com>
	<47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
	<57A03888.1@windriver.com>
	<E145B74B-3968-45C3-A0B0-D557C76ADC38@seebs.net>
	<57A04154.1050909@windriver.com>
	<9BFBB743-6513-4791-9046-6BFBED50A347@seebs.net>
	<57A05A86.7000701@windriver.com>
	<DCF70298-25BA-4206-8B13-7FA3E198978C@seebs.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 20:18:59 +0100
Message-ID: <CAJTo0LZWA1T97eTwOR94SWgTMiB9dVusx+q6TYd-18XTLCCpBg@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 19:19:19 -0000
Content-Type: multipart/alternative; boundary=001a114ab3caf3b55005391b97f9

--001a114ab3caf3b55005391b97f9
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 20:16, Seebs <seebs@seebs.net> wrote:

> Does python's os.link work across devices maybe?
>

The documentation at least says hard link explicitly, so presumably not.

Ross

--001a114ab3caf3b55005391b97f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 August 2016 at 20:16, Seebs <span dir=3D"ltr">&lt;<a href=3D"mailto:se=
ebs@seebs.net" target=3D"_blank">seebs@seebs.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":2pn" class=3D"a3s aXjCH m1564cb06=
88c293b8">Does python&#39;s os.link work across devices maybe?<br></div></b=
lockquote><div><br></div><div>The documentation at least says hard link exp=
licitly, so presumably not.</div><div><br></div><div>Ross=C2=A0</div></div>=
<br></div></div>

--001a114ab3caf3b55005391b97f9--
