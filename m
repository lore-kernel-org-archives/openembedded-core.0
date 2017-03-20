Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5A14777952
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:26:57 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id r45so104778945qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SKp5l9etjUzze3YFEddvhb/U8GOhk7D3UXCr/55y8hU=;
	b=zUkOSSnBgw+bwwOnsafZBc0UY5pBqV1sI6GbIKoErDKTNxC7jze87DC3j4XxFLAOeR
	mFmrkCqczh7cueMYQdTvV7MRaBKTrsxNbnpeDlT5Nx8DSPoaTn4+/ao8EPiBUNd+Om7m
	8qG3P/1Fr6fPWlVJ40cqEBVF1cI2IxdaSl07ae3HCKf2corVTARrI7YqK26KzaSVA8Wm
	So4qFrpfVqIpX7B1C5VHs5ASXh1cuN0kZFf/Zt6lvjich+jBP0DCy4RZmUPVilTneIpG
	XzI+7OzNPnPprRKxiovpfKv/3TJYVbKw9D6rKuRqvhlmU8Nz3vFKRQmSeQ0HJgiIRNbY
	YC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SKp5l9etjUzze3YFEddvhb/U8GOhk7D3UXCr/55y8hU=;
	b=jsLhAbTlFO0H/ftr2AkW7EdtGTMdBjBSm5hEAuQudErKbo5IA6eQZ6NBfQ/z3QjvFQ
	SL5eSzAbZQk6TDSBeuXXqaQ5zMKPlXlXL87q8UWNaC92XbJpFKNzMJDR/zxhgiiVwqMQ
	0XOs4BeCDlMe7koCg++65AlZDVt+KIZG8dP8RYFuog78TRvIxaqJjx0qaUHffem9gPh8
	z2JWEueNRtH3fKwoH6lBNrQSeh929L8peQArzdqh8yyLastyV5aAGASGYu0/wF+3TZ3e
	ggmmfZBPBwGuKnl/+Boftzhfif0GrwxtNk5chETNkzFC8tWbZR4DG24Lqv2n5xN2eg4D
	yToQ==
X-Gm-Message-State: AFeK/H2ReJhCjZsg1ItRys/v38KddaPCRT5f5MnvzZvNMah5MukH/Fhj5I5DW5+VJV9RE84hENBgi67Enr8ahj8e
X-Received: by 10.200.2.150 with SMTP id p22mr28159786qtg.197.1490012818549;
	Mon, 20 Mar 2017 05:26:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 05:26:38 -0700 (PDT)
In-Reply-To: <1490012333-43021-3-git-send-email-d.schultz@phytec.de>
References: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
	<1490012333-43021-3-git-send-email-d.schultz@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 12:26:38 +0000
Message-ID: <CAJTo0LbxzD21M8+A=9FuHQNjOH9A65dLh48Exe1sBRNwGrVmqg@mail.gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] meta: images: Add fsck to avoid corrupt EXT file systems
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
X-List-Received-Date: Mon, 20 Mar 2017 12:26:57 -0000
Content-Type: multipart/alternative; boundary=f4030435c234c2f83d054b28a4da

--f4030435c234c2f83d054b28a4da
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 12:18, Daniel Schultz <d.schultz@phytec.de> wrote:

> Since there are no checks if a EXT file system was successfully created,
> this should add to prevent possible system failures.
>

Doesn't mkfs returns an exit code if it wasn't successful?

Ross

--f4030435c234c2f83d054b28a4da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 March 2017 at 12:18, Daniel Schultz <span dir=3D"ltr">&lt;<a href=3D"=
mailto:d.schultz@phytec.de" target=3D"_blank">d.schultz@phytec.de</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1o2" class=3D"a3=
s aXjCH m15aeba88db0499fb">Since there are no checks if a EXT file system w=
as successfully created,<br>
this should add to prevent possible system failures.<br></div></blockquote>=
</div><br>Doesn&#39;t mkfs returns an exit code if it wasn&#39;t successful=
?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--f4030435c234c2f83d054b28a4da--
