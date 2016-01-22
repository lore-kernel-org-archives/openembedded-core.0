Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA9A6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:40:14 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z14so148184319igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tuHeLpVUxPGzKJDNX9125Dg9BbsB3FShgRuk70wQXA0=;
	b=0VNqrCRUFwtP/UaRTZkN+TrqBuL4WlfRQPqwNdi0+kumXzmfje1z4sT6VKq+HnuhGP
	pB7cowWXxRvC44o0u5yOBCrOvDLUEtgyDeuy14ZRKIOWoxtGh59St7S/43MY9drjf5fu
	pLM58+xYT2JzNRxEzClvsqeDZRdccrVmuNPGy/zzr5suOGUwXahCowcrX9R++Il21GnN
	uOtOLKHtwVg2wSALjqa+amdSo0wMn7asAqFjtcxOMnyajP03LfEoAIl1KPeAjSTiGCWr
	lwxQG5CyVCYQkoGNe+s6ibHCOGbP55s04/uaO0gSfDR028jBjTjDfzS1xj0sW7nBvjO9
	DjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tuHeLpVUxPGzKJDNX9125Dg9BbsB3FShgRuk70wQXA0=;
	b=jThxy3UhfIkhnaPhNalXV+yki0Y1vkwVxVUnf1M5oU891nV5a+Wsfbf2S1SSEWJegZ
	FlLZ5IDjmJiv/8i+/oljFepLlwKdkOPsk/qh2bLlPOQU4RLzC6KVLVdY6E6n03lJHHvp
	48l/tSsVfaq6MMUbOugTsTio+Iy87+gGl+WflUD1mrOzM6PXVd6HEH2TWsBFWNtZzZj4
	KowL7738fD4OTHX1RfZDah0HD33Qzm2wFRCzGP9U8mbDfdt/QHHP+ZuFhvPEOCjvllj6
	wBPraqq6+Q8TxJ+1Z6Th+J0MCoyE68pkWEGOoUQX1FbAdH5PKlyES1O3FMbQWU54/WTh
	zDhg==
X-Gm-Message-State: AG10YOQxp8hQ43x9EJuJja8wRSdB4BvZ/MTwPxoHesT8+vT4RElpyrKRLzcbECeSHRCwKLN0HcbVKqjIUtUmrqVo
X-Received: by 10.50.111.111 with SMTP id ih15mr3433119igb.78.1453466415623;
	Fri, 22 Jan 2016 04:40:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:39:56 -0800 (PST)
In-Reply-To: <4db181ab873afe453a8203c7f10a9e08a5e4f41c.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<4db181ab873afe453a8203c7f10a9e08a5e4f41c.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:39:56 +0000
Message-ID: <CAJTo0La-aNU6nMmrykB6VcTV_zOLVsj_+0T35QtZ1Zjs6bMCxw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 54/73] btrfs-tools: Disable backtrace on musl
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
X-List-Received-Date: Fri, 22 Jan 2016 12:40:15 -0000
Content-Type: multipart/alternative; boundary=089e0149be34658d920529eb8535

--089e0149be34658d920529eb8535
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:

> musl does not support backtrace APIs
> include limit.h for PATH_MAX definition
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Since the rebase to btrfs-tools 4.4 this fails to patch:

NOTE: Applying patch '0001-btrfs-corrupt-blocks-Include-limits.h.patch'
(../meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch)
ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-btrfs-corrupt-blocks-Include-limits.h.patch
patching file btrfs-corrupt-block.c
Hunk #1 FAILED at 21.
1 out of 1 hunk FAILED -- rejects in file btrfs-corrupt-block.c
Patch 0001-btrfs-corrupt-blocks-Include-limits.h.patch can be
reverse-applied

Presumably 4.4 accepted these patches and this can be dropped?

Ross

--089e0149be34658d920529eb8535
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":v04" class=3D"" style=3D"overflow:hi=
dden">musl does not support backtrace APIs<br>
include limit.h for PATH_MAX definition<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;</div></blockquote><div>=C2=A0</div></div></div>Since the =
rebase to btrfs-tools 4.4 this fails to patch:<br><br>NOTE: Applying patch =
&#39;0001-btrfs-corrupt-blocks-Include-limits.h.patch&#39; (../meta/recipes=
-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.=
h.patch)<br>ERROR: Command Error: exit status: 1 =C2=A0Output:<br>Applying =
patch 0001-btrfs-corrupt-blocks-Include-limits.h.patch<br><div>patching fil=
e btrfs-corrupt-block.c<br>Hunk #1 FAILED at 21.<br>1 out of 1 hunk FAILED =
-- rejects in file btrfs-corrupt-block.c<br>Patch 0001-btrfs-corrupt-blocks=
-Include-limits.h.patch can be reverse-applied</div><div><br></div><div>Pre=
sumably 4.4 accepted these patches and this can be dropped?</div><div><br><=
/div><div>Ross</div></div>

--089e0149be34658d920529eb8535--
