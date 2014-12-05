Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7267232E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:14:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB58EqSg009860
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 5 Dec 2014 00:14:52 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 5 Dec 2014 00:14:51 -0800
Message-ID: <54816995.7010203@windriver.com>
Date: Fri, 5 Dec 2014 16:15:17 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1417413565.git.Qi.Chen@windriver.com>
	<eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
	<CAJTo0Lag8Oh1_qFar3D5Ac70A_pDNHsF7bv3caRS9-tbKnGG4A@mail.gmail.com>
In-Reply-To: <CAJTo0Lag8Oh1_qFar3D5Ac70A_pDNHsF7bv3caRS9-tbKnGG4A@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Fri, 05 Dec 2014 08:14:54 -0000
Content-Type: multipart/alternative;
	boundary="------------080001060702010203060608"

--------------080001060702010203060608
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2014 04:48 AM, Burton, Ross wrote:
>
> On 1 December 2014 at 06:01, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Allow globs in CONFFILES and default CONFFILES to '${sysconfdir}'.
>
>
> If I apply this patch and build core-image-sato with package_ipk:
>
> | *** Error: CONTROL/conffiles mentions conffile /etc/depmod.d which 
> does not exist
> | *** Error: CONTROL/conffiles mentions conffile /etc/modprobe.d which 
> does not existERROR: Task 1120 
> (/home/ross/Yocto/poky/meta/recipes-kernel/kmod/kmod_git.bb 
> <http://kmod_git.bb>, do_package_write_ipk) failed with exit code '1'
>
> | *** Error: CONTROL/conffiles mentions conffile /etc/udev/hwdb.d 
> which does not exist
> ERROR: Task 558 
> (/home/ross/Yocto/poky/meta/recipes-core/systemd/systemd_216.bb 
> <http://systemd_216.bb>, do_package_write_ipk) failed with exit code '1'
>
> Ross

Hi Ross,

Thanks for pointing these problems out.
I'll send out a V2 with common code extracted and the above problem fixed.

Best Regards,
Chen Qi

--------------080001060702010203060608
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/04/2014 04:48 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lag8Oh1_qFar3D5Ac70A_pDNHsF7bv3caRS9-tbKnGG4A@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 1 December 2014 at 06:01, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":4ng" class="" style="overflow:hidden">Allow
                globs in CONFFILES and default CONFFILES to
                '${sysconfdir}'.<br>
              </div>
            </blockquote>
          </div>
          <div class="gmail_extra"><br>
          </div>
          If I apply this patch and build core-image-sato with
          package_ipk:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">
          <div class="gmail_extra">| *** Error: CONTROL/conffiles
            mentions conffile /etc/depmod.d which does not exist</div>
          <div class="gmail_extra">| *** Error: CONTROL/conffiles
            mentions conffile /etc/modprobe.d which does not existERROR:
            Task 1120 (/home/ross/Yocto/poky/meta/recipes-kernel/kmod/<a
              moz-do-not-send="true" href="http://kmod_git.bb">kmod_git.bb</a>,
            do_package_write_ipk) failed with exit code '1'</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">| *** Error: CONTROL/conffiles
            mentions conffile /etc/udev/hwdb.d which does not exist<br>
          </div>
          <div class="gmail_extra">ERROR: Task 558
            (/home/ross/Yocto/poky/meta/recipes-core/systemd/<a
              moz-do-not-send="true" href="http://systemd_216.bb">systemd_216.bb</a>,
            do_package_write_ipk) failed with exit code '1'<br>
          </div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    Thanks for pointing these problems out.<br>
    I'll send out a V2 with common code extracted and the above problem
    fixed.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------080001060702010203060608--
