Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91AED6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:07:59 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id lp2so2446272igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p/NBUBXxashPg48wt7I3AcXQsoLzShDBE2SKujo/ji0=;
	b=VOjIqXMsuWuYIrMGOiF/DEI3ZolrFRK4idWb8BEuIWemstXNaQbOzFD0fhVrHTxc0n
	6sbWPrN9zrqXGYyPczqDVvFP87rxu8+1yhCDJNU8rUqJbxEAzS0YcZY9IEr9IwVFmnk5
	Z2Yp2Wb0w8iyg+pfX05yLLE8AIV4d0yvn8Qcbmpng0YQojPGWQg3kGo3+qFD5LOb+6bi
	eR8wt/JajXKSaT4wbx2pWQYWyEVWo7HCJv7lxFR8CWwuetogkvxBCyXtoyjY7IsnciJN
	cOIPmV0yawKproZRWfahEZ75hXHc4pde1uepHePw2DyIvWo0CiDSlwfjhnxsYAGYMQwS
	V8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p/NBUBXxashPg48wt7I3AcXQsoLzShDBE2SKujo/ji0=;
	b=HgkcOkEGWD+hNAgNi1FFi5E7O2SV0Q8nDl5evT2P/ODtYRadAtEqP8aM3ooEs849R1
	/mIXaKlfNa5ovsRO8TBu88R3nzMidpkZgh2zxGTHyYWPJsdkUeiDjfziRhwxbv2KwdAC
	1mVTr0udDUTdo6I9tmFxXiPOutePHMD2361z6+AWFxgJSP9UoAlLXeUB9ih6BaaJJ+Uj
	RNiE6IWzu3ZnRhMxeOMCS0r2JBQTtXQAtCUSJ8C7opIovTYeqAu9XC9q1WWibcXBwXcE
	jHFYqJyVrKGffFtrT/AkvSBWgC/lkwfcNIi9Tf+FwC89GagHvXAhihg0RCh/QT51Oloj
	6N8Q==
X-Gm-Message-State: AOPr4FUbK9R53OP3KV5yhZt9o018Dr0ubo7aneouA7c80HkD4SAPR/UErsNnFmiHR2utIQ16qmCdJA3gbtrmbw==
X-Received: by 10.50.123.161 with SMTP id mb1mr19186064igb.20.1464106079687;
	Tue, 24 May 2016 09:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 09:07:40 -0700 (PDT)
In-Reply-To: <CABcZANkto4yOZXjd9hMstf8kZ+LdRSQpcV+nHCQdKbLDYVOxYA@mail.gmail.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
	<c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
	<1464081235.9570.51.camel@linuxfoundation.org>
	<CABcZANkto4yOZXjd9hMstf8kZ+LdRSQpcV+nHCQdKbLDYVOxYA@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 24 May 2016 09:07:40 -0700
Message-ID: <CABcZAN=Y-pxry+=efZPHabXeOUSa6m19T-7sNLBVXrEqr09-Og@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 May 2016 16:08:02 -0000
Content-Type: multipart/alternative; boundary=001a1135e7eacb1cab053398c264

--001a1135e7eacb1cab053398c264
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 7:26 AM, Christopher Larson <kergoth@gmail.com>
wrote:

>
> On Tue, May 24, 2016 at 2:13 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2016-05-23 at 13:34 -0700, Christopher Larson wrote:
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > These files are treated as the contents of a bitbake variable, so
>> > usual
>> > bitbake variable references are supported. I considered using another
>> > templating mechanism, for example the one used by yocto-layer, but
>> > then we'd
>> > end up largely mapping metadata variables to template fields anyway,
>> > which is
>> > a pointless indirection. Let bitbake expand the variables directly
>> > instead.
>> >
>> > This feature lets us, for example, reference ${APPEND} in --append,
>> > and avoid
>> > hardcoding the serial console tty in the wks file, and let the user's
>> > changes
>> > to APPEND affect wic the way they do the other image construction
>> > mechanisms.
>> >
>> > The template is read in and set in a variable at parse time, so
>> > changes to the
>> > variables referenced by the template will result in rebuilding the
>> > image.
>> >
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > ---
>> >  meta/classes/image_types.bbclass | 35
>> > +++++++++++++++++++++++++++++++++++
>> >  1 file changed, 35 insertions(+)
>> >
>> > diff --git a/meta/classes/image_types.bbclass
>> > b/meta/classes/image_types.bbclass
>> > index dc681ae..caf8757 100644
>> > --- a/meta/classes/image_types.bbclass
>> > +++ b/meta/classes/image_types.bbclass
>> > @@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
>> >  }
>> >  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
>> >
>> > +python process_wks_template () {
>> > +    """Write out expanded template contents to WKS_FULL_PATH."""
>> > +    template_body = d.getVar('_WKS_TEMPLATE', True)
>> > +    if template_body:
>> > +        wks_file = d.getVar('WKS_FULL_PATH', True)
>> > +        with open(wks_file, 'w') as f:
>> > +            f.write(template_body)
>> > +}
>> > +do_image_wic[prefuncs] += 'process_wks_template'
>> > +
>> >  # Rebuild when the wks file or vars in WICVARS change
>> >  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
>> > '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '',
>> > d)}"
>> >  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
>> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>> > @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?= ""
>> >  # The WICVARS variable is used to define list of bitbake variables
>> > used in wic code
>> >  # variables from this list is written to <image>.env file
>> >  WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME
>> > IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES
>> > INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR
>> > STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
>> > +
>> > +python () {
>> > +    """Read in and set up wks file template for wic."""
>> > +    if d.getVar('USING_WIC', True):
>> > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
>> > +        wks_file = d.expand(wks_file_u)
>> > +        base, ext = os.path.splitext(wks_file)
>> > +        if ext == '.in' and os.path.exists(wks_file):
>> > +            wks_out_file = os.path.join(d.getVar('WORKDIR', True),
>> > os.path.basename(base))
>> > +            d.setVar('WKS_FULL_PATH', wks_out_file)
>> > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
>> > +            d.setVar('WKS_FILE_CHECKSUM',
>> > '${WKS_TEMPLATE_PATH}:True')
>> > +
>> > +            try:
>> > +                with open(wks_file, 'r') as f:
>> > +                    body = f.read()
>> > +            except (IOError, OSError) as exc:
>> > +                pass
>>
>> I'm a little nervous about determinism here. Shouldn't it either find
>> the referenced file or error?
>
>
> That's a fair point, I think I was concerned about parse time errors,
> since they tend to blow up into a lot of unpleasantness for the user, since
> parse time errors in classes can cause errors for multiple recipes. If no
> file is read in at parse time, there'll be no contents to write out, and we
> could then error when trying to build the image with wic, as no wks file
> will exist.
>
> Of course, the file being missing will change checksums for the image
> tasks, but I think that's reasonable.
>
> Thoughts?
>

I'll do a bit more testing on the behaviors and get back to you on that
later. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e7eacb1cab053398c264
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 7:26 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"adM"><di=
v class=3D"h5"><br><div class=3D"gmail_quote">On Tue, May 24, 2016 at 2:13 =
AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div>On Mon, 201=
6-05-23 at 13:34 -0700, Christopher Larson wrote:<br>
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
&gt; This feature lets us, for example, reference ${APPEND} in --append,<br=
>
&gt; and avoid<br>
&gt; hardcoding the serial console tty in the wks file, and let the user&#3=
9;s<br>
&gt; changes<br>
&gt; to APPEND affect wic the way they do the other image construction<br>
&gt; mechanisms.<br>
&gt;<br>
&gt; The template is read in and set in a variable at parse time, so<br>
&gt; changes to the<br>
&gt; variables referenced by the template will result in rebuilding the<br>
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
&gt;=C2=A0 # Rebuild when the wks file or vars in WICVARS change<br>
&gt;=C2=A0 USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;IMAGE_FSTYPES&=
#39;, &#39;wic &#39; + &#39;<br>
&gt; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;${COMPRESSIONTYPES}&#39;=
.split()), &#39;1&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt;=C2=A0 WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; %<b=
r>
&gt; os.path.exists(&#39;${WKS_FULL_PATH}&#39;) if &#39;${USING_WIC}&#39; e=
lse &#39;&#39;}&quot;<br>
&gt; @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
&gt;=C2=A0 # The WICVARS variable is used to define list of bitbake variabl=
es<br>
&gt; used in wic code<br>
&gt;=C2=A0 # variables from this list is written to &lt;image&gt;.env file<=
br>
&gt;=C2=A0 WICVARS ?=3D &quot;BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENA=
ME<br>
&gt; IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES<br>
&gt; INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR<br>
&gt; STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Read in and set up wks file template =
for wic.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;, True):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FULL_PAT=
H&#39;, False)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_file)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.in&#39; and os.path.e=
xists(wks_file):<br>
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
errors in classes can cause errors for multiple recipes. If no file is read=
 in at parse time, there&#39;ll be no contents to write out, and we could t=
hen error when trying to build the image with wic, as no wks file will exis=
t.<br><br clear=3D"all"><div>Of course, the file being missing will change =
checksums for the image tasks, but I think that&#39;s reasonable.</div><div=
><br></div><div>Thoughts?</div></blockquote></div><br>I&#39;ll do a bit mor=
e testing on the behaviors and get back to you on that later. Thanks.<br>--=
 <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>=
kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1135e7eacb1cab053398c264--
