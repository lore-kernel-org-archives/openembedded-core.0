Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAAC77FF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 11:20:37 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id r30so21630237qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kNzDoJa2MJLquauoeifKbuv9aY6V6VhaRt90S7yPfvs=;
	b=hwYiBb+L30MLZPusmQAYoqJ0+fSzBH1pa7xejFhE7NYbX+03ICs84s4VRPUsOuKS1W
	mR9Glbx8ZbLypJyNPhOMcXMH8LFTWB4elcUSVxXwgUo8uSgTVMr7ADOBP1BdNbnw8NWc
	LRPiMpiArenlACwWgalXM+6QN/qCGVkfRCXPFjlyFzdwDXP9iMxmFOsDmHihbKFO99cj
	TL7ACZF18auOiV/wJkPYyIdT9YfVcn5tURMgj5UHSa0buZIt6SMd+ZGXqp4yV5Z0zJWn
	9TyAYAxLNuKFoszBDtoQgQ7kzffbjlwa2OQjcOJI+JLqZDFCIewWGWsf00hv5/dZUDz1
	k8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kNzDoJa2MJLquauoeifKbuv9aY6V6VhaRt90S7yPfvs=;
	b=pRC+uk0g+ymgwZyzcDQsCoWpVcDbnx5CvlCp4ic5HaHqcdxbwyB5fyiTlug8v/r89E
	aLjxpOYtnkeSJbWCJz4VCArTLEctQ8og/tcO44A9Xx5d93JT3s05ICA0Utq6ZdI5p65x
	ZeZKVSP1INGy2CHw05MI9or+9xcDHFHKM6NvYkjmrLByXvQzxH5w1IO4t6KnxKNzMwDg
	IeHtuyMvsZbGkkurkWGegLqNkB7JYmL15uYzbYGs6RluS3E+D6fTapmgA5pLA7PsCQJ9
	BiEozK/TyE+9lyWAUH5IENtci3+t3bn5ooRNzUTnQg4FOf/MfwkUoCNxdBN80/3fhOkS
	Cf4A==
X-Gm-Message-State: AKS2vOxWyu4v7lW90KxrySGGbQt37LzbjnIbWCBeTQlkVNIbfMvATWJn
	ahWNX2+bRyfRhoFoL0DcGYyhazZRBT2z
X-Received: by 10.237.48.45 with SMTP id 42mr5468582qte.139.1498562439466;
	Tue, 27 Jun 2017 04:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 27 Jun 2017 04:20:19 -0700 (PDT)
In-Reply-To: <F187383F84EB304A88D055C304958879468479EE@FMSMSX106.amr.corp.intel.com>
References: <cover.1497632387.git.humberto.ibarra.lopez@intel.com>
	<7dc39347ac14d76dbdeb4d29cb63254dc559001f.1497632387.git.humberto.ibarra.lopez@intel.com>
	<CAJTo0LbyA6q5ywJhKj6WUiozesJNo0ZqWrZsMhvW+k0Cei2QGw@mail.gmail.com>
	<F187383F84EB304A88D055C304958879468479EE@FMSMSX106.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jun 2017 12:20:19 +0100
Message-ID: <CAJTo0LbEBRnsKJRiF4T7117iZmhbAQJoMPxX1LAKL1u3ijbbUw@mail.gmail.com>
To: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Tue, 27 Jun 2017 11:20:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c96eae0e5f10552ef410c"

--94eb2c0c96eae0e5f10552ef410c
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 18:37, Ibarra Lopez, Humberto <
humberto.ibarra.lopez@intel.com> wrote:

> Thought about testing debug packages because the bug comments mentioned
> iterating through rpm, deb and ipk. If there is no value to this part I
> could drop it and only test for the debug filesystem. In this cases there
> any value to check the debug filesystem in all three package classes?
>
>
The debugfs generation involves using the package manager, but we exercise
those codepaths already so I'd be happy with just one package manager being
used for speed.

Ross

--94eb2c0c96eae0e5f10552ef410c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 18:37, Ibarra Lopez, Humberto <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.i=
barra.lopez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:#1f497d">Thought about testing debug packag=
es because the bug comments mentioned iterating through rpm, deb and ipk. I=
f there is no value to this part I could drop it
 and only test for the debug filesystem. In this cases there any value to c=
heck the debug filesystem in all three package classes?<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"></p></blockquote></div><br></div><div class=3D"gmail=
_extra">The debugfs generation involves using the package manager, but we e=
xercise those codepaths already so I&#39;d be happy with just one package m=
anager being used for speed.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--94eb2c0c96eae0e5f10552ef410c--
