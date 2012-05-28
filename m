Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SZ23v-0002as-F8
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 17:40:51 +0200
Received: by yenl13 with SMTP id l13so1461243yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7P/7+u55hHw9a7c8pV4snj0IdoHn1GBTtOCSURIF3LE=;
	b=A5FNFUwjv9itUp57lSA8Gy1GSE25uafLs2rnEfgIQDtjfnlAxsU8K/A2J3MAYTIUNe
	b/J1E7egcvHYCycFukLTg1a/33EIR3AwgJc6cUF5u5Si9YEPDuwj2kOzMxUGmxJqtbpg
	ov8PUy/B4GOjsJ+zfWybBB8ODMLtoNhfz+s0P+c5RB5xkesrTb+cJy3A04+bCZoOm+Qf
	mJq5EOtoh2qWeKU9tPKL2q7Fjc0dd3B1/nZTQSeiPvvyCtVm5P21t9/jnBTZMSi+XGI5
	r7OO51+islB3o5ADyXfNegYmU6tkNKgBl6vfO6EicrFez9MG76/8jylKztxsUhMboiAv
	/4jQ==
MIME-Version: 1.0
Received: by 10.42.175.10 with SMTP id ay10mr2576099icb.14.1338219034648; Mon,
	28 May 2012 08:30:34 -0700 (PDT)
Received: by 10.231.238.69 with HTTP; Mon, 28 May 2012 08:30:34 -0700 (PDT)
In-Reply-To: <5252895.1gMWNIkXN5@helios>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<5252895.1gMWNIkXN5@helios>
Date: Mon, 28 May 2012 17:30:34 +0200
Message-ID: <CAOHjBZsnd8aZjp5ZAvPZ2p3R9AmxGoLXZhVMQjOJxS8Bto61BA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to query installed rpm packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 15:40:51 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8d8431217604c11a663c

--90e6ba6e8d8431217604c11a663c
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

first of all many thanks for your quick reply. :)

2012/5/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Monday 28 May 2012 15:14:32 Giuseppe Condorelli wrote:
> > I need to query, via rpm command, the packages installed building an own
> > image recipe.
> > I know the populate_rootfs step for images uses rpm to install the
> packages
> > (if we set PACKAGE_CLASSES).
> > To do this it sets a dbpath and a root path for installing the packages.
> > I need to know how to query them (rpm -qa ....) given that dbpath is set
> to
> > /var/lib/rpm but I think it actually doesn't override
> > the real /var/lib/rpm database (also I'm not building as superuser).
>
> Have a look at list_installed_packages() in classes/rootfs_rpm.bbclass;
> that
> does exactly this. You can call this from your own shell function which you
> can add to ROOTFS_POSTPROCESS_COMMAND.
>

Well, I added ROOTFS_POSTPROCESS_COMMAND += "list_installed_packages ; " in
the image recipe I want to build.
Build went right but I don't know where to find the output the
list_installed_packages has provided.
Any suggestion? Am I wrong?


>
> Note that if all you want is a listing of the installed packages in a file
> that
> gets written every time an image is built, you can get that using
> buildhistory
> without any extra work:
>
> https://wiki.yoctoproject.org/wiki/Buildhistory
>

I've tried this and the generated output is very usefull for me.
At the moment, given that I already had all the packages built, it created
only the image history information.
Now I'll run a clean build to collect also packages info.


>
> Cheers,
> Paul
>
Cheers,
Giuseppe

>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--90e6ba6e8d8431217604c11a663c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,</div><div>=A0</div><div>first of all many thanks for your qui=
ck reply. :)<br><br></div><div class=3D"gmail_quote">2012/5/28 Paul Eggleto=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" ta=
rget=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"HOEnZb"><div class=3D"h5">On Monday 28 May 2=
012 15:14:32 Giuseppe Condorelli wrote:<br>

&gt; I need to query, via rpm command, the packages installed building an o=
wn<br>
&gt; image recipe.<br>
&gt; I know the populate_rootfs step for images uses rpm to install the pac=
kages<br>
&gt; (if we set PACKAGE_CLASSES).<br>
&gt; To do this it sets a dbpath and a root path for installing the package=
s.<br>
&gt; I need to know how to query them (rpm -qa ....) given that dbpath is s=
et to<br>
&gt; /var/lib/rpm but I think it actually doesn&#39;t override<br>
&gt; the real /var/lib/rpm database (also I&#39;m not building as superuser=
).<br>
<br>
</div></div>Have a look at list_installed_packages() in classes/rootfs_rpm.=
bbclass; that<br>
does exactly this. You can call this from your own shell function which you=
<br>
can add to ROOTFS_POSTPROCESS_COMMAND.<br></blockquote><div>=A0</div><div>W=
ell, I added ROOTFS_POSTPROCESS_COMMAND +=3D &quot;list_installed_packages =
; &quot; in the image recipe I want to build.</div><div>Build went right bu=
t I don&#39;t know where to find the output the list_installed_packages has=
=A0provided.</div>
<div>Any suggestion? Am I wrong?</div><div>=A0</div><blockquote style=3D"ma=
rgin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);=
border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<br>
Note that if all you want is a listing of the installed packages in a file =
that<br>
gets written every time an image is built, you can get that using buildhist=
ory<br>
without any extra work:<br>
<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Buildhistory" target=3D"_blan=
k">https://wiki.yoctoproject.org/wiki/Buildhistory</a><br></blockquote><div=
>=A0</div><div>I&#39;ve tried this and=A0the generated output is very usefu=
ll for me.</div>
<div>At the moment, given that I already had all the packages built, it cre=
ated only the image history information.</div><div>Now I&#39;ll run a clean=
 build to=A0collect also packages info.</div><div>=A0</div><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,20=
4,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quote"=
>

<br>
Cheers,<br>
Paul<br></blockquote><div>Cheers,</div><div>Giuseppe=A0</div><blockquote st=
yle=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,=
204,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quot=
e">

<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</blockquote></div><br>

--90e6ba6e8d8431217604c11a663c--
