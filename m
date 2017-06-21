Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9195C71975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:11:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2017 11:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,370,1493708400"; 
	d="scan'208,217";a="1143523101"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 21 Jun 2017 11:11:08 -0700
To: Christopher Larson <kergoth@gmail.com>
References: <1498004059-12231-1-git-send-email-california.l.sullivan@intel.com>
	<CABcZANmLQno0gXMoaBPz22WpsoPCvkCySe1JY+m7L4n5TTqsLw@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <376a5ff8-a6ef-0055-eafb-514be875a1bd@intel.com>
Date: Wed, 21 Jun 2017 11:11:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmLQno0gXMoaBPz22WpsoPCvkCySe1JY+m7L4n5TTqsLw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc: Don't add live to IMAGE_FSTYPES, default instead
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
X-List-Received-Date: Wed, 21 Jun 2017 18:11:07 -0000
Content-Type: multipart/alternative;
	boundary="------------8B20365CF7741F9E58D1A962"

--------------8B20365CF7741F9E58D1A962
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/21/2017 08:28 AM, Christopher Larson wrote:
>
> On Tue, Jun 20, 2017 at 5:14 PM, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     Using += makes it difficult to remove. Soft-set with ?= instead.
>
>     Signed-off-by: California Sullivan
>     <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>>
>     ---
>      meta/conf/machine/include/x86-base.inc | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/conf/machine/include/x86-base.inc
>     b/meta/conf/machine/include/x86-base.inc
>     index 7365953..bfacdf5 100644
>     --- a/meta/conf/machine/include/x86-base.inc
>     +++ b/meta/conf/machine/include/x86-base.inc
>     @@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost
>     ext2 ext3 x86 \
>
>      MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
>
>     -IMAGE_FSTYPES += "live"
>     +IMAGE_FSTYPES ?= "live"
>
>
> I’m assuming you verified that none of the existing machines including 
> this were depending on the += behavior to add to the current value? 
> And this would almost certainly result in a different default for any 
> machines that don’t adjust IMAGE_FSTYPES at all, since it’d be adding 
> to the bitbake.conf or distro default.

I tested genericx86, genericx86-64, intel-corei7-64 and intel-core2-32, 
and their IMAGE_FSTYPES values were the same with and without this patch.

x86-base.inc is the first thing parsed that sets IMAGE_FSTYPES for all 
these machines, and since += is applied immediately its effectively 
setting a default value. A ?= from bitbake.conf for distro conf won't 
actually get applied with or without this patch.

I'm not aware of other machines that inherit x86-base.inc, but I'd think 
it would be the same for them.

Thanks,
Cal

> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


--------------8B20365CF7741F9E58D1A962
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 06/21/2017 08:28 AM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmLQno0gXMoaBPz22WpsoPCvkCySe1JY+m7L4n5TTqsLw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Jun 20, 2017 at 5:14 PM,
            California Sullivan <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:california.l.sullivan@intel.com"
                target="_blank">california.l.sullivan@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":12j" class="a3s aXjCH m15cc800708907dec">Using
                += makes it difficult to remove. Soft-set with ?=
                instead.<br>
                <br>
                Signed-off-by: California Sullivan &lt;<a
                  moz-do-not-send="true"
                  href="mailto:california.l.sullivan@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
                ---<br>
                 meta/conf/machine/include/x86-<wbr>base.inc | 2 +-<br>
                 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git a/meta/conf/machine/include/<wbr>x86-base.inc
                b/meta/conf/machine/include/<wbr>x86-base.inc<br>
                index 7365953..bfacdf5 100644<br>
                --- a/meta/conf/machine/include/<wbr>x86-base.inc<br>
                +++ b/meta/conf/machine/include/<wbr>x86-base.inc<br>
                @@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard
                pci usbhost ext2 ext3 x86 \<br>
                <br>
                 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"<br>
                <br>
                -IMAGE_FSTYPES += "live"<br>
                +IMAGE_FSTYPES ?= "live"</div>
            </blockquote>
          </div>
          <br>
          I’m assuming you verified that none of the existing machines
          including this were depending on the += behavior to add to the
          current value? And this would almost certainly result in a
          different default for any machines that don’t adjust
          IMAGE_FSTYPES at all, since it’d be adding to the bitbake.conf
          or distro default.<br>
        </div>
      </div>
    </blockquote>
    <br>
    I tested genericx86, genericx86-64, intel-corei7-64 and
    intel-core2-32, and their IMAGE_FSTYPES values were the same with
    and without this patch.<br>
    <br>
    x86-base.inc is the first thing parsed that sets IMAGE_FSTYPES for
    all these machines, and since += is applied immediately its
    effectively setting a default value. A ?= from bitbake.conf for
    distro conf won't actually get applied with or without this patch.<br>
    <br>
    I'm not aware of other machines that inherit x86-base.inc, but I'd
    think it would be the same for them.<br>
    <br>
    Thanks,<br>
    Cal<br>
    <br>
    <blockquote
cite="mid:CABcZANmLQno0gXMoaBPz22WpsoPCvkCySe1JY+m7L4n5TTqsLw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">
            <div dir="ltr">
              <div>
                <div dir="ltr">Christopher Larson<br>
                  kergoth at gmail dot com<br>
                  Founder - BitBake, OpenEmbedded, OpenZaurus<br>
                  Senior Software Engineer, Mentor Graphics</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8B20365CF7741F9E58D1A962--
