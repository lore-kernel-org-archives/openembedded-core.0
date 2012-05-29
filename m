Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SZMVM-00048V-Cc
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 15:30:32 +0200
Received: by ggnp4 with SMTP id p4so2566449ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ll8g0xRyy2yUfE6eVSmgMYhCKHE9WqdARjxaFMzDrEg=;
	b=UjPE7XilHeTBsAIB11iWWGSj028tlfvDDQ+BNQw2RRPyPjPLt4YkqDB97v21adAnCx
	hszRs/YCiNnmHKQ4G8gcDUe2jPNgJ73+magWqReczzs0ZpDTTcmBHBVeAO910iCG3GcU
	X7yQGwpKNGrJ+E3R2JGwUEXBbHJYP8BoD/4uKieA9MOUw4nNpk/Ast4Y6Bm+JmrdMIKm
	PUL8DD6jf1y5zSSK0GX+Yweqj8sq/ElWq7ruGDjdX0ptvUP7ibyATuMdvFZz4wJdikvW
	QJJUPsR8i4jVHA6rr2hc98h+8d27+C5QG2eE6AtDni1dwio09+Esq7a4c67sPnhFMe9R
	FTBg==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr7321870igc.5.1338297614422; Tue,
	29 May 2012 06:20:14 -0700 (PDT)
Received: by 10.231.238.69 with HTTP; Tue, 29 May 2012 06:20:14 -0700 (PDT)
In-Reply-To: <3418839.G4f3PdLdKK@helios>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<5252895.1gMWNIkXN5@helios>
	<CAOHjBZsnd8aZjp5ZAvPZ2p3R9AmxGoLXZhVMQjOJxS8Bto61BA@mail.gmail.com>
	<3418839.G4f3PdLdKK@helios>
Date: Tue, 29 May 2012 15:20:14 +0200
Message-ID: <CAOHjBZu6_vfPkPnVj9E48nc=1jEO9dqMG8hkrtLkLesbWZ8g6w@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 May 2012 13:30:32 -0000
Content-Type: multipart/alternative; boundary=14dae9340a99e9549004c12cb178

--14dae9340a99e9549004c12cb178
Content-Type: text/plain; charset=ISO-8859-1

2012/5/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Monday 28 May 2012 17:30:34 Giuseppe Condorelli wrote:
> > Well, I added ROOTFS_POSTPROCESS_COMMAND += "list_installed_packages ; "
> in
> > the image recipe I want to build.
> > Build went right but I don't know where to find the output the
> > list_installed_packages has provided.
> > Any suggestion? Am I wrong?
>
> All list_installed_packages does is print a list of the packages; if you
> just
> add it to ROOTFS_POSTPROCESS_COMMAND the output will be going into the log
> file
> for the image task which is probably not what you want. If you wanted to
> proceed with this I think you'd need to redirect the output to some file
> somewhere - this is easily done by instead calling your own shell function
> and
> then calling list_installed_packages > path/to/some_output_file.txt within
> it.
>
Thanks for the reply. What I'm not understanding is how I can invoke my
shell function. Do you mean
I have to invoke it as append function of populate_rootfs one? What I
really need is a way to query the rpm database
out from the build system, as we normally do with host packages.
I tried to have a standalone run of  the rpm command the
list_installed_packages invokes but (obviously) I got a long series of
errors.


> However it sounds like buildhistory will do what you want here anyway.
>
> Well, that adds usefull information but I actually need the one above.

> Cheers,
> Paul
>
>
Thanks again,
Giuseppe


> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--14dae9340a99e9549004c12cb178
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/5/28 Paul Eggleton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pa=
ul.eggleton@linux.intel.com</a>&gt;</span><br><blockquote style=3D"margin:0=
px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border=
-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Monday 28 May 2012 17:30:34 Giuseppe Condorelli wrote:=
<br>
&gt; Well, I added ROOTFS_POSTPROCESS_COMMAND +=3D &quot;list_installed_pac=
kages ; &quot; in<br>
&gt; the image recipe I want to build.<br>
&gt; Build went right but I don&#39;t know where to find the output the<br>
&gt; list_installed_packages has provided.<br>
&gt; Any suggestion? Am I wrong?<br>
<br>
</div>All list_installed_packages does is print a list of the packages; if =
you just<br>
add it to ROOTFS_POSTPROCESS_COMMAND the output will be going into the log =
file<br>
for the image task which is probably not what you want. If you wanted to<br=
>
proceed with this I think you&#39;d need to redirect the output to some fil=
e<br>
somewhere - this is easily done by instead calling your own shell function =
and<br>
then calling list_installed_packages &gt; path/to/some_output_file.txt with=
in it.<br></blockquote><div>Thanks for the reply.=A0What I&#39;m not unders=
tanding is how I can invoke my shell function.=A0Do you mean</div><div>I=A0=
have to invoke it as append function of populate_rootfs one? What I really=
=A0need is a way to query the rpm database</div>
<div>out from the build system, as we normally do with host packages.</div>=
<div>I tried to have a standalone run=A0of =A0the rpm command the list_inst=
alled_packages invokes but (obviously) I got a long series of errors.</div>
<div>=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1e=
x;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-styl=
e:solid" class=3D"gmail_quote">
However it sounds like buildhistory will do what you want here anyway.<br>
<br></blockquote><div>Well, that=A0adds usefull information but I=A0actuall=
y need the one above.=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex=
;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;=
border-left-style:solid" class=3D"gmail_quote">

Cheers,<br>
Paul<br>
<div class=3D"HOEnZb"><div class=3D"h5">=A0</div></div></blockquote><div>Th=
anks again,</div><div>Giuseppe=A0</div><div>=A0</div><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204)=
;border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"HOEnZb"><div class=3D"h5">
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>

--14dae9340a99e9549004c12cb178--
