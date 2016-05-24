Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id B491E60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 17:45:46 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id 190so2742306iow.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xipP4pGl3bOCNOHKQ3CHWwiueMYRla+86bC6ax8iu4M=;
	b=XhHNZqEWdFfCPM0gA8p2Lc2PSLTlfFzbOHZD5b5K6s44wpEslE9SBO2g5Xgq/LTZp3
	F9tOX3zcUmuc6o6/pfyV8ljIXBublg0HPFrnNh8HMNarB1aVxkH0v41aeoyiZF8obE00
	mW1IQVO1OX1mTgzz6HBVYgfusaDpX/SqzOBwEYVC21QFL+diz6hv3E/ThxUbzvacbeOS
	4HVrBNuLpgwL79uFb3xxlJS1GOqGJP5AUad5W+i4Y30iLzaZBizwYiJRM3u0oR3r7zNN
	F9jJ7pDl9OdTvc8365R874HYZ1y1A4Nyqg7qsFtTZu/encYR9qL6RQsMthtxHhnsww8N
	8I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xipP4pGl3bOCNOHKQ3CHWwiueMYRla+86bC6ax8iu4M=;
	b=aAUAQiTmA+xVlhxGGkT80UeVMEAv/j7EkhPUC+BZe/ZLib4VhWE15rCB/5nReFiLyu
	wXDKkjLdaZftmgitQfc7KLOu9etxHMGDTloItJYmlJni10473d69g2gbUjZGPq6DB4uj
	ycboj8AFA5+RvGnbQUCiMJB4CJzRPcR0LWWQk8gZuIO463+PrBi05jslwQsVNb76bp4s
	E7h+yVMlMH/YIte3tbOP5csAN0Lh0n+mutW4bOrYqjxd3NVN0E9JwDQgiIxG7qnb9tMh
	7B0mnlHbSO53FVhkcRK4onfmefv/6QJ7j1vVmg9XEuKNkaLwIGVMrrvaTpD2HE6AgZB+
	7wrg==
X-Gm-Message-State: ALyK8tLksk5+sz1Hebcz4B6VwV0t7ZQy0lpeJvrLdzKkl9J0/f8ktNECq0xYElDnMAFSLz5y6LM9yVY0wHPAaA==
X-Received: by 10.107.2.70 with SMTP id 67mr57060ioc.70.1464111946948; Tue, 24
	May 2016 10:45:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 10:45:27 -0700 (PDT)
In-Reply-To: <CABcZAN=Y-pxry+=efZPHabXeOUSa6m19T-7sNLBVXrEqr09-Og@mail.gmail.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
	<c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
	<1464081235.9570.51.camel@linuxfoundation.org>
	<CABcZANkto4yOZXjd9hMstf8kZ+LdRSQpcV+nHCQdKbLDYVOxYA@mail.gmail.com>
	<CABcZAN=Y-pxry+=efZPHabXeOUSa6m19T-7sNLBVXrEqr09-Og@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 24 May 2016 10:45:27 -0700
Message-ID: <CABcZANm0hrQWmxJPA94Hvs-NOK1X-12ykAn09vbBZv5NW4DNuA@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 May 2016 17:45:48 -0000
Content-Type: multipart/alternative; boundary=001a11396814826a8605339a20dc

--001a11396814826a8605339a20dc
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 9:07 AM, Christopher Larson <kergoth@gmail.com>
wrote:

>
> On Tue, May 24, 2016 at 7:26 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>>
>> On Tue, May 24, 2016 at 2:13 AM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Mon, 2016-05-23 at 13:34 -0700, Christopher Larson wrote:
>>> > From: Christopher Larson <chris_larson@mentor.com>
>>> >
>>> > These files are treated as the contents of a bitbake variable, so
>>> > usual
>>> > bitbake variable references are supported. I considered using another
>>> > templating mechanism, for example the one used by yocto-layer, but
>>> > then we'd
>>> > end up largely mapping metadata variables to template fields anyway,
>>> > which is
>>> > a pointless indirection. Let bitbake expand the variables directly
>>> > instead.
>>> >
>>> > This feature lets us, for example, reference ${APPEND} in --append,
>>> > and avoid
>>> > hardcoding the serial console tty in the wks file, and let the user's
>>> > changes
>>> > to APPEND affect wic the way they do the other image construction
>>> > mechanisms.
>>> >
>>> > The template is read in and set in a variable at parse time, so
>>> > changes to the
>>> > variables referenced by the template will result in rebuilding the
>>> > image.
>>> >
>>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>> > ---
>>> >  meta/classes/image_types.bbclass | 35
>>> > +++++++++++++++++++++++++++++++++++
>>> >  1 file changed, 35 insertions(+)
>>> >
>>> > diff --git a/meta/classes/image_types.bbclass
>>> > b/meta/classes/image_types.bbclass
>>> > index dc681ae..caf8757 100644
>>> > --- a/meta/classes/image_types.bbclass
>>> > +++ b/meta/classes/image_types.bbclass
>>> > @@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
>>> >  }
>>> >  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
>>> >
>>> > +python process_wks_template () {
>>> > +    """Write out expanded template contents to WKS_FULL_PATH."""
>>> > +    template_body = d.getVar('_WKS_TEMPLATE', True)
>>> > +    if template_body:
>>> > +        wks_file = d.getVar('WKS_FULL_PATH', True)
>>> > +        with open(wks_file, 'w') as f:
>>> > +            f.write(template_body)
>>> > +}
>>> > +do_image_wic[prefuncs] += 'process_wks_template'
>>> > +
>>> >  # Rebuild when the wks file or vars in WICVARS change
>>> >  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
>>> > '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '',
>>> > d)}"
>>> >  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
>>> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>>> > @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?= ""
>>> >  # The WICVARS variable is used to define list of bitbake variables
>>> > used in wic code
>>> >  # variables from this list is written to <image>.env file
>>> >  WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME
>>> > IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES
>>> > INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR
>>> > STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
>>> > +
>>> > +python () {
>>> > +    """Read in and set up wks file template for wic."""
>>> > +    if d.getVar('USING_WIC', True):
>>> > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
>>> > +        wks_file = d.expand(wks_file_u)
>>> > +        base, ext = os.path.splitext(wks_file)
>>> > +        if ext == '.in' and os.path.exists(wks_file):
>>> > +            wks_out_file = os.path.join(d.getVar('WORKDIR', True),
>>> > os.path.basename(base))
>>> > +            d.setVar('WKS_FULL_PATH', wks_out_file)
>>> > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
>>> > +            d.setVar('WKS_FILE_CHECKSUM',
>>> > '${WKS_TEMPLATE_PATH}:True')
>>> > +
>>> > +            try:
>>> > +                with open(wks_file, 'r') as f:
>>> > +                    body = f.read()
>>> > +            except (IOError, OSError) as exc:
>>> > +                pass
>>>
>>> I'm a little nervous about determinism here. Shouldn't it either find
>>> the referenced file or error?
>>
>>
>> That's a fair point, I think I was concerned about parse time errors,
>> since they tend to blow up into a lot of unpleasantness for the user, since
>> parse time errors in classes can cause errors for multiple recipes. If
>> no file is read in at parse time, there'll be no contents to write out,
>> and we could then error when trying to build the image with wic, as no
>> wks file will exist.
>>
>> Of course, the file being missing will change checksums for the image
>> tasks, but I think that's reasonable.
>>
>> Thoughts?
>>
>
> I'll do a bit more testing on the behaviors and get back to you on that
> later. Thanks.


If the WKS_FILE doesn't exist, whether we're using templates or not, it'll
fail in do_image_wic:

ERROR: core-image-sato-1.0-r0 do_image_wic: No kickstart files from
WKS_FILES were found: /scratch/dogwood/minnowmax/build/mkefidiskf.wks.in
core-image-sato.wks. Please set WKS_FILE or WKS_FILES appropriately.
ERROR: core-image-sato-1.0-r0 do_image_wic: Function failed: do_image_wic
(log file is located at
/scratch/dogwood/minnowmax/build/tmp/work/intel_corei7_64-mel-linux/core-image-sato/1.0-r0/temp/log.do_image_wic.12181)

If the template doesn't exist, then no template handling will be done at
all, so do_image_wic won't depend on any of the variables referenced in the
template, and the task will fail. If it does, then we will depend on its
contents and referenced variables, and the task will not fail.

I don't really see a problem with determinism there. Either the file exists
at parse time or it doesn't, and the behavior seems reasonable in either
case.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11396814826a8605339a20dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 9:07 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex"><div class=3D""><div class=3D"h5"><b=
r><div class=3D"gmail_quote">On Tue, May 24, 2016 at 7:26 AM, Christopher L=
arson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"=
_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div><d=
iv><br><div class=3D"gmail_quote">On Tue, May 24, 2016 at 2:13 AM, Richard =
Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex"><div><div>On Mon, 2016-05-23 at 13:34 -0700, Ch=
ristopher Larson wrote:<br>
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
&gt; This feature lets us, for example, reference ${APPEND} <span class=3D"=
">in</span> --append,<br>
&gt; and avoid<br>
&gt; hardcoding the serial console tty <span class=3D"">in</span> the <span=
 class=3D"">wks</span> file, and let the user&#39;s<br>
&gt; changes<br>
&gt; to APPEND affect wic the way they do the other image construction<br>
&gt; mechanisms.<br>
&gt;<br>
&gt; The template is read <span class=3D"">in</span> and set <span class=3D=
"">in</span> a variable at parse time, so<br>
&gt; changes to the<br>
&gt; variables referenced by the template will result <span class=3D"">in</=
span> rebuilding the<br>
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
&gt;=C2=A0 # Rebuild when the <span class=3D"">wks</span> file or vars <spa=
n class=3D"">in</span> WICVARS change<br>
&gt;=C2=A0 USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;IMAGE_FSTYPES&=
#39;, &#39;wic &#39; + &#39;<br>
&gt; &#39;.join(&#39;wic.%s&#39; % c for c <span class=3D"">in</span> &#39;=
${COMPRESSIONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt;=C2=A0 WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; %<b=
r>
&gt; os.path.exists(&#39;${WKS_FULL_PATH}&#39;) if &#39;${USING_WIC}&#39; e=
lse &#39;&#39;}&quot;<br>
&gt; @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?=3D &quot;&quot;<br>
&gt;=C2=A0 # The WICVARS variable is used to define list of bitbake variabl=
es<br>
&gt; used <span class=3D"">in</span> wic code<br>
&gt;=C2=A0 # variables from this list is written to &lt;image&gt;.env file<=
br>
&gt;=C2=A0 WICVARS ?=3D &quot;BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENA=
ME<br>
&gt; IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES<br>
&gt; INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR<br>
&gt; STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Read <span class=3D"">in</span> and s=
et up <span class=3D"">wks</span> file template for wic.&quot;&quot;&quot;<=
br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;USING_WIC&#39;, True):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file_u =3D d.getVar(&#39;WKS_FULL_PAT=
H&#39;, False)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wks_file =3D d.expand(wks_file_u)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, ext =3D os.path.splitext(wks_file)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ext =3D=3D &#39;.<span class=3D"">in</=
span>&#39; and os.path.exists(wks_file):<br>
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
errors <span class=3D"">in</span> classes can cause errors for multiple rec=
ipes. If no file is read <span class=3D"">in</span> at parse time, there&#3=
9;ll be no contents to write out, and we could then error when trying to bu=
ild the image with wic, as no <span class=3D"">wks</span> file will exist.<=
br><br clear=3D"all"><div>Of course, the file being missing will change che=
cksums for the image tasks, but I think that&#39;s reasonable.</div><div><b=
r></div><div>Thoughts?</div></blockquote></div><br></div></div>I&#39;ll do =
a bit more testing on the behaviors and get back to you on that later. Than=
ks.</blockquote></div><br>If the WKS_FILE doesn&#39;t exist, whether we&#39=
;re using templates or not, it&#39;ll fail in do_image_wic:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">ERROR: core-image-sato-1.0-r0 do_image_wic: No kickstart files from W=
KS_FILES were found: /scratch/dogwood/minnowmax/build/<a href=3D"http://mke=
fidiskf.wks.in">mkefidiskf.wks.in</a> core-image-sato.wks. Please set WKS_F=
ILE or WKS_FILES appropriately.</div><div class=3D"gmail_extra">ERROR: core=
-image-sato-1.0-r0 do_image_wic: Function failed: do_image_wic (log file is=
 located at /scratch/dogwood/minnowmax/build/tmp/work/intel_corei7_64-mel-l=
inux/core-image-sato/1.0-r0/temp/log.do_image_wic.12181)</div><br clear=3D"=
all"><div>If the template doesn&#39;t exist, then no template handling will=
 be done at all, so do_image_wic won&#39;t depend on any of the variables r=
eferenced in the template, and the task will fail. If it does, then we will=
 depend on its contents and referenced variables, and the task will not fai=
l.</div><div><br></div><div>I don&#39;t really see a problem with determini=
sm there. Either the file exists at parse time or it doesn&#39;t, and the b=
ehavior seems reasonable in either case.</div>-- <br><div class=3D"gmail_si=
gnature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senio=
r Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11396814826a8605339a20dc--
