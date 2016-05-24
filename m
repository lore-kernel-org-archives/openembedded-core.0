Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70A5562132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 19:28:26 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m17so2395708ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZVEW6LasbDFViKrtERZ4H+3Enf1UPDVcEfOxivmlRFg=;
	b=YX217g+lhfkoCqNGDBqto8Fugr14xbUZmcUoL6LcvY4ErsfPDmBrrA8/Vh6CPhaSz8
	qnnXfgM9kGlbsrhnX8QqOtC5zhLINHvuyK9moCgU+gEnldkNEh5Lj+JPMQrUbHLBs1D4
	mXIlTKL1LgaKrLRaLaqerq9m/x9ss7jquvEX8I6RS4MZoE4NiLpnkF68ZFs3LNCMAjL0
	9wKoq/1cdzqT2G3NTklIYp9udbNTEGuNSvDP5lsLiUVCCXDz0evHWtSHdGQ22xlxScbe
	pL11EEsco3oom16rQFwdL2s6mQMxYH+k67PiHxFk8iG803pbBmryir+AOEhVduzJRGRc
	Uy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZVEW6LasbDFViKrtERZ4H+3Enf1UPDVcEfOxivmlRFg=;
	b=e+TE8Xfdl4s5yNSCY6EwAC0ysD6NH0HRpMpJCfC/AFIK5gjxVvuPrsd8KnySy0elzV
	/fD9rzM6AfomSWoWitbi4AgZKhPwlX4aotSNGZ3/Ao1oMbZZi5+Xe94oOvB+cVHzTZ2s
	QMte1oydY7mxPi8OMc2qwtveNIc5l6htyQE8DsCJiMYEsTWpc6gRbnAagiaaO03LdLJc
	I41b8LoROyfIMAgkZ3CCc6A95tntyqXFxl33oJpLFL6+sqarlsrryEY64WfNd+zs4q/C
	GGFlyz+8POQTiVtRcld5vhO7K0XX7Nf8Jdoya95maxZ+qZD+PelI/EZXoIr/58CW2ap8
	lGdg==
X-Gm-Message-State: ALyK8tIxLwr3ZeOWcdph45vrCUeXOVvHTE3SXMh/vYYU82tlpnzGkcY7DbhE7d2/mSi96FZq1wouh4aZTqbVdg==
X-Received: by 10.107.2.70 with SMTP id 67mr446889ioc.70.1464118106657; Tue,
	24 May 2016 12:28:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 12:28:07 -0700 (PDT)
In-Reply-To: <CABcZANm0hrQWmxJPA94Hvs-NOK1X-12ykAn09vbBZv5NW4DNuA@mail.gmail.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
	<c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
	<1464081235.9570.51.camel@linuxfoundation.org>
	<CABcZANkto4yOZXjd9hMstf8kZ+LdRSQpcV+nHCQdKbLDYVOxYA@mail.gmail.com>
	<CABcZAN=Y-pxry+=efZPHabXeOUSa6m19T-7sNLBVXrEqr09-Og@mail.gmail.com>
	<CABcZANm0hrQWmxJPA94Hvs-NOK1X-12ykAn09vbBZv5NW4DNuA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 24 May 2016 12:28:07 -0700
Message-ID: <CABcZAN=x6UR-=5eeKVCYoYkAvLEF1-gjY03erMOZnoJZW087iQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image_types.bbclass: support template .wks.in files for wic
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
X-List-Received-Date: Tue, 24 May 2016 19:28:26 -0000
Content-Type: multipart/alternative; boundary=001a11396814a839f105339b8f04

--001a11396814a839f105339b8f04
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 10:45 AM, Christopher Larson <kergoth@gmail.com>
wrote:

>
> On Tue, May 24, 2016 at 9:07 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>>
>> On Tue, May 24, 2016 at 7:26 AM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>>
>>>
>>> On Tue, May 24, 2016 at 2:13 AM, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> On Mon, 2016-05-23 at 13:34 -0700, Christopher Larson wrote:
>>>> > From: Christopher Larson <chris_larson@mentor.com>
>>>> >
>>>> > These files are treated as the contents of a bitbake variable, so
>>>> > usual
>>>> > bitbake variable references are supported. I considered using another
>>>> > templating mechanism, for example the one used by yocto-layer, but
>>>> > then we'd
>>>> > end up largely mapping metadata variables to template fields anyway,
>>>> > which is
>>>> > a pointless indirection. Let bitbake expand the variables directly
>>>> > instead.
>>>> >
>>>> > This feature lets us, for example, reference ${APPEND} in --append,
>>>> > and avoid
>>>> > hardcoding the serial console tty in the wks file, and let the user's
>>>> > changes
>>>> > to APPEND affect wic the way they do the other image construction
>>>> > mechanisms.
>>>> >
>>>> > The template is read in and set in a variable at parse time, so
>>>> > changes to the
>>>> > variables referenced by the template will result in rebuilding the
>>>> > image.
>>>> >
>>>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>>> > ---
>>>> >  meta/classes/image_types.bbclass | 35
>>>> > +++++++++++++++++++++++++++++++++++
>>>> >  1 file changed, 35 insertions(+)
>>>> >
>>>> > diff --git a/meta/classes/image_types.bbclass
>>>> > b/meta/classes/image_types.bbclass
>>>> > index dc681ae..caf8757 100644
>>>> > --- a/meta/classes/image_types.bbclass
>>>> > +++ b/meta/classes/image_types.bbclass
>>>> > @@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
>>>> >  }
>>>> >  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
>>>> >
>>>> > +python process_wks_template () {
>>>> > +    """Write out expanded template contents to WKS_FULL_PATH."""
>>>> > +    template_body = d.getVar('_WKS_TEMPLATE', True)
>>>> > +    if template_body:
>>>> > +        wks_file = d.getVar('WKS_FULL_PATH', True)
>>>> > +        with open(wks_file, 'w') as f:
>>>> > +            f.write(template_body)
>>>> > +}
>>>> > +do_image_wic[prefuncs] += 'process_wks_template'
>>>> > +
>>>> >  # Rebuild when the wks file or vars in WICVARS change
>>>> >  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
>>>> > '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '',
>>>> > d)}"
>>>> >  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
>>>> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>>>> > @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?= ""
>>>> >  # The WICVARS variable is used to define list of bitbake variables
>>>> > used in wic code
>>>> >  # variables from this list is written to <image>.env file
>>>> >  WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME
>>>> > IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES
>>>> > INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR
>>>> > STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
>>>> > +
>>>> > +python () {
>>>> > +    """Read in and set up wks file template for wic."""
>>>> > +    if d.getVar('USING_WIC', True):
>>>> > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
>>>> > +        wks_file = d.expand(wks_file_u)
>>>> > +        base, ext = os.path.splitext(wks_file)
>>>> > +        if ext == '.in' and os.path.exists(wks_file):
>>>> > +            wks_out_file = os.path.join(d.getVar('WORKDIR', True),
>>>> > os.path.basename(base))
>>>> > +            d.setVar('WKS_FULL_PATH', wks_out_file)
>>>> > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
>>>> > +            d.setVar('WKS_FILE_CHECKSUM',
>>>> > '${WKS_TEMPLATE_PATH}:True')
>>>> > +
>>>> > +            try:
>>>> > +                with open(wks_file, 'r') as f:
>>>> > +                    body = f.read()
>>>> > +            except (IOError, OSError) as exc:
>>>> > +                pass
>>>>
>>>> I'm a little nervous about determinism here. Shouldn't it either find
>>>> the referenced file or error?
>>>
>>>
>>> That's a fair point, I think I was concerned about parse time errors,
>>> since they tend to blow up into a lot of unpleasantness for the user, since
>>> parse time errors in classes can cause errors for multiple recipes. If
>>> no file is read in at parse time, there'll be no contents to write out,
>>> and we could then error when trying to build the image with wic, as no
>>> wks file will exist.
>>>
>>> Of course, the file being missing will change checksums for the image
>>> tasks, but I think that's reasonable.
>>>
>>> Thoughts?
>>>
>>
>> I'll do a bit more testing on the behaviors and get back to you on that
>> later. Thanks.
>
>
> If the WKS_FILE doesn't exist, whether we're using templates or not, it'll
> fail in do_image_wic:
>
> ERROR: core-image-sato-1.0-r0 do_image_wic: No kickstart files from
> WKS_FILES were found: /scratch/dogwood/minnowmax/build/mkefidiskf.wks.in
> core-image-sato.wks. Please set WKS_FILE or WKS_FILES appropriately.
> ERROR: core-image-sato-1.0-r0 do_image_wic: Function failed: do_image_wic
> (log file is located at
> /scratch/dogwood/minnowmax/build/tmp/work/intel_corei7_64-mel-linux/core-image-sato/1.0-r0/temp/log.do_image_wic.12181)
>
> If the template doesn't exist, then no template handling will be done at
> all, so do_image_wic won't depend on any of the variables referenced in the
> template, and the task will fail. If it does, then we will depend on its
> contents and referenced variables, and the task will not fail.
>
> I don't really see a problem with determinism there. Either the file
> exists at parse time or it doesn't, and the behavior seems reasonable in
> either case.
>

Update: I've occasionally seen a taskhash mismatch, so clearly I've missed
something. Hold off on this until further notice. Thanks again for the
feedback.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11396814a839f105339b8f04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 10:45 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_e=
xtra"><div class=3D"adM"><div class=3D"h5"><br><div class=3D"gmail_quote">O=
n Tue, May 24, 2016 at 9:07 AM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex"><div><div><br><div class=3D"gmail_quo=
te">On Tue, May 24, 2016 at 7:26 AM, Christopher Larson <span dir=3D"ltr">&=
lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div><div><br><div class=3D"gmai=
l_quote">On Tue, May 24, 2016 at 2:13 AM, Richard Purdie <span dir=3D"ltr">=
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x"><div><div>On Mon, 2016-05-23 at 13:34 -0700, Christopher Larson wrote:<b=
r>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; These files are treated as the contents of a bitbake variable, so<br>
&gt; usual<br>
&gt; bitbake variable references are supported. I considered using another<=
br>
&gt; templating mechanism, for example the one used by yocto-layer, but<br>
&gt; then we&#39;d<br>
&gt; end up largely mapping metadata variables to template fields anyway,<b=
r>
&gt; which is<br>
&gt; a pointless indirection. Let bitbake expand the variables directly<br>
&gt; instead.<br>
&gt;<br>
&gt; This feature lets us, for example, reference ${APPEND} <span>in</span>=
 --append,<br>
&gt; and avoid<br>
&gt; hardcoding the serial console tty <span>in</span> the <span>wks</span>=
 file, and let the user&#39;s<br>
&gt; changes<br>
&gt; to APPEND affect wic the way they do the other image construction<br>
&gt; mechanisms.<br>
&gt;<br>
&gt; The template is read <span>in</span> and set <span>in</span> a variabl=
e at parse time, so<br>
&gt; changes to the<br>
&gt; variables referenced by the template will result <span>in</span> rebui=
lding the<br>
&gt; image.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image_types.bbclass | 35<br>
&gt; +++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 35 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/image_types.bbclass<br>
&gt; b/meta/classes/image_types.bbclass<br>
&gt; index dc681ae..caf8757 100644<br>
&gt; --- a/meta/classes/image_types.bbclass<br>
&gt; +++ b/meta/classes/image_types.bbclass<br>
&gt; @@ -206,6 +206,16 @@ IMAGE_CMD_wic () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES&=
quot;<br>
&gt;<br>
&gt; +python process_wks_template () {<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Write out expanded template contents =
to WKS_FULL_PATH.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 template_body =3D d.getVar(&#39;_WKS_TEMPLATE&#39;, Tru=
e)<br>
&gt; +=C2=A0 =C2=A0 if template_body:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.getVar(&#39;WKS_FULL_PATH&=
#39;, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wks_file, &#39;w&#39;) as f:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(template_body)<br>
&gt; +}<br>
&gt; +do_image_wic[prefuncs] +=3D &#39;process_wks_template&#39;<br>
&gt; +<br>
&gt;=C2=A0 # Rebuild when the <span>wks</span> file or vars <span>in</span>=
 WICVARS change<br>
&gt;=C2=A0 USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;IMAGE_FSTYPES&=
#39;, &#39;wic &#39; + &#39;<br>
&gt; &#39;.join(&#39;wic.%s&#39; % c for c <span>in</span> &#39;${COMPRESSI=
ONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt;=C2=A0 WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; %<b=
r>
&gt; os.path.exists(&#39;${WKS_FULL_PATH}&#39;) if &#39;${USING_WIC}&#39; e=
lse &#39;&#39;}&quot;<br>
&gt; @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
&gt;=C2=A0 # The WICVARS variable is used to define list of bitbake variabl=
es<br>
&gt; used <span>in</span> wic code<br>
&gt;=C2=A0 # variables from this list is written to &lt;image&gt;.env file<=
br>
&gt;=C2=A0 WICVARS ?=3D &quot;BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENA=
ME<br>
&gt; IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES<br>
&gt; INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR<br>
&gt; STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Read <span>in</span> and set up <span=
>wks</span> file template for wic.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;, True):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FULL_PAT=
H&#39;, False)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_file)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.<span>in</span>&#39; =
and os.path.exists(wks_file):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_out_file =3D os.path.jo=
in(d.getVar(&#39;WORKDIR&#39;, True),<br>
&gt; os.path.basename(base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FULL_PATH=
&#39;, wks_out_file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_TEMPLATE_=
PATH&#39;, wks_file_u)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;WKS_FILE_CHEC=
KSUM&#39;,<br>
&gt; &#39;${WKS_TEMPLATE_PATH}:True&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(wks=
_file, &#39;r&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 body =3D f.read()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError, OSError) a=
s exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
<br>
</div></div>I&#39;m a little nervous about determinism here. Shouldn&#39;t =
it either find<br>
the referenced file or error?</blockquote></div><br></div></div>That&#39;s =
a fair point, I think I was concerned about parse time errors, since they t=
end to blow up into a lot of unpleasantness for the user, since parse time =
errors <span>in</span> classes can cause errors for multiple recipes. If no=
 file is read <span>in</span> at parse time, there&#39;ll be no contents to=
 write out, and we could then error when trying to build the image with wic=
, as no <span>wks</span> file will exist.<br><br clear=3D"all"><div>Of cour=
se, the file being missing will change checksums for the image tasks, but I=
 think that&#39;s reasonable.</div><div><br></div><div>Thoughts?</div></blo=
ckquote></div><br></div></div>I&#39;ll do a bit more testing on the behavio=
rs and get back to you on that later. Thanks.</blockquote></div><br></div><=
/div>If the WKS_FILE doesn&#39;t exist, whether we&#39;re using templates o=
r not, it&#39;ll fail in do_image_wic:</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: core-ima=
ge-sato-1.0-r0 do_image_wic: No kickstart files from WKS_FILES were found: =
/scratch/dogwood/minnowmax/build/<a href=3D"http://mkefidiskf.wks.in" targe=
t=3D"_blank">mkefidiskf.wks.in</a> core-image-sato.wks. Please set WKS_FILE=
 or WKS_FILES appropriately.</div><div class=3D"gmail_extra">ERROR: core-im=
age-sato-1.0-r0 do_image_wic: Function failed: do_image_wic (log file is lo=
cated at /scratch/dogwood/minnowmax/build/tmp/work/intel_corei7_64-mel-linu=
x/core-image-sato/1.0-r0/temp/log.do_image_wic.12181)</div><br clear=3D"all=
"><div>If the template doesn&#39;t exist, then no template handling will be=
 done at all, so do_image_wic won&#39;t depend on any of the variables refe=
renced in the template, and the task will fail. If it does, then we will de=
pend on its contents and referenced variables, and the task will not fail.<=
/div><div><br></div><div>I don&#39;t really see a problem with determinism =
there. Either the file exists at parse time or it doesn&#39;t, and the beha=
vior seems reasonable in either case.</div></div></blockquote></div><br>Upd=
ate: I&#39;ve occasionally seen a taskhash mismatch, so clearly I&#39;ve mi=
ssed something. Hold off on this until further notice. Thanks again for the=
 feedback.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christ=
opher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded=
, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Grap=
hics</div></div>
</div></div>

--001a11396814a839f105339b8f04--
