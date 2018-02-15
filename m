Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45C8E78259
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 14:11:02 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id d26so11978696qtk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 06:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=35jEnXxxLN1sz8DqV1wN1eIh/bIvS4USfaLXAQsBlX0=;
	b=QQ8/6WX2OF2zRiOHUTa5loUtqDdc5zjpnrfzKccTF74iGitKYh4OA5+Q/JzOKtyFPA
	2qQ6L/Iq/gdvoRwJCcMHBMP6kzN5Bv5N66fCh6pTuqZMVOxhlYy0Q1/9MjHNkdbBOcPg
	jQA1bPo5LU31NyS5YMmF80MBHTNlhCM3w71+lbPG1oOBsUABTVX8m8SAKbhhZQEMrMaJ
	CT8w9ODrTCiK7f6FPImnAh66h5ooNM27+U4W4gpe5FQKaotRH/kpAT7f9hzU/kpw9OlR
	Y/rlX4MwdTmAkZP4U0kfxFHIKRb06RSnDrh8xkkqKEXxclZ6SsK1lYroeQslbERigJYx
	xaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=35jEnXxxLN1sz8DqV1wN1eIh/bIvS4USfaLXAQsBlX0=;
	b=ZZAE8CqNjcz8i0ToxfQPvnxNyDFD+RKsaXHczy4bZ+rppDRSDNtqfZa/aGwpZB8DDG
	Jq/ALOD1RVmB/dK7QIfrfi5DBUYJHfheUeQyTNfr8cr/gFOhXKB04iaC2ROwbcEthZla
	pVuux7jQQJ/WJjZvS38JGirSYi8PXHuk3o/v/Suu/Q4P8NHlvMzcssTo89qLJUJ8FMwk
	cD6CQTwI5kYU0oTmfqQIAMIJayWxeAJHN1zlJx77omO0GiN2pBCrFb2iqDd/8NCiivxJ
	D44z0vmCRgmYSepeO/DqYmci1Ga7kWXgCBaEodAuaZGDPONq7dULAo6IU5MCmxK1/hTS
	gBEA==
X-Gm-Message-State: APf1xPB/qRQo1hhtXh7XA1kThS8seWRnBtpPQLFnycTRmhmrpJC7s/GV
	KmT9WJ/RUIn3CiDo1aY233tWt++k9QZgD+YchkI=
X-Google-Smtp-Source: AH8x224I2/fbFaXfbpbvnXo9hZy6+ggopDAX02OINyE4WuP42PP84x9XcdsAqjzJLqy8bXFlyYR4+bvT81GKSwfIFeM=
X-Received: by 10.237.45.35 with SMTP id h32mr4447686qtd.34.1518703864169;
	Thu, 15 Feb 2018 06:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.62.153 with HTTP; Thu, 15 Feb 2018 06:11:03 -0800 (PST)
In-Reply-To: <1518701655.24236.146.camel@linuxfoundation.org>
References: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
	<1518701655.24236.146.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 15 Feb 2018 15:11:03 +0100
Message-ID: <CALatG=7Fxnseh+qrNYuO0q85_H7y3eZkv9FaKsMMQ-_819FZvA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass: set do_bootimg recrdeptask on do_populate_lic
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
X-List-Received-Date: Thu, 15 Feb 2018 14:11:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c124a6a57cb50056540ccc4"

--94eb2c124a6a57cb50056540ccc4
Content-Type: text/plain; charset="UTF-8"

Hi, Richard:

I observed this issue on rocko branch, but I think upstream also needs it.
Since even recrdepends handling had been changed in bitbake, the problem
here is the "recrdepends" is missing between do_bootimg and do_populate_lic,
actually there was a bug record for it, see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9446, but the fix only
considered the missing recrdepends of do_image, but looking
into get_deployed_dependencies->get_boot_dependencies, the do_bootimg also
needs a similar fix.

//Ming Liu

2018-02-15 14:34 GMT+01:00 Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Thu, 2018-02-15 at 13:49 +0100, liu.ming50@gmail.com wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > This is needed since the license_deployed_manifest task is referring
> > the deployed licenses of the depends of do_bootimg task.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/license.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/license.bbclass
> > b/meta/classes/license.bbclass
> > index d353110..10d2279 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -679,6 +679,7 @@ do_rootfs[recrdeptask] += "do_populate_lic"
> >
> >  IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
> >  do_image[recrdeptask] += "do_populate_lic"
> > +do_bootimg[recrdeptask] += "do_populate_lic"
> >
> >  python do_populate_lic_setscene () {
> >      sstate_setscene(d)
>
> How old is this patch?
>
> The recrdepends handling in bitbake changed recently and these kind of
> older issues may have been a bitbake bug. Can you describe a test
> scenario and check if master still needs this "fix"?
>
> Cheers,
>
> Richard
>
>

--94eb2c124a6a57cb50056540ccc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>I observed this issue on=
=C2=A0rocko branch, but I think upstream also needs it. Since even=C2=A0<sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:14px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">recrdepends handling had been changed in bitbake, the=
 problem here is the &quot;<span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">recrdepends</span>&quot=
; is missing between do_bootimg and=C2=A0<span style=3D"color:rgb(80,0,80);=
font-family:arial,sans-serif;font-size:14px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">do_populat=
e_lic, actually there was a bug record for it, see:=C2=A0<a href=3D"https:/=
/bugzilla.yoctoproject.org/show_bug.cgi?id=3D9446">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D9446</a>, but the fix only considered the missi=
ng=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">recrdepends of do_image, but looking into=
=C2=A0get_deployed_dependencies-&gt;get_boot_dependencies, the do_bootimg a=
lso needs a similar fix.</span></span></span></div><div><br></div><div><spa=
n style=3D"font-size:14px">//Ming Liu</span></div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">2018-02-15 14:34 GMT+01:00 Richard P=
urdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, 2018-02-15 at 1=
3:49 +0100, <a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a=
> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; This is needed since the license_deployed_manifest task is referring<b=
r>
&gt; the deployed licenses of the depends of do_bootimg task.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/license.bbclass | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/license.bbclass<br>
&gt; b/meta/classes/license.bbclass<br>
&gt; index d353110..10d2279 100644<br>
&gt; --- a/meta/classes/license.bbclass<br>
&gt; +++ b/meta/classes/license.bbclass<br>
&gt; @@ -679,6 +679,7 @@ do_rootfs[recrdeptask] +=3D &quot;do_populate_lic&=
quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0IMAGE_POSTPROCESS_COMMAND_<wbr>prepend =3D &quot;write_deploy_ma=
nifest; &quot;<br>
&gt; =C2=A0do_image[recrdeptask] +=3D &quot;do_populate_lic&quot;<br>
&gt; +do_bootimg[recrdeptask] +=3D &quot;do_populate_lic&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0python do_populate_lic_setscene () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sstate_setscene(d)<br>
<br>
</span>How old is this patch?<br>
<br>
The recrdepends handling in bitbake changed recently and these kind of<br>
older issues may have been a bitbake bug. Can you describe a test<br>
scenario and check if master still needs this &quot;fix&quot;?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--94eb2c124a6a57cb50056540ccc4--
