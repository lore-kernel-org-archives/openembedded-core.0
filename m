Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED3966B6F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 13:55:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id y205so3138681qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N/yKN/7c5OTccODsNU6adWPzW7uaOfIBIIF7EoiwN4o=;
	b=QzJ/ocS4pGhFTzibBipLw729cuiQBzSrYZylcb55qBPkur82Qlt5ov0MiW38M1XIOy
	rVdmPzn/0PUcKNGYNAJUg6n/n5DkNBWVdTiMIsu/zGTCR5EdpVOnZyPjWPTilVGL1idp
	yKgHz37IhcxDj6G66geezE/GuTREwijaX4uxihAj0K8FCIf8OAvT9UsU702Tlxeg0esT
	/Fb3ew7RV01qk8mlFn45F4c0b2YkAdJKaEzbE/Gb9ejPBJJC0jndzkVijRfnljExModH
	MO1hr6FNiNmJo4lpS9OqVx53tfAx2X+y4jtjXWAgBTl44skYCHCdUmv2bREgjX+Rt/iU
	enuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N/yKN/7c5OTccODsNU6adWPzW7uaOfIBIIF7EoiwN4o=;
	b=SyEV+RROcp7Df70kEh66LZSZEPwpPcK4UYGxCx08xdSsmxAcncyPoWH2SrkWv07IQD
	cAH+4JwX1hw0qtDYDzKKmbwMzKh5M3l7irkv7jgkL7cOW6w31Z5UmMAI174X5saRmCCZ
	ySEj8Vnvv8s6rmv7eHxyMrMV/u1KOCjkxAfIL+z5AT/Ym20h3lVuzIHarQ1NRxL4fTGi
	22i4BTq5ABIRrgx31JvhaqgZCIZzg7SiLDXFmo4RfN3WQbLae3S84w2icS+Xoz1h+rO0
	V1ku+inhB1sm7O1m8OPOJOPwPc//4T/WZQ9XgixTVcgOavjtyvEwrjfzVOIPl+MSAtFE
	KtqA==
X-Gm-Message-State: AKaTC03z0UsYJXYkQxuFz+w3l11mM447psS4AEHv+v5IqI9/ip5pfKSzpZD2Ew31lR9EQmRYFY267H5SHiPGdg==
X-Received: by 10.55.122.197 with SMTP id v188mr1858007qkc.120.1479995728686; 
	Thu, 24 Nov 2016 05:55:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Thu, 24 Nov 2016 05:55:27 -0800 (PST)
In-Reply-To: <9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
References: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
	<9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Nov 2016 08:55:27 -0500
Message-ID: <CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 24 Nov 2016 13:55:28 -0000
Content-Type: multipart/alternative; boundary=94eb2c065d9ead7a0805420c5b71

--94eb2c065d9ead7a0805420c5b71
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 24, 2016 at 5:32 AM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> On 24-11-16 11:10, Mike Looijmans wrote:
>
>> I'm currently experiencing a problem with "defconfig" files and the
>> kernel.
>>
>> In short, when I make a change to the "defconfig" file, the kernel is
>> rebuilt
>> (which is correct), but the resulting kernel has been built using the old
>> defconfig from a previous build, instead of the new one.
>>
>> The kernel recipe just contains "file://defconfig" in its SRC_URI. The
>> defconfig file is in the project's overlay.
>>
>> For example, I have a kernel with "CONFIG_DEVMEM" disabled:
>>
>> # gunzip < /proc/config.gz | grep DEVMEM
>> # CONFIG_DEVMEM is not set
>>
>> Now, I change the defconfig to contain CONFIG_DEVMEM=y and build the
>> image.
>> The result:
>>
>> # gunzip < /proc/config.gz | grep DEVMEM
>> # CONFIG_DEVMEM is not set
>>
>> So the change did not make it into the actual kernel, even though the
>> kernel
>> was rebuild as a result of the change.
>>
>> I run "bitbake -c cleansstate virtual/kernel" and build the image again:
>>
>> # gunzip < /proc/config.gz | grep DEVMEM
>> CONFIG_DEVMEM=y
>>
>> After cleaning, the result is correct and the new defconfig is active.
>>
>> I'm trying to figure out how this can happen, any help is welcome...
>>
>
> What seems to be the problem is this code in kernel.bbclass:
>
>         # Copy defconfig to .config if .config does not exist. This allows
>         # recipes to manage the .config themselves in
> do_configure_prepend().
>         if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>                 cp "${WORKDIR}/defconfig" "${B}/.config"
>         fi
>
> This keeps any existing ".config" file if it happens to still be in the $B
> path, which is the case if you're rebuilding a kernel.
>
> I see two possible ways to fix this.
>
> 1) During "cleanup" also remove the .config file in the build dir.
> However, the build dir is probably kept alive for a reason? I also can't
> figure out how that "cleanup" is being done.
>
>
> 2) Remove the second part of the "if" statement, so it becomes:
>
>         # Copy defconfig to .config if "defconfig" exists. This allows
>         # recipes to manage the .config themselves in
> do_configure_prepend().
>         if [ -f "${WORKDIR}/defconfig" ]; then
>                 cp "${WORKDIR}/defconfig" "${B}/.config"
>         fi
>
> I've tested that, and it solves my problem. However, it will probably
> break other people's config mangling?
>
>
Yep, in particular all the fragment processing which has the capability of
starting
with a defconfig and then apply fragments from any number of other places.
When
that task completes, a full .config is in ${B}.  If that statement comes
along and
clobbers the .config ...

I'm actually working in the 2.3 release cycle to make the fragment
processing
be available to all kernels, which will likely solve this problem .. but we
can't
wait for that.

So I'm hoping that there's a way to make the behaviour cover both use cases.

Maybe someone with more bitbake knowledge can point out a way that can
detect if the task is being run due to a change in the task signature.

Since if you've modified the defconfig, the task is being re-run for that
change
and at that point we could safely remove the .config (versus forcing it on
the
clean step).

Bruce




>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c065d9ead7a0805420c5b71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 24, 2016 at 5:32 AM, Mike Looijmans <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@=
topic.nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On 24-11-16 11:10, Mike Looijmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;m currently experiencing a problem with &quot;defconfig&quot; files a=
nd the kernel.<br>
<br>
In short, when I make a change to the &quot;defconfig&quot; file, the kerne=
l is rebuilt<br>
(which is correct), but the resulting kernel has been built using the old<b=
r>
defconfig from a previous build, instead of the new one.<br>
<br>
The kernel recipe just contains &quot;file://defconfig&quot; in its SRC_URI=
. The<br>
defconfig file is in the project&#39;s overlay.<br>
<br>
For example, I have a kernel with &quot;CONFIG_DEVMEM&quot; disabled:<br>
<br>
# gunzip &lt; /proc/config.gz | grep DEVMEM<br>
# CONFIG_DEVMEM is not set<br>
<br>
Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and build the imag=
e.<br>
The result:<br>
<br>
# gunzip &lt; /proc/config.gz | grep DEVMEM<br>
# CONFIG_DEVMEM is not set<br>
<br>
So the change did not make it into the actual kernel, even though the kerne=
l<br>
was rebuild as a result of the change.<br>
<br>
I run &quot;bitbake -c cleansstate virtual/kernel&quot; and build the image=
 again:<br>
<br>
# gunzip &lt; /proc/config.gz | grep DEVMEM<br>
CONFIG_DEVMEM=3Dy<br>
<br>
After cleaning, the result is correct and the new defconfig is active.<br>
<br>
I&#39;m trying to figure out how this can happen, any help is welcome...<br=
>
</blockquote>
<br></span>
What seems to be the problem is this code in kernel.bbclass:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy defconfig to .config if .config does not=
 exist. This allows<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # recipes to manage the .config themselves in d=
o_configure_prepend().<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${WORKDIR}/defconfig&quot; ] &amp=
;&amp; [ ! -f &quot;${B}/.config&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp &quot;${WORKDIR}=
/defconfig&quot; &quot;${B}/.config&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
This keeps any existing &quot;.config&quot; file if it happens to still be =
in the $B path, which is the case if you&#39;re rebuilding a kernel.<br>
<br>
I see two possible ways to fix this.<br>
<br>
1) During &quot;cleanup&quot; also remove the .config file in the build dir=
. However, the build dir is probably kept alive for a reason? I also can&#3=
9;t figure out how that &quot;cleanup&quot; is being done.<br>
<br>
<br>
2) Remove the second part of the &quot;if&quot; statement, so it becomes:<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy defconfig to .config if &quot;defconfig&=
quot; exists. This allows<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # recipes to manage the .config themselves in d=
o_configure_prepend().<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${WORKDIR}/defconfig&quot; ]; the=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp &quot;${WORKDIR}=
/defconfig&quot; &quot;${B}/.config&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
I&#39;ve tested that, and it solves my problem. However, it will probably b=
reak other people&#39;s config mangling?<div class=3D"HOEnZb"><div class=3D=
"h5"><br></div></div></blockquote><br></div><div class=3D"gmail_quote">Yep,=
 in particular all the fragment processing which has the capability of star=
ting<br></div><div class=3D"gmail_quote">with a defconfig and then apply fr=
agments from any number of other places. When<br></div><div class=3D"gmail_=
quote">that task completes, a full .config is in ${B}.=C2=A0 If that statem=
ent comes along and<br></div><div class=3D"gmail_quote">clobbers the .confi=
g ...<br><br></div><div class=3D"gmail_quote">I&#39;m actually working in t=
he 2.3 release cycle to make the fragment processing<br></div><div class=3D=
"gmail_quote">be available to all kernels, which will likely solve this pro=
blem .. but we can&#39;t <br></div><div class=3D"gmail_quote">wait for that=
.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
</div><div class=3D"gmail_quote">So I&#39;m hoping that there&#39;s a way t=
o make the behaviour cover both use cases.</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Maybe someone with more bitbake knowle=
dge can point out a way that can<br></div><div class=3D"gmail_quote">detect=
 if the task is being run due to a change in the task signature. <br><br>Si=
nce if you&#39;ve modified the defconfig, the task is being re-run for that=
 change<br>and at that point we could safely remove the .config (versus for=
cing it on the<br></div><div class=3D"gmail_quote">clean step).<br><br></di=
v><div class=3D"gmail_quote">Bruce<br></div><div class=3D"gmail_quote"><br>=
<br></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">
<br>
<br>
Kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
TOPIC Products<br>
Materiaalweg 4, NL-5681 RJ Best<br>
Postbus 440, NL-5680 AK Best<br>
Telefoon: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079" value=3D"+31=
499336979" target=3D"_blank">+31 (0) 499 33 69 79</a><br>
E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blan=
k">mike.looijmans@topicproducts.c<wbr>om</a><br>
Website: <a href=3D"http://www.topicproducts.com" rel=3D"noreferrer" target=
=3D"_blank">www.topicproducts.com</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
<br>
<br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c065d9ead7a0805420c5b71--
