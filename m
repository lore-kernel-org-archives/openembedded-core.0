Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFAC7F7CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:33:51 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id b64so4571397vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=NprfjcFn+IO1vngWGEpktAI3SpyZsucgVM5LQ/eHSa4=;
	b=SEBOvs6K2DOCY4sW3c83wYpPXXgYLwCupSqwRuSzoQmI0iRIM35aRuKBWoAy2JR0gc
	Lns2DbSyVI963x+Cl2zDKHfM/ed4xU9xGq6fyX2tZ8IkXyFGzXHTq2WwpNML+VNdX/nW
	6B08IEkNJzJqgT8wRylBqgYkCIXjSpfKKIo6Lju2WAopdIGQT/QQjrEoGPqedBgOxq1j
	WWcsMLZr988R0PKuZfLVTiapc2lfCbNHj+t/6jPJBxKa3y7WjwEPEniQPE4Mzb3DQquQ
	sdQ09Qqkp4ZWdWGLwxtoYkSmybFSVqboWkQkaheZq/IWE8G4tb1cU6xY7YEZFDu9djTX
	uvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=NprfjcFn+IO1vngWGEpktAI3SpyZsucgVM5LQ/eHSa4=;
	b=I1eJSTPWwALlEqHuDs8iQlCMQxhUsj0d5ltkrZq9HjexNxVy+O+jlxWDEokOHtDcKz
	pPvx2w3C9EUt/TscXHAKfx+us12gq912hoEpE8oZwSGJWmFFHm/0J0zIR9ksOjnY11R5
	JJlhLyUxp8seV7JmdJj1ZHHV8yHT2/MF0OiBVe8Z3oPhJYOq266eVCdGOHY0QuHyTnHs
	s9ObuecHMk9740auxc/SKrkAm+b94CbHsEu7sMOaBB5bhrUcAeV/bBk3S/UhAwx/cUGC
	iVoMJx2DO/lc9LKq9B/m4OVpdA6NpOzgEwRcujm3CZZ+8EwGbzRSup+jCaylh0oMJuO+
	Ckhw==
X-Gm-Message-State: APjAAAWkcDOnrj9X32LyrTBX+49bf5BiMxzDIo8fH1K4v1+DVVvTPdLb
	mpupdyWC0rV9EGiUXWZVmd5sFHAtW2Tglw5ux9w5MA==
X-Google-Smtp-Source: APXvYqySBuoEIhPGCBbn2TTHyu0SOVrdRzjHH+iVCh4AtD9uA5mBM7Ki6FVTEdAe96YUW0fyKyauibV3e1s3QUAc+Eg=
X-Received: by 2002:a05:6122:119c:: with SMTP id
	x28mr20316308vkn.9.1574170432580; 
	Tue, 19 Nov 2019 05:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20191119132556.107508-1-alex.kanavin@gmail.com>
	<20191119133226.2330.35859@do>
In-Reply-To: <20191119133226.2330.35859@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 14:33:41 +0100
Message-ID: <CANNYZj8nyyLjsExJ8uwFszcCJ0dhR5wtn9uuV3uzqmqyhQKZ9g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJzb2x2OiB1cGdyYWRlIDAuNy42IC0+IDAuNy4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Tue, 19 Nov 2019 13:33:52 -0000
Content-Type: multipart/alternative; boundary="000000000000732e7f0597b31d4b"

--000000000000732e7f0597b31d4b
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2019 at 14:32, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at dfb3b56641)
>

This is intentional as psmisc patch is based on a previous patch that is in
master-next.


> * Issue             Upstream-Status is in incorrect format
> [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in
> 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
>   Current          Upstream-Status: Inapppropriate [upstream wants a
> proper fix]
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
>

I will send a fixup patch for this.

Alex

--000000000000732e7f0597b31d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 19 Nov 2019 at 14:32, Patchwork &=
lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patchwork@patchw=
ork.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">* Issue=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not apply on top of target branch [t=
est_series_merge_on_head] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at dfb3b56641)<br></blockquo=
te><div><br></div><div>This is intentional as psmisc patch is based on a pr=
evious patch that is in master-next.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status is i=
n incorrect format [test_upstream_status_presence_format] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Fix Upstream-Status format in 0001-rpmfc.=
c-do-not-run-file-classification-in-parallel.patch<br>
=C2=A0 Current=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Inappprop=
riate [upstream wants a proper fix]<br>
=C2=A0 Standard format=C2=A0 Upstream-Status: &lt;Valid status&gt;<br>
=C2=A0 Valid status=C2=A0 =C2=A0 =C2=A0Pending, Accepted, Backport, Denied,=
 Inappropriate [reason], Submitted [where]<br></blockquote><div><br></div><=
div>I will send a fixup patch for this.</div><div><br></div><div>Alex<br></=
div></div></div>

--000000000000732e7f0597b31d4b--
