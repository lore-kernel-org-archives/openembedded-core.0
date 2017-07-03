Return-Path: <razvan.heghedus@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC6A71D9C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 14:35:18 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v63EUc6J013981; Mon, 3 Jul 2017 09:35:19 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2be98nx3tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 03 Jul 2017 09:35:18 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v63EZHNC005835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2017 09:35:17 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 3 Jul 2017 09:35:16 -0500
Received: from [10.113.0.62] (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 3 Jul 2017 09:35:15 -0500
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<20170621120003.6440-2-razvan.heghedus@ni.com>
	<CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
	<945a7f98-d3f7-7d41-c440-0bd71bb4ee19@ni.com>
	<CADkTA4MpEScpJ74MmtEQMTXPAe8_-wrMkYGTbEOAvPH7fpno1w@mail.gmail.com>
	<23f339ea-47ed-7a93-5583-a74b555c690c@ni.com>
	<CADkTA4MR=dHJFu+9SOqX4DLxAqLSxgiBy5-rZVqTp=W3PMOwVQ@mail.gmail.com>
From: Razvan Heghedus <razvan.heghedus@ni.com>
Message-ID: <8dcbdf50-54fb-d59f-ba9e-b774d18a0c93@ni.com>
Date: Mon, 3 Jul 2017 17:36:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MR=dHJFu+9SOqX4DLxAqLSxgiBy5-rZVqTp=W3PMOwVQ@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1707030241
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: user defined KERNEL_VERSION_PKG_NAME
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
X-List-Received-Date: Mon, 03 Jul 2017 14:35:19 -0000
Content-Type: multipart/alternative;
	boundary="------------0CCF6FAC83271B7F1706FBFB"
Content-Language: en-US

--------------0CCF6FAC83271B7F1706FBFB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2017 04:06 PM, Bruce Ashfield wrote:
>
>
> On Thu, Jun 29, 2017 at 5:10 AM, Razvan Heghedus 
> <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>
>
>
>     On 06/28/2017 04:29 AM, Bruce Ashfield wrote:
>>
>>
>>     On Tue, Jun 27, 2017 at 5:15 AM, Razvan Heghedus
>>     <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>>
>>
>>
>>         On 06/26/2017 06:52 PM, Bruce Ashfield wrote:
>>>
>>>
>>>         On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan
>>>         <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>>>
>>>             Add possibility to set KERNEL_VERSION_PKG_NAME to a user
>>>             defined value.
>>>
>>>             Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com
>>>             <mailto:razvan.heghedus@ni.com>>
>>>             ---
>>>              meta/classes/kernel.bbclass | 8 ++++++--
>>>              1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>>             diff --git a/meta/classes/kernel.bbclass
>>>             b/meta/classes/kernel.bbclass
>>>             index 605c101e62..02728d5a86 100644
>>>             --- a/meta/classes/kernel.bbclass
>>>             +++ b/meta/classes/kernel.bbclass
>>>             @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
>>>              # LINUX_VERSION which is a constant.
>>>              KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or
>>>             " <mailto:$%7B@d.getVar%28%27KERNEL_VERSION%27%29or>"}"
>>>              KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
>>>             -KERNEL_VERSION_PKG_NAME =
>>>             "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>>>             -KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>>
>>>              python __anonymous () {
>>>                  import re
>>>
>>>             +    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
>>>             + d.setVar('KERNEL_VERSION_PKG_NAME',
>>>             "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
>>>             + d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]',
>>>             "${LINUX_VERSION}")
>>>             +    else:
>>>             + d.setVar('KERNEL_VERSION_PKG_NAME',
>>>             "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
>>>
>>>
>>>         This is introducing yet another variable that tweaks the
>>>         already complex setting of
>>>         the kernel version. Not to mention this code is already
>>>         touchy with respect to
>>>         parse time and rebuilding of the kernel.
>>>
>>>         My concern is that if this is set, we are completely
>>>         disassociated with the source
>>>         code of the kernel.
>>>
>>>         Where did you think this would be set ? local.conf ? distro
>>>         config ? somewhere else ?
>>>
>>>         If we had a way to simply override KERNEL_VERSION, we
>>>         wouldn't need any extra
>>>         variables.
>>>
>>>         Bruce
>>>
>>>             +
>>>                  # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE
>>>             into KERNEL_IMAGETYPES
>>>                  type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>                  alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>>             --
>>>             2.13.1
>>>
>>>             --
>>>             _______________________________________________
>>>             Openembedded-core mailing list
>>>             Openembedded-core@lists.openembedded.org
>>>             <mailto:Openembedded-core@lists.openembedded.org>
>>>             http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>             <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>>
>>>
>>>
>>>
>>>         -- 
>>>         "Thou shalt not follow the NULL pointer, for chaos and
>>>         madness await thee at its end"
>>         I have setting the variable in the kernel recipe. I need a
>>         way to override the KERNEL_VERSION because I want the kernel
>>         packages name to contain only a part of the version or
>>         nothing at all.
>>         I need this for the the kernel upgrade stuff, because if the
>>         package name is something like: kernel-4.9.8-{static_string}
>>         then I couldn't upgrade to a version like:
>>         kernel-4.9.10-{static_string}, because they are two different
>>         packages. I wanted a simple way to be able to have the
>>         package name : kernel-4.9-{static_string}, then I could do
>>         the upgrade for the new minor updates of the kernel.
>>
>>
>>     I could have sworn this (upgrading) was already possible via the
>>     version string we
>>     are currently using.  i.e. the PV is already picked up from the
>>     kernel source, and
>>     that should be doing the job.
>>
>>     i.e. when I unpack my
>>     kernel-image-bzimage-4.10.15-yocto-standard_4.10.15+git0+4d929fac34_d2c1ed3c0c-r0_qemux86_64.ipk
>>     package, I see that it has:
>>
>>      Version: 4.10.15+git0+4d929fac34_d2c1ed3c0c-r0
>>      but obviously has the general provides: Provides:
>>     kernel-image-bzimage
>>
>>     So that should be upgradable based on the version ... sure they
>>     have different names, but the provides
>>     and versions take care of things.
>>
>>     The versioning, ability to install multiple kernels, upgrades,
>>     etc, have really churned
>>     these variables making them a mess to read.
>>
>>     I'm probably misunderstanding your use case and error, can you
>>     elaborate for me
>>     and/or provide a log ? I'm more of a kernel guy than a package
>>     format guy .. so
>>     I'm probably missing something obvious.
>>
>>     Bruce
>>
>     If I build a genericx86_64 core-image_sato without this patch,
>     only with the other patch which add the versions(only the parts
>     that are in round parenthesis) I have the following packages:
>
>     Package: kernel-4.10.9-yocto-standard
>     Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
>     Depends: kernel-image-4.10.9-yocto-standard (=
>     4.10.9+git0+ad2e885015_fe0fb8da3d-r0)
>     Provides: kernel-4.10.9-yocto-standard, kernel-base
>
>     Package: kernel-image-4.10.9-yocto-standard
>     Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
>     Depends: kernel-image-bzimage-4.10.9-yocto-standard (=
>     4.10.9+git0+ad2e885015_fe0fb8da3d-r0)
>     Provides: kernel-image
>
>     Package: kernel-module-6lowpan-4.10.9-yocto-standard
>     Version: 4.10.9+git0+ad2e885015_fe0fb8da3d-r0
>     Depends: kernel-4.10.9-yocto-standard (=
>     4.10.9+git0+ad2e885015_fe0fb8da3d-r0)
>     Provides: kernel-module-6lowpan
>
>     So the problem are the Depends field. We have the 4.10.9 part in
>     the dependents that is messing with the upgrade. If we want to do
>     only some minor update that doesn't change this value than
>     everything is ok. It works. But if we have a new value e.g.
>     4.10.10 than we couldn't do the upgrade.
>     So that's why I came up with this patch to be able to modify the
>     Depends value to something like: kernel-image-4.10-yocto-standard,
>     or even kernel-image.
>
>
> That's the point I'm trying to make.
>
> Patch 1/2 adds the depends, but there's no way to disable it. Without 
> defining the variable
> that you have in patch 2/2, you can't upgrade the kernel packages .. 
> which makes it not only
> a new variable, but a new requirement when working with the kernel 
> recipes/packages.
>
> People have been upgrading the kernel before either of these patches 
> (I can't say that
> I do very often .. but I know that users of the commercially supported 
> distros do) .. unless
> it has been inadvertently broken, or there are more patches floating 
> around that I've not
> seen.
>
> what is the upgrade behaviour with neither of these patches applied ? 
> .. that's the behaviour that
> I'm most concerned about maintaining.
>
> Also, if we were to introduce something like this, the series needs to 
> have documentation
> updates along with it .. or we'll surely forget to document it and 
> catch people by surprise :(
>
> Bruce

You misunderstood the first patch. It only appends the version to the 
packages in the Depends field. E.g (from the pyro branch):

Package: kernel-4.10.17-yocto-standard
Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0
Depends: kernel-image-4.10.17-yocto-standard
Provides: kernel-4.10.17-yocto-standard, kernel-base

Package: kernel-image-4.10.17-yocto-standard
Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0
Depends: kernel-image-bzimage-4.10.17-yocto-standard
Provides: kernel-image

Package: kernel-module-6lowpan-4.10.17-yocto-standard
Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0
Depends: kernel-4.10.17-yocto-standard
Provides: kernel-module-6lowpan

As you can see the difference from the last email was only the versions 
in the Depends field.
About the upgrades, I only manage to upgrade the kernel only for new 
revisions version, from kernel-4.10.17-yocto-standard version 
4.10.17+git0+4b89f331d4_6648a34e00-r0 to kernel-4.10.17-yocto-standard 
version 4.10.17+git0+4b89f331d4_6648a34e00-r1. I tried to do an upgrade 
from kernel-4.10.15-yocto-standard to kernel-4.10.17-yocto-standard, but 
it failed (For the upgrade tests I used ipk format, might be the new 
opkg solver).

About the other distros based on OE, maybe they have some custom recipe 
for the kernel and somehow achieve the the same behaviour as this patch, 
or use rpm/deb, or the have custom scripts for the kernel and modules 
upgrades, or something else, idk.

The idea of these patches is to have a simple and easy way to do a 
kernel upgrade(with the kernel image and installed kernel modules), 
because now, when you want to upgrade the kernel you need to manually do 
the upgrade for the kernel-image and the modules.

>>
>>         This was the simple and cleanest way I could think of to
>>         achieve the my scenario. But if there is a better idea for
>>         this, let me know.
>>
>>         -- 
>>
>>         Razvan
>>
>>
>>
>>
>>     -- 
>>     "Thou shalt not follow the NULL pointer, for chaos and madness
>>     await thee at its end"
>
>     -- 
>
>     Razvan
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"

-- 

Razvan


--------------0CCF6FAC83271B7F1706FBFB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/29/2017 04:06 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4MR=dHJFu+9SOqX4DLxAqLSxgiBy5-rZVqTp=W3PMOwVQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Jun 29, 2017 at 5:10 AM,
            Razvan Heghedus <span dir="ltr">&lt;<a
                href="mailto:razvan.heghedus@ni.com" target="_blank"
                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">
                <div>
                  <div class="m_7077270757819647348h5">
                    <p><br>
                    </p>
                    <br>
                    <div
                      class="m_7077270757819647348m_7647524976359667176moz-cite-prefix">On
                      06/28/2017 04:29 AM, Bruce Ashfield wrote:<br>
                    </div>
                    <blockquote type="cite">
                      <div dir="ltr"><br>
                        <div class="gmail_extra"><br>
                          <div class="gmail_quote">On Tue, Jun 27, 2017
                            at 5:15 AM, Razvan Heghedus <span dir="ltr">&lt;<a
                                href="mailto:razvan.heghedus@ni.com"
                                target="_blank" moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
                            wrote:<br>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">
                              <div bgcolor="#FFFFFF">
                                <div>
                                  <div
                                    class="m_7077270757819647348m_7647524976359667176gmail-h5">
                                    <p><br>
                                    </p>
                                    <br>
                                    <div
class="m_7077270757819647348m_7647524976359667176gmail-m_-2376083430806215195moz-cite-prefix">On
                                      06/26/2017 06:52 PM, Bruce
                                      Ashfield wrote:<br>
                                    </div>
                                    <blockquote type="cite">
                                      <div dir="ltr"><br>
                                        <div class="gmail_extra"><br>
                                          <div class="gmail_quote">On
                                            Wed, Jun 21, 2017 at 8:00
                                            AM, Heghedus Razvan <span
                                              dir="ltr">&lt;<a
                                                href="mailto:razvan.heghedus@ni.com"
                                                target="_blank"
                                                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
                                            wrote:<br>
                                            <blockquote
                                              class="gmail_quote"
                                              style="margin:0px 0px 0px
                                              0.8ex;border-left:1px
                                              solid
                                              rgb(204,204,204);padding-left:1ex">Add
                                              possibility to set
                                              KERNEL_VERSION_PKG_NAME to
                                              a user<br>
                                              defined value.<br>
                                              <br>
                                              Signed-off-by: Heghedus
                                              Razvan &lt;<a
                                                href="mailto:razvan.heghedus@ni.com"
                                                target="_blank"
                                                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;<br>
                                              ---<br>
 meta/classes/kernel.bbclass | 8 ++++++--<br>
                                               1 file changed, 6
                                              insertions(+), 2
                                              deletions(-)<br>
                                              <br>
                                              diff --git
                                              a/meta/classes/kernel.bbclass
b/meta/classes/kernel.bbclass<br>
                                              index
                                              605c101e62..02728d5a86
                                              100644<br>
                                              ---
                                              a/meta/classes/kernel.bbclass<br>
                                              +++
                                              b/meta/classes/kernel.bbclass<br>
                                              @@ -28,12 +28,16 @@
                                              INITRAMFS_IMAGE_BUNDLE ?=
                                              ""<br>
                                               # LINUX_VERSION which is
                                              a constant.<br>
                                               KERNEL_VERSION_NAME = <a
class="m_7077270757819647348m_7647524976359667176gmail-m_-2376083430806215195moz-txt-link-rfc2396E"
href="mailto:$%7B@d.getVar%28%27KERNEL_VERSION%27%29or" target="_blank"
                                                moz-do-not-send="true">"${@d.getVar('KERNEL_VERSION')
                                                or "</a>"}"<br>
 KERNEL_VERSION_NAME[vardepval<wbr>ue] = "${LINUX_VERSION}"<br>
                                              -KERNEL_VERSION_PKG_NAME =
"${@legitimize_package_name(d.<wbr>getVar('KERNEL_VERSION'))}"<br>
-KERNEL_VERSION_PKG_NAME[varde<wbr>pvalue] = "${LINUX_VERSION}"<br>
                                              <br>
                                               python __anonymous () {<br>
                                                   import re<br>
                                              <br>
                                              +    if
                                              d.getVar('USER_KERNEL_VERSION_<wbr>PKG')
                                              is None :<br>
                                              +       
                                              d.setVar('KERNEL_VERSION_PKG_N<wbr>AME',
"${@legitimize_package_name(d.<wbr>getVar('KERNEL_VERSION'))}")<br>
                                              +       
                                              d.setVar('KERNEL_VERSION_PKG_N<wbr>AME[vardepvalue]',
                                              "${LINUX_VERSION}")<br>
                                              +    else:<br>
                                              +       
                                              d.setVar('KERNEL_VERSION_PKG_N<wbr>AME',
"${@legitimize_package_name(d.<wbr>getVar('USER_KERNEL_VERSION_PK<wbr>G'))}")<br>
                                            </blockquote>
                                            <div><br>
                                            </div>
                                            <div>This is introducing yet
                                              another variable that
                                              tweaks the already complex
                                              setting of</div>
                                            <div>the kernel version. Not
                                              to mention this code is
                                              already touchy with
                                              respect to</div>
                                            <div>parse time and
                                              rebuilding of the kernel.</div>
                                            <div><br>
                                            </div>
                                            <div>My concern is that if
                                              this is set, we are
                                              completely disassociated
                                              with the source</div>
                                            <div>code of the kernel.</div>
                                            <div><br>
                                            </div>
                                            <div>Where did you think
                                              this would be set ?
                                              local.conf ? distro config
                                              ? somewhere else ?</div>
                                            <div><br>
                                            </div>
                                            <div>If we had a way to
                                              simply override
                                              KERNEL_VERSION, we
                                              wouldn't need any extra</div>
                                            <div>variables.</div>
                                            <div><br>
                                            </div>
                                            <div>Bruce</div>
                                            <div> </div>
                                            <blockquote
                                              class="gmail_quote"
                                              style="margin:0px 0px 0px
                                              0.8ex;border-left:1px
                                              solid
                                              rgb(204,204,204);padding-left:1ex">
                                              +<br>
                                                   # Merge
                                              KERNEL_IMAGETYPE and
                                              KERNEL_ALT_IMAGETYPE into
                                              KERNEL_IMAGETYPES<br>
                                                   type =
                                              d.getVar('KERNEL_IMAGETYPE')
                                              or ""<br>
                                                   alttype =
                                              d.getVar('KERNEL_ALT_IMAGETYPE<wbr>')
                                              or ""<br>
                                              <span
class="m_7077270757819647348m_7647524976359667176gmail-m_-2376083430806215195m_-3599068778944099545HOEnZb"><font
                                                  color="#888888">--<br>
                                                  2.13.1<br>
                                                  <br>
                                                  --<br>
______________________________<wbr>_________________<br>
                                                  Openembedded-core
                                                  mailing list<br>
                                                  <a
                                                    href="mailto:Openembedded-core@lists.openembedded.org"
                                                    target="_blank"
                                                    moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                                                  <a
                                                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                                    rel="noreferrer"
                                                    target="_blank"
                                                    moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                                                </font></span></blockquote>
                                          </div>
                                          <br>
                                          <br clear="all">
                                          <div><br>
                                          </div>
                                          -- <br>
                                          <div
class="m_7077270757819647348m_7647524976359667176gmail-m_-2376083430806215195m_-3599068778944099545gmail_signature">"Thou
                                            shalt not follow the NULL
                                            pointer, for chaos and
                                            madness await thee at its
                                            end"</div>
                                        </div>
                                      </div>
                                    </blockquote>
                                  </div>
                                </div>
                                I have setting the variable in the
                                kernel recipe. I need a way to override
                                the KERNEL_VERSION because I want the
                                kernel packages name to contain only a
                                part of the version or nothing at all. <br>
                                I need this for the the kernel upgrade
                                stuff, because if the package name is
                                something like:
                                kernel-4.9.8-{static_string} then I
                                couldn't upgrade to a version like:
                                kernel-4.9.10-{static_string}, because
                                they are two different packages. I
                                wanted a simple way to be able to have
                                the package name :
                                kernel-4.9-{static_string}, then I could
                                do the upgrade for the new minor updates
                                of the kernel.<br>
                              </div>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>I could have sworn this (upgrading) was
                              already possible via the version string we</div>
                            <div>are currently using.  i.e. the PV is
                              already picked up from the kernel source,
                              and</div>
                            <div>that should be doing the job.</div>
                            <div><br>
                            </div>
                            <div>i.e. when I unpack my
                              kernel-image-bzimage-4.10.15-y<wbr>octo-standard_4.10.15+git0+4d9<wbr>29fac34_d2c1ed3c0c-r0_qemux86_<wbr>64.ipk</div>
                            <div>package, I see that it has:<br>
                            </div>
                            <div><br>
                               Version: 4.10.15+git0+4d929fac34_d2c1ed<wbr>3c0c-r0<br>
                            </div>
                            <div> but obviously has the general
                              provides: Provides: kernel-image-bzimage<br>
                            </div>
                            <div><br>
                            </div>
                            <div>So that should be upgradable based on
                              the version ... sure they have different
                              names, but the provides</div>
                            <div>and versions take care of things.</div>
                            <div><br>
                            </div>
                            <div>The versioning, ability to install
                              multiple kernels, upgrades, etc, have
                              really churned</div>
                            <div>these variables making them a mess to
                              read.</div>
                            <div><br>
                            </div>
                            <div>I'm probably misunderstanding your use
                              case and error, can you elaborate for me</div>
                            <div>and/or provide a log ? I'm more of a
                              kernel guy than a package format guy .. so</div>
                            <div>I'm probably missing something obvious.</div>
                            <div><br>
                            </div>
                            <div>Bruce</div>
                            <div><br>
                            </div>
                            <div> </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                If I build a genericx86_64 core-image_sato without this
                patch, only with the other patch which add the
                versions(only the parts that are in round parenthesis) I
                have the following packages:<br>
                <br>
                Package: kernel-4.10.9-yocto-standard<br>
                Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
                Depends: kernel-image-4.10.9-yocto-stan<wbr>dard (=
                4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
                Provides: kernel-4.10.9-yocto-standard, kernel-base<br>
                <br>
                Package: kernel-image-4.10.9-yocto-stan<wbr>dard<br>
                Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
                Depends: kernel-image-bzimage-4.10.9-yo<wbr>cto-standard
                (= 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
                Provides: kernel-image<br>
                <br>
                Package: kernel-module-6lowpan-4.10.9-y<wbr>octo-standard<br>
                Version: 4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0<br>
                Depends: kernel-4.10.9-yocto-standard (=
                4.10.9+git0+ad2e885015_fe0fb8d<wbr>a3d-r0)<br>
                Provides: kernel-module-6lowpan<br>
                <br>
                So the problem are the Depends field. We have the 4.10.9
                part in the dependents that is messing with the upgrade.
                If we want to do only some minor update that doesn't
                change this value than everything is ok. It works. But
                if we have a new value e.g. 4.10.10 than we couldn't do
                the upgrade. <br>
                So that's why I came up with this patch to be able to
                modify the Depends value to something like:
                kernel-image-4.10-yocto-standa<wbr>rd, or even
                kernel-image.</div>
            </blockquote>
            <div><br>
            </div>
            <div>That's the point I'm trying to make.</div>
            <div><br>
            </div>
            <div>Patch 1/2 adds the depends, but there's no way to
              disable it. Without defining the variable</div>
            <div>that you have in patch 2/2, you can't upgrade the
              kernel packages .. which makes it not only</div>
            <div>a new variable, but a new requirement when working with
              the kernel recipes/packages.</div>
            <div><br>
            </div>
            <div>People have been upgrading the kernel before either of
              these patches (I can't say that</div>
            <div>I do very often .. but I know that users of the
              commercially supported distros do) .. unless</div>
            <div>it has been inadvertently broken, or there are more
              patches floating around that I've not</div>
            <div>seen.</div>
            <div><br>
            </div>
            <div>what is the upgrade behaviour with neither of these
              patches applied ? .. that's the behaviour that</div>
            <div>I'm most concerned about maintaining.</div>
            <div><br>
            </div>
            <div>Also, if we were to introduce something like this, the
              series needs to have documentation</div>
            <div>updates along with it .. or we'll surely forget to
              document it and catch people by surprise :(</div>
            <div><br>
            </div>
            <div>Bruce</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    You misunderstood the first patch. It only appends the version to
    the packages in the Depends field. E.g (from the pyro branch):<br>
    <br>
    Package: kernel-4.10.17-yocto-standard<br>
    Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0<br>
    Depends: kernel-image-4.10.17-yocto-standard<br>
    Provides: kernel-4.10.17-yocto-standard, kernel-base<br>
    <br>
    Package: kernel-image-4.10.17-yocto-standard<br>
    Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0<br>
    Depends: kernel-image-bzimage-4.10.17-yocto-standard<br>
    Provides: kernel-image<br>
    <br>
    Package: kernel-module-6lowpan-4.10.17-yocto-standard<br>
    Version: 4.10.17+git0+4b89f331d4_6648a34e00-r0<br>
    Depends: kernel-4.10.17-yocto-standard<br>
    Provides: kernel-module-6lowpan<br>
    <br>
    As you can see the difference from the last email was only the
    versions in the Depends field.<br>
    About the upgrades, I only manage to upgrade the kernel only for new
    revisions version, from kernel-4.10.17-yocto-standard version
    4.10.17+git0+4b89f331d4_6648a34e00-r0 to
    kernel-4.10.17-yocto-standard version
    4.10.17+git0+4b89f331d4_6648a34e00-r1. I tried to do an upgrade from
    kernel-4.10.15-yocto-standard to kernel-4.10.17-yocto-standard, but
    it failed (For the upgrade tests I used ipk format, might be the new
    opkg solver).<br>
    <br>
    About the other distros based on OE, maybe they have some custom
    recipe for the kernel and somehow achieve the the same behaviour as
    this patch, or use rpm/deb, or the have custom scripts for the
    kernel and modules upgrades, or something else, idk.<br>
    <br>
    The idea of these patches is to have a simple and easy way to do a
    kernel upgrade(with the kernel image and installed kernel modules),
    because now, when you want to upgrade the kernel you need to
    manually do the upgrade for the kernel-image and the modules.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4MR=dHJFu+9SOqX4DLxAqLSxgiBy5-rZVqTp=W3PMOwVQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"> <span>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <blockquote class="gmail_quote"
                            style="margin:0px 0px 0px
                            0.8ex;border-left:1px solid
                            rgb(204,204,204);padding-left:1ex">
                            <div bgcolor="#FFFFFF"> <br>
                              This was the simple and cleanest way I
                              could think of to achieve the my scenario.
                              But if there is a better idea for this,
                              let me know.<span
                                class="m_7077270757819647348m_7647524976359667176gmail-HOEnZb"><font
                                  color="#888888"><br>
                                  <pre class="m_7077270757819647348m_7647524976359667176gmail-m_-2376083430806215195moz-signature" cols="72">-- 

Razvan
</pre>
                                </font></span></div>
                          </blockquote>
                        </div>
                        <br>
                        <br clear="all">
                        <div><br>
                        </div>
                        -- <br>
                        <div
                          class="m_7077270757819647348m_7647524976359667176gmail_signature">"Thou
                          shalt not follow the NULL pointer, for chaos
                          and madness await thee at its end"</div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span><span class="m_7077270757819647348HOEnZb"><font
                    color="#888888">
                    <pre class="m_7077270757819647348m_7647524976359667176moz-signature" cols="72">-- 

Razvan
</pre>
                  </font></span></div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="m_7077270757819647348gmail_signature"
            data-smartmail="gmail_signature">"Thou shalt not follow the
            NULL pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 

Razvan
</pre>
  </body>
</html>

--------------0CCF6FAC83271B7F1706FBFB--
