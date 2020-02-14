Return-Path: <andrew@avilution.com>
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEDB610B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:31:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id q9so3795395qvu.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=avilution-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZULXNdZxlK11cYlzBIVxjH2LJvH+sYAogDAmIo4mKYE=;
	b=c5oe6plz3HSg+t56r3ASJ/En0tRZUoxcW0+i4iCrQd3GlabUnFDEbLIceFWZSSMwEN
	dM7teLhyhhCMe+adD6+H8ndr98MCTMOVZDwawMnujNH3ZIOEf5h8GkLWk2LAPN80EFAx
	rBAtdjp7O/WcYwYfnGcx3CN+vwTO9ZtfzQnNYvKp/h1nAUIHZ2ZphQfEs899Unu8iijZ
	A6aVpTEHqF47q4yM9TznxuyEhT/k5iDoEL8KeYhyMDQKzrdILXsFAJE+TndTtpMnKXUv
	BdVSKb9QmvF6CI/TvA61eglbkxaOR74cDKXSSrTy6agnrKPC1lqal+dlkNYC25flWAis
	8kYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZULXNdZxlK11cYlzBIVxjH2LJvH+sYAogDAmIo4mKYE=;
	b=a76hH9OyPGIHziy7HfeW39MPrqJ4Gf8p8WDjcuDl5L/d58NY7snYH3txojP4iUPOwE
	2KkRviqUOpcQv5lQi4+2rZBZJAje7UGQiRSa6UOX6rhUh+8IVlLv0fzbIKrtQ/7doGtX
	QSYBQ6IwU+5JnTj1AFjuHuQue7/djbynETNXtbKa+VJjeOmntLzkJsanlCwl97dJ69yE
	Jm6Cm9Dqdnpf9uO9lHntoOz4HC+651IciQjjkLfrfl7fJIOxLeI0gX7N4ciyfpURrUST
	YsNMrr6lAdq6hA9J+Vpq+7PuEb88+LnCqgh26xGd9JBbcEqeseGR8HPudWNebBXljyPE
	ZkrA==
X-Gm-Message-State: APjAAAWpV/0/PN5np7er6lMS5ndJWLfT1LqX5xPjs9GntLOmJrFJOHhq
	8oYgoSYt+Sp3rVELJifv70oGhlSGtszACLaoDKOwFi1Jcg3WiQ==
X-Google-Smtp-Source: APXvYqxwYAvl/r845+aXWnfxvalbz2TodjbA60o3nqOklNt2Ckc+3Ck+H7hf76p2HRtwsMy6IpwfmCKCv1tRw7Um9no=
X-Received: by 2002:a05:6214:3aa:: with SMTP id
	m10mr3385410qvy.125.1581705060931; 
	Fri, 14 Feb 2020 10:31:00 -0800 (PST)
MIME-Version: 1.0
References: <CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com>
	<1b01b37f-ba3b-da34-8e04-81e3f2dd72fb@mvista.com>
In-Reply-To: <1b01b37f-ba3b-da34-8e04-81e3f2dd72fb@mvista.com>
From: Andrew Boos <andrew@avilution.com>
Date: Fri, 14 Feb 2020 12:30:50 -0600
Message-ID: <CAGgh2e_TzXNQejWMog37ad7kf-ruSiRw-rvCC_NpOF-PjMbUhg@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Unknown Postinstall Scriptlet Failing to Defer Boot
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
X-List-Received-Date: Fri, 14 Feb 2020 18:31:00 -0000
Content-Type: multipart/alternative; boundary="0000000000004bef9b059e8d6832"

--0000000000004bef9b059e8d6832
Content-Type: text/plain; charset="UTF-8"

Thanks Jeremy for the hint about update-alternatives. It turns out that
lmbench was installing a binary called "stream" that conflicts with
ImageMagick's own stream. All we had to do was remove lmbench from our
IMAGE_INSTALL and the problem went away. I'm posting the original error for
anyone that is having the same issue.

ERROR: imx8-image-3.0b3-r0 do_rootfs: Postinstall scriptlets of
['imagemagick'] have failed. If the intention is to defer them to first
boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Andrew


On Thu, Feb 13, 2020 at 8:02 PM Jeremy A. Puhlman <jpuhlman@mvista.com>
wrote:

> In these kind of cases, by providing the actual error message, people can
> provide more help.
>
> The recipe inherits update-alternatives and sets a large number of
> alternatives. The alternatives are done in the automatically added post
> install scripts. In all likelihood one of the listed links is wrong, or
> already a symlink or something similar.
> On 2/13/2020 4:49 PM, Andrew Boos wrote:
>
> Hi,
>
> I am working on a bitbake build and I am running into an issue where a
> postinst scriptlet is failing via "exit 1" to defer to first boot and I
> cannot figure out which recipe is causing the issue. Does anybody have any
> tips on identifying which recipe is actually exiting with a failure? The
> error log says that it is in imagemagick but the recipe does not have any
> postinst scripts defined. Also, there are no imagemagick .bbappend files in
> my layers. (
> https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
> )
>
> Thanks,
> Andrew
>
>
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> Virus-free.
> www.avg.com
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient>
> <#m_-7702559278781328841_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
>
>
> --
> Jeremy A. Puhlmanjpuhlman@mvista.com
>
>

-- 
*Andrew Boos* | Avilution, LLC
(c) 251-895-5509

--0000000000004bef9b059e8d6832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Jeremy for the hint about update-alternatives. It t=
urns out that lmbench was installing a binary called &quot;stream&quot; tha=
t conflicts with ImageMagick&#39;s own stream. All we had to do was remove =
lmbench from our IMAGE_INSTALL and the problem went away. I&#39;m posting t=
he original error for anyone that is having the same=C2=A0issue.<div><br></=
div><div>ERROR: imx8-image-3.0b3-r0 do_rootfs: Postinstall scriptlets of [&=
#39;imagemagick&#39;] have failed. If the intention is to defer them to fir=
st boot,<br>then please place them into pkg_postinst_ontarget_${PN} ().<br>=
Deferring to first boot via &#39;exit 1&#39; is no longer supported.<br></d=
iv><div><br></div><div>Andrew</div><div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 13, 2020 at 8=
:02 PM Jeremy A. Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com">jpuhlma=
n@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
 =20
   =20
 =20
  <div>
    <font size=3D"+1"><tt>In these kind of cases, by providing the actual
        error message, people can provide more help. </tt><tt><br>
      </tt><tt><br>
      </tt><tt>The recipe inherits </tt></font><tt><span style=3D"color:rgb=
(36,41,46);font-size:12px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:pre-wrap;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline"><font size=3D"+1">update-a=
lternatives and sets a large number of alternatives. The alternatives
are done in the automatically added post install scripts. In all likelihood=
 one of the listed links
is wrong, or already a symlink or something similar.</font>
</span></tt><br>
    <div>On 2/13/2020 4:49 PM, Andrew Boos
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div dir=3D"auto">Hi,</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">I am working on a bitbake build and I am running
          into an issue where a postinst scriptlet is failing via &quot;exi=
t
          1&quot; to defer to first boot and I cannot figure out which reci=
pe
          is causing the issue. Does anybody have any tips on
          identifying which recipe is actually exiting with a failure?
          The error log says that it is in imagemagick but the recipe
          does not have any postinst scripts defined. Also, there are no
          imagemagick .bbappend files in my layers. (<a href=3D"https://git=
hub.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/im=
agemagick/imagemagick_7.0.7.bb" target=3D"_blank">https://github.com/openem=
bedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imag=
emagick_7.0.7.bb</a>)</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Thanks,</div>
        <div dir=3D"auto">Andrew</div>
      </div>
      <div id=3D"gmail-m_-7702559278781328841DAB4FAD8-2DD7-40BB-A1B8-4E2AA1=
F9FDF2"><br>
        <table style=3D"border-top:1px solid rgb(211,212,222)">
          <tbody>
            <tr>
              <td style=3D"width:55px;padding-top:13px"><a href=3D"http://w=
ww.avg.com/email-signature?utm_medium=3Demail&amp;utm_source=3Dlink&amp;utm=
_campaign=3Dsig-email&amp;utm_content=3Demailclient" target=3D"_blank"><img=
 src=3D"https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-=
v1.png" alt=3D"" style=3D"width: 46px; height: 29px;" width=3D"46" height=
=3D"29"></a></td>
              <td style=3D"width:470px;padding-top:12px;color:rgb(65,66,78)=
;font-size:13px;font-family:Arial,Helvetica,sans-serif;line-height:18px">Vi=
rus-free. <a href=3D"http://www.avg.com/email-signature?utm_medium=3Demail&=
amp;utm_source=3Dlink&amp;utm_campaign=3Dsig-email&amp;utm_content=3Demailc=
lient" style=3D"color:rgb(68,83,234)" target=3D"_blank">www.avg.com</a> </t=
d>
            </tr>
          </tbody>
        </table>
        <a href=3D"#m_-7702559278781328841_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9=
FDF2" width=3D"1" height=3D"1"> </a></div>
      <br>
      <fieldset></fieldset>
    </blockquote>
    <br>
    <pre cols=3D"72">--=20
Jeremy A. Puhlman
<a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.co=
m</a>
</pre>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div styl=
e=3D"color:rgb(0,0,0);font-family:Verdana;font-size:13.3333px"><strong>Andr=
ew Boos</strong>=C2=A0| Avilution, LLC</div><div style=3D"color:rgb(0,0,0);=
font-family:Verdana;font-size:13.3333px">(c) 251-895-5509</div></div></div>=
</div></div>

--0000000000004bef9b059e8d6832--
