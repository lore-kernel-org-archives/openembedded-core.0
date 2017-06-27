Return-Path: <razvan.heghedus@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 49D6C77805
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:13:48 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5R9B1WI006044; Tue, 27 Jun 2017 04:13:50 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b9m3v19br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 27 Jun 2017 04:13:49 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5R9Dmub021147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2017 04:13:48 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Jun 2017 04:13:48 -0500
Received: from [10.113.0.62] (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 27 Jun 2017 04:13:47 -0500
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<20170621120003.6440-2-razvan.heghedus@ni.com>
	<CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
From: Razvan Heghedus <razvan.heghedus@ni.com>
Message-ID: <945a7f98-d3f7-7d41-c440-0bd71bb4ee19@ni.com>
Date: Tue, 27 Jun 2017 12:15:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-27_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706270149
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
X-List-Received-Date: Tue, 27 Jun 2017 09:13:49 -0000
Content-Type: multipart/alternative;
	boundary="------------A09235DF4BE5CEA708EECE0E"
Content-Language: en-US

--------------A09235DF4BE5CEA708EECE0E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/26/2017 06:52 PM, Bruce Ashfield wrote:
>
>
> On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan 
> <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>
>     Add possibility to set KERNEL_VERSION_PKG_NAME to a user
>     defined value.
>
>     Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com
>     <mailto:razvan.heghedus@ni.com>>
>     ---
>      meta/classes/kernel.bbclass | 8 ++++++--
>      1 file changed, 6 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>     index 605c101e62..02728d5a86 100644
>     --- a/meta/classes/kernel.bbclass
>     +++ b/meta/classes/kernel.bbclass
>     @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
>      # LINUX_VERSION which is a constant.
>      KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
>      KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
>     -KERNEL_VERSION_PKG_NAME =
>     "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>     -KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>
>      python __anonymous () {
>          import re
>
>     +    if d.getVar('USER_KERNEL_VERSION_PKG') is None :
>     +        d.setVar('KERNEL_VERSION_PKG_NAME',
>     "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}")
>     +        d.setVar('KERNEL_VERSION_PKG_NAME[vardepvalue]',
>     "${LINUX_VERSION}")
>     +    else:
>     +        d.setVar('KERNEL_VERSION_PKG_NAME',
>     "${@legitimize_package_name(d.getVar('USER_KERNEL_VERSION_PKG'))}")
>
>
> This is introducing yet another variable that tweaks the already 
> complex setting of
> the kernel version. Not to mention this code is already touchy with 
> respect to
> parse time and rebuilding of the kernel.
>
> My concern is that if this is set, we are completely disassociated 
> with the source
> code of the kernel.
>
> Where did you think this would be set ? local.conf ? distro config ? 
> somewhere else ?
>
> If we had a way to simply override KERNEL_VERSION, we wouldn't need 
> any extra
> variables.
>
> Bruce
>
>     +
>          # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>     KERNEL_IMAGETYPES
>          type = d.getVar('KERNEL_IMAGETYPE') or ""
>          alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>     --
>     2.13.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"
I have setting the variable in the kernel recipe. I need a way to 
override the KERNEL_VERSION because I want the kernel packages name to 
contain only a part of the version or nothing at all.
I need this for the the kernel upgrade stuff, because if the package 
name is something like: kernel-4.9.8-{static_string} then I couldn't 
upgrade to a version like: kernel-4.9.10-{static_string}, because they 
are two different packages. I wanted a simple way to be able to have the 
package name : kernel-4.9-{static_string}, then I could do the upgrade 
for the new minor updates of the kernel.

This was the simple and cleanest way I could think of to achieve the my 
scenario. But if there is a better idea for this, let me know.

-- 

Razvan


--------------A09235DF4BE5CEA708EECE0E
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
    <div class="moz-cite-prefix">On 06/26/2017 06:52 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NDO_5ch_unyr1Ydk9_wgxTaOzRkev3Kd=sXcSDtUMQoA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Jun 21, 2017 at 8:00 AM,
            Heghedus Razvan <span dir="ltr">&lt;<a
                href="mailto:razvan.heghedus@ni.com" target="_blank"
                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Add
              possibility to set KERNEL_VERSION_PKG_NAME to a user<br>
              defined value.<br>
              <br>
              Signed-off-by: Heghedus Razvan &lt;<a
                href="mailto:razvan.heghedus@ni.com" target="_blank"
                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;<br>
              ---<br>
               meta/classes/kernel.bbclass | 8 ++++++--<br>
               1 file changed, 6 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes/kernel.bbclass
              b/meta/classes/kernel.bbclass<br>
              index 605c101e62..02728d5a86 100644<br>
              --- a/meta/classes/kernel.bbclass<br>
              +++ b/meta/classes/kernel.bbclass<br>
              @@ -28,12 +28,16 @@ INITRAMFS_IMAGE_BUNDLE ?= ""<br>
               # LINUX_VERSION which is a constant.<br>
               KERNEL_VERSION_NAME = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar('KERNEL_VERSION')or">"${@d.getVar('KERNEL_VERSION') or
              "</a>"}"<br>
               KERNEL_VERSION_NAME[vardepval<wbr>ue] =
              "${LINUX_VERSION}"<br>
              -KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.<wbr>getVar('KERNEL_VERSION'))}"<br>
              -KERNEL_VERSION_PKG_NAME[varde<wbr>pvalue] =
              "${LINUX_VERSION}"<br>
              <br>
               python __anonymous () {<br>
                   import re<br>
              <br>
              +    if d.getVar('USER_KERNEL_VERSION_<wbr>PKG') is None :<br>
              +        d.setVar('KERNEL_VERSION_PKG_N<wbr>AME',
              "${@legitimize_package_name(d.<wbr>getVar('KERNEL_VERSION'))}")<br>
              +        d.setVar('KERNEL_VERSION_PKG_N<wbr>AME[vardepvalue]',
              "${LINUX_VERSION}")<br>
              +    else:<br>
              +        d.setVar('KERNEL_VERSION_PKG_N<wbr>AME',
              "${@legitimize_package_name(d.<wbr>getVar('USER_KERNEL_VERSION_PK<wbr>G'))}")<br>
            </blockquote>
            <div><br>
            </div>
            <div>This is introducing yet another variable that tweaks
              the already complex setting of</div>
            <div>the kernel version. Not to mention this code is already
              touchy with respect to</div>
            <div>parse time and rebuilding of the kernel.</div>
            <div><br>
            </div>
            <div>My concern is that if this is set, we are completely
              disassociated with the source</div>
            <div>code of the kernel.</div>
            <div><br>
            </div>
            <div>Where did you think this would be set ? local.conf ?
              distro config ? somewhere else ?</div>
            <div><br>
            </div>
            <div>If we had a way to simply override KERNEL_VERSION, we
              wouldn't need any extra</div>
            <div>variables.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +<br>
                   # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE
              into KERNEL_IMAGETYPES<br>
                   type = d.getVar('KERNEL_IMAGETYPE') or ""<br>
                   alttype = d.getVar('KERNEL_ALT_IMAGETYPE<wbr>') or ""<br>
              <span class="m_-3599068778944099545HOEnZb"><font
                  color="#888888">--<br>
                  2.13.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank" moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="m_-3599068778944099545gmail_signature"
            data-smartmail="gmail_signature">"Thou shalt not follow the
            NULL pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    I have setting the variable in the kernel recipe. I need a way to
    override the KERNEL_VERSION because I want the kernel packages name
    to contain only a part of the version or nothing at all. <br>
    I need this for the the kernel upgrade stuff, because if the package
    name is something like: kernel-4.9.8-{static_string} then I couldn't
    upgrade to a version like: kernel-4.9.10-{static_string}, because
    they are two different packages. I wanted a simple way to be able to
    have the package name : kernel-4.9-{static_string}, then I could do
    the upgrade for the new minor updates of the kernel.<br>
    <br>
    This was the simple and cleanest way I could think of to achieve the
    my scenario. But if there is a better idea for this, let me know.<br>
    <pre class="moz-signature" cols="72">-- 

Razvan
</pre>
  </body>
</html>

--------------A09235DF4BE5CEA708EECE0E--
