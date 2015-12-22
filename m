Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 534FD60762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:11:23 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id to18so46990604igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gxN7oJ7j35VYpzg4syGR6yrRp89cRRmi663vJu95CdA=;
	b=2B5YsxsU5sn1KVAwahPCEEzKjBy3H2Y5/3OKX4yRgZQwxdToaQEgazPwpjNtuF5WEI
	me4bcr+Kf5y5vgJIMmky1GBtLqQonTBwEuyYh2D9FkKtkFUAmvMTPWOdS5o81ARNlwDg
	e2n7Kk+5c01kciIZv+gxcGC8DGaeN7kJcfZvR38bvPvLNxY8fk98P7m0A1wRL4K8RnPr
	n4E5/0RzHAWNzfGg4/TthDiXFGwi5d1H3i4NW2gi9COTGQ/K1TB+MY6JWBrrUWSaA11b
	PEv9LPi8/HPDdyBylflvvz8bpf9a8u5nq3d24amFJ3WC0Gf3x4sOFGsq5PfelcIwhnLI
	dUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gxN7oJ7j35VYpzg4syGR6yrRp89cRRmi663vJu95CdA=;
	b=G36H7FoPBSHwjM0SDJzk39GLZWs3hyA5Io4voRlkOVMKjrCsMTXwXzF/N2rkEd7gbW
	6roCYYGuH43b2vHsisW0QDxg9TmphgfHIXnrQmf/pW71em047YW0cgl64azfRXZlFNZ9
	UEBLmc7dHOpjhhP0Hf5we3kb9nRj/PvIczO7kTJOYUi09ELFgCNZ1/VjjNjTElnrZeHE
	ewxcsQ5xu2cdEV640nq4f9gSJjWzdqAvFdDj3idDjgVHAYYrFkO9c2Gek9Ix6OWGgD8s
	UGIwi0/VrZZinX0WEZSyF4wwZqcbZOd4La3OHhZ8HoRKpTw27yhozrpw0U84/U6ueSUR
	THvQ==
X-Gm-Message-State: ALoCoQlnJMtrJ/RSWopKP1xJFEAsPV52nDpBFUO3NH5XdNNQ2TTuzNFBRgR40b0J9Icb3l/5I6ybQXOPFJF3A1MCZAcRj9ky6pgRAl1YXfMKjMSHcRIky4A=
X-Received: by 10.50.30.69 with SMTP id q5mr21848227igh.78.1450743083931; Mon,
	21 Dec 2015 16:11:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 16:11:04 -0800 (PST)
In-Reply-To: <1450554119-15984-1-git-send-email-costin.c.constantin@intel.com>
References: <1450554119-15984-1-git-send-email-costin.c.constantin@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 00:11:04 +0000
Message-ID: <CAJTo0Lah03Ts32rUyR=eAijWk+m4nnHDLU7145n2TkCWY2N_=w@mail.gmail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-selftest: Add support for selftest log with timestamp
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
X-List-Received-Date: Tue, 22 Dec 2015 00:11:24 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c2dc06f0527717221

--047d7bdc1c0c2dc06f0527717221
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 19:41, Costin Constantin <
costin.c.constantin@intel.com> wrote:

> +    log_file = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S") + ".log"
> +    if os.path.exists("oe-selftest.log"): os.remove("oe-selftest.log")
> +    os.symlink(log_file, "oe-selftest.log")
>

Wouldn't it be sensible to also then write directly to the timestamped file
instead of the symlink, just in case? (in the FileHandler call just below).

Ross

--047d7bdc1c0c2dc06f0527717221
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 19:41, Costin Constantin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:costin.c.constantin@intel.com" target=3D"_blank">costin.c.cons=
tantin@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":2m6" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 log_f=
ile =3D &quot;oe-selftest-&quot; + t.strftime(&quot;%Y-%m-%d_%H:%M:%S&quot;=
) + &quot;.log&quot;<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;oe-selftest.log&quot;): os.remove(&q=
uot;oe-selftest.log&quot;)<br>
+=C2=A0 =C2=A0 os.symlink(log_file, &quot;oe-selftest.log&quot;)<br></div><=
/blockquote></div><br>Wouldn&#39;t it be sensible to also then write direct=
ly to the timestamped file instead of the symlink, just in case? (in the Fi=
leHandler call just below).</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--047d7bdc1c0c2dc06f0527717221--
