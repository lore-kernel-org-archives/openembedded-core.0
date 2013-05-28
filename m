Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id EB8FF6A57F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 14:14:27 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so10160459oag.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 07:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=NCbbGs9U9hegk5aUUW6CUwzHmsPg6SyE/T2A0dT11iY=;
	b=B/WGmixj6Ijg66+EK9FulMW6OZdizd+zfvRCImZRR71I1QMIliUQQn6TVRJ9iK+P9e
	hfmeLuxgr0O7XERD3oiiVCapCZfTEL0H1UPS5iKHnokUzM8jxbFjxHOz1zOfIgGiXgav
	m9rxz+CrhS6jOangigROiEb0uBXzLIhhx8Iz1qIMK5i4fXAbF7opsHyKDjEv3oBldAFn
	7lqAm58rz0c2Sbw7/eglsTnCJESZGhrOQeD6/iGtpZ+BQQC0iKL8Rm9CAPgnyUd+1kNh
	jXMHHWS0wz+ng16xtEtZetmwRKeYwjEX6uJHrscINKUZpLnJU4361S3aeY7to25wKnuu
	zkwg==
X-Received: by 10.60.59.37 with SMTP id w5mr3272185oeq.7.1369750468646; Tue,
	28 May 2013 07:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.225.230 with HTTP; Tue, 28 May 2013 07:14:08 -0700 (PDT)
In-Reply-To: <CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
	<1369227075.6695.89.camel@phil-desktop.brightsign>
	<CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 28 May 2013 17:14:08 +0300
Message-ID: <CAMZjud39jnVQwMShEzn33EAs_VyxM-BESBLhyyp_vZj+T8M+4A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmm6sJAsasTrpytPfwXfRJ8RVd7w2CKXjSZ9DBWup5BgVYYj4MNd5qVQvgRx7P2itjvnSMV
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Tue, 28 May 2013 14:14:28 -0000
Content-Type: multipart/alternative; boundary=089e0149d1861d6f0104ddc7e212

--089e0149d1861d6f0104ddc7e212
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 22, 2013 at 4:41 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 22 May 2013 13:51, Phil Blundell <pb@pbcl.net> wrote:
> > I had thought we had virtual-gconv-ENCODING providers but apparently
> > that's not the case.  So I think the answer at the moment is probably
> > no.  I guess we should add something like that.
>
> Agreed.  Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=4530.
>

So, if I understand correctly, this bug depends on the fix for #4530
(because the patch that I've sent isn't generic enough) ?

Thanks,
Bogdan


>
> Ross
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--089e0149d1861d6f0104ddc7e212
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, May 22, 2013 at 4:41 PM, Burton, Ross <span dir=3D=
"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.b=
urton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 22 May 2013 13:51, Phil Blundell &lt;=
<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br>


&gt; I had thought we had virtual-gconv-ENCODING providers but apparently<b=
r>
&gt; that&#39;s not the case. =A0So I think the answer at the moment is pro=
bably<br>
&gt; no. =A0I guess we should add something like that.<br>
<br>
</div>Agreed. =A0Filed <a href=3D"https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D4530" target=3D"_blank">https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D4530</a>.<br></blockquote><div><br></div><div>So, if I understa=
nd correctly, this bug depends on the fix for #4530 (because the patch that=
 I&#39;ve sent isn&#39;t generic enough) ?</div>

<div><br></div><div>Thanks,</div><div>Bogdan</div><div>=A0=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex">


<div class=3D""><div class=3D"h5"><br>
Ross<br>
---------------------------------------------------------------------<br>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
</div></div></blockquote></div><br></div></div>

--089e0149d1861d6f0104ddc7e212--
