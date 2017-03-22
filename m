Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8878F77A8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:57:51 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id r45so151166688qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qbmi6bkbgnmk6BAmBqUDFBwVqVPEe5flLg5ro7LVYB0=;
	b=Lo7pDFrNf9QOFFHSAvm/j3fpLymRMxy0c/RcIrptki23AgANUkC8RR4bI/7F2EZo1t
	cHAz0xoXJut42dlTgdQtzIFGCa2WdCliNUnTdWgr/5Ujo0W5lbdwdHyOb3n9hkoIZrPG
	nSL8l0MSikPgkJXeUX9hmW34lKRQp36VTxS8tFDFfDjjR7YGHhIndB9GcSADbu16R27J
	Xb8+ahub1Z/49U3Fl1CCmoToVenYBgfq+QRE1qp53zaG6IMo9vPYKd91EDYJN2WxYwkS
	tY5ifa6Vk2LCk/oxC3ER5jkfYuNyhsjpnPwsD5E4brWR2sqP6xL1juz3YRnQmjabJRlG
	a2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qbmi6bkbgnmk6BAmBqUDFBwVqVPEe5flLg5ro7LVYB0=;
	b=KvvVd2whOYXSbttNxb/3d4PhxO50hpcX8UWCQLAX1JEDH87QORvvNcaMLTt4onFcy7
	bWPlprTaZItD83r7JQI67C6Vc/l4JFLlA7lnmjZza4rNgsd9T2TJtdOY4k6AuwtPgu/N
	wkuA+TQuzonXbQ8EwPntb05F83PPun95SaDSnXY/m+SZPvGBb8ZCBXhLFIGcxNc/ubOg
	NPHfbDMKJP5aVTZBrH++Quh4hK9HlG/xRhBN8Y4co4oFi4RP3OmRnd7HDDVYla0sy4pT
	+UuXLtTxF7S+8ar0nDsf5rhzCfr8r7ZEj+E1KBiiYJRHl11MFcN7EwCrKkloA91Xxe2e
	56yA==
X-Gm-Message-State: AFeK/H00/Z1WqW2O5xeA13vsh4zCJJvXWmPbB245dCQRllvIkZgBFTf4/l/ZvmHTZph6mv6xmFX+s2PtSRYkmA==
X-Received: by 10.200.54.207 with SMTP id b15mr41445466qtc.9.1490183872280;
	Wed, 22 Mar 2017 04:57:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 22 Mar 2017 04:57:51 -0700 (PDT)
In-Reply-To: <CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Mar 2017 07:57:51 -0400
Message-ID: <CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 11:57:51 -0000
Content-Type: multipart/alternative; boundary=001a1139782a5b8291054b5078f2

--001a1139782a5b8291054b5078f2
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 7:19 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 22 March 2017 at 11:14, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>> so, just to be clear, the simple act of adding that layer to a
>> project's bblayers.conf file will cause those preferred versions to
>> be selected, correct?
>>
>>   is that considered good design? in a perfect world, i've always
>> believed that you should be able to load up your bblayers.conf file
>> with as many extraneous layers as you want and (well, with some
>> exceptions), if you choose not to take advantage of the contents of a
>> layer, it shouldn't hurt you.
>>
>
> Yes.
>
> No.
>

So where are they supposed to be specified ? Surely not a separate distro
.conf ? and most
certainly not in local.conf ... I've always been unsure of where the right
place to specify
versions like that.

Bruce


>
> It's a violation of the layer design rules and should result in the new
> layer compat tools failing the layer.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1139782a5b8291054b5078f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 7:19 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 22 March 2017 at 11:14, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-114512=
8975278774339:35" class=3D"m_-1145128975278774339a3s m_-1145128975278774339=
aXjCH m_-1145128975278774339m15af5ba4e9d18421">so, just to be clear, the si=
mple act of adding that layer to a<br>
project&#39;s bblayers.conf file will cause those preferred versions to<br>
be selected, correct?<br>
<br>
=C2=A0 is that considered good design? in a perfect world, i&#39;ve always<=
br>
believed that you should be able to load up your bblayers.conf file<br>
with as many extraneous layers as you want and (well, with some<br>
exceptions), if you choose not to take advantage of the contents of a<br>
layer, it shouldn&#39;t hurt you.</div></blockquote></div><br></span>Yes.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">No.</di=
v></div></blockquote><div><br></div><div>So where are they supposed to be s=
pecified ? Surely not a separate distro .conf ? and most</div><div>certainl=
y not in local.conf ... I&#39;ve always been unsure of where the right plac=
e to specify=C2=A0</div><div>versions like that.</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It&#39;s a =
violation of the layer design rules and should result in the new layer comp=
at tools failing the layer.</div><span class=3D"HOEnZb"><font color=3D"#888=
888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></font></span></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a1139782a5b8291054b5078f2--
