Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id EA18378038
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:20:06 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id b2so13145162iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QOwNtXgUvohRrAPvdtVux8pT2C6cgT1sZr01fshQD8M=;
	b=Nadr7mbH53S2OD95NW1sFS8E2Jp49pCP0b3cgrfzwDn1Z37LxB1hW3qKVL0uqr5Mof
	HmLcfYlFUdW0ZTHhVLJVP+4tWNVnD680NSUVn6pcRIi1M+eIT9pPkIs/6OJa/EAj7tg5
	MQdEzdydew4ipkqWDGQs7roJJkwzn+mGGCIHU0lfUUbDhejMsfeGcgc0wjZHYcob+jO6
	NTcEqsks2Ut//IyAVA6bycELMPmi/gWWdfUQwafw3jkNM2xbQWt63WesM3d7L4MHUFt9
	xqMDfE2nFMrP31tWmJuG398ifciky7DAy1Ezp+jdvMTnwGpkW0FDkosh35NIRpwDaFPk
	KPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QOwNtXgUvohRrAPvdtVux8pT2C6cgT1sZr01fshQD8M=;
	b=klcYgHGlUJIgrF/jm5uTCNZgxRQuM9Lp9HOi2LkiZFLTaYajkoWLnU6Wtk3mlGjDf+
	n/uXQOYCv/piTDXvRBDgdgTL/KbRDqRvNDJh6aCSSYNlpr5HZVxXM6CGmDrG4EMAHftR
	muLirxcqGNtTk3ySgAYfULYK3bHRvk6kdW4qeLLO+7hdSmvbXrkYnWmFBO/0sEmQBVh4
	aIVjv/YxE34qbCLAJvLo4wtQmM+Kjqk30C0mMwqvCzl6tsb3QCxFHHKM/9TJA+TEJEBy
	QYeA8vI6SLs+1JdBq8BJ4547fQJ63R4QuKTAcLsK4s0XK7PZO8RebSMLlyNvzxVOqC8G
	5WPQ==
X-Gm-Message-State: AHPjjUiJQ165C5Q/2f6lepD8MM9+uknTlB4Wcpt0s6mgy3HlkJybaZuU
	tcvsS1Wo5tJiNTEzsWWYCeaUPlBpLgGF
X-Google-Smtp-Source: ADKCNb6pyayD+YD8crLTpWi2TD8riV1wJjpS3g3tmxSwHMC1yPjWYrCdenDywgcZ6VRY2Xk1xZq3nghtTSYPAcaQEBs=
X-Received: by 10.107.142.13 with SMTP id q13mr3160174iod.153.1504603207977;
	Tue, 05 Sep 2017 02:20:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 02:19:47 -0700 (PDT)
In-Reply-To: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 10:19:47 +0100
Message-ID: <CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Tue, 05 Sep 2017 09:20:07 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c5ecbd7d4405586dbb8b"

--94eb2c05c5ecbd7d4405586dbb8b
Content-Type: text/plain; charset="UTF-8"

On 5 September 2017 at 07:35, Andrej Valek <andrej.valek@siemens.com> wrote:

> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>

We're past freeze to the upgrade will have to wait until 2.4 releases. Does
this fix any outstanding CVEs that we should be cherry-picking?

Ross

--94eb2c05c5ecbd7d4405586dbb8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 September 2017 at 07:35, Andrej Valek <span dir=3D"lt=
r">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej=
.valek@siemens.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Andrej=
 Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com">andrej.valek@siemens=
.com</a>&gt;<br></blockquote><div><br></div><div>We&#39;re past freeze to t=
he upgrade will have to wait until 2.4 releases. Does this fix any outstand=
ing CVEs that we should be cherry-picking?</div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--94eb2c05c5ecbd7d4405586dbb8b--
