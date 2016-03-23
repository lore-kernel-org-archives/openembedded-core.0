Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C8B4460132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:35:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 124so42085970iov.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QG7lEeqiDhjbBK4P9CtJbozij9YMANatnds2hvmLXFM=;
	b=gq9WP9NCtQ37Acmxvh+0KfQsRILosYNYJhCvlE3j87N5MC/9YJ12nraMqNqyebsYzm
	xZymBDwiZcZ0T5V7uYL0Z8nfa1tTwgKWXCsrI42kwDp4TCSy40bcuDlcTIt44bMnB4CK
	fjyD7lz9cb3aSVR927YcEJEBUJ9x1iMTVx2aVvvsVUyF7oX57GtHYObC3pzH4XfsE0VU
	PtUJxoCWHeR44TOI377QXJWhbZO/y3LLub7zzOn9MiqyiunNZcOyNkiRxdOrWAC0qxP9
	KLAjDBuGWYjrecRDIU06b2RsXpluXytJ462nBCRzzXLtxegGfAqn156mrzMYcOXIhITZ
	Ei9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QG7lEeqiDhjbBK4P9CtJbozij9YMANatnds2hvmLXFM=;
	b=ZsZnW5OngZxnLL4PbTltGyShTgEOjvwxyl+UFoOPv3GR9yZSl4byJS+5z2Lgbj4x7M
	Xcbhpl7+lZ225DuWT2YyW7vV93y0Xz5Kb5OJUo5DqxNh+7HcCVtXc9uAC1GXj3gyXddQ
	DJxLPcoe0BEDm04l9Isl5iCGS1iq/08DOiU8OzmHzLUYqVhqmE8uIPxmiRIJ8cNItjf9
	idX3iNqhlr377QWPdn7JYVWoISQlRRzd7Wv3WNSSSvvzLmDvGTopgoVQiYQLD4ZXCGAl
	ewfPgoIKXxU5hy9iYyDtGXfczpMWMi/Ob7VNYunY5ndDCQTzbPuoHlnwiphcvLFXUHtS
	p7jw==
X-Gm-Message-State: AD7BkJKYwccaOyG/wLBj4mP2Ept1eWAakAfSwm5px77G4wf75TjgxptZccaM/8RfckjOM7BFdWHSC46sBnhYj+VV
X-Received: by 10.50.150.41 with SMTP id uf9mr3853663igb.64.1458743743244;
	Wed, 23 Mar 2016 07:35:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 07:35:23 -0700 (PDT)
In-Reply-To: <1458742435.3073.7.camel@linuxfoundation.org>
References: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
	<56F29A68.5030905@linux.intel.com>
	<1458742435.3073.7.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 14:35:23 +0000
Message-ID: <CAJTo0LYz6ufXJZyc0TFviL=oih7RBuOym1VwiQrmn3Cz4RJVnQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python 3 as oe-core default?
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
X-List-Received-Date: Wed, 23 Mar 2016 14:35:49 -0000
Content-Type: multipart/alternative; boundary=001a11345c0ca2db9a052eb83e61

--001a11345c0ca2db9a052eb83e61
Content-Type: text/plain; charset=UTF-8

On 23 March 2016 at 14:13, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> In 2.2, switching the bulk of things over to python 3 is one of the
> things I'd like to see happen.
>

Including bitbake itself?

(obviously orthogonal, but still a good question)

Ross

--001a11345c0ca2db9a052eb83e61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2016 at 14:13, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":ext" class=3D"a3s" style=3D"overflow:hidden">In 2.2, switchin=
g the bulk of things over to python 3 is one of the<br>
things I&#39;d like to see happen.<br></div></blockquote></div><br>Includin=
g bitbake itself?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">(obviously orthogonal, but still a good question)</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11345c0ca2db9a052eb83e61--
