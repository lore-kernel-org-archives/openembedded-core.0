Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C1CFE65CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 22:54:54 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so3439099qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 15:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2XEldJEz+sIqYL1PzW5VdDKzOwRBeKJDMDWWu4b86Tg=;
	b=hZBR9/DuXilgFxF6B6skkzklspxzLtTQhGLE+V1b6SMGkZ1sON6ArKQQxX+5Auc7LE
	0tquIcdqgU53hMhskAMRdbSj7p+PnuEJubrujn7+9DxIbnDcH1bYfiiHocaDzAyC3vLz
	Sk/DNCTWsfQR6bvGfENnH0A6P0lWO19Uyrji+/hIUkl+rIVf4413h27D5uI85l8lI69T
	93lbYqLOKOAG4VZNeGmcHPTs8iY7e50xV3hGESkiVTIojqnrFnplFiKqXvYW6j7Gr3WZ
	4y0fz+zCFRGPeEMvWJ5MpskxBYnO1hEfUPbJGDbcCmBK/ZmYOdqe7CXRAZTF9sEqQAqo
	2lUw==
X-Gm-Message-State: ALoCoQlHbgiO3/xkLwvnLetAZmXJ4AvbcCCeeVi6aVIoXSzi7AzLeqj9IXWq4w8581QvA9XHagf6
X-Received: by 10.224.160.83 with SMTP id m19mr1757393qax.17.1414018495402;
	Wed, 22 Oct 2014 15:54:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 15:54:35 -0700 (PDT)
In-Reply-To: <CANyK_8cVJEBpBWG2Nes705+1mdmT3W86izEnqYreiaCTD5yBdA@mail.gmail.com>
References: <543ef52e.0879c20a.1785.4076SMTPIN_ADDED_BROKEN@mx.google.com>
	<CANyK_8cVJEBpBWG2Nes705+1mdmT3W86izEnqYreiaCTD5yBdA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 23:54:35 +0100
Message-ID: <CAJTo0LaPRdCw5EatHYZ0TKd1EQvy17XsfPZorC+qVocyquyUeA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 22 Oct 2014 22:54:56 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa20fad105060ad6bc

--047d7bacb2aa20fad105060ad6bc
Content-Type: text/plain; charset=UTF-8

On 21 October 2014 16:40, Paul Barker <paul@paulbarker.me.uk> wrote:

> Sorry Peter, it looks like this patch has been corrupted as well as
> the one sent to the opkg-devel list. In this case I think it's mostly
> lines like the above which have been incorrectly wrapped.
>
> Could you resend this using 'git send-email' if possible?
>

Alternatively (and preferably for large numbers of patches), push your
changes to a git repo somewhere.

Ross

--047d7bacb2aa20fad105060ad6bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 October 2014 16:40, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1lb" class=3D"a3=
s" style=3D"overflow:hidden">Sorry Peter, it looks like this patch has been=
 corrupted as well as<br>
the one sent to the opkg-devel list. In this case I think it&#39;s mostly<b=
r>
lines like the above which have been incorrectly wrapped.<br>
<br>
Could you resend this using &#39;git send-email&#39; if possible?</div></bl=
ockquote><div><br></div><div>Alternatively (and preferably for large number=
s of patches), push your changes to a git repo somewhere.</div><div><br></d=
iv><div>Ross</div></div></div></div>

--047d7bacb2aa20fad105060ad6bc--
