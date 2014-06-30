Return-Path: <sadlife1990@gmail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7870465D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 17:27:01 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id db11so8404410veb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DbWHiSS/NdAcOZh5zfFiBLYwvP3fs4JKw+fhBjVXm4Y=;
	b=ND3qX10y4UOOZYjtZiNhOyG8bhQLEFyXPWD348dRWJn7lk0DQGUklKcdzVl/0Ftc9y
	blfyypmRHSOYbZ0AshLAlg+O5OfezfD/rjAZ4FykJI2l4A9f7oTVaGdkMt3xEMDepqxs
	1IBFZMdBUGQt4Vh6o+FI3ATWyXlfuUPhl726qzsaDcC34k/sZiJZrjEmqLoUH6x6AHgE
	SFqiupCRNBOJTNo5dz1u2nFTRbX1b/hPBNFez5AdWfdssYsD1iLGOirBnzRyd5Zd9Rv5
	hwBq1FZ4LhberUfUJ29/WQ/2NsJ7K4+ixuJsXl5L7rgxowv3FwJLv4Nhtf0N5vOGyMDp
	GhMA==
MIME-Version: 1.0
X-Received: by 10.52.135.7 with SMTP id po7mr1841993vdb.50.1404149222689; Mon,
	30 Jun 2014 10:27:02 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Mon, 30 Jun 2014 10:27:02 -0700 (PDT)
In-Reply-To: <CAMCfZKE6bTaWSCGg=2Gdzau-d=tSM_Vcae60rTWTYw88mMoyJQ@mail.gmail.com>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
	<20140630081507.GA5083@ad.chargestorm.se>
	<CAMCfZKE6bTaWSCGg=2Gdzau-d=tSM_Vcae60rTWTYw88mMoyJQ@mail.gmail.com>
Date: Mon, 30 Jun 2014 20:27:02 +0300
Message-ID: <CAAHuHfw8_G0=tndHAvT+GGq2PRY7gAETDEc2qTWaqtdZvimJng@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 30 Jun 2014 17:27:06 -0000
Content-Type: multipart/alternative; boundary=bcaec52c637da14ffc04fd10f731

--bcaec52c637da14ffc04fd10f731
Content-Type: text/plain; charset=UTF-8

Hello,

How to use this layer, please explain

Thanks


2014-06-30 16:40 GMT+03:00 Diego Sueiro <diego.sueiro@gmail.com>:

>
> On Mon, Jun 30, 2014 at 5:15 AM, Anders Darander <anders@chargestorm.se>
> wrote:
>
>> * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
>>
>>
>> > On 06/30/2014 12:24 AM, Life Life wrote:
>> > > Hello,
>>
>> > > I'm trying build yocto based linux, My hardware is beaglebone black I
>> > > successfull build system image. But I can't see capemanager. Beacuse
>> my lcd is
>> > > not work.
>>
>> > Hello,
>>
>> > The cape manager is in meta-ti layer:
>>
>> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
>>
>> > Seems that we'd better add it to meta-yoco-bsp ?
>>
>> Unless something has changed since I last looked at this, I don't think
>> so.
>>
>> If I remember correctly, capemgr basically consists of a number of
>> patches not in the mainline kernel (and also not in TI's staging
>> kernel). I haven't checked it, by I doubt that we have them in the
>> linux-yocto kernel. (Especially as the last time I checked it, you had
>> to revert to a 3.8 (if I rember correctly, it might have been an even
>> earlier kernel) kernel to get full capemgr support.
>>
>> If this has changed, then it'd be interesting to know!
>>
>> Cheers,
>> Anders
>>
>
> To get cape manager support you have to use meta-beagleboard layer (
> linux-mainline_3.8.bb
> <https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline_3.8.bb>
> )
>
>
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--bcaec52c637da14ffc04fd10f731
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div>How to use this layer, please exp=
lain<br><br>Thanks<br></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">2014-06-30 16:40 GMT+03:00 Diego Sueiro <span dir=3D"ltr">=
&lt;<a href=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueir=
o@gmail.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D""><br><div class=3D"gmail_quote">On Mon, Jun 30, 2014 at 5:15=
 AM, Anders Darander <span dir=3D"ltr">&lt;<a href=3D"mailto:anders@charges=
torm.se" target=3D"_blank">anders@chargestorm.se</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">* Robert Yang &lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt; [140630 <span><span>05:47</span></span>]:<br>



<div><br>
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
Anders</div></blockquote></div><br></div>To get cape manager support you ha=
ve to use meta-beagleboard layer (<a href=3D"https://github.com/beagleboard=
/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainlin=
e_3.8.bb" title=3D"linux-mainline_3.8.bb" style=3D"background-color:rgb(248=
,248,248);color:rgb(65,131,196);text-decoration:none;font-family:Helvetica,=
arial,freesans,clean,sans-serif,&#39;Segoe UI Emoji&#39;,&#39;Segoe UI Symb=
ol&#39;;font-size:12.727272033691406px;line-height:20px;white-space:nowrap"=
 target=3D"_blank">linux-mainline_3.8.bb</a>)</div>


<div class=3D"gmail_extra"><br><br><br clear=3D"all"><div><div dir=3D"ltr">=
<div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administ=
rador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>


<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--bcaec52c637da14ffc04fd10f731--
