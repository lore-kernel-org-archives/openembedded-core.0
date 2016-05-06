Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id C48ED731CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:27:22 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id f89so111106093ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c6M6omJwz3fP91Qa7w2bi8UUYtcTWIkzsFbu5ab47WY=;
	b=FJA3r+ZPNOEJY1NqE/sJ1QSMZ8YRwrQ2F5pXeN3TXso5fByjDiV2f2Ml+KmCaYZamm
	sDXwGe2HsCAoRbkfQaNKJPrPetIZW06pwb1on8Axar8XOAs9KmRk/5tL5WwA4SuGcL10
	1I+I2YgIOhere0fgY8vErS/IMiDE68TvPgCl+dFyyTfE0mgM0otm2y1xXHEewNEs82Vm
	jEe2+ORo3QJ0DfZItKS0cwfVHHbcYi/8BrlwACVaLo+DTW+bdA3ePvJIkjNkGiRxlynm
	HVtzA2OxAe4SNR2/oeRR3LwL5J6Cm/V5Uqu8VKdZaIFAUIdjEpu0Qi1UOGm3QHewK5Te
	L7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c6M6omJwz3fP91Qa7w2bi8UUYtcTWIkzsFbu5ab47WY=;
	b=crSpM4W35CHIPaQdkIgxHdSgEaQ8nczNy1leQeBNi2gDzGAedcbJLGGBxyAuD9sCRq
	4HruF70138Zb4Rf1ro2mDqhOti8Z8Mee6zwwzBh6WKyhcOE5xfxYPUg6AVBRD+btE8qS
	0+S80W0OG/e7q3sPxJrOh9KU6rLdyX4lUb+OWyY2AEyAldf2ry9cz1cozWYEh4tjtsED
	Wm45v+Qd85tdpfQSkLaHLWn+hmo+NJTzg0kMvdsxsnkuJPgdjmnFZ15+VRC7O1EjbeDu
	qq/dnZ1F+vNn9lQ07gtIWknJmAo57wbhwO06Cz/XagFlmdLg3LB/laUYB6FZw/IN1L+X
	+XEQ==
X-Gm-Message-State: AOPr4FVWDgNTkEJxmRB+eoDJk20OsB4Gqraw4Cdlh1bFfnXTrpaH6wQgRZlr7rR/YrmzzsvCHpK/1DwxYSh/SWaN
X-Received: by 10.107.135.211 with SMTP id r80mr24690529ioi.133.1462534043035; 
	Fri, 06 May 2016 04:27:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Fri, 6 May 2016 04:27:03 -0700 (PDT)
In-Reply-To: <CAJTo0LZ5KNk2eLC=fD7+PxzrcRrq_-UVG3etOeHOx3vL616RPg@mail.gmail.com>
References: <1461084427.31320.25.camel@linuxfoundation.org>
	<20160505154748.GA23370@jama>
	<9ac61a33-ea21-17d4-a7d5-c5c2e94fad86@windriver.com>
	<CAJTo0LZ5KNk2eLC=fD7+PxzrcRrq_-UVG3etOeHOx3vL616RPg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 May 2016 12:27:03 +0100
Message-ID: <CAJTo0LZoZgj=OmUuOq6KVfLebg4-QK3-ys+F2MSfcqsHqCnmeA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure rootfs dependencies cover DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 11:27:22 -0000
Content-Type: multipart/alternative; boundary=001a113ed20a1b89c405322abecc

--001a113ed20a1b89c405322abecc
Content-Type: text/plain; charset=UTF-8

On 6 May 2016 at 12:23, Burton, Ross <ross.burton@intel.com> wrote:

> Nope, nothing in oe-core sets that.  Can some at WR send a patch?
>

Never mind, just sent it using your example.

Ross

--001a113ed20a1b89c405322abecc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2016 at 12:23, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">No=
pe, nothing in oe-core sets that.=C2=A0 Can some at WR send a patch?</div><=
/blockquote><div><br></div><div>Never mind, just sent it using your example=
.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a113ed20a1b89c405322abecc--
