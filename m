Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC7D60770
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 19:03:00 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id b81so53588681lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8sd/SLaI1LnaRHKpCCf1lo1BtEeH58s7OjUhPW3WpzY=;
	b=ue8Xz91LOIVFD4B8Op8FSsKunQEsBGpuRz/11gQ/Tc5DAea86ni+nME54+yAkLpzif
	2h9Ob9Op3eDKS0usGuuad0+nwTTc2XOd4d068S9uKe2ogop+K946cm1TC1z1ZKRIsQx5
	S/80gg5EUDa8d+CeyVbuJsv9sFS/+1pk3II8+m2TSxBFuztA9ckjwspr4gE7EpXbBCKK
	G0kVlM0aBWLDKpVaxdQSdCR6Kl5/ut//H0B9g2/KHUFPuMLxV/WwYxVR10JPH208ur6J
	U+LinGegV6uPh8VLTVwdW+MU0usbCDpY4AR0uFUHQ/hIs2rbMWLgy9GJv0iHKiBtk39X
	xu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8sd/SLaI1LnaRHKpCCf1lo1BtEeH58s7OjUhPW3WpzY=;
	b=TX8kgOsTLaLk7wGJFFGG3ktxB6v8DGmwPItwZZB+nKukEJCU7kqyAE7F0b0pJwKLDb
	gMSLVfFscdpFg/SYLqVlYVlh92e4xoI2FaCsVNtzbNxku5qolk6sOUO6Y/mPBDt2WqAN
	/AZ2e8wnEE3qwQ0pJ+1ytG4vAfr41DDLHq3fnvKn+/3HFNiwbHLV/VRO+spbzZb+ELwr
	plfN++csxa/P4CLQaWvJBNWWP5AKrhXUkVdH6ExWypcoYPEs/JroAPfOyMgkeJXU026g
	cXa35mzvgU8CdRWwEpTJEw2k5ghBC8DDF/Sv6IECj8sPGX54xI0mWu4lWIgayMtC6Vgz
	La3w==
X-Gm-Message-State: AA6/9RlxOsfNw/NSKTs7sJDN4OXNsZ+4aVcb1i4rwpGxhPBkNF7g87wxJeGPmRZ70JYg66zdKLQpIF/Swzef7SMy
X-Received: by 10.25.35.6 with SMTP id j6mr4440647lfj.147.1476212581740; Tue,
	11 Oct 2016 12:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.77.42 with HTTP; Tue, 11 Oct 2016 12:03:00 -0700 (PDT)
In-Reply-To: <CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
	<CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Wed, 12 Oct 2016 00:33:00 +0530
Message-ID: <CAD3vsf6muVV_NNP=rTGNo-4gMz_Q0SNojJ-qJui8_j9eW-gmZQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Tue, 11 Oct 2016 19:03:01 -0000
Content-Type: multipart/alternative; boundary=001a113ca7628cb3cb053e9b8627

--001a113ca7628cb3cb053e9b8627
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> Thanks for reviewing the patch.
>>
>>
>>> I think this is too fragile to land in OE-Core. What happens if a
>>> network driver prints "device=eth0"? Or if other kernel messages make
>>> the string disappear from dmesg and connman gets restarted later?
>>>
>>
>> True. If device=eth0 gets disappeared/corrupted, then we may have problem.
>>
>>>
>>> FWIW, I'm attaching my current wrapper script for connmand. I don't
>>> think it's perfect, but at least it doesn't depend on any init manager
>>> and works across restarts.
>>
>> The wrapper script attached by you, takes care of the missing scenarios.
>> Seems to be more complete.
>>
>>>
>>>
>> Add these lines to connman's do_install, in case you'd like to test
>>> and/or submit it:
>>>
>>> mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
>>> install -m 755 ${WORKDIR}/connmand-nfsroot.in ${D}${sbindir}/connmand
>>> sed -e 's,@sbindir@,${sbindir},g' -i ${D}${sbindir}/connmand
>>>
>> I think it would be good idea to integrate your changes into the already
>> existing OE-core's connman script, instead of a calling original connman
>> script from the wrapper script.
>>
>
> I threw together https://github.com/openembedded/openembedded-
> core/compare/master...kergoth:connman-systemd-nfs last night,
> only limited testing. I think using a script in libexecdir is rather
> cleaner than wrapping connmand in place, for something like this,
> personally.
>

In the above commit,  the last line of connman/connman/start-connman file,
should be exec @SBINDIR@/connmand "$@" instead of exec @SBINDIR@/connman
"$@" ; as the actual binary file name is connmand.

Regards,
Jagadeesh
>
>
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--001a113ca7628cb3cb053e9b8627
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson <span dir=3D"ltr">&=
lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><span class=3D"gmail-"><br><div class=3D"gmail_quote">On T=
ue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishna=
njanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div>Thanks f=
or reviewing the patch.<br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote"><span class=3D"gmail-m_-1398317967282633483gmail-"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x"><span class=3D"gmail-m_-1398317967282633483gmail-m_284506143400425565gma=
il-"><br>
</span>I think this is too fragile to land in OE-Core. What happens if a<br=
>
network driver prints &quot;device=3Deth0&quot;? Or if other kernel message=
s make<br>
the string disappear from dmesg and connman gets restarted later?<br></bloc=
kquote><div>=C2=A0</div></span><div>True. If device=3Deth0 gets disappeared=
/corrupted, then we may have problem.</div><span class=3D"gmail-m_-13983179=
67282633483gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex">
<br>
FWIW, I&#39;m attaching my current wrapper script for connmand. I don&#39;t=
<br>
think it&#39;s perfect, but at least it doesn&#39;t depend on any init mana=
ger<br>
and works across restarts.</blockquote></span><div>The wrapper script attac=
hed by you, takes care of the missing scenarios. Seems to be more complete.=
</div><span class=3D"gmail-m_-1398317967282633483gmail-"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex">
Add these lines to connman&#39;s do_install, in case you&#39;d like to test=
<br>
and/or submit it:<br>
<br>
mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real<br>
install -m 755 ${WORKDIR}/<a href=3D"http://connmand-nfsroot.in" rel=3D"nor=
eferrer" target=3D"_blank">connmand-nfsroot.in</a> ${D}${sbindir}/connmand<=
br>
sed -e &#39;s,@sbindir@,${sbindir},g&#39; -i ${D}${sbindir}/connmand<br></b=
lockquote></span><div>I think it would be good idea to integrate your chang=
es into the already existing OE-core&#39;s connman script, instead of a cal=
ling original connman script from the wrapper script.</div></div></div></di=
v></blockquote></div><br></span>I threw together=C2=A0<a href=3D"https://gi=
thub.com/openembedded/openembedded-core/compare/master...kergoth:connman-sy=
stemd-nfs" target=3D"_blank">https://github.com/<wbr>openembedded/openembed=
ded-<wbr>core/compare/master...kergoth:<wbr>connman-systemd-nfs</a>=C2=A0la=
st night, only=C2=A0limited testing. I think using a script in libexecdir i=
s rather cleaner than wrapping connmand in place, for something like this, =
personally.</div></div></blockquote><div>=C2=A0</div>In the above commit, =
=C2=A0the last line of connman/connman/start-connman file, should be exec @=
SBINDIR@/connmand &quot;$@&quot; instead of exec @SBINDIR@/connman &quot;$@=
&quot; ; as the actual binary file name is connmand.<br><br>Regards,<br>Jag=
adeesh<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span cl=
ass=3D"gmail-HOEnZb"><font color=3D"#888888"><br>-- <br><div class=3D"gmail=
-m_-1398317967282633483gmail_signature">Christopher Larson<br>clarson at ke=
rgoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer =
- Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</font></span></div></div>
</blockquote></div><br></div></div>

--001a113ca7628cb3cb053e9b8627--
