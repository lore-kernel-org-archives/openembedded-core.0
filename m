Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6104F60123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:03:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so7277545pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 18:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=Uvf7fG7kr3M/M/095jsAPe99oi7rOkHtexBHH/z5mHA=;
	b=M4EKJhCSUNgkyF0bM8B5anb1Asu8JCxWYM1eNi8nT0ess/Hf5ZAzJcM/clsvWULW5E
	Cq4P909wXHux2OB63hklM4Yb6Y2Vr9lI2majqjJgRclq054Geq8JTz/4h5cTF3Na0Pe4
	ZCj28T5lazNIXSoATP24Zycpbg/RUigfOyhex2cFPiVucFyJHRjFrQmp3VEweaoSZo+W
	QN2hPyj1hCJU8puxnMBT1VNZldWF+dN+xIh4cFpYwhVH+j06+XPDAGKEwr3NrgDKfLiq
	IB1o6Q2nzwqFz/ZyLGX0ExOGPk9VQRzXN3l16ilzFYT7eNY2eNQYAsO5WGQ4iddSdmbh
	VOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=Uvf7fG7kr3M/M/095jsAPe99oi7rOkHtexBHH/z5mHA=;
	b=hydWnF6bN1MjYnO9buA2ogxRgHf+xeYEScuwXjocFrp9DcBDgO+OCB6hCcYZnjdMlD
	8FhDriDw02dR6NMAr7FIzcw6xnIqGVViY8rzxcxaSeuXXm9nnYq8le2v9ZgeNodWZAfv
	mPa4Qqszco56m/2UukYdwJwiyQYpX28+5zgSwb07BbZ0uhaeh6uwpR3RANk0FwGqVe08
	+j7ijf3ZSq5ackcb2hgLW1HSCydbTHyvMevBoPvbadoYXQN/mbkxm1EGDmLE+92dQ+Zn
	M171p64D/BbUos0wMNrBOY56xjwaKZnnR6ySqSEiPIlosLhCLS5yvtEmTsLc8Q139xV/
	EpWQ==
X-Gm-Message-State: AKaTC01Fm6IlGztjnaRaeFOzxyqdKxKXo5+wParbUF34wEEg+PPN0V+qux+JXzK++BbVNA==
X-Received: by 10.99.145.74 with SMTP id l71mr45434565pge.128.1480385017690;
	Mon, 28 Nov 2016 18:03:37 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:f08c:19b4:e718:7b0b?
	([2601:646:8882:b8c:f08c:19b4:e718:7b0b])
	by smtp.gmail.com with ESMTPSA id
	q26sm90069448pfk.94.2016.11.28.18.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 18:03:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <B3A9B210-3501-47BB-8B16-CC31C7A4BCC5@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 28 Nov 2016 18:03:36 -0800
In-Reply-To: <CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
	<9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
	<CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
X-Mailer: Apple Mail (2.3251)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel: Builds use old version of defconfig
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
X-List-Received-Date: Tue, 29 Nov 2016 02:03:38 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8B0D2BB0-AF08-43B5-B246-A3D4970E0C04"

--Apple-Mail=_8B0D2BB0-AF08-43B5-B246-A3D4970E0C04
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 24, 2016, at 5:55 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
>=20
>=20
> On Thu, Nov 24, 2016 at 5:32 AM, Mike Looijmans =
<mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>> wrote:
> On 24-11-16 11:10, Mike Looijmans wrote:
> I'm currently experiencing a problem with "defconfig" files and the =
kernel.
>=20
> In short, when I make a change to the "defconfig" file, the kernel is =
rebuilt
> (which is correct), but the resulting kernel has been built using the =
old
> defconfig from a previous build, instead of the new one.
>=20
> The kernel recipe just contains "file://defconfig" in its SRC_URI. The
> defconfig file is in the project's overlay.
>=20
> For example, I have a kernel with "CONFIG_DEVMEM" disabled:
>=20
> # gunzip < /proc/config.gz | grep DEVMEM
> # CONFIG_DEVMEM is not set
>=20
> Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and build the =
image.
> The result:
>=20
> # gunzip < /proc/config.gz | grep DEVMEM
> # CONFIG_DEVMEM is not set
>=20
> So the change did not make it into the actual kernel, even though the =
kernel
> was rebuild as a result of the change.
>=20
> I run "bitbake -c cleansstate virtual/kernel" and build the image =
again:
>=20
> # gunzip < /proc/config.gz | grep DEVMEM
> CONFIG_DEVMEM=3Dy
>=20
> After cleaning, the result is correct and the new defconfig is active.
>=20
> I'm trying to figure out how this can happen, any help is welcome...
>=20
> What seems to be the problem is this code in kernel.bbclass:
>=20
>         # Copy defconfig to .config if .config does not exist. This =
allows
>         # recipes to manage the .config themselves in =
do_configure_prepend().
>         if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; =
then
>                 cp "${WORKDIR}/defconfig" "${B}/.config"
>         fi
>=20
> This keeps any existing ".config" file if it happens to still be in =
the $B path, which is the case if you're rebuilding a kernel.
>=20
> I see two possible ways to fix this.
>=20
> 1) During "cleanup" also remove the .config file in the build dir. =
However, the build dir is probably kept alive for a reason? I also can't =
figure out how that "cleanup" is being done.
>=20
>=20
> 2) Remove the second part of the "if" statement, so it becomes:
>=20
>         # Copy defconfig to .config if "defconfig" exists. This allows
>         # recipes to manage the .config themselves in =
do_configure_prepend().
>         if [ -f "${WORKDIR}/defconfig" ]; then
>                 cp "${WORKDIR}/defconfig" "${B}/.config"
>         fi
>=20
> I've tested that, and it solves my problem. However, it will probably =
break other people's config mangling?
>=20
>=20
> Yep, in particular all the fragment processing which has the =
capability of starting
> with a defconfig and then apply fragments from any number of other =
places. When
> that task completes, a full .config is in ${B}.  If that statement =
comes along and
> clobbers the .config =E2=80=A6

so you either assume that .config is valid once generated or you dont. =
When a configure task
is triggered it should recreate .config everytime.=20

>=20
> I'm actually working in the 2.3 release cycle to make the fragment =
processing
> be available to all kernels, which will likely solve this problem .. =
but we can't=20
> wait for that.
>=20
> So I'm hoping that there's a way to make the behaviour cover both use =
cases.
>=20
> Maybe someone with more bitbake knowledge can point out a way that can
> detect if the task is being run due to a change in the task signature.=20=

>=20
> Since if you've modified the defconfig, the task is being re-run for =
that change
> and at that point we could safely remove the .config (versus forcing =
it on the
> clean step).
>=20
> Bruce
>=20
>=20
> =20
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79 =
<tel:%2B31%20%280%29%20499%2033%2069%2079>
> E-mail: mike.looijmans@topicproducts.com =
<mailto:mike.looijmans@topicproducts.com>
> Website: www.topicproducts.com <http://www.topicproducts.com/>
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end"
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_8B0D2BB0-AF08-43B5-B246-A3D4970E0C04
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 24, 2016, at 5:55 AM, Bruce Ashfield &lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" =
class=3D"">bruce.ashfield@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><div class=3D"gmail_extra"><br=
 class=3D"Apple-interchange-newline"><br class=3D""><div =
class=3D"gmail_quote">On Thu, Nov 24, 2016 at 5:32 AM, Mike =
Looijmans<span class=3D"Apple-converted-space">&nbsp;</span><span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" =
target=3D"_blank" class=3D"">mike.looijmans@topic.nl</a>&gt;</span><span =
class=3D"Apple-converted-space">&nbsp;</span>wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px =
0px 0.8ex; border-left-width: 1px; border-left-color: rgb(204, 204, =
204); border-left-style: solid; padding-left: 1ex;"><span class=3D"">On =
24-11-16 11:10, Mike Looijmans wrote:<br class=3D""><blockquote =
class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; =
border-left-width: 1px; border-left-color: rgb(204, 204, 204); =
border-left-style: solid; padding-left: 1ex;">I'm currently experiencing =
a problem with "defconfig" files and the kernel.<br class=3D""><br =
class=3D"">In short, when I make a change to the "defconfig" file, the =
kernel is rebuilt<br class=3D"">(which is correct), but the resulting =
kernel has been built using the old<br class=3D"">defconfig from a =
previous build, instead of the new one.<br class=3D""><br class=3D"">The =
kernel recipe just contains "<a href=3D"file://defconfig" =
class=3D"">file://defconfig</a>" in its SRC_URI. The<br =
class=3D"">defconfig file is in the project's overlay.<br class=3D""><br =
class=3D"">For example, I have a kernel with "CONFIG_DEVMEM" =
disabled:<br class=3D""><br class=3D""># gunzip &lt; /proc/config.gz | =
grep DEVMEM<br class=3D""># CONFIG_DEVMEM is not set<br class=3D""><br =
class=3D"">Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and =
build the image.<br class=3D"">The result:<br class=3D""><br class=3D""># =
gunzip &lt; /proc/config.gz | grep DEVMEM<br class=3D""># CONFIG_DEVMEM =
is not set<br class=3D""><br class=3D"">So the change did not make it =
into the actual kernel, even though the kernel<br class=3D"">was rebuild =
as a result of the change.<br class=3D""><br class=3D"">I run "bitbake =
-c cleansstate virtual/kernel" and build the image again:<br =
class=3D""><br class=3D""># gunzip &lt; /proc/config.gz | grep DEVMEM<br =
class=3D"">CONFIG_DEVMEM=3Dy<br class=3D""><br class=3D"">After =
cleaning, the result is correct and the new defconfig is active.<br =
class=3D""><br class=3D"">I'm trying to figure out how this can happen, =
any help is welcome...<br class=3D""></blockquote><br =
class=3D""></span>What seems to be the problem is this code in =
kernel.bbclass:<br class=3D""><br class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span># Copy =
defconfig to .config if .config does not exist. This allows<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span># recipes to manage the =
.config themselves in do_configure_prepend().<br class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>if =
[ -f "${WORKDIR}/defconfig" ] &amp;&amp; [ ! -f "${B}/.config" ]; =
then<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>cp =
"${WORKDIR}/defconfig" "${B}/.config"<br class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>fi<br =
class=3D""><br class=3D"">This keeps any existing ".config" file if it =
happens to still be in the $B path, which is the case if you're =
rebuilding a kernel.<br class=3D""><br class=3D"">I see two possible =
ways to fix this.<br class=3D""><br class=3D"">1) During "cleanup" also =
remove the .config file in the build dir. However, the build dir is =
probably kept alive for a reason? I also can't figure out how that =
"cleanup" is being done.<br class=3D""><br class=3D""><br class=3D"">2) =
Remove the second part of the "if" statement, so it becomes:<br =
class=3D""><br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span># Copy defconfig to .config =
if "defconfig" exists. This allows<br class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span># recipes to =
manage the .config themselves in do_configure_prepend().<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>if [ -f =
"${WORKDIR}/defconfig" ]; then<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>cp "${WORKDIR}/defconfig" =
"${B}/.config"<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span>fi<br class=3D""><br =
class=3D"">I've tested that, and it solves my problem. However, it will =
probably break other people's config mangling?<div class=3D"HOEnZb"><div =
class=3D"h5"><br class=3D""></div></div></blockquote><br =
class=3D""></div><div class=3D"gmail_quote">Yep, in particular all the =
fragment processing which has the capability of starting<br =
class=3D""></div><div class=3D"gmail_quote">with a defconfig and then =
apply fragments from any number of other places. When<br =
class=3D""></div><div class=3D"gmail_quote">that task completes, a full =
.config is in ${B}.&nbsp; If that statement comes along and<br =
class=3D""></div><div class=3D"gmail_quote">clobbers the .config =
=E2=80=A6</div></div></div></div></blockquote><div><br =
class=3D""></div><div>so you either assume that .config is valid once =
generated or you dont. When a configure task</div><div>is triggered it =
should recreate .config everytime.&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><br class=3D""></div><div=
 class=3D"gmail_quote">I'm actually working in the 2.3 release cycle to =
make the fragment processing<br class=3D""></div><div =
class=3D"gmail_quote">be available to all kernels, which will likely =
solve this problem .. but we can't<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""></div><div =
class=3D"gmail_quote">wait for that.<br class=3D""></div><div =
class=3D"gmail_quote"><br class=3D""></div><div =
class=3D"gmail_quote"></div><div class=3D"gmail_quote">So I'm hoping =
that there's a way to make the behaviour cover both use cases.</div><div =
class=3D"gmail_quote"><br class=3D""></div><div =
class=3D"gmail_quote">Maybe someone with more bitbake knowledge can =
point out a way that can<br class=3D""></div><div =
class=3D"gmail_quote">detect if the task is being run due to a change in =
the task signature.<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">Since if you've modified the defconfig, the =
task is being re-run for that change<br class=3D"">and at that point we =
could safely remove the .config (versus forcing it on the<br =
class=3D""></div><div class=3D"gmail_quote">clean step).<br class=3D""><br=
 class=3D""></div><div class=3D"gmail_quote">Bruce<br =
class=3D""></div><div class=3D"gmail_quote"><br class=3D""><br =
class=3D""></div><div class=3D"gmail_quote"><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin: =
0px 0px 0px 0.8ex; border-left-width: 1px; border-left-color: rgb(204, =
204, 204); border-left-style: solid; padding-left: 1ex;"><div =
class=3D"HOEnZb"><div class=3D"h5"><br class=3D""><br class=3D"">Kind =
regards,<br class=3D""><br class=3D"">Mike Looijmans<br class=3D"">System =
Expert<br class=3D""><br class=3D"">TOPIC Products<br =
class=3D"">Materiaalweg 4, NL-5681 RJ Best<br class=3D"">Postbus 440, =
NL-5680 AK Best<br class=3D"">Telefoon:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079" value=3D"+31499336979" =
target=3D"_blank" class=3D"">+31 (0) 499 33 69 79</a><br =
class=3D"">E-mail:<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blank" =
class=3D"">mike.looijmans@topicproducts.c<wbr class=3D"">om</a><br =
class=3D"">Website:<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://www.topicproducts.com/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">www.topicproducts.com</a><br class=3D""><br =
class=3D"">Please consider the environment before printing this =
e-mail<br class=3D""><br class=3D""><br class=3D""><br class=3D""><br =
class=3D""><br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">______________________________<wbr =
class=3D"">_________________<br class=3D"">Openembedded-core mailing =
list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blank"=
 class=3D"">Openembedded-core@lists.openem<wbr =
class=3D"">bedded.org</a><br class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr class=3D"">core</a><br =
class=3D""></div></div></blockquote></div><br class=3D""><br clear=3D"all"=
 class=3D""><br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><div =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature">"Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its =
end"</div></div></div><span style=3D"font-family: Times-Roman; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Times-Roman; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Openembedded-core =
mailing list</span><br style=3D"font-family: Times-Roman; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"font-family: Times-Roman; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_8B0D2BB0-AF08-43B5-B246-A3D4970E0C04--
