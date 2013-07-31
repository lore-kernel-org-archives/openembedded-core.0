Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 127EA6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 07:09:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6V79GWf029179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2013 00:09:16 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 31 Jul 2013 00:09:16 -0700
Message-ID: <51F8B825.3000707@windriver.com>
Date: Wed, 31 Jul 2013 15:09:25 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<51F092C5.3060906@windriver.com>
	<CABcZANk_XvT3uHDQQmqsm-4dTVZYd-D3RRsW+wz=2cdE-xkbmA@mail.gmail.com>
In-Reply-To: <CABcZANk_XvT3uHDQQmqsm-4dTVZYd-D3RRsW+wz=2cdE-xkbmA@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 31 Jul 2013 07:09:17 -0000
Content-Type: multipart/alternative;
	boundary="------------020505050601090500000409"

--------------020505050601090500000409
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 02:53 AM, Chris Larson wrote:
> On Wed, Jul 24, 2013 at 7:51 PM, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     You can get more information from the bug link below. The related
>     bugs are listed in the blocks list of this bug.
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103
>     You can also review the patchset for these bugs on
>
>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images
>
>
> I'll start playing around with this locally, to see how well it'd work 
> (with adjustments to support systemd) for our use cases, and will go 
> from there on our end. Up next for me:
>

Thank you very much for your review :)

Best Regards,
Chen Qi

> - see if your r/o bits will be suitable for us with systemd rather 
> than using our tmpfiles override mechanism. we need to support this on 
> much more than just live images, and we need systemd :)
> - pursue systemd support for services missing that support in oe-core
> - pursue improved sysvinit / systemd feature parity, and potential 
> volatiles -> tmpfiles migration / consolidation
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------020505050601090500000409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/31/2013 02:53 AM, Chris Larson
      wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANk_XvT3uHDQQmqsm-4dTVZYd-D3RRsW+wz=2cdE-xkbmA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Wed, Jul 24, 2013 at 7:51 PM,
            ChenQi <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>You can get more information from the bug link below.
                The related bugs are listed in the blocks list of this
                bug.<br>
                <a moz-do-not-send="true"
                  href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103"
                  target="_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4103</a><br>
                You can also review the patchset for these bugs on <br>
                <pre><a moz-do-not-send="true" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images" target="_blank">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images</a></pre>
              </div>
            </blockquote>
          </div>
          <br>
          I'll start playing around with this locally, to see how well
          it'd work (with adjustments to support systemd) for our use
          cases, and will go from there on our end. Up next for me:</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    Thank you very much for your review :)<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CABcZANk_XvT3uHDQQmqsm-4dTVZYd-D3RRsW+wz=2cdE-xkbmA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">- see if your r/o bits will be suitable
          for us with systemd rather than using our tmpfiles override
          mechanism. we need to support this on much more than just live
          images, and we need systemd :)</div>
        <div class="gmail_extra">- pursue systemd support for services
          missing that support in oe-core</div>
        <div class="gmail_extra">- pursue improved sysvinit / systemd
          feature parity, and potential volatiles -&gt; tmpfiles
          migration / consolidation<br>
          -- <br>
          Christopher Larson<br>
          clarson at kergoth dot com<br>
          Founder - BitBake, OpenEmbedded, OpenZaurus<br>
          Maintainer - Tslib<br>
          Senior Software Engineer, Mentor Graphics
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020505050601090500000409--
