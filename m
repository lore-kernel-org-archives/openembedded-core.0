Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id BC1CE70031
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:26:35 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id p16so75270399qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4MLDlAfR59ziP99KfEXw/e74oKZKL6eCyRhSDwB9WcM=;
	b=Al+O+S/oI3uCY8RNLntEXuP6pUPp2+04+tp+G2aCpt/8i8uXvG5IEwRfeZJVIElog+
	vdgl1tkwKdxdCQ6m/fBv3XCR9fvdXAbIFqGq++8N0zN1aS1Y3wJTbxmW+h6e4JIeocW5
	P8M0PsuUco/mRIfcddBnRRZfMyT+rgcSgqjLro10PQ+BjzXvsFrMfk6gTHpI2P6I3bye
	WgaliZNupcvpOHlaB7Ek2N2TT2PktDJMjnvlqm9Xq0xx7g/8QTArP0wA47JSDxeOXFVA
	75WkwYkdXkZY8tZfECxk3xrydILjJwj7kwNQaTwaepYsR0AA5OiavlWRjFZSmmbG4yvf
	I4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4MLDlAfR59ziP99KfEXw/e74oKZKL6eCyRhSDwB9WcM=;
	b=ONUa4W7bv7aEN9zbBQSc/9tq2uP/Mdr6wzs/i6xBGvaWPe/tEZ/gBkVX+AsmvYb2PR
	amQpCgA6/ENkOT4Ji3ACRIEsQvrzT0/1WOqWZ5w9mR8I0gW6NRWz4z6uCNjPAwdxD5XO
	BFt6DU3eWR9ws11gHz3Zm8Xz6ZrpunyF+kwUhCjZ/EN+ntTNtxhmaIV3myxQiKMO7wQO
	D/lraCW8ftGXyhrTsAfX2McINhUQJdIsob8iSi8FPo6X0eTpYhlPVlFkseAAJKIImM2t
	tp7k333+uUqukmXe18nG8Fzh0JtlXm+yoTJ9a6cYL02Tpog7voFBdOnZibLod9cJIwy5
	PO6w==
X-Gm-Message-State: AKaTC035EQ1ZEUxz/JbIKgu2t6SqP4QOv8n4R4oeKYR4+PZ2fNHczNVdIW+k8gEO3JQ9PT2aPSqDdgM3qasG7eSU
X-Received: by 10.237.44.161 with SMTP id g30mr82304623qtd.144.1481549196536; 
	Mon, 12 Dec 2016 05:26:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 05:26:16 -0800 (PST)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE5ADEB5@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1479838559-24993-1-git-send-email-fabio.berton@ossystems.com.br>
	<1B56A49860EB2D45ADE3731B15C959FDFE5ADEB5@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 13:26:16 +0000
Message-ID: <CAJTo0La30LEGSnpNxSM5HkNRBi1gSb8H1UATt_ZUo3TM5sfUwQ@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Disable exposed bits of WinPCAP remote capture support
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
X-List-Received-Date: Mon, 12 Dec 2016 13:26:36 -0000
Content-Type: multipart/alternative; boundary=94eb2c12584893c7110543760d70

--94eb2c12584893c7110543760d70
Content-Type: text/plain; charset=UTF-8

On 12 December 2016 at 06:55, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:

> I met the same issue when I build wireshark comes from meta-oe.
> Why this patch hasn't been merged yet?
>

I had the wrong tag on it locally so it didn't get merged.  In staging now.

Ross

--94eb2c12584893c7110543760d70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 06:55, Lei, Maohui <span dir=3D"ltr">&lt;<a href=3D"=
mailto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3c" cl=
ass=3D"a3s aXjCH m158f1d152dc0ad9a">I met the same issue when I build wires=
hark comes from meta-oe.<br>
Why this patch hasn&#39;t been merged yet?<br></div></blockquote></div><br>=
I had the wrong tag on it locally so it didn&#39;t get merged.=C2=A0 In sta=
ging now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div><div class=3D"gmail_extra"><br></div></div>

--94eb2c12584893c7110543760d70--
