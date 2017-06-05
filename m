Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 36EF860049
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 10:41:32 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id w1so80172425qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ScbhFMxH71qqb64wTzRSk26tgtdnyIOdOnvcgTNzEZE=;
	b=YAhokA0aijX0KWVKVgY3u6vDeNVIfsvd9IpcwMyAdMltuqCjWIEoU4gfGTzdfDkuDL
	LPO4nIw0Jdunu0Fg2xybvdpV2WkC72d4nJPnZkhnXZabMIPAKYMCDatUP5TXDAkuj7jM
	SfA9SWKELQHlRrp7nKqytHs+vqGtxiv1GtJKMk3hrE6MgPJYD1I259a5sPY4+taLPbCz
	ysNbVX2qm78+uXYBu+rkF4YReKNcNCU+/sC4UmhvKyw6E8yPakmbpaC2qUOTNaF5nFmk
	/tGcvy5Rdn+8Ud5h3eTPMlL82QpyRhsGDP3E1Vt4ksjEUubNMhS497hD4mTivJRrb1E3
	7xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ScbhFMxH71qqb64wTzRSk26tgtdnyIOdOnvcgTNzEZE=;
	b=eKKWZ/sxixGVD6qOYFEfaZVaoBFjk7ujRbhi4lgjykanmBOpmw8Py3apiKO1SMYAVg
	myp5NJLuPnBYf2PcVen9WQfv39ag0FwwysvxMF5TMdX/XFiPQ75cIUR3LESQRct5Qbxa
	t8RlxBhED8VTK6P4oliDy49yV6QfqP4NVQHQVvpurCZ9BOu74ecy5eeHDeFvjAmV4JDk
	J3fTukSZyqyji7t/2jspJVM8p86wsfVuJXqBy62ea4KUhB9mA8ZmA6G1RFf+dXgCyXYO
	RHYNmsBOsfWXIR1xBUT0JvUrFU626Gp7DzeLlo8KrfLa+v9dK+ARvU3KaqoYJ/+B5F1k
	kxgQ==
X-Gm-Message-State: AODbwcDPVa3bn86C5bEbjsCNHEEYC0LdBZVUn8uH6BgjZmjaSKl27auO
	+KqoXKDxrt+H3HRBFZEiY0otSuAUkvWM
X-Received: by 10.200.62.25 with SMTP id z25mr11798521qtf.139.1496659293835;
	Mon, 05 Jun 2017 03:41:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 03:41:13 -0700 (PDT)
In-Reply-To: <1496629240-14416-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496629240-14416-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 11:41:13 +0100
Message-ID: <CAJTo0LZAO2UJdw4zOYD6uoBfPCGaFzigbJObprzB6v7rEp4OiA@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: Fix CVE-2017-7475
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
X-List-Received-Date: Mon, 05 Jun 2017 10:41:33 -0000
Content-Type: multipart/alternative; boundary="f403045ee67e8f29b40551342500"

--f403045ee67e8f29b40551342500
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 03:20, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> +Upstream-Status: Pending
>

This should be Submitted.

Ross

--f403045ee67e8f29b40551342500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2017 at 03:20, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
n.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":22i" class=3D"a3s a=
XjCH m15c760e36a517618">+Upstream-Status: Pending<br></div></blockquote></d=
iv><br>This should be Submitted.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--f403045ee67e8f29b40551342500--
