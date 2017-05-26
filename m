Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 73BDC78222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 14:30:37 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id u75so8569436qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2meyPE/CGbZSc9FDt7mwplw0/DNuo80KnT6wkZxaTkM=;
	b=MHgFzqzb5zN7QGF+YZQ/W+bFn0WPBe8A8tiLMsr35t8sRY+iI0j0hgB2FD3+/UcG6G
	Vajv41b1x1sQzNq9dsJaiwSQXTVb+sknSxh4iSfE1Vy4dRPe1NSpdQQxkfKeFoO2wvRH
	ZSZPr41PPjhT03QACoK61iDIAEZ/2znf/s2fUoWdUusz3fSHTdhejLhNpnv04+Ny58hk
	qw07b+4vHmsD0f8DEuJto2YbpJvrpV6jqwdpFbcgW/F5l3h85QFaGggN1q9h8RJYArUf
	2xwyPB10oDXxfBE8TiQZEwIpk7VAc9tilaPBd3/I3jfJSIaCnywMXx+2Fc8XM20oru+V
	7Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2meyPE/CGbZSc9FDt7mwplw0/DNuo80KnT6wkZxaTkM=;
	b=mbhbEkH1CXp1gRZUglN447RO0P+LuR9NM2HmNr0ZVnGZv4W+ZTkkwO+gfu+rCBuLyJ
	2WWc7gzX279HTCs+juMCXjRIZKykOXMxeNkjvc3vv05p2ReCW38eT37ZXru7WBxTO0tY
	8/gzz2/NKnQo9HAzU/Mck3yEtJpvUd+A+Hxe7kci42aXOwagLDNHYhGzJ7phn4jHAzhG
	zdzYka03LSL5t817/EAuOS6hfjiT9ACNs1jrULkRN1u85uw7guVgRddJuG6H2aAB4pzU
	iu/NfyQbs+3ciQzNMYdmT1iVv1II3Vt8w9BtIqXRje9YDxIpNvQzs0UAt9NBd7sqxvKI
	RgQA==
X-Gm-Message-State: AODbwcCZ+/I0VKtCCcE6f6sUZNpvVJcO7JfaMKB5UG5zD5bI0rD296dC
	AwKgRnNylf2sugX3KyNfgEwEU53wk+MR6u8=
X-Received: by 10.55.116.133 with SMTP id p127mr2296789qkc.154.1495809038350; 
	Fri, 26 May 2017 07:30:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 26 May 2017 07:30:17 -0700 (PDT)
In-Reply-To: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 May 2017 15:30:17 +0100
Message-ID: <CAJTo0LYTGn2kObGysTxTPvRj8GR_ahkZO3s=DzvXPo3BWBY5bg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: Upgrade 0.168 to 0.169
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
X-List-Received-Date: Fri, 26 May 2017 14:30:37 -0000
Content-Type: multipart/alternative; boundary="001a114fde726210eb05506e2ec7"

--001a114fde726210eb05506e2ec7
Content-Type: text/plain; charset="UTF-8"

On 26 May 2017 at 06:06, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1) Upgrade elfutils from 0.168 to 0.169
> 2) Delete unnecessary patches which has been merged into 0.169
> 3) Rebase the patch files for 0.169
>

ERROR: elfutils-0.169-r0 do_fetch: Fetcher failure for URL:
'file://aarch64_uio.patch'. Unable to fetch URL from any source.

Ross

--001a114fde726210eb05506e2ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2017 at 06:06, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
n.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div id=3D"gmail-:2s6" class=3D"gmail-a3s gma=
il-aXjCH gmail-m15c4325c486895af">1) Upgrade <span class=3D"gmail-il">elfut=
ils</span> from 0.168 to 0.169<br>
2) Delete unnecessary patches which has been merged into 0.169<br>
3) Rebase the patch files for 0.169<br></div></blockquote></div><br>ERROR: =
elfutils-0.169-r0 do_fetch: Fetcher failure for URL: &#39;file://aarch64_ui=
o.patch&#39;. Unable to fetch URL from any source.<br></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114fde726210eb05506e2ec7--
