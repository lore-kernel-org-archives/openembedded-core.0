Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 12E026093E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:15:15 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 128so7761169oih.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=J4Sjnxi0o07IlPgoONofCabEDVGcWyuKQ3+l8gyvSXY=;
	b=RPifIqPRC79Kb881JuGwyrcK5A1sccmd0Ra1/0K708Vs9Of/juEI9rrGZz5lXMm/II
	jaeWgjwQb3pnFUXTMmwrPsYX4D0Do+pWquNi7H36BAY3WML09YL2KzUVtaWZk8kuKStx
	PS86iKtjEYSuaGPjROPXle9bqrgYbVz3dKtGKOmLW/MxnFjFlzjrvV9KbsC1JMCYu7WG
	GXy48lSe2KvAgpbEW9GjqzwhLqcjGy2f4I00n3dr87jAH3y2n0XaTTxPPceWRu8Qn+HU
	oOgCREXkgSvJYdYfZ6zNRUYsNMYf3wfD7DlshoHrci49v/bEnVaRv9hGkpaePCdsE6B2
	vt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=J4Sjnxi0o07IlPgoONofCabEDVGcWyuKQ3+l8gyvSXY=;
	b=OdFYy8wVjU13ZmL0Ivb2tWzznZpaoNj6LUqSUVs0gc/deJIABR0BdVxxWw5Z3N7/cG
	NCVBaxw+puW94dG/lQ6SsHgc9xh2poZz463UuHvWw2rFxTR86MeOuXP5An4P0TVcgsiR
	ZnnKb2eCc/TlNzsRJaVfdWcKE1kv7EjqGhKvbjaKbVKuHNm4mAe3CyZZuT4g2CxSr6Nf
	Uyiv/pIky+m5k8cDR78uism032JAvi7ASWyLedmOpXbkHo+2jXGAYaw+DSZlMogB4Ri7
	NCn5eFvRfSGbdZIu9DZ78A7CbF5Y/PjbKCH7QwmedAbJwo8CXmbmSCtkLp+LJXwFAjEy
	LWNA==
X-Gm-Message-State: ABUngvdouz4gSO++u62Xut2AENclTyax70JP5iNCjMC/7/ZqN8JxokvOMnBkDGALeP1uRQX+cIkFt8sqhKk+0Q==
X-Received: by 10.202.74.88 with SMTP id x85mr9399939oia.77.1478193316744;
	Thu, 03 Nov 2016 10:15:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 3 Nov 2016 10:14:56 -0700 (PDT)
In-Reply-To: <86a0da96-542d-685b-cdd3-588df6fe7024@linux.intel.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
	<86a0da96-542d-685b-cdd3-588df6fe7024@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 3 Nov 2016 10:14:56 -0700
X-Google-Sender-Auth: GrbF4SNwF0r2EpRIbFfv44fwsGk
Message-ID: <CABcZAN=6WvHcfyUj5hYmFG6nYoYTkYLrqO6s70v31bYNn85iXg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 17:15:17 -0000
Content-Type: multipart/alternative; boundary=001a113db3508dd37c054068b339

--001a113db3508dd37c054068b339
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2016 at 9:35 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/03/2016 06:29 PM, Christopher Larson wrote:
>
>> git already provides such a UI, afaik devtool just needs to use git-am
>> to apply the patches, ideally passing -3 to it, and let the user use git
>> am to resolve and continue applying patches.
>>
>
> I don't think git am has any UI that helps with rebasing the rejects, and
> -3 is often not useful here, as we don't have the commit history, if the
> source is coming from tarball.
>

Fairly sure that=E2=80=99s not actually correct. See below.


> What you need to do here is to use git am --reject, which would partially
> apply the patch, then find all the *.rej files and let the user manually
> edit them in, then complete the patch application with git am --continue.


With -3, it=E2=80=99ll merge it into the file with conflict markers, which =
is a lot
more pleasant to deal with than .rej files, even without the merge-base
being available.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113db3508dd37c054068b339
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 3, 2016 at 9:35 AM, Alexander Kanavin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexand=
er.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On 11/03/2016 06:29 PM, Christopher Larson wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
git already provides such a UI, afaik devtool just needs to use git-am<br>
to apply the patches, ideally passing -3 to it, and let the user use git<br=
>
am to resolve and continue applying patches.<br>
</blockquote>
<br></span>
I don&#39;t think git am has any UI that helps with rebasing the rejects, a=
nd -3 is often not useful here, as we don&#39;t have the commit history, if=
 the source is coming from tarball.<br></blockquote><div><br></div><div>Fai=
rly sure that=E2=80=99s not actually correct. See below.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
What you need to do here is to use git am --reject, which would partially a=
pply the patch, then find all the *.rej files and let the user manually edi=
t them in, then complete the patch application with git am --continue.</blo=
ckquote><div><br></div><div>With -3, it=E2=80=99ll merge it into the file w=
ith conflict markers, which is a lot more pleasant to deal with than .rej f=
iles, even without the merge-base being available.</div></div>-- <br><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher Lar=
son<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZ=
aurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</d=
iv>
</div></div>

--001a113db3508dd37c054068b339--
