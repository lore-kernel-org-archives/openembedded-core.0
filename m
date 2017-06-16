Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A586E6010D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 23:12:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 16:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,348,1493708400"; 
	d="scan'208,217";a="115956118"
Received: from srprakas-mobl3.amr.corp.intel.com (HELO [10.252.250.206])
	([10.252.250.206])
	by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2017 16:12:10 -0700
To: openembedded-core@lists.openembedded.org
References: <CA+chaQeJVOrExYkyWCsyx+mtARAuvhge6a_ds=n_pXXuYofaXw@mail.gmail.com>
	<CADkTA4O4Py_Xteuero=gd+8=hh_+4U_LGoCT1VDm8fRQcYpDeA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <cc2f5e2b-2140-7ec0-39b4-50e35bc48256@linux.intel.com>
Date: Fri, 16 Jun 2017 18:12:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O4Py_Xteuero=gd+8=hh_+4U_LGoCT1VDm8fRQcYpDeA@mail.gmail.com>
Subject: Re: New warning from linux-yocto
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
X-List-Received-Date: Fri, 16 Jun 2017 23:12:10 -0000
Content-Type: multipart/alternative;
	boundary="------------5E0225FF536CC1AACEB0ED81"
Content-Language: en-US

--------------5E0225FF536CC1AACEB0ED81
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey guys,


Yup, this was caused by a patch that solved another warning, a patch is 
in the works to solve this by separating smp.cfg into smp-32.cfg and 
smp-64.cfg to be able to satisfy

all dependencies for the different architectures.


Alejandro


On 06/16/2017 02:02 PM, Bruce Ashfield wrote:
> Yep, this was reported on the list (and IRC) and apparently someone 
> was looking
> into it.
>
> I still haven't seen a patch, so I'll have a look at it myself soon.
>
> Bruce
>
> On Fri, Jun 16, 2017 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     New linux-yocto version.. new warning..
>
>     WARNING: linux-yocto-4.10.17+gitAUTOINC+4b89f331d4_6648a34e00-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
>
>     ---------- CONFIG_X86_BIGSMP -----------------
>     Config: CONFIG_X86_BIGSMP
>     From: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
>     Requested value:  CONFIG_X86_BIGSMP=y
>     Actual value:
>
>
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
>
>


--------------5E0225FF536CC1AACEB0ED81
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey guys,</p>
    <p><br>
    </p>
    <p>Yup, this was caused by a patch that solved another warning, a
      patch is in the works to solve this by separating smp.cfg into
      smp-32.cfg and smp-64.cfg to be able to satisfy</p>
    <p>all dependencies for the different architectures.</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/16/2017 02:02 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4O4Py_Xteuero=gd+8=hh_+4U_LGoCT1VDm8fRQcYpDeA@mail.gmail.com">
      <div dir="ltr">Yep, this was reported on the list (and IRC) and
        apparently someone was looking
        <div>into it.</div>
        <div><br>
        </div>
        <div>I still haven't seen a patch, so I'll have a look at it
          myself soon.</div>
        <div><br>
        </div>
        <div>Bruce<br>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On Fri, Jun 16, 2017 at 2:39 PM,
              Martin Jansa <span dir="ltr">&lt;<a
                  href="mailto:martin.jansa@gmail.com" target="_blank"
                  moz-do-not-send="true">martin.jansa@gmail.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div dir="ltr">New linux-yocto version.. new warning..
                  <div><br>
                  </div>
                  <div>
                    <pre style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">WARNING: linux-yocto-4.10.17+<wbr>gitAUTOINC+4b89f331d4_<wbr>6648a34e00-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

---------- CONFIG_X86_BIGSMP -----------------
Config: CONFIG_X86_BIGSMP
From: /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work-shared/<wbr>qemux86-64/kernel-source/.<wbr>kernel-meta/configs/standard/<wbr>cfg/smp.cfg
Requested value:  CONFIG_X86_BIGSMP=y
Actual value:     
</pre>
                  </div>
                  <div><br>
                  </div>
                </div>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                <br>
              </blockquote>
            </div>
            <br>
            <br clear="all">
            <div><br>
            </div>
            -- <br>
            <div class="gmail_signature"
              data-smartmail="gmail_signature">"Thou shalt not follow
              the NULL pointer, for chaos and madness await thee at its
              end"</div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------5E0225FF536CC1AACEB0ED81--
