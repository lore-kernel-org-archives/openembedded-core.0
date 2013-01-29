Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0EAC-0008TI-W4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:36:01 +0100
Received: by mail-wi0-f180.google.com with SMTP id hj13so592638wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 08:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=BRzD3P96V/1cencSdneYCgJOFHm+VKigEVH6l35f+xs=;
	b=G3hejUWaNKZEVzkeYq407K4WHwmOTzFOe2+Ck7nG97H5iLoOIVBhDglEMPrV7Bghq+
	+pEgPJs5T7QqD3P15EvAUdyZrnXJPjihcH0V1xNcLzADJB3hYRbNGF8TfAnh7kPHUkwD
	Ew+2/U9MtXa0iQJ6uLFmZoUPPIPLByzW1uHKArOltm05cm7nVtv0qdQ9rORrRhEW/zNR
	hs3JH2bhHz5/DId1pwVi83RWRCdl3RWFRJhQMkrJ2WBJfiJf+1Y2Ekq67qOuAVpDp5MP
	TTGKnnmnuC9Op851/W9HxXc0O5ptA7z6J/wS2WdU/Pne0m3HMhiHG0xEecprqMHEvXUh
	9Iuw==
MIME-Version: 1.0
X-Received: by 10.180.8.130 with SMTP id r2mr3353156wia.28.1359476421208; Tue,
	29 Jan 2013 08:20:21 -0800 (PST)
Received: by 10.194.179.39 with HTTP; Tue, 29 Jan 2013 08:20:21 -0800 (PST)
In-Reply-To: <CAJTo0LYSwOTCUJ4kF1LtEDuZyKf7LSs+=51WAWv6Q4rDPN9wCw@mail.gmail.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<20130129155615.GP16904@jama.palm1.palmone.com>
	<CAJTo0LYSwOTCUJ4kF1LtEDuZyKf7LSs+=51WAWv6Q4rDPN9wCw@mail.gmail.com>
Date: Tue, 29 Jan 2013 17:20:21 +0100
Message-ID: <CA+chaQdiGJz0+YkM3omFhCHM1NNzyvM_EZUBX2nHBW2=sDtvrw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Remove -systemd postfix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 16:36:01 -0000
Content-Type: multipart/alternative; boundary=f46d0444029a2aac6a04d46fc591

--f46d0444029a2aac6a04d46fc591
Content-Type: text/plain; charset=UTF-8

There were in meta-systemd for much longer.


On Tue, Jan 29, 2013 at 5:12 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 29 January 2013 15:56, Martin Jansa <martin.jansa@gmail.com> wrote:
> > No upgrade path for both.
>
> Do we really need to add an upgrade path for packages that have only
> exists in git master for a week?  I can understand the desire, but
> we're not talking about a release-release upgrade path but an upgrade
> that will only hit people who are using oe-core's systemd support
> right now.  I suspect that's a fairly small number outside of the
> developers.
>
> Ross
>

--f46d0444029a2aac6a04d46fc591
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There were in meta-systemd for much longer.</div><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Jan 29, 2013 a=
t 5:12 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton=
@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 January 2013 15:56, =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br>

&gt; No upgrade path for both.<br>
<br>
</div>Do we really need to add an upgrade path for packages that have only<=
br>
exists in git master for a week? =C2=A0I can understand the desire, but<br>
we&#39;re not talking about a release-release upgrade path but an upgrade<b=
r>
that will only hit people who are using oe-core&#39;s systemd support<br>
right now. =C2=A0I suspect that&#39;s a fairly small number outside of the<=
br>
developers.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--f46d0444029a2aac6a04d46fc591--
