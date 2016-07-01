Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80048601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 02:43:26 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id g127so856272ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7aakfs9MU0CHv4PRvRX2ZtyURywE4t/Wrh8YTo/+4xQ=;
	b=ehUhnK32JQpX859xPbPyhMj0zGdO9jRBKRJ6cy6u97xcKxcyi4zT7VCY1qnF2F/TBQ
	EYNui8WIkI8r6Eokv1UE/SvQnwlRYxretZywD3uGCzhcoFYYynoYhQt0VWCpMvsuzNyf
	WEDbg1ldDDWm+Hkv6DZoaXo3qZNdzEY9RgGBFyi6KcbdKhH6Lfnchyb/AR8AGtprmAxX
	JqGAusgq93T8ddzgd0IpPl+m9k7pUkF2+/AgwPoRUl9DUpTrQ4ckPIBV6DFyxuy4HKUo
	IkdwvM8tIkZRzBsaLxmOhPTIdKBnKvyYUeK3/zEVunyc39VGiJgOmR6zrAzbYTV5ZYgt
	Lw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7aakfs9MU0CHv4PRvRX2ZtyURywE4t/Wrh8YTo/+4xQ=;
	b=A5eBatLmkGx8kEgxFCuXq4Cin2Dlr/z0wOUimXT3zH+lcZhQY6O8z9QK2roVqXcmHC
	X/DwxcaG0O1H2KPR+uSf10I1lmOM34BOEmPCija5o6miGpRpb+VL8DuPPc91aGyBPKNO
	xIZe5wx0CONF+MRyMLlrNZ8ySaeH5B/sH3GRMi+0BhFXwqRfVL8pFEEmTsYZo4leZiMF
	feAhvZu4Z0HasuLRb1ZLC0u4njo5cxOsC8Ehorgxs8VCq8KmglldsfOZxxnOsLXycJBH
	JSiS/BU/Xv7LGry6rJbsiDWBMjeqWHT5/A3z/furfOY3aTKVMHRS6N33ReU9orM7j0hP
	R5wQ==
X-Gm-Message-State: ALyK8tL6KZP3sHc1N4XgoE84I1gTL6RpIzOPLCub/Nz4ylgrz3LD5VpTdguVBYYIRz0bzpeziFcdsnasS3Tdxg==
X-Received: by 10.36.216.5 with SMTP id b5mr18501271itg.19.1467341006845; Thu,
	30 Jun 2016 19:43:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Thu, 30 Jun 2016 19:43:07 -0700 (PDT)
In-Reply-To: <1467332324-27040-1-git-send-email-kergoth@gmail.com>
References: <1467332324-27040-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 30 Jun 2016 19:43:07 -0700
X-Google-Sender-Auth: URdCUmBR_TfQc5osjavS_5R5eBU
Message-ID: <CABcZANmrSbfS_FFuqw523-22p9qJ+S-2sqoCpSe6iPx+q2f4ag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] buildstats-summary: round the floating point percentage
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
X-List-Received-Date: Fri, 01 Jul 2016 02:43:28 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cc147a3c9b053689f3bb

--94eb2c05cc147a3c9b053689f3bb
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 30, 2016 at 5:18 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This was rounded in python 2, but python 3 changed the default behavior of
> /.
> We could switch to the same behavior as previous by switching to // rather
> than /, but there's value in keeping at least one decimal point, to avoid
> the
> misleading case where it says 0% but the reuse is non-zero.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Hold off on this, should probably address the rounding via the formatting,
otherwise we'll only get good results when the number can be fully
represented by the float type.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05cc147a3c9b053689f3bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jun 30, 2016 at 5:18 PM, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":x4" class=3D"a=
3s aXjCH m155a3d2c8df6ffdc">From: Christopher Larson &lt;<a href=3D"mailto:=
chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
This was rounded in python 2, but python 3 changed the default behavior of =
/.<br>
We could switch to the same behavior as previous by switching to // rather<=
br>
than /, but there&#39;s value in keeping at least one decimal point, to avo=
id the<br>
misleading case where it says 0% but the reuse is non-zero.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote><div><br></div><div=
>Hold off on this, should probably address the rounding via the formatting,=
 otherwise we&#39;ll only get good results when the number can be fully rep=
resented by the float type.</div></div>-- <br><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br=
>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br=
>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div=
>
</div></div>

--94eb2c05cc147a3c9b053689f3bb--
