Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7370D71D97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 12:05:13 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id t26so31832802qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G2Aysxg0vuJB2+mHbw3WBTpmiZ4ZdxBJrQdOy1FKeZM=;
	b=ZaeaqwExHZzrlHUguK66uaB9TNj9YO+13i635CJuG6E2x9GuNv8MmK+VolmqpWFt89
	AqP761uS2WC5Ic4nsxy10udOT52JdPLNI8iQqc87XMpH3upKVJ0g87GJ0Bq/VXmQUImf
	J+OYsSnp5/uhrAfNHeR2+hD6QNqbsPwPu0jlR0EnCgNkvhf0zhBwRkljeQXST5Ry/ZtE
	DRjPluO+Ck6TaPiETtt1gTe0bN6sxTeU7OjvWz3Jp/cLpXHNDVOpnO1X+pL+GSnvIgbo
	/UTMNPP4RrCNemzKWzIuNjurQLRr80IX9u4NrBNkQG0nkX0C3zb+Nleew1tjhCviSlMO
	JWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G2Aysxg0vuJB2+mHbw3WBTpmiZ4ZdxBJrQdOy1FKeZM=;
	b=jTcZ9lPNMscl+dXa05p9ypebzvv8GJzvQeC2CpkVOoJa13O/yrb11tOmrWj4iKNBCy
	jvn2Jz99vwufAKgfQ9nA2TRk8Mw/v2V+iQfvKO8vGmQ49Rw6rXq68feqFsgNsQVmP9FP
	bZKL+aIvoUfZLdBbxjMVkHpGBMa+6qt/fhyuXlirPoXYsQBj6fLQhDWZPLxhviW7L1fr
	Qdc5nHAj1ZAhqCTkMhcwfdoqHuUQTCsLxYLnDStfgGCjcJpOfE4VULx1PmN9AXvuOtfk
	YnX42CuiOtYmkLAlLswPQ2sBR6qTXF1pfBE6m/SrT6/wV8Le/8xJ2MGH7EreHmUleLWG
	ZD3g==
X-Gm-Message-State: AN3rC/7LACWUxGexocyCiEv+niwNjVr17ccDzVPd4lCUi7SJ1PfNbl0E
	/lHnW0iihrhbD/9uvnaiUzN2g7Q0klY0
X-Received: by 10.200.50.49 with SMTP id x46mr28899536qta.105.1494245114374;
	Mon, 08 May 2017 05:05:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 8 May 2017 05:04:54 -0700 (PDT)
In-Reply-To: <1494244017-3933-1-git-send-email-maxin.john@intel.com>
References: <1494244017-3933-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 May 2017 13:04:54 +0100
Message-ID: <CAJTo0LZfcvtMKTXbpjVp9v14SOsFLbQZEXKCV_gdJ5ddzkg-wA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 12:05:14 -0000
Content-Type: multipart/alternative; boundary=001a113577a24022f4054f020d54

--001a113577a24022f4054f020d54
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 12:46, Maxin B. John <maxin.john@intel.com> wrote:

> +PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
> +PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
>

What happens if neither iptables or nftables is specified?

Ross

--001a113577a24022f4054f020d54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 12:46, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mail=
to:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">+PACKAGECONFI=
G[nftables] =3D &quot;--with-firewall=3Dnftables ,,nftables,nftables&quot;<=
br>
</span>+PACKAGECONFIG[iptables] =3D &quot;--with-firewall=3Diptables ,,ipta=
bles,iptables&quot;<br></blockquote></div><br>What happens if neither iptab=
les or nftables is specified?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113577a24022f4054f020d54--
