Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8CD6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 23:06:00 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so85856903qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o94hkMw+CL3PuOhGZ3kBJO/vNnyYuTGEX3cdYc5vOm0=;
	b=dEeV3yhW94zHrRB+SwBcwfDgO9qdTOugZnInhj0F/Y8ERha9KIxSFcunMjCRd06l0s
	81yLqJrxkcQtA/UEM2HUmm9chmxIYBeVd0qDvVDdDfa5aQ+gZtV/S1ksrD6dQckqv6LQ
	5E8tPzfARd1SuZWpNZapgatTJ5VLLBJImDzBnOI7aO28IIk+C/nzCuQCoTLUjVU/2a2D
	n9u/fMz9mwaDiezWo30u7e5P9WJ6yijFpHAIxenOkND7hNP2tVm0hQf6ADY7OqPI6otP
	NCDIHF7bdjy7XvoMbuaoGjByGNOfliE/mp0LeUf71yMHXSSOgTtqZ8aw7HB7D8KEVYXH
	iAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o94hkMw+CL3PuOhGZ3kBJO/vNnyYuTGEX3cdYc5vOm0=;
	b=NrQkhidM1OxE2t6py4A/gk/RSEy2GGvemNH0MO+in0Pcjtg4PIB7wd1eAqwqHCW/as
	d5eYNn7qluKU1kmOiuMbAfHFglIFmaOvdqmJuXUmYH0cDIdCfGernyioDcCj2BcbHQZR
	ThKt947lN2iDnWXJd6iL3YsjmHVKGuILpdWzQLyNsJo4+ayQx6eHy9yPy7QKaSRHGtmk
	EaOwRhhbNyaeYSKkonenmkajwPC+pNTty9Ut8ZPNcqn10mKDOriaVuDlfbHbB6DRfcVf
	3x3El54IFJ2ZBhlpNK/WQh7oZKdBnvJjRAko9FAreGmito6RVdqBxlVvQx1lPYlQMWdI
	8qqA==
X-Gm-Message-State: ABUngvd7BfxIqZxyQACmHHNNhmn4QNPrGbb/BnIGkyzRzRRZMs4rs8Zo9imYmX035GkuKtdr23B5CdYboNBupjIx
X-Received: by 10.237.44.161 with SMTP id g30mr15379197qtd.144.1479251161863; 
	Tue, 15 Nov 2016 15:06:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 15:05:41 -0800 (PST)
In-Reply-To: <20161115152158.7883-1-thilo.cestonaro@ts.fujitsu.com>
References: <20161115152158.7883-1-thilo.cestonaro@ts.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 23:05:41 +0000
Message-ID: <CAJTo0Lat+q9JZLmc34aXB8VV2Ggc4Nf0a5SU=7nZwqVWmvwi5A@mail.gmail.com>
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
Cc: Thilo Cestonaro <thilo@cestona.ro>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libdbus-c++: added recipe for it
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
X-List-Received-Date: Tue, 15 Nov 2016 23:06:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848096e0e05415f00a2

--94eb2c125848096e0e05415f00a2
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 15:21, Thilo Cestonaro <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Patch goes into meta-oe of meta-openembedded.
>

meta-oe patches should go to openembedded-devel@lists.openembedded.org.

Thanks,
Ross

--94eb2c125848096e0e05415f00a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 15:21, Thilo Cestonaro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonar=
o@ts.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":352" class=3D"a3s aXjCH m158689e38e8d4b29">Patch goes into meta-o=
e of meta-openembedded.<br></div></blockquote></div><br>meta-oe patches sho=
uld go to <a href=3D"mailto:openembedded-devel@lists.openembedded.org">open=
embedded-devel@lists.openembedded.org</a>.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra=
">Ross</div></div>

--94eb2c125848096e0e05415f00a2--
