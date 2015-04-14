Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D24F6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 14:41:51 +0000 (UTC)
Received: by qkx62 with SMTP id 62so22061382qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 07:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CdZCV5f3MeHAiPAff9O0v3npHW57NTqA3Rz70AqMWqU=;
	b=FotLxSqRsS75A3+LEiCxIiu3I4x+/MIxR0fY2RL5k5u7OPGUxw1WQyrRo7iYFkl2EJ
	Fv8bMGAe+qxMhkY/lwYipDY+TNgmNbaCfaUXTix6W1mqniN62+EiPvFdRUpTXW8RC7U8
	Sn8OA/48rhcG/Uid5FQUcGbB0Zq0ZnN/fVWs8FZBqOd3jslcBH5WbB7fv1ux7DNgEI05
	uEKjahzVFB87lqkjZ34+89HypSWgkLAeKXSEIuE2WRkSc8VUhqeFIeh0DPu3DxmxsXjL
	ahHCw5L2pjYsWK/yWa6Taut9AQdmxJeXT4utI/fxph9cX9g8kDvRVqELxo/OqwqrebTC
	hH0w==
X-Received: by 10.140.102.17 with SMTP id v17mr24737543qge.96.1429022490698;
	Tue, 14 Apr 2015 07:41:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Tue, 14 Apr 2015 07:41:10 -0700 (PDT)
In-Reply-To: <1428997376.23267.134.camel@intel.com>
References: <cover.1428939671.git.patrick.ohly@intel.com>
	<e03e02a4abdec92544b1f32e759ce378c80bf2c5.1428939671.git.patrick.ohly@intel.com>
	<CABcZAN=54ffzEd5u7926uqXde8ecamQuQv2h34S+DRdF4KPNdw@mail.gmail.com>
	<1428997376.23267.134.camel@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 14 Apr 2015 07:41:10 -0700
X-Google-Sender-Auth: GlRbrinkQOEhtrF5cqcaDMCNSJM
Message-ID: <CABcZAN=03fQtYVKZ6q7Ze9NZPLTjMztizj5YX1XffLgzR=sPHQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rootfsdebugfiles.bbclass: quick-and-dirty installation of additional files
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
X-List-Received-Date: Tue, 14 Apr 2015 14:41:51 -0000
Content-Type: multipart/alternative; boundary=001a11c17212ef2b860513b03989

--001a11c17212ef2b860513b03989
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 14, 2015 at 12:42 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Mon, 2015-04-13 at 09:07 -0700, Christopher Larson wrote:
> >
> > On Mon, Apr 13, 2015 at 8:44 AM, Patrick Ohly <patrick.ohly@intel.com>
> > wrote:
> >         The main motivation for this class was the observation that
> >         a) a core-image can hang under qemu when the kernel does not
> >            have enough entropy to generate the ssh host key
> >         b) ssh complains about changing ssh host key files when
> >            rebooting the same machine with different images
> >
> >         For debugging it is okay to reuse an ssh host key generated on
> >         the device
> >         before. There may be also similar use cases, so the class is
> >         generic enough to
> >         also copy more than one file or directory, with
> >         dropbear_rsa_host_key given as
> >         example.
> >
> >         The documentation and naming of the class makes it clear that
> >         it
> >         should not be used for production images.
> >
> >         Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> >
> > Freescale's merge-files recipe may be worth looking at as an
> > alternative to this.
>
> Thanks for mentioning it. Yes, that's also a way to do it. It seems a
> bit more complicated to set up (all files must be in a common "merge"
> directory) and does not seem to support sub-directories (-maxdepth 1),
> so it is a bit less flexible than the ROOTFS_DEBUG_FILES that I was
> proposing. On the other hand, the files get packaged properly (well, if
> one is careful about adapting the default MIT license as needed).
>
> For my use case, I still prefer the quick-and-dirty approach.


Indeed, both approaches have value, depending on one's needs, I think.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c17212ef2b860513b03989
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 14, 2015 at 12:42 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Mon, 2015-04-13 at 09:07 -0700, Christopher Larson wrote:<br>
&gt;<br>
&gt; On Mon, Apr 13, 2015 at 8:44 AM, Patrick Ohly &lt;<a href=3D"mailto:pa=
trick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The main motivation for this class wa=
s the observation that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a) a core-image can hang under qemu w=
hen the kernel does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have enough entropy to genera=
te the ssh host key<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b) ssh complains about changing ssh h=
ost key files when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rebooting the same machine wi=
th different images<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For debugging it is okay to reuse an =
ssh host key generated on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before. There may be also similar use=
 cases, so the class is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generic enough to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also copy more than one file or direc=
tory, with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dropbear_rsa_host_key given as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0example.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The documentation and naming of the c=
lass makes it clear that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0should not be used for production ima=
ges.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Patrick Ohly &lt;<a hr=
ef=3D"mailto:patrick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
&gt;<br>
&gt; Freescale&#39;s merge-files recipe may be worth looking at as an<br>
&gt; alternative to this.<br>
<br>
</span>Thanks for mentioning it. Yes, that&#39;s also a way to do it. It se=
ems a<br>
bit more complicated to set up (all files must be in a common &quot;merge&q=
uot;<br>
directory) and does not seem to support sub-directories (-maxdepth 1),<br>
so it is a bit less flexible than the ROOTFS_DEBUG_FILES that I was<br>
proposing. On the other hand, the files get packaged properly (well, if<br>
one is careful about adapting the default MIT license as needed).<br>
<br>
For my use case, I still prefer the quick-and-dirty approach.</blockquote><=
/div><br>Indeed, both approaches have value, depending on one&#39;s needs, =
I think.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>cla=
rson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>M=
aintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c17212ef2b860513b03989--
