Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 348CF783BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 16:03:32 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id x129so3176663iod.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l7GrB8UoTBlXu/vBN+M7dQQ9kUpnGCgvF3G7L8O6E1U=;
	b=gzqxs9lt5U198IqqpwTzHMh3pvFdajS4x3LQSApx3Uvw+5JRTdO1F8RIAl+KOrKkiL
	aFIKotbyvHUi8Fd47z3pqf1QKRebXIB51Mru1YpXmfLbO3G2LiiKkrDcMZa7mhRhy58M
	RlFms5bJKhptgfVTuX9RJFtTqoY80sKpaHLRKI2cenAIDd5iJXS9ts1nOh7t/jCn5Mg3
	nlc2/TgIU74+aMIGEfhkKymOI2+klnW3BDxdxYq7+Q9xAv1j4I5ven8rjol4Y/u8RDB3
	rQPtVPrATzCVMi7F4i/CmHR3Mbyx4vpBJACj2TG0Px5FghaKhJqjk7BMUXVsBb+mUDOT
	ZSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l7GrB8UoTBlXu/vBN+M7dQQ9kUpnGCgvF3G7L8O6E1U=;
	b=r0rode6tCRda5QJNnKapARPLiVklxDg+2nnwMfjJ0hCU1XtzFvuwh7mosOMjapq7jA
	Vx6HAXCLFUIrr+3AiSDcOP9RrbcCxLPcjvyTR7v1zPP0NEs375kEa/oF4eTuzEWDFUcl
	E4LWCDmhb00AExwGb/FPxgUJpkIwm47JMw4jioCPrKGznIMXBqLpVSYb2N+QCg1l60lk
	ouNcLSqWUR8FBBCGdMv24zsNNJX0OCFHtbuJqmAkbxH48ZJmwo9fHzwZXIDTgnIY2sma
	KGvI7arudfOQ2AUiBB881sKuawl5hbblgWBxTnnN6KC9TgdRquH1e3XerIcC2NlDLaDi
	zmlw==
X-Gm-Message-State: AJaThX6CwwwT4CzK3YyTOcBYRzH/BQhEnJeZ8a4PuBV7CvR+cXFPp6Wr
	klBi5oFJ+nWW2xhO1qUoTWJn4BzouzdBMjgBtthPJA==
X-Google-Smtp-Source: AGs4zMbOZQOUtDQij5Navplx+XQt/+X8QB1hq7hZpb9UkCxSgn4X4qX6itKQldiifzOx3jluf0Oxsc4UqfgFYl6e/m8=
X-Received: by 10.107.178.145 with SMTP id b139mr33982285iof.52.1512576214158; 
	Wed, 06 Dec 2017 08:03:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 6 Dec 2017 08:03:13 -0800 (PST)
In-Reply-To: <20171206100021.3c757776@lsandov1-mobl2.zpn.intel.com>
References: <20171206145928.5497-1-ross.burton@intel.com>
	<20171206150257.2785.75026@do.openembedded.org>
	<20171206100021.3c757776@lsandov1-mobl2.zpn.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Dec 2017 16:03:13 +0000
Message-ID: <CAJTo0LZJJccVooX7P=Vfkw20S962c6iEKMCKNSj5P2rsrHrODA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patchwork <patchwork@patchwork.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJ4c2x0OiB1c2UgSFRUUCBpbnN0ZWFkIG9mIEYuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Wed, 06 Dec 2017 16:03:33 -0000
Content-Type: multipart/alternative; boundary="001a114ca162f10f2a055fae1758"

--001a114ca162f10f2a055fae1758
Content-Type: text/plain; charset="UTF-8"

On 6 December 2017 at 16:00, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Wed, 06 Dec 2017 15:02:57 -0000
> Patchwork <patchwork@patchwork.openembedded.org> wrote:
>
> > == Series Details ==
> >
> > Series: "libxslt: use HTTP instead of F..." and 1 more
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/10099/
> > State : failure
> >
> > == Summary ==
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             SRC_URI changed but checksums are the same
> [test_src_uri_checksums_not_changed]
> >   Suggested fix    Include the SRC_URI's checksums changes into your
> patch
>
>
> I believe we need to improve this check. checksums do not necessary change
> if URL changes.
>

Not sure how to improve it.  Maybe making the wording vague, as that is a
common mistake and the URL changing but checksums not changing is  not
common.

Ross

--001a114ca162f10f2a055fae1758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 December 2017 at 16:00, Leonardo Sandoval <span dir=
=3D"ltr">&lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" =
target=3D"_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>=
 wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Wed, 06 Dec 2017 15:02:57 -0000<br>
Patchwork &lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patch=
work@patchwork.<wbr>openembedded.org</a>&gt; wrote:<br>
<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: &quot;libxslt: use HTTP instead of F...&quot; and 1 more<br>
&gt; Revision: 1<br>
&gt; URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series=
/10099/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openem=
bedded.org/series/10099/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This =
is<br>
&gt; an automated response. Several tests have been executed on the propose=
d<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; * Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI changed=
 but checksums are the same [test_src_uri_checksums_not_<wbr>changed]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Include the SRC_URI&#39;s check=
sums changes into your patch<br>
<br>
<br>
I believe we need to improve this check. checksums do not necessary change =
if URL changes.<br></blockquote><div><br></div><div>Not sure how to improve=
 it.=C2=A0 Maybe making the wording vague, as that is a common mistake and =
the URL changing but checksums not changing is =C2=A0not common.</div><div>=
<br></div><div>Ross=C2=A0</div></div></div></div>

--001a114ca162f10f2a055fae1758--
