Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id BE0C165D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:21:57 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id d45so292829802qta.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r67q9bTsDgXj+pOjCuxFBxnIRVzr2gYIIQilNrLb1L0=;
	b=ijtMLBN0oc2U1u80xYhfHdRs1zs326AkxEcbMLksu/hig2tNm0+MnslC3G0nlRV32N
	4Lz3vxhthhQJp+PUYMzHyxWsguwjuVjBBKnwJ2IgnHQR0vzodpZF7/i785SWHpHaxprz
	iN8lCygCJrHx4TfVK5tPtaqkGOf9gs9VLDIF+F+XBxv0gq50HJkOShK6qKIB8Md6J1lW
	dQIKKvjqAN+pPPnEf58oRAs7OTXq5yNAYZXSC2xQdK9JB/9ObPXsgkko62SxJFS8o416
	kM2bX7zlEpfQWOyDWykWp6fv8Robnu7+jSF7iWgcsPoebckiRsOWliRdZbVh1cndFxpK
	y5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r67q9bTsDgXj+pOjCuxFBxnIRVzr2gYIIQilNrLb1L0=;
	b=l48xAs7Jv6S2io6YpSxp9jYJO+GfV+FjCOk5kP8/eGHSHTtqfEYRhsLT1eMJ0xvTAj
	koCEM3qiKQbE90fZkJvE+qx6JlnPePhcCVl3BrbmFjWWDL69E0GwzJB3QD9D8wvpUK4E
	eVoP+J7OvjPBKXMh3FZvob8Jx6CRaNlSyAW+ZNgZdT7K+24XUvC2q8gICD54JADLTurH
	spCLkoclhNByYwFIMoJ8aADdBWvOzRdTMMViC2PDQ+r1jPtImahU/TyninVDJ3K+NKIf
	VPqjrEAjLlrkamlPPuCzMKUcC+FWZlpmVwlXqG7EEC+SznDommntQNDhAdngjfyCOr0v
	OEIw==
X-Gm-Message-State: AIkVDXK/3SQIMj0m1iA9i7ntvVgjwQkFxsn8jev6/0QYvzO/SAxYwfcd2qYMohF6ggGk9au+UMUB8FDOvhguT7l7
X-Received: by 10.200.58.4 with SMTP id w4mr57611341qte.68.1483611717519; Thu,
	05 Jan 2017 02:21:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 5 Jan 2017 02:21:37 -0800 (PST)
In-Reply-To: <898ed8805458cc57a90ec929c7405ac1fbc06080.1483500113.git.Qi.Chen@windriver.com>
References: <cover.1483500113.git.Qi.Chen@windriver.com>
	<898ed8805458cc57a90ec929c7405ac1fbc06080.1483500113.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Jan 2017 10:21:37 +0000
Message-ID: <CAJTo0LZtLv5YeANvJYGV1ut4a9q-n5ZWtbGb3znYzvjtVGxwvQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: upgrade to 1.26.1
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
X-List-Received-Date: Thu, 05 Jan 2017 10:21:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c1252aa686843054556453f

--94eb2c1252aa686843054556453f
Content-Type: text/plain; charset=UTF-8

On 4 January 2017 at 03:22, Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade busybox to 1.26.1. Also upgrade the git version to the
> corresponding
> commit.
>

Did you examine the changes that this introduces?

The packages grow a fairly large amount, and a number of new symlinks are
introduced.  Interestingly /bin/sh is now provided by both busybox.nosuid
and busybox.suid.

Ross

--94eb2c1252aa686843054556453f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2017 at 03:22, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-5806657399527285=
488:38m" class=3D"m_-5806657399527285488a3s m_-5806657399527285488aXjCH m_-=
5806657399527285488m1596780f2e5e8286">Upgrade <span class=3D"m_-58066573995=
27285488il">busybox</span> to 1.26.1. Also upgrade the git version to the c=
orresponding<br>
commit.<br></div></blockquote></div><br>Did you examine the changes that th=
is introduces?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">The packages grow a fairly large amount, and a number of new symli=
nks are introduced.=C2=A0 Interestingly /bin/sh is now provided by both bus=
ybox.nosuid and busybox.suid.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--94eb2c1252aa686843054556453f--
