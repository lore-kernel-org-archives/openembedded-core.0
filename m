Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id EF274759B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:40:32 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id g6so15210846igt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=arJzm9dWIR6FEYIo9QTXtGbQqfu1/ukZyFpE75VitTY=;
	b=xuQzfKbPA1xapG1/lERu5fWBS7YRqoH3yB+Qif/0i9qtNYInMZQp5fWWfsXdWconks
	cgo5jHQtpcHiqXkkE/AYcq35xlpTlrqEgq8BErK43anqe28xklAxEvh+9XXuYsJqPoZX
	b4n3SKUQWDOtPmd0aJaOo1Pw2Fod14f8RhC/4R6E8mkARmPiIdq80zmclFUs+r8nAb+g
	SPVm3CVUTskFLYvkqiXTj8rTRcmlNI3I6fIQSt4J/lKZXdbSDbHsEbJhBslI12zMSxtf
	LaGKn+FGnAZ5X7/P9bVTnpaRReDqb7rZu8wzOSS3aoACaeJCB2CKNCUrHeLwRnxEbxj/
	eeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=arJzm9dWIR6FEYIo9QTXtGbQqfu1/ukZyFpE75VitTY=;
	b=OtycFJQ+5HaHYxh/hs9Vwm/tNeAqrNcQ00H83mvGI7ZuX86Z7hrr8eGebfORfFKP6n
	0Qj3cYxjX+FTV9MogfsrWQ+p9q9qH2Hkx1jMYYo0aUv549ElByz/d2tf/3ArYuyPAX2t
	HpBCx5UCo/dBYt+/PfnYLPW4W36xRc4ZwOhGQK8NWqcY1g/DDVz13sAQYZLRqPmWrD0v
	/m4y6e+sB2TyiAYTyr00f4hqduvqm7wCnhD2dMqZHbFgfzWHXmZ8pWsjqCMDWxjyyWHb
	RUuAa61loySfz/omjaQasC2FexeArEI7liU8h9q1TPUgz0n/lbsipfx6Mx6Pd6CZBiae
	/k2g==
X-Gm-Message-State: AD7BkJI/inYeX4AXbeL86yjhVLZmfwlN3+dk5J8aCCfxSbPWGBuLbOX6On/JomuCapxjWhLqREHvWg59YjhySAit
X-Received: by 10.50.160.7 with SMTP id xg7mr2213200igb.64.1456821633263; Tue,
	01 Mar 2016 00:40:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 1 Mar 2016 00:40:13 -0800 (PST)
In-Reply-To: <20160301004309.GA2559@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
	<20160301004309.GA2559@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Mar 2016 08:40:13 +0000
Message-ID: <CAJTo0LbSUxP=yUD2Ga8=TeT-eudZaFjrMP7HKq-yv0B9RfK6sw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Tue, 01 Mar 2016 08:40:33 -0000
Content-Type: multipart/alternative; boundary=001a11339de8f3c505052cf8b79e

--001a11339de8f3c505052cf8b79e
Content-Type: text/plain; charset=UTF-8

On 1 March 2016 at 00:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> OE qemux86@ ~/build/oe-core $ cat
> meta-qt5/recipes-devtools/gdb/gdb_%.bbappend
> PACKAGECONFIG ??= "python"
>

Having fixed number of these myself it's definitely best practise to use
PACKAGECONFIG_append and _remove in a bbappend.

Ross

--001a11339de8f3c505052cf8b79e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2016 at 00:43, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":41x" class=3D=
"a3s" style=3D"overflow:hidden">OE qemux86@ ~/build/oe-core $ cat meta-qt5/=
recipes-devtools/gdb/gdb_%.bbappend<br>
PACKAGECONFIG ??=3D &quot;python&quot;<br></div></blockquote></div><br>Havi=
ng fixed number of these myself it&#39;s definitely best practise to use PA=
CKAGECONFIG_append and _remove in a bbappend.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11339de8f3c505052cf8b79e--
