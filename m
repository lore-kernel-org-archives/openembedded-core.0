Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id D0C926010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:55:54 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so13698842igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RCtW26A9l0JuHv4qEoK/AtmBLwlkfrI9RlfpuVixcSo=;
	b=otMsPqp7EYeqLUz1RjIrpIR8Xzok7GSTSYRQyXU8O3CkWd7uc/07C1MpyBjcopQ4Y2
	g1j7rWEW62S36MNvwyYBZTfj8xpWJkGfYKhGrxUiWc9lSbiUP92IJhZdkWknEGHlb2ms
	iqJ9nE84cZJOXogGeJwMAglikTk/QD18/md7O+oXGYFisbJrCC7E1eT3r+sFbUg7dDG5
	dZr5hC8GR8Y6aaWzOyotDCXK2OaKiuTpuGE2YQ9eLXcEz+Es3ZYhQ1pyBM/3oewsMnXR
	gpkuMOr9tsmaZGc12K7jIqZOE6FZJSPMbu7C7jSVPxQTl3rOasO8YRF/jCAv6/P2o9QH
	oFbA==
X-Received: by 10.50.150.37 with SMTP id uf5mr2160675igb.10.1447768555184;
	Tue, 17 Nov 2015 05:55:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Tue, 17 Nov 2015 05:55:35 -0800 (PST)
In-Reply-To: <CALbNGRSRxhTWMDa3B9a4N1m5E7TxTJXajLWaYCGUjKOf6WdZ4Q@mail.gmail.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
	<CALbNGRSRxhTWMDa3B9a4N1m5E7TxTJXajLWaYCGUjKOf6WdZ4Q@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 17 Nov 2015 06:55:35 -0700
Message-ID: <CABcZANm=PqxaTxFSSv+rj0qXSfeyBN3YPEo01qWy0=bs5FOZZw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
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
X-List-Received-Date: Tue, 17 Nov 2015 13:55:55 -0000
Content-Type: multipart/alternative; boundary=001a11c2c35072e7810524bce2ed

--001a11c2c35072e7810524bce2ed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 12:25 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Nov 13, 2015 at 12:41 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We don't need nss-myhostname on systemd systems, because systemd alread=
y
> > provides myhostname, but we weren't configuring nsswitch to use it.
> Being able
> > to resolve the hostname is useful for a number of different
> applications, so
> > enable it using the same postinst/prerm bits which are in nss-myhostnam=
e.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/recipes-core/systemd/systemd_225.bb | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_225.bb
> b/meta/recipes-core/systemd/systemd_225.bb
> > index 18c2448..20515f5 100644
> > --- a/meta/recipes-core/systemd/systemd_225.bb
> > +++ b/meta/recipes-core/systemd/systemd_225.bb
> > @@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] =3D
> "${base_bindir}/systemctl"
> >  ALTERNATIVE_LINK_NAME[runlevel] =3D "${base_sbindir}/runlevel"
> >  ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
> >
> > +pkg_postinst_${PN} () {
> > +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> > +               -e
> 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname
> \3\4\5/' \
> > +               -i $D${sysconfdir}/nsswitch.conf
> > +}
> > +
> > +pkg_prerm_${PN} () {
> > +       sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> > +               -e '/^hosts:/s/\s*myhostname//' \
> > +               -i $D${sysconfdir}/nsswitch.conf
> > +}
> > +
> >  pkg_postinst_udev-hwdb () {
> >         if test -n "$D"; then
> >                 ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')}
> hwdb --update \
> > --
> > 2.2.1
> >
> > --
> This seems to solve my xfce4-terminal delay - thanks. I have a
> questions regarding this patch: As soon as basefiles are updated
> resolving stops working - right? So why not handle at basefiles based
> on systemd distro setting?


As far as I know, nsswitch.conf is flagged as a conffile (actually in
master everything in /etc/ will be), so once it's modified externally (in
this case, by the systemd recipe), the original package which installed the
file won't blindliy overwrite those changes.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2c35072e7810524bce2ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 17, 2015 at 12:25 AM, Andreas M=C3=BCller <span dir=3D"ltr">&lt=
;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitze=
ltony@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div class=3D"HOEnZb adM"><div class=3D"h5">On Fri, Nov 13, 2015 at 12:41=
 AM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gm=
ail.com</a>&gt; wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We don&#39;t need nss-myhostname on systemd systems, because systemd a=
lready<br>
&gt; provides myhostname, but we weren&#39;t configuring nsswitch to use it=
. Being able<br>
&gt; to resolve the hostname is useful for a number of different applicatio=
ns, so<br>
&gt; enable it using the same postinst/prerm bits which are in nss-myhostna=
me.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_225.bb</a> | 12 ++++++++++++<br>
&gt;=C2=A0 1 file changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_225.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_225.bb" rel=3D"noreferrer" target=3D"=
_blank">systemd_225.bb</a><br>
&gt; index 18c2448..20515f5 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_225.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_225.bb</a><br>
&gt; @@ -397,6 +397,18 @@ ALTERNATIVE_TARGET[runlevel] =3D &quot;${base_bin=
dir}/systemctl&quot;<br>
&gt;=C2=A0 ALTERNATIVE_LINK_NAME[runlevel] =3D &quot;${base_sbindir}/runlev=
el&quot;<br>
&gt;=C2=A0 ALTERNATIVE_PRIORITY[runlevel] ?=3D &quot;300&quot;<br>
&gt;<br>
&gt; +pkg_postinst_${PN} () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;/^hosts:/s/\s*\&lt;myhostname\=
&gt;//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/\(^h=
osts:.*\)\(\&lt;files\&gt;\)\(.*\)\(\&lt;dns\&gt;\)\(.*\)/\1\2 myhostname \=
3\4\5/&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i $D${sysconf=
dir}/nsswitch.conf<br>
&gt; +}<br>
&gt; +<br>
&gt; +pkg_prerm_${PN} () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;/^hosts:/s/\s*\&lt;myhostname\=
&gt;//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/^host=
s:/s/\s*myhostname//&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i $D${sysconf=
dir}/nsswitch.conf<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 pkg_postinst_udev-hwdb () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n &quot;$D&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@qemu_r=
un_binary(d, &#39;$D&#39;, &#39;${base_bindir}/udevadm&#39;)} hwdb --update=
 \<br>
&gt; --<br>
&gt; 2.2.1<br>
&gt;<br>
</div></div>&gt; --<br>
This seems to solve my xfce4-terminal delay - thanks. I have a<br>
questions regarding this patch: As soon as basefiles are updated<br>
resolving stops working - right? So why not handle at basefiles based<br>
on systemd distro setting?</blockquote></div><br>As far as I know, nsswitch=
.conf is flagged as a conffile (actually in master everything in /etc/ will=
 be), so once it&#39;s modified externally (in this case, by the systemd re=
cipe), the original package which installed the file won&#39;t blindliy ove=
rwrite those changes.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"=
ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, O=
penEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, =
Mentor Graphics</div></div>
</div></div>

--001a11c2c35072e7810524bce2ed--
