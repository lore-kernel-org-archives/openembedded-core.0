Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B838C77980
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:02:54 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p64so108971885qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j21ROfTTo0yYJd+o4vmBY405c+n/paBA+B+jOOcjq9o=;
	b=o5hsVtObCmIMGvNACW4XIocOHewKUNC6hTN3b62P8wmYw9Ty80xuzq97jWdQ1Oy0FC
	q/SAY2LLLdcvKMJkJsfSsGGRGU0XXMccqX80jiB20YfQDFdR9vNPALUuxO/d6lW/rh/8
	OUfwo0i+tnOe+5mS+yV82Xzmk39K8pGxYhrapLNP4Kp2XJ/13nD7FVWnplUD5/4UpaHb
	ytbHlwdP2Ibkg72wqaVHxVbl7VKzWRfbd1jkuNJ8meCQtoE6zqyAGXNI0m1m/Lg4/xmK
	L+HFLb745509NKclIkc2uILkUatefgjRkX9009xPgTYoajHHUhbF5ZcXijoIv7biuIfG
	1A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j21ROfTTo0yYJd+o4vmBY405c+n/paBA+B+jOOcjq9o=;
	b=IQT+c9cZc8p2TETdyZpJLTFVfbvpsXo90qGg7Vr0aI+Bx64RMmmsLlHbnt0RfE1kHh
	D9AlH/4soPELXTt71QMM9kJDpW6j9dzgochm8juREnxebQkBUTY2PhWNKCrFVOwd6lfH
	MYxy6p1MTsOmu92muFzalrlJf7ohPyGUjmh1zFP6EHUfJHXtqm0SL4jnc1l7l9bj/i0C
	iSJj2tizR1E8ch1E2moEd39cn/TjxQ7vO5cizMCQWMmPJyoboJ0ug2vDKO6S/OClmjnn
	lhGfUspZz3oKI+ApKDdzue9i+U+JW+NncJ13oKHnvshuMrKIlFDZPo7awA3+HjSnuiqb
	o8xg==
X-Gm-Message-State: AFeK/H03aZMnG9JTxeBFvXW2cYJrUtGnaXQrF1vU7CykUSO0XqM2n1o8yk34E/bQCBlUrmtzoZ3vspLBTIRX5Vu1
X-Received: by 10.55.3.151 with SMTP id 145mr23857633qkd.244.1490014975693;
	Mon, 20 Mar 2017 06:02:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 06:02:35 -0700 (PDT)
In-Reply-To: <67fb66ea-1f41-afa0-cc42-fd0b83681829@phytec.de>
References: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
	<1490012333-43021-3-git-send-email-d.schultz@phytec.de>
	<CAJTo0LbxzD21M8+A=9FuHQNjOH9A65dLh48Exe1sBRNwGrVmqg@mail.gmail.com>
	<67fb66ea-1f41-afa0-cc42-fd0b83681829@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 13:02:35 +0000
Message-ID: <CAJTo0LbUpaLwfiZb4KLCHoK7B8LC7eSzt1i=0MAzBL6d8Vhuug@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Mar 2017 13:02:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a05676e1054b2925e2

--94eb2c0b93a05676e1054b2925e2
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 13:01, Daniel Schultz <d.schultz@phytec.de> wrote:

> Doesn't mkfs returns an exit code if it wasn't successful?
>>
>> Yes, but it seems like mkfs can't handle everything.
>
> "The htree (hash tree) indexes directory entries by hash to speed up
> random directory accesses.  e2fsck can regenerate the indices, but the
> rest of e2fsprogs cannot create or maintain them."
> [http://www.spinics.net/lists/linux-ext4/msg55702.html]
>
> Currently, our boards have to reboot, because fsck exits with an error
> code of 1 at the first boot.
>

Fair enough, thanks.

Ross

--94eb2c0b93a05676e1054b2925e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 March 2017 at 13:01, Daniel Schultz <span dir=3D"ltr">&lt;<a href=3D"=
mailto:d.schultz@phytec.de" target=3D"_blank">d.schultz@phytec.de</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">Doesn&#39;t mkfs returns an exit code if it wasn&#39;t =
successful?<br>
<br>
</span></blockquote>
Yes, but it seems like mkfs can&#39;t handle everything.<br>
<br>
&quot;The htree (hash tree) indexes directory entries by hash to speed up<b=
r>
random directory accesses.=C2=A0 e2fsck can regenerate the indices, but the=
<br>
rest of e2fsprogs cannot create or maintain them.&quot;<br>
[<a href=3D"http://www.spinics.net/lists/linux-ext4/msg55702.html" rel=3D"n=
oreferrer" target=3D"_blank">http://www.spinics.net/lists/<wbr>linux-ext4/m=
sg55702.html</a>]<br>
<br>
Currently, our boards have to reboot, because fsck exits with an error code=
 of 1 at the first boot.<br></blockquote></div><br>Fair enough, thanks.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--94eb2c0b93a05676e1054b2925e2--
