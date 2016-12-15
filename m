Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DE17B772D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:56:05 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id t184so2889164qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0I1NuXZP5jvcGQ/Tbulw1Y8ghkmDiOwPEk1xW2ujvZE=;
	b=V35tfOKBHxcOT0g1XAk7eeOZYblsDv9AHJDdR7Trds4smqo0SpuneR41zAVyO4g/fv
	IfBD+fungIfFmMJYzcWCs79wfq6OO3AwjEWcp/mCpyywJhCdYW9zYwTgKWUsRyTZyY+b
	OeWbSERUJ1xrZ5ajOwt96nvH7ObXrIajRUICRcntzHKw+h05k+uXiF8uGjCj51vFrw3k
	OPk/YX+h7Cj+o4e2oo8dMemi3RgQ+UmfDeWVFFL4qC7exJjK06HbUYfsSQgKEVJ/rhmO
	ioUgSv5Hvqd4X6ZAjR+Bugw8RUyiTF+pPLr04AAUofdmhVDvfOadW7Bz0xjGsMhCIdiW
	RLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0I1NuXZP5jvcGQ/Tbulw1Y8ghkmDiOwPEk1xW2ujvZE=;
	b=CBu0saaRRt+O4/GuKVlZp+1GK4itwdUmrL8Bu3pqvhenVXX0MYgzciTTD9hv5gII1J
	jw21I8O5kjPuC5ci5Kf5cRsxLhInr971tYtQSWY+8m3m0a/qxYMAj+tlPNQ2lYpWy8LV
	ZlSyNK/h1mK5h+rAsIq0m+O4muTc1v38z19a22CDPMD/USC8mCsnPQMMUc6mOBcov2k6
	3ZklZPhrt680CGNjBmTczSCqKYbtZFJ6Z7Z8Te33H+NYb9uhAqNnSRqUthyqFoAztxs0
	DGTIOQbJNJIYT5XLaFqSvvX9jA/cUA3ONeG0WfWuWKv2gcByiGlmT15QeZsRIeeN2c3j
	yo6w==
X-Gm-Message-State: AIkVDXKBAJrTjAH9jfbgXCk17/f6Q6ct4zgCUtsilv6zC8jyjRTTNYur5WVOGyQzT7PuPtqgyzq7qEnv33vigESz
X-Received: by 10.55.75.17 with SMTP id y17mr1356138qka.26.1481810166611; Thu,
	15 Dec 2016 05:56:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 15 Dec 2016 05:55:46 -0800 (PST)
In-Reply-To: <20161215135317.GA11254@openSUSE-i7.site>
References: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
	<CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
	<CAHZ0fbGUf4naEmiEvTPuEMT2LgRYKf+m70-rqon7ZReVrp9a3g@mail.gmail.com>
	<20161215135317.GA11254@openSUSE-i7.site>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Dec 2016 13:55:46 +0000
Message-ID: <CAJTo0LYb7j4XYBjekHr8xNP5UpmRJKkVCof9aubiRO=XoXC=-w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-intel] [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Thu, 15 Dec 2016 13:56:06 -0000
Content-Type: multipart/alternative; boundary=001a114a88c89b170e0543b2d04a

--001a114a88c89b170e0543b2d04a
Content-Type: text/plain; charset=UTF-8

On 15 December 2016 at 13:53, Trevor Woerner <twoerner@gmail.com> wrote:

>         | configure: error: Requested 'gstreamer-codecparsers-1.0 <=
> 1.8.99' but version of GStreamer codec parsers is 1.10.1
>         | WARNING: /z/layerindex-master/minnowmax/tmp-glibc/work/
> corei7-64-oe-linux/gstreamer-vaapi-1.0/1.8.2-r0/temp/run.do_configure.11053:1
> exit 1 from 'exit 1'
>         | ERROR: Function failed: do_configure (log file is located at
> /z/layerindex-master/minnowmax/tmp-glibc/work/
> corei7-64-oe-linux/gstreamer-vaapi-1.0/1.8.2-r0/temp/log.
> do_configure.11053)
>         ERROR: Task (/z/layerindex-master/layers/
> meta-intel/common/recipes-multimedia/gstreamer/
> gstreamer-vaapi-1.0_1.8.2.bb:do_configure) failed with exit code '1'
>

Yes, there's some outstanding patches for meta-intel.

When gst-vaapi moved to oe-core it also renamed to match the convention in
there.  I guess we should add a PROVIDES for the old name to ensure it
replaces the old version.  Can you test that this works for you?

Ross

--001a114a88c89b170e0543b2d04a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 December 2016 at 13:53, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7ei" class=3D"=
a3s aXjCH m15902c2cbedb13ea">=C2=A0 =C2=A0 =C2=A0 =C2=A0 | configure: error=
: Requested &#39;gstreamer-codecparsers-1.0 &lt;=3D 1.8.99&#39; but version=
 of GStreamer codec parsers is 1.10.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | WARNING: /z/layerindex-master/<wbr>minnowmax/=
tmp-glibc/work/<wbr>corei7-64-oe-linux/gstreamer-<wbr>vaapi-1.0/1.8.2-r0/te=
mp/run.<wbr>do_configure.11053:1 exit 1 from &#39;exit 1&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ERROR: Function failed: do_configure (log fil=
e is located at /z/layerindex-master/<wbr>minnowmax/tmp-glibc/work/<wbr>cor=
ei7-64-oe-linux/gstreamer-<wbr>vaapi-1.0/1.8.2-r0/temp/log.<wbr>do_configur=
e.11053)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR: Task (/z/layerindex-master/layers/<wbr>m=
eta-intel/common/recipes-<wbr>multimedia/gstreamer/<wbr>gstreamer-vaapi-1.0=
_1.8.2.bb:d<wbr>o_configure) failed with exit code &#39;1&#39;<br></div></b=
lockquote></div><div class=3D"gmail_extra"><br></div>Yes, there&#39;s some =
outstanding patches for meta-intel.</div><div class=3D"gmail_extra"><br>Whe=
n gst-vaapi moved to oe-core it also renamed to match the convention in the=
re.=C2=A0 I guess we should add a PROVIDES for the old name to ensure it re=
places the old version.=C2=A0 Can you test that this works for you?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114a88c89b170e0543b2d04a--
