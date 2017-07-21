Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7E08F783C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:13:47 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m88so11404369iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aJztwp4BwJbZ4/4WFNe8B17uRp4/YfLnt6imrq9NsfM=;
	b=mycT33L1V1DgjB9SrEZ3eMJtrgYc1MwiM47J79jiMUcd3dv5rIpXsWy3DVTD4N7DSx
	NU9dysySCL30fnNQb9znTIFbcSHXz1B0v4ZDIFp+F3V4LU1h2ly5XPcTuIeS0R7t45Jj
	zmN5ww1bLPb/m+zoFkdQIrKUEDNuG9Pg99ukNS3l/VVgrVk7oaF2K8F3KTW6TcArmCXY
	3nIeyi+/y94YEvFVqXU8/P/0QUELxkkVdAH7UAclo+biGUENADe04mJPBYtPF28Ok406
	bLo2dFCMrA69NMPEnAE0rv71xE43zSSXAV/tzLg+hUTovgLQfhCBpPfkFwBNfFkLrj0W
	snFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aJztwp4BwJbZ4/4WFNe8B17uRp4/YfLnt6imrq9NsfM=;
	b=BbWy9ICHGwPJdz0zwHyHvYOzqWv1mdwkYUA1XV8FkrrThTOVl4PZJ29c9WEr/N/EVK
	EcNAVyJQMjlWfnSVRIqErASfi0mpJfHke5tYF2B0OGg4zyuWWyhAm9ON/BY/j59llPRE
	LS+aC+yZ5nycDze2zNVMTqYkI59pLfGdCv8gEEXtgkZ/zXR99n0GXT1faELmoQznNp/w
	fyXtQo6rsOChC/YcBEi5he8oj6pAxKXg8yrbqhy3MUmO/V/Gm0ikuThkYJ8ScYCf115o
	XtroWIkNK4IFk/IWgBNHTwt3nTsnCCTjaC1Ww6l3pvANBl5XCPy8JYBxAbspisMNHmfZ
	Icew==
X-Gm-Message-State: AIVw110NILJC+lShTdZGn0+C1KzkspQRz7Vdux36uLboek8Qfb1jdbhT
	vxF5bn0ntL1z19lrk+9YhnKf0FsjGyHB
X-Received: by 10.107.143.84 with SMTP id r81mr2478127iod.171.1500624828704;
	Fri, 21 Jul 2017 01:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Fri, 21 Jul 2017 01:13:18 -0700 (PDT)
In-Reply-To: <c238e3a3-1fde-a5e7-f499-c0cfd4d84521@windriver.com>
References: <1499775981-13801-1-git-send-email-jussi.kukkonen@intel.com>
	<c238e3a3-1fde-a5e7-f499-c0cfd4d84521@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Jul 2017 11:13:18 +0300
Message-ID: <CAHiDW_Hu4ec_ESeWvfMTQMx50qbvRO_t_5aOwxYhfcNy=tpxaw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] vulkan-demos: Add recipe
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
X-List-Received-Date: Fri, 21 Jul 2017 08:13:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d2d4db44430554cf71ab"

--94eb2c05d2d4db44430554cf71ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 20 July 2017 at 12:01, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2017=E5=B9=B407=E6=9C=8811=E6=97=A5 20:26, Jussi Kukkonen wrote:
>
>> Sascha Willems collection of Vulkan demos is useful as a smoke testing
>> tool.
>>
>> * Add patch to install binaries and data.
>> * Add patch to fix build on X86
>> * Use a combination of patch and do_install_append to avoid some 3D
>> models with unclear licensing.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>
> Hi Jussi,
>
> Did you meet build failure:
>
> | CMake Error at /buildarea3/kkang/WRLX/builds/
> vulkan-amr64/tmp/work/aarch64-wrs-linux/vulkan-demos/git-r0/
> recipe-sysroot-native/usr/share/cmake-3.8/Modules/FindPackageHandleStanda=
rdArgs.cmake:137
> (message):
> |   Could NOT find ASSIMP (missing: ASSIMP_LIBRARIES)
> | Call Stack (most recent call first):
> | /buildarea3/kkang/WRLX/builds/vulkan-amr64/tmp/work/aarch64-
> wrs-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/shar
> e/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377
> (_FPHSA_FAILURE_MESSAGE)
> |   cmake/FindASSIMP.cmake:50 (find_package_handle_standard_args)
> |   CMakeLists.txt:45 (find_package)
>
> If not, would you please to tell me where or which recipe is module ASSIM=
P
> from?
>

No, I did not see this. The assimp library comes from assimp_git.bb recipe
in the same directory as vulkan-demos recipe -- it is in DEPENDS for
vulkan-demos.

Jussi

--94eb2c05d2d4db44430554cf71ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
0 July 2017 at 12:01, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mailto:Kai.=
Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2017=E5=B9=B4=
07=E6=9C=8811=E6=97=A5 20:26, Jussi Kukkonen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Sascha Willems collection of Vulkan demos is useful as a smoke testing<br>
tool.<br>
<br>
* Add patch to install binaries and data.<br>
* Add patch to fix build on X86<br>
* Use a combination of patch and do_install_append to avoid some 3D<br>
models with unclear licensing.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
</blockquote>
<br></span>
Hi Jussi,<br>
<br>
Did you meet build failure:<br>
<br>
| CMake Error at /buildarea3/kkang/WRLX/builds/<wbr>vulkan-amr64/tmp/work/a=
arch64-<wbr>wrs-linux/vulkan-demos/git-r0/<wbr>recipe-sysroot-native/usr/sh=
ar<wbr>e/cmake-3.8/Modules/FindPackag<wbr>eHandleStandardArgs.cmake:137 (me=
ssage):<br>
|=C2=A0 =C2=A0Could NOT find ASSIMP (missing: ASSIMP_LIBRARIES)<br>
| Call Stack (most recent call first):<br>
| /buildarea3/kkang/WRLX/builds/<wbr>vulkan-amr64/tmp/work/aarch64-<wbr>wrs=
-linux/vulkan-demos/git-r0/<wbr>recipe-sysroot-native/usr/shar<wbr>e/cmake-=
3.8/Modules/FindPackag<wbr>eHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_ME=
SSAGE)<br>
|=C2=A0 =C2=A0cmake/FindASSIMP.cmake:50 (find_package_handle_standard_<wbr>=
args)<br>
|=C2=A0 =C2=A0CMakeLists.txt:45 (find_package)<br>
<br>
If not, would you please to tell me where or which recipe is module ASSIMP =
from?<br></blockquote><div><br></div><div>No, I did not see this. The assim=
p library comes from <a href=3D"http://assimp_git.bb">assimp_git.bb</a> rec=
ipe in the same directory as vulkan-demos recipe -- it is in DEPENDS for vu=
lkan-demos.</div><div><br></div><div>Jussi</div><div><br></div></div></div>=
</div>

--94eb2c05d2d4db44430554cf71ab--
