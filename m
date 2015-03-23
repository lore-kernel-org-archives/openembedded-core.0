Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F81D6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 16:49:10 +0000 (UTC)
Received: by qgez102 with SMTP id z102so64744814qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 09:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d1u54Btps2d9WfhNTAditjCQHjjuj67tHX8bIxraa20=;
	b=TpYGA/5yxm8b6jskUo1sBRMwHklylaXglDX/YUCHGWJthuQJq3Pmy0AZnBoMX0OsLP
	tEU5DAfEzDbBQrwy2Biej59k2mwXn7SLk9pVrQqXJE96i4VtQWjjQuKlbILEOwEDSeYr
	dLYwY5mjex5etSnS8iuZGwgwQVyTOiu/YgEStySyU7mrc6OUXENEJjW34QHJV/co9IRE
	+NMObVHIRgi+fzz6A0e2IRbhi4pbAdT93EPI8Wcz/Z7R54Z1ARPwZ3ZqY6Jwf1YD4mmS
	hnIl7KB9X05z5H1PK8Zbm2N9snceYbXEph5YHCNPdyP04euQcmApq+1x77LVuiThyDEb
	ILpg==
X-Gm-Message-State: ALoCoQnmzW6lKvOcTPTAuiz68mrwxgsc/UiuztYhUpGDs8ssuCP04XE2vMKJZUIzrdiYoJUUTPxy
X-Received: by 10.55.52.83 with SMTP id b80mr332609qka.36.1427129324463; Mon,
	23 Mar 2015 09:48:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 09:48:24 -0700 (PDT)
In-Reply-To: <551043A1.4040601@opendreambox.org>
References: <1427125293-27123-1-git-send-email-obi@opendreambox.org>
	<CAJTo0LaG2kM=Q0ewEq+S7W3XMjRV=cvEc41jrsOSqHfkpee9uw@mail.gmail.com>
	<551043A1.4040601@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 18:48:24 +0200
Message-ID: <CAJTo0LYcFx9GNtcOuYAhWP_TDX8pA3MbPfE4eWXWsissU05F3g@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libav: fix floating dependency on libasound
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
X-List-Received-Date: Mon, 23 Mar 2015 16:49:11 -0000
Content-Type: multipart/alternative; boundary=001a114907746efe7d0511f770c2

--001a114907746efe7d0511f770c2
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 18:47, Andreas Oberritter <obi@opendreambox.org> wrote:

> As far as I can tell there's no configure switch to disable alsa. I
> didn't care enough to patch libav's configure script, especially because
> it's not based on autotools. I'd say apply this simple patch first, then
> wait until someone wants to make the more complicated fix after the
> release.
>

Agreed :)

Ross

--001a114907746efe7d0511f770c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 18:47, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1jk" class=
=3D"a3s" style=3D"overflow:hidden">As far as I can tell there&#39;s no conf=
igure switch to disable alsa. I<br>
didn&#39;t care enough to patch libav&#39;s configure script, especially be=
cause<br>
it&#39;s not based on autotools. I&#39;d say apply this simple patch first,=
 then<br>
wait until someone wants to make the more complicated fix after the release=
.<br></div></blockquote></div><br>Agreed :)</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114907746efe7d0511f770c2--
