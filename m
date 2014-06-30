Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 38DAD601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 13:40:42 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id r5so6892897qcx.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jVycua6L/8xp7Llym9vbDTN1TRqyKXMvmW0frmaumqY=;
	b=gfIFVHmWBYPS7QgWd5tVEBNLrMMrt+jwWHXgfKu9UEnKRuoeISB4dDy3x17wAuCr8j
	Y1agt+yihYF65o1+S/p3QSAaLTXK+oqDgOd9TEd8JUCJWXapqIRT4W9FhBC2oBi3wJiC
	Hfhwd7hQVWnh0Ex1pX53YBdqGXTYdPevNj8b4oHuwulxiokEnlKYegjfvzwH3vw9/+vh
	ACCvpRpX+VEIIJY0lIkw+mEE/UATqiPhhQ8ll0ZyiWZdR64fzMiDVqvfqZ8RrbBPdNeu
	5HGNreBcasNiRMUjkzr34aXJYRy1UbLcjKpprKB/E/QF19sYCbrcJ2YKAbvYdZBcNX+h
	8xwg==
X-Received: by 10.140.41.116 with SMTP id y107mr56952071qgy.78.1404135643205; 
	Mon, 30 Jun 2014 06:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Mon, 30 Jun 2014 06:40:23 -0700 (PDT)
In-Reply-To: <20140630081507.GA5083@ad.chargestorm.se>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
	<20140630081507.GA5083@ad.chargestorm.se>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 30 Jun 2014 10:40:23 -0300
Message-ID: <CAMCfZKE6bTaWSCGg=2Gdzau-d=tSM_Vcae60rTWTYw88mMoyJQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cape Manager
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
X-List-Received-Date: Mon, 30 Jun 2014 13:40:44 -0000
Content-Type: multipart/alternative; boundary=001a11c125e83ad7ff04fd0dce77

--001a11c125e83ad7ff04fd0dce77
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 30, 2014 at 5:15 AM, Anders Darander <anders@chargestorm.se>
wrote:

> * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
>
>
> > On 06/30/2014 12:24 AM, Life Life wrote:
> > > Hello,
>
> > > I'm trying build yocto based linux, My hardware is beaglebone black I
> > > successfull build system image. But I can't see capemanager. Beacuse
> my lcd is
> > > not work.
>
> > Hello,
>
> > The cape manager is in meta-ti layer:
>
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
>
> > Seems that we'd better add it to meta-yoco-bsp ?
>
> Unless something has changed since I last looked at this, I don't think
> so.
>
> If I remember correctly, capemgr basically consists of a number of
> patches not in the mainline kernel (and also not in TI's staging
> kernel). I haven't checked it, by I doubt that we have them in the
> linux-yocto kernel. (Especially as the last time I checked it, you had
> to revert to a 3.8 (if I rember correctly, it might have been an even
> earlier kernel) kernel to get full capemgr support.
>
> If this has changed, then it'd be interesting to know!
>
> Cheers,
> Anders
>

To get cape manager support you have to use meta-beagleboard layer (
linux-mainline_3.8.bb
<https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline_3.8.bb>
)



Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c125e83ad7ff04fd0dce77
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 30, 2014 at 5:15 AM, Anders Darander <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:anders@chargestorm.se" target=3D"_blank">anders@chargestorm.s=
e</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":5fi" class=3D"" style=3D"overflow:hidden">* Ro=
bert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@wind=
river.com</a>&gt; [140630 <span class=3D"" tabindex=3D"0"><span class=3D"">=
05:47</span></span>]:<br>


<div class=3D""><br>
<br>
&gt; On 06/30/2014 12:24 AM, Life Life wrote:<br>
&gt; &gt; Hello,<br>
<br>
&gt; &gt; I&#39;m trying build yocto based linux, My hardware is beaglebone=
 black I<br>
&gt; &gt; successfull build system image. But I can&#39;t see capemanager. =
Beacuse my lcd is<br>
&gt; &gt; not work.<br>
<br>
&gt; Hello,<br>
<br>
&gt; The cape manager is in meta-ti layer:<br>
<br>
&gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/master/lay=
er/meta-ti/" target=3D"_blank">http://layers.openembedded.org/layerindex/br=
anch/master/layer/meta-ti/</a><br>
<br>
&gt; Seems that we&#39;d better add it to meta-yoco-bsp ?<br>
<br>
</div>Unless something has changed since I last looked at this, I don&#39;t=
 think<br>
so.<br>
<br>
If I remember correctly, capemgr basically consists of a number of<br>
patches not in the mainline kernel (and also not in TI&#39;s staging<br>
kernel). I haven&#39;t checked it, by I doubt that we have them in the<br>
linux-yocto kernel. (Especially as the last time I checked it, you had<br>
to revert to a 3.8 (if I rember correctly, it might have been an even<br>
earlier kernel) kernel to get full capemgr support.<br>
<br>
If this has changed, then it&#39;d be interesting to know!<br>
<br>
Cheers,<br>
Anders</div></blockquote></div><br>To get cape manager support you have to =
use meta-beagleboard layer (<a href=3D"https://github.com/beagleboard/meta-=
beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline_3.8.=
bb" class=3D"" id=3D"433d21100f1d248d1b851f6eedbd91d2-e2cfe4a35e6fa5b9e5d74=
d850577c2fdfa65a5ad" title=3D"linux-mainline_3.8.bb" style=3D"background-co=
lor:rgb(248,248,248);color:rgb(65,131,196);text-decoration:none;font-family=
:Helvetica,arial,freesans,clean,sans-serif,&#39;Segoe UI Emoji&#39;,&#39;Se=
goe UI Symbol&#39;;font-size:12.727272033691406px;line-height:20px;white-sp=
ace:nowrap">linux-mainline_3.8.bb</a>)</div>

<div class=3D"gmail_extra"><br><br><br clear=3D"all"><div><div dir=3D"ltr">=
<div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administ=
rador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c125e83ad7ff04fd0dce77--
