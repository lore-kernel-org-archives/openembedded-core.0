Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TtJoD-0001o6-Ph
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 16:12:49 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so279901dak.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2cnyRu8+CowoTK9yAcaFPWggaQwoJGQBzQp/VYyWC1o=;
	b=uYANALBnPJLrJLlb3FoqTm4ZV23Zw2dZEtLfoPf/VseUTmRb5F4FlFbPgfL4VfZkAq
	vh+t+5Ab57VI65PG2QK9dSXXKslbBI8ByyTyUDRfPqx+QKJzx2ERW4RRmICpyGJq1MND
	uDKhhvslb39SN9SdT4Rj+F4/diwuqSu5cpZhCNpyd8dSs08e2uLGtSj4vDMzrfjc4rk2
	EUPG0EmcOjK8z3pALxUYQOQeRywgQtbScpHsEroxWWQTvKs+2FgI6Mjiy1tCj/tdzhQ0
	2p015/Yxd3AdDxq3sIkwIhUQQDenUzvFRJznkeVmK1s3zNDnh8hItLwTrZ8w1MWAkyTB
	1Yew==
MIME-Version: 1.0
Received: by 10.66.80.162 with SMTP id s2mr17330326pax.61.1357829851356; Thu,
	10 Jan 2013 06:57:31 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Thu, 10 Jan 2013 06:57:31 -0800 (PST)
In-Reply-To: <50EECF09.1040205@intel.com>
References: <50EC3002.8050209@intel.com>
	<CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
	<50EEC93F.9060802@intel.com>
	<CADkTA4OJMeDCXFdFZVD20tuN04=UCSvpnb_89B706scUN-0Ytw@mail.gmail.com>
	<50EECF09.1040205@intel.com>
Date: Thu, 10 Jan 2013 09:57:31 -0500
Message-ID: <CADkTA4P-6WoXy=W19Mh2bvjMDnOcwLMkEVzv+piByaz_nkvjHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 15:12:50 -0000
Content-Type: multipart/alternative; boundary=f46d042de45ff49d8504d2f06596

--f46d042de45ff49d8504d2f06596
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 10, 2013 at 9:24 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

>
>
> On 01/10/2013 04:10 PM, Bruce Ashfield wrote:
> > I don't have any use for the rest of update-modules, so I don't disagree
> on
> > that point. I'd just like to see a form of autoload support be continued
> if
> > anything happens to update-modules. But since update-modules isn't
> > mandatory, I suppose nothing drastic will happen to it regardless, but
> > having
> > a modern equivalent would be nice :)
> >
> Just to be clear on this. Even if update-modules is removed, modules
> will still be autoloaded by modutils.sh which is run in rcS.d. Also,
> /etc/init.d/modutils.sh can be run separately.


Right, but the files that it reads are generated in kernel.bbclass, right ?
If so, the generation of those files is tied to update-modules being in the
DISTRO_FEATURES and available. So if update-modules is removed, we
want to update the kernel.bbclass to have a different generation of the
autoload config files.

Bruce


>


> Thanks,
> Laurentiu
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042de45ff49d8504d2f06596
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 10, 2013 at 9:24 AM, Laurentiu Palcu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurenti=
u.palcu@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><br>
<br>
On 01/10/2013 04:10 PM, Bruce Ashfield wrote:<br>
&gt; I don&#39;t have any use for the rest of update-modules, so I don&#39;=
t disagree on<br>
&gt; that point. I&#39;d just like to see a form of autoload support be con=
tinued if<br>
&gt; anything happens to update-modules. But since update-modules isn&#39;t=
<br>
&gt; mandatory, I suppose nothing drastic will happen to it regardless, but=
<br>
&gt; having<br>
&gt; a modern equivalent would be nice :)<br>
&gt;<br>
</div>Just to be clear on this. Even if update-modules is removed, modules<=
br>
will still be autoloaded by modutils.sh which is run in rcS.d. Also,<br>
/etc/init.d/modutils.sh can be run separately.</blockquote><div><br></div><=
div>Right, but the files that it reads are generated in kernel.bbclass, rig=
ht ?=A0</div><div>If so, the generation of those files is tied to update-mo=
dules being in the</div>
<div>DISTRO_FEATURES and available. So if update-modules is removed, we<br>=
</div><div style>want to update the kernel.bbclass to have a different gene=
ration of the=A0</div><div style>autoload config files.</div><div style><br=
>
</div><div style>Bruce</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">=A0</blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">


<br>
Thanks,<br>
Laurentiu<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--f46d042de45ff49d8504d2f06596--
