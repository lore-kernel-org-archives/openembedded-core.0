Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 18D5D606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 13:13:22 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 2so9705633vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bpH9pE1tB11tZaCDip34ck/MNqxGRKdBhVSTXsM6WLc=;
	b=Zq+veUvMCuTp/tdeJdPGsq+hIZt7GgwtI2RjMSQVItftEI1BZaVFCa+D9DQStPqL9+
	bHiqlA3O1yki6CzGp/+xkw7O0ytgfQYVJ97ioR3PgwWepecqXwkzBUf4YYx+4Z3Qgi4f
	GxMKKxEZK0FZLycyQ49Flkzs3hoe6bzraPQ5ohknYIzLRO4ybTNI3PI0IaEw6yh8Wz5H
	MP+VBUaODzeIhXze3VT+f3z6Q+0WVkC3IJbc3TE0PhGp3MI/PhR80zYFPbjkKYpWZIdH
	mOSXLkAG1+t6F58D7FvIKKNPxKI/+KOV3L2Y/dYQPY3JmH64OK7RdxYAIjPRdgC6GcJz
	n+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bpH9pE1tB11tZaCDip34ck/MNqxGRKdBhVSTXsM6WLc=;
	b=QCNw+/yqTZaoFv9fA49R1+kZFlXpW01PZrdibaSsZDIwGLVLGYU5JjHOTqDW65pkEb
	ZOz/8d3KEZC67g1kC/dbNvDqhdjby3aKAxbPsL/C/3dRsJpLvPI8+d3StaKZsGRZt96e
	C9CQpgltOMBP46V77+WlnkeEoX/ffcQqHA2nStOGP4tFr9OimSkMDlBBCr0aJP+nAy+5
	2EBNTAPE3/sQe0oeEa/Vjhz4ity9NIrBFV6xoG11JKefyjU81Vj47HsLrJ0N/J58DcjZ
	+fgrPrpDI5zAe1/MvQYA6wI+XLHh/Sq5xIrrJ1LC9z9zlCKTk/BEcw/wTCBRpWsHQ+z3
	T44Q==
X-Gm-Message-State: AA6/9RlUXDCRwrZpSbO2luTzgHPywWFNdv3/9nNtnt1yOulLpNKTxRBbkVP5I4trp0ROmo+pUthY+ogDva0n0g==
X-Received: by 10.31.140.147 with SMTP id o141mr259779vkd.149.1476796403291;
	Tue, 18 Oct 2016 06:13:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.117.81 with HTTP; Tue, 18 Oct 2016 06:13:22 -0700 (PDT)
In-Reply-To: <f16484e1-ffb3-0102-fab6-01c0572a2b02@vaisala.com>
References: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
	<CA+aJhH16Z9trr9TgQfd1S8sVRorLcJds1Wrrf6vDWTYF8bf2FQ@mail.gmail.com>
	<f16484e1-ffb3-0102-fab6-01c0572a2b02@vaisala.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 18 Oct 2016 15:13:22 +0200
Message-ID: <CAFkk2KQ2Tp_df4WPCmaHSKqyhKrKZxVNb7Z+2TwbnfxyYF3e=g@mail.gmail.com>
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Two kmeta's not allowed for master?
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
X-List-Received-Date: Tue, 18 Oct 2016 13:13:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 2:56 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen
<vesa.jaaskelainen@vaisala.com> wrote:
> On 2016-10-11 16:38, Nathan Rossi wrote:
>>
>> On Tue, Oct 11, 2016 at 11:15 PM,  <vesa.jaaskelainen@vaisala.com> wrote=
:
>>>
>>> Hi,
>>>
>>> I was trying out how well 'master' branch compiles in our environment.
>>>
>>> We are using meta-xilinx and then we have custom BSP layer which
>>> bbappends linux-xlnx.
>>>
>>> When using meta-xilinx as standalone (w/o our BSP layer) I can get it
>>> tocompile.
>>>
>>> However when using it with combo meta-xilinx and our BSP we get failure
>>> on do_kernel_metadata due to missing scc files.
>>>
>>> It seems that there can no longer be two kmeta entries in SRC_URI.
>>>
>>> meta-xilinx's linux-xlnx.inc has:
>>> file://xilinx-base;type=3Dkmeta;destsuffix=3Dxilinx-base
>>
>> linux-xlnx has multiple kmeta sources. The one you mention here:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kerne=
l/linux/linux-xlnx.inc#n13
>>
>> And two more (added by a separate include):
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kerne=
l/linux/linux-xilinx-configs.inc#n8
>>
>> So I don't think this is an issue due to the number of type=3Dkmeta sour=
ces.
>>
>> Regards,
>> Nathan
>>
>>> our bbappend has:
>>> file://meta;type=3Dkmeta;destsuffix=3Dmeta
>>>
>>> In krogoth this works fine.
>>>
>>> Is this expected change?
>
>
> I had to remove 'meta' from paths in KERNEL_FEATURES:
>
> -KERNEL_FEATURES_append +=3D "meta/cfg/net/netfilter.scc"
> +KERNEL_FEATURES_append +=3D "cfg/net/netfilter.scc"

Unrelated nit: +=3D is never needed with _append (though an initial
space would need to be added). See the note in
http://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manua=
l.html#override-style-operation-advantages.

>
> After this it seems to compile nicely with master.
>
> Thanks,
> Vesa J=C3=A4=C3=A4skel=C3=A4inen

Cheers,
Ulf

