Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id A92F373D46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:10:14 +0000 (UTC)
Received: by qkca6 with SMTP id a6so41034509qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 09:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tKy+FAFU5jvJ/Sg1WT0lnVwX9IYR0bFWIDfZv87Rz0I=;
	b=c4RF4jwxuTMMyjSgVkMaAdc0iMANuQtYv0+RMzNIigk8WoRJpDR0wh5YoIymqO5MzV
	TxA3OnIJpAApr1ThqnS86veOBQZDj8n/H7qJRMZuIbD8MsrEbih658YQ4O4ss/fr2k2w
	ASqPtHvdrpDnL8nfbxzl3VbO65vxabA2kDUyCqebp1ORjdCaKpSf54GauJFVvLTTPGqd
	8eYNGTDTBOBlFj5TUPGzmUTNvMXH/Dofh9gvPMf2Ghu81PN/pyXh1mZm+PJCrxjiTpDH
	0YWp2SCMJDUT1S+aG4qvVa3S1DLI+n4fG+ranbAYHArVjuZPzTki7fGNPEf/jnBKYRNn
	2NQw==
X-Gm-Message-State: ALoCoQkmsfeY41KLQWIBqk2yR9/hiOCsqmAgCvsDMr1YY1o11nTuNw7LZ2f/JRlNSJgzmclUrgWf
X-Received: by 10.140.165.196 with SMTP id l187mr13047319qhl.93.1445443814233; 
	Wed, 21 Oct 2015 09:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 21 Oct 2015 09:09:54 -0700 (PDT)
In-Reply-To: <f8642636a68071a0e33fa74d61fcb9cea566e5d7.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
	<f8642636a68071a0e33fa74d61fcb9cea566e5d7.1445334356.git.joshua.lock@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Oct 2015 17:09:54 +0100
Message-ID: <CAJTo0LZLoorMg6Jro+7GN0--hB8e4dFcxNNFLMcS6qTc5T9qrQ@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/7] systemd: make dbus an optional build time dependency
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
X-List-Received-Date: Wed, 21 Oct 2015 16:10:15 -0000
Content-Type: multipart/alternative; boundary=001a1134f6741765e005229f9d38

--001a1134f6741765e005229f9d38
Content-Type: text/plain; charset=UTF-8

On 20 October 2015 at 10:47, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
>

This also disables the code by default which is a change from the previous
behaviour, which needs to be documented at least.  Also as they're for the
test suite, should we enable dbus by default if ptest is enabled?

Ross

--001a1134f6741765e005229f9d38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2015 at 10:47, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora.=
co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6=
3h" class=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[dbus] =3D &quot;=
--enable-dbus,--disable-dbus,dbus&quot;<br></div></blockquote></div><br>Thi=
s also disables the code by default which is a change from the previous beh=
aviour, which needs to be documented at least.=C2=A0 Also as they&#39;re fo=
r the test suite, should we enable dbus by default if ptest is enabled?</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1134f6741765e005229f9d38--
