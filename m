Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
	[209.85.222.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1658C61C20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:25:35 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id t20so2336698uao.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ipmJoGItZcGz+wbhf1L8m5LM7oczNGbKp7R6wWLfzcI=;
	b=bzkxbBcUjI0l92PIri/4WADn/6xPSOAdFy0XZtFLbKFcyYoXXp93hJhvZUwvfqWYeJ
	a9xwoGp2nfA+geo/VfFMnWyWtU7T4hqQdK8XnfLT9cEpXjHtsL7n59wzrnvMtsXH+UDZ
	znWghT4nQY8KzbjwkIZPf0YkgzobsSyXdBml3ePZdfDmyA7CbZPgfknuGPLieg1g9R/X
	Hw432BTFAdQKt0UxyxIc6ZBNAKEKVgc94AktzsR0DDqDH1l1kkRoWRxnTKtv45PKHQ0C
	tx3uvkMAS1csnmQObN8AUAveeSyZwwHVh7ZpVYy0C1pwZtGhRvQ5oJabyzAq618Pge2G
	IaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ipmJoGItZcGz+wbhf1L8m5LM7oczNGbKp7R6wWLfzcI=;
	b=QH0oCdhO/Bexhp9N0Jo7i7aJA1Q4JwuKYSyQIRqdpCBXbntAHnvD27kddVmIqhQCjh
	qDPUlvZaxvy5mmektGgyOAusOnEzjruwM98xAqLHQOCnu1ZaSSyZwHl7OrQbjw1FzGHW
	mBNvQBMZV5eESqeHFlaruylX3FnIVDJZJA+QTV3kDdgojFMBEggg9AEhSI9QXAJybdk0
	vsWVmnqaERBPBSyt9ndoUjnaqgHkSY8ZpnqH+cXhwleez8im8uAB+uWfSDM7qtPmkFqF
	zDNFnyFp5yUAx+jsIXjlSTS9ZIrHPwe2689a9E60c/gFvol0nqYevG6jsnAlR964Ofve
	VmTQ==
X-Gm-Message-State: ANhLgQ2nDW9XirM1ulInJWzEoNkemUO7CdtJMCwML5CiFRRTPcOt1D9Y
	gme1RSJu8dmu8nLvDE0dvp7ppv2m+0wIVhqKh58=
X-Google-Smtp-Source: ADFU+vtUgjXSMb1RxdmwK5eB8Kf/C4qnhKkJzsBwacVMDFo7AACaB7GwPpr6vpF5snvZECw7cu+7k10CA6D9Try45pQ=
X-Received: by 2002:ab0:1158:: with SMTP id g24mr5301018uac.71.1584030336109; 
	Thu, 12 Mar 2020 09:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
	<CANNYZj8uQeTRf4n1rkCkKkGc7n4KWrH5MdT13uAzivrBHDAsZA@mail.gmail.com>
	<35d02004-68f2-eac7-16e5-8e51d98d7a1d@gmail.com>
In-Reply-To: <35d02004-68f2-eac7-16e5-8e51d98d7a1d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2020 17:25:24 +0100
Message-ID: <CANNYZj_xSpmzHCsZ=JK9phne5ZC_kzfwaNk4tSDPfaebGZdyOw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] netbase: use snapshot.debian.org
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
X-List-Received-Date: Thu, 12 Mar 2020 16:25:36 -0000
Content-Type: multipart/alternative; boundary="0000000000007f514905a0aacdfa"

--0000000000007f514905a0aacdfa
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Mar 2020 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:

> > This will break version checks and automated upgrades. Is it possible to
> > build from git instead?
> > Specifically: https://salsa.debian.org/md/netbase
>
> That repo is debian build metadata sources for netbase.
>

Nope. It is the actual sources too, in etc/.

Alex

--0000000000007f514905a0aacdfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Mar 2020 at 17:08, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; This will break version checks and automated upgrades. Is i=
t possible to <br>
&gt; build from git instead?<br>
&gt; Specifically: <a href=3D"https://salsa.debian.org/md/netbase" rel=3D"n=
oreferrer" target=3D"_blank">https://salsa.debian.org/md/netbase</a><br>
<br>
That repo is debian build metadata sources for netbase.<br></blockquote><di=
v><br></div><div>Nope. It is the actual sources too, in etc/.</div><div><br=
></div><div>Alex<br></div></div></div>

--0000000000007f514905a0aacdfa--
