Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 171A27826A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:50:43 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v127so13402939itd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uBiIOCPJidz8OYmcr3yrnsoaSLtkAp+ShSsrfRic5AM=;
	b=t78vbrN080QETCHBc88rXD7swSvBIGlwyXlS9QtSh1qdETmbgvkyhaoVQv8suO2ijq
	jC2B1eEgtMbCcROKkEJ+yldq+0LVo0PxtqApFeD1+PpFph+ygFu7RMq7EHwThcQeGY4t
	JNvR1wQSX2R4kqKgNKFpj80rx61wQUjKaFsJDtlvQ7vrzmoYoauL0POwWcuVRpTC2Tl+
	bi/B7+Mo/HrSHgYkQTEFT77+fCUw13O3z/bGaHetoB28zZ2tK6qXdty41/IspB63l1IU
	V7VREYAv5l/cdVRaHlpTc1vwa277apJTDJJImO3PrGcXfin82YD3VpnMvGiOtPGicRJx
	ns0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uBiIOCPJidz8OYmcr3yrnsoaSLtkAp+ShSsrfRic5AM=;
	b=cv4ETmZRbfypGYmhSLrnkrhBXBk6Y7Kz+G9rvlShClcEoI6xm3Gbt6hseqeZkuW7NO
	a2lUfdRlxxziAXwYQPYs7OWzO2Uj4YFX7mgfD+SBabfNBqUz5A8h8IZuoSqEPqsqzyx8
	truADXWGqxVpQJ+7eoMn2vxnGJi9e9cFNsKQndWoJdbORZDxycbtUs2qbGN8U6jSQwwN
	awX0dV5oWDXsVAmqTTXqy9QuiL115x8/0jWvaFJ0sCHNLgulpYAo8AokXkonvpBsFere
	VmQDPgkdlEYfQipQFoGUNh+E65n9RepphxuIHmu7NqN3r+YJe73PHOqSqqB0w8JjzHNA
	VyQw==
X-Gm-Message-State: AIVw112MnO7ZCe3hJK6LcMggTZDoiK1WlgI2/swHt2PosYNb5ImPGZch
	lwjYkR/nIDs/cgsagGsisY47bWXQdFTH
X-Received: by 10.36.26.13 with SMTP id 13mr2462986iti.87.1500544245289; Thu,
	20 Jul 2017 02:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 02:50:24 -0700 (PDT)
In-Reply-To: <1499916836-188258-4-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1499916836-188258-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1499916836-188258-4-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 10:50:24 +0100
Message-ID: <CAJTo0LbENeKn+TGavONc1mcOU3LKZBuU=DHjY+8UPP3BW98Orw@mail.gmail.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] recipetool: create: being able to set branch when revision is provided
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
X-List-Received-Date: Thu, 20 Jul 2017 09:50:44 -0000
Content-Type: multipart/alternative; boundary="001a11441b5cb5ed4d0554bcaec8"

--001a11441b5cb5ed4d0554bcaec8
Content-Type: text/plain; charset="UTF-8"

On 13 July 2017 at 04:33, Chang Rebecca Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

>      if not srcuri:
>          lines_before.append('# No information for SRC_URI yet (only an
> external source tree was specified)')
> +    # Check if users has provide a branch
> +    append_branch = branch_re.search(srcuri)
> +    if branch and not append_branch:
> +        # Append the correct branch into SRC_URI
> +        srcuri += (';branch=%s' % str(branch))
>

Traceback (most recent call last):
  File
"TOPDIR/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/recipetool",
line 121, in <module>
    ret = main()
  File
"TOPDIR/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/recipetool",
line 110, in main
    ret = args.func(args)
  File
"TOPDIR/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/scripts/lib/recipetool/create.py",
line 638, in create_recipe
    append_branch = branch_re.search(srcuri)
UnboundLocalError: local variable 'branch_re' referenced before assignment

Also this conflicts with other things in master, so can you rebase when
fixing this.

Cheers,
Ross

--001a11441b5cb5ed4d0554bcaec8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2017 at 04:33, Chang Rebecca Swee Fun <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rebecca.swee.fun.chang@intel.com" target=3D"_blank">rebecca.s=
wee.fun.chang@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=
=3D"gmail-:233" class=3D"gmail-a3s gmail-aXjCH gmail-m15d3a02836707ee7">=C2=
=A0 =C2=A0 =C2=A0if not srcuri:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines_before.append(&#39;# No information=
 for SRC_URI yet (only an external source tree was specified)&#39;)<br>
+=C2=A0 =C2=A0 # Check if users has provide a branch<br>
+=C2=A0 =C2=A0 append_branch =3D branch_re.search(srcuri)<br>
+=C2=A0 =C2=A0 if branch and not append_branch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Append the correct branch into SRC_URI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcuri +=3D (&#39;;branch=3D%s&#39; % str(bran=
ch))</div></blockquote></div><br>Traceback (most recent call last):<br>=C2=
=A0 File &quot;TOPDIR/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r=
0/testsdkext/layers/build/scripts/recipetool&quot;, line 121, in &lt;module=
&gt;<br>=C2=A0 =C2=A0 ret =3D main()<br>=C2=A0 File &quot;TOPDIR/tmp/work/q=
emumips-poky-linux/core-image-minimal/1.0-r0/testsdkext/layers/build/script=
s/recipetool&quot;, line 110, in main<br>=C2=A0 =C2=A0 ret =3D args.func(ar=
gs)<br>=C2=A0 File &quot;TOPDIR/tmp/work/qemumips-poky-linux/core-image-min=
imal/1.0-r0/testsdkext/layers/build/scripts/lib/recipetool/create.py&quot;,=
 line 638, in create_recipe<br>=C2=A0 =C2=A0 append_branch =3D branch_re.se=
arch(srcuri)<br>UnboundLocalError: local variable &#39;branch_re&#39; refer=
enced before assignment</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Also this conflicts with other things in master, so can y=
ou rebase when fixing this.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11441b5cb5ed4d0554bcaec8--
