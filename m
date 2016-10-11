Return-Path: <nathan@nathanrossi.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1993360770
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 13:38:29 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id w3so12540917ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6ZLzrs22fvTBytCauwkEMndMtBm7l23DbbKHxDvHjow=;
	b=gglsVwANBzQBkrV9at5jB+IPxZtgSqVV4lwjaWF07gW2e8DNPEJ7DWYzbiRpwQ0Gid
	3wuy+vOzfoaykzmnOD0GW+MEm/dPpntgonCezVmT4tGs3pmaiJI0e7MEKfMMl5+Iz+sB
	PEQwVaqN0tnOirlRt5t7DD0vdUUt9qYY5Io44qoVSdSTEA3QQbIfrggo90kyyX2I7D/X
	v9rz7OwC0BCGabpvijk/PVUx3ekjIzuR1wiRRcjDcv69vqMRIULDvC+j3wmF8hfO/nMc
	jVZGpZ5M1eIdmZ7dG6DU6kvDb+GmoBe+jYSN2AhPfovaSXxKj66MBZ/4dmvipwMzgIBM
	UJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6ZLzrs22fvTBytCauwkEMndMtBm7l23DbbKHxDvHjow=;
	b=XY06/vzFJhsE7AZuI6qUypjVkkNk/xfX4RbWojBp1W6KNpE+W2oCmV10srle73Cw+M
	t8JgV61CRH8a3HWFN9SpE3Q3FDsFUWf7SD6yKcix7ukHKyzO1S4TFxscCIzaukWoIQ9W
	Yo9mg2AFPd9Xoy75gPPb11TpsXYb6JmkZuUCbv1z/9OfQga5WgZ04bXpmo925Psw3/Rz
	WHWu79zPWSPgwG/2rTZXkVlNn5qjm+zoRGy3G78/N6Pnjjy0ie6bLi+m/07GJcUmtT3x
	rSI3IJ4yq9kpBgxBZE43SMHG/vZqVXcWyB3jvJ//vhU+ATr6HYasOdH705PGUgcJB6VT
	Ritg==
X-Gm-Message-State: AA6/9RmZLBf8yvf0kkQL2XDC69p8Ws2VLkNEH5FrqVsR6p9d7rYmwgU5e65OnDs+VQYnUM4AEBYUPdII4WGCIQ==
X-Received: by 10.13.204.216 with SMTP id o207mr3275561ywd.16.1476193110921;
	Tue, 11 Oct 2016 06:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.164.199 with HTTP; Tue, 11 Oct 2016 06:38:30 -0700 (PDT)
In-Reply-To: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
References: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 11 Oct 2016 23:38:30 +1000
Message-ID: <CA+aJhH16Z9trr9TgQfd1S8sVRorLcJds1Wrrf6vDWTYF8bf2FQ@mail.gmail.com>
To: vesa.jaaskelainen@vaisala.com
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 11 Oct 2016 13:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 11:15 PM,  <vesa.jaaskelainen@vaisala.com> wrote:
> Hi,
>
> I was trying out how well 'master' branch compiles in our environment.
>
> We are using meta-xilinx and then we have custom BSP layer which bbappend=
s linux-xlnx.
>
> When using meta-xilinx as standalone (w/o our BSP layer) I can get it to =
compile.
>
> However when using it with combo meta-xilinx and our BSP we get failure o=
n do_kernel_metadata due to missing scc files.
>
> It seems that there can no longer be two kmeta entries in SRC_URI.
>
> meta-xilinx's linux-xlnx.inc has:
> file://xilinx-base;type=3Dkmeta;destsuffix=3Dxilinx-base

linux-xlnx has multiple kmeta sources. The one you mention here:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kernel/l=
inux/linux-xlnx.inc#n13

And two more (added by a separate include):
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-kernel/l=
inux/linux-xilinx-configs.inc#n8

So I don't think this is an issue due to the number of type=3Dkmeta sources=
.

Regards,
Nathan

> our bbappend has:
> file://meta;type=3Dkmeta;destsuffix=3Dmeta
>
> In krogoth this works fine.
>
> Is this expected change?
>
> Ps. Sorry for html version of this same email.
>
> Thanks,
> Vesa J=C3=A4=C3=A4skel=C3=A4inen
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

