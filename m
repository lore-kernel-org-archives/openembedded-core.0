Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D6AFF6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 16:35:17 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id t40so56369573ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R+TGbFHAE73yQUYK6q0hHlTXwtciZRhPL6bwJli5l2k=;
	b=rATFhi1iGRBXbnMTIxkvU8Vq9ckx8FEzTjP185Z8SczG+t6kt1Tywe7bW76hyIgX2i
	Ne0HzJUB4tYlK087najCFyliNqXzF6X5MZYgwhPz3mgCg4Hf6f5Id1++Z1kv8+/MiwSI
	h8O8dq51O9sLFtN4mHPE3dHgHrHb8Agzn3az1scYkm+SEHKIrUFyGhQirD3voaGtn0KR
	YVrmCFo7XqJEbNUT2wa1D0WUwyauAHf1JWvJVOQcsw74cKznP8vs06XexPeYmrS63x4Y
	L2FSGCX9HoZGtZSEFgG2Ds7j1w8+n8OuekNwEa/PkAi7+vRBFp0keeUn0ryiY8vHjCam
	sKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R+TGbFHAE73yQUYK6q0hHlTXwtciZRhPL6bwJli5l2k=;
	b=YkUXVTLUJ6usapUOk40W0RkHV4p8/dDDig5moyu6xq86f8UWnAXkWSdSLv4tC54Gkn
	8ICmsneSh3WedlWBIszWoE4vj/CorMT2m2ZdmdmC9DlI8ryae1Wb69ZoX8tQ8Cd2TLN5
	VTluoOG8xNASpw5qaj2tnfe3pC/slkuBptLOIrVAqEkzqluak0crLxcoPrBmcSDXW0PL
	ZDgHQMv+qTC01YiuVeoD0lkN2L/suKO2xmsjQWPTPQmk4YxzWXsKGXM8x0k40+lvLV0q
	9gnJDMyLsfm5XmxMPjFX91MTj8ZaaSyo/upIR92NbPNcy883JUTKdLowedQQJBeR8jim
	yfgg==
X-Gm-Message-State: ALyK8tLU0ue45WJqaIlYjwaaO59iYQPy7V7Q/TfmGe206gbAfaQwjFPcuEhbYwRbx4nFdRPL1th9Rx/vL7ZcHOPW
X-Received: by 10.107.135.234 with SMTP id r103mr9995995ioi.133.1464280518332; 
	Thu, 26 May 2016 09:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 26 May 2016 09:34:58 -0700 (PDT)
In-Reply-To: <cover.1464276666.git.bruce.ashfield@windriver.com>
References: <cover.1464276666.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 May 2016 17:34:58 +0100
Message-ID: <CAJTo0LYrq-TnfMbD-1_u-F56Xiq7pW-SRQv++Vo4-OzHcb355Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Tom Zanussi <tom.zanussi@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/2] linux-yocto: intel staging and bxt backports
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
X-List-Received-Date: Thu, 26 May 2016 16:35:19 -0000
Content-Type: multipart/alternative; boundary=001a113fc2b625c8780533c16036

--001a113fc2b625c8780533c16036
Content-Type: text/plain; charset=UTF-8

On 26 May 2016 at 16:36, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> We have a couple of patches to integrate broxton backports, and to
> create some intel staging branches.
>

With qemux86-64:

WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
After meta data application, the kernel tree branch is standard/intel.
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
The SRC_URI specified branch standard/base.
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
The branch will be forced to standard/base, but this means the board meta
data
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
(.scc files) do not match the SRC_URI specification.
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
The meta data and branch standard/base should be inspected to ensure the
proper
WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
kernel is being built.

Ross

--001a113fc2b625c8780533c16036
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2016 at 16:36, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":1gx" class=3D"=
">We have a couple of patches to integrate broxton backports, and to<br>
create some intel staging branches.<br></div></blockquote></div><div class=
=3D"gmail_extra"><br></div>With qemux86-64:</div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_extra">WARNING: linux-yocto-4.4.11+gitAUTOINC+1465=
ac389f_53e84104c5-r0 do_patch: After meta data application, the kernel tree=
 branch is standard/intel.</div><div class=3D"gmail_extra">WARNING: linux-y=
octo-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch: The SRC_URI speci=
fied branch standard/base.</div><div class=3D"gmail_extra">WARNING: linux-y=
octo-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:</div><div class=
=3D"gmail_extra">WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104=
c5-r0 do_patch: The branch will be forced to standard/base, but this means =
the board meta data</div><div class=3D"gmail_extra">WARNING: linux-yocto-4.=
4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch: (.scc files) do not matc=
h the SRC_URI specification.</div><div class=3D"gmail_extra">WARNING: linux=
-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:</div><div class=
=3D"gmail_extra">WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104=
c5-r0 do_patch: The meta data and branch standard/base should be inspected =
to ensure the proper</div><div class=3D"gmail_extra">WARNING: linux-yocto-4=
.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch: kernel is being built.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div></div>

--001a113fc2b625c8780533c16036--
