Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63A5761013
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 02:10:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r782A7RP007205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 19:10:07 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 7 Aug 2013 19:10:07 -0700
Message-ID: <5202FE14.70101@windriver.com>
Date: Thu, 8 Aug 2013 10:10:28 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
	<CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com>
In-Reply-To: <CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: chen_q07@163.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 09/10] irda-utils: fix for read-only rootfs
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
X-List-Received-Date: Thu, 08 Aug 2013 02:10:15 -0000
Content-Type: multipart/alternative;
	boundary="------------070901010107000902000106"

--------------070901010107000902000106
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2013 10:18 PM, Chris Larson wrote:
>
> On Wed, Aug 7, 2013 at 1:08 AM, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>
>     The init script for irda writes configuration items to
>     /etc/sysconfig/irda
>     if that file is not available in system. But it's actually not
>     necessary,
>     the behavior doesn't change whether the init script writes to the
>     file or not.
>
>     Considering it issues error messages in case of a read-only
>     rootfs, I delete
>     the writing process.
>
>     [YOCTO #4103]
>     [YOCTO #4886]
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>
>
> This is a start, but is incomplete, from what I can tell. As mentioned 
> in the other thread, the startup script shouldn't be using 
> /etc/sysconfig/ at all, in any form. We use /etc/default/ for our 
> startup script config files, not /etc/sysconfig/.
Yeah, I agree with you.
But when I checked the irda source code, I saw that it actually could 
ship its own init script (irda-utils-xxx/etc/irda.rc). And I think our 
init script is derived from this one. In its own init script, 
/etc/sysconfig is used.
(Of course, I still think /etc/default is a better location for its 
configuration file.)


> Also, the purpose of this block was clearly to implement a default 
> configuration, yet the recipe isn't altered to ship a default 
> configuration to provide equivalent functionality.
In its source code, there's a default configuration file, and we don't 
use that. I think there might be a reason.
So I'm not sure about this one.

If you have a patch to fix the irda issue properly, send it out and I'll 
rebase my remote branch and drop this one.

Best Regards,
Chen Qi


> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------070901010107000902000106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/07/2013 10:18 PM, Chris Larson
      wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Aug 7, 2013 at 1:08 AM, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":vd" style="overflow:hidden">From: Chen Qi &lt;<a
                  moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
                <br>
                The init script for irda writes configuration items to
                /etc/sysconfig/irda<br>
                if that file is not available in system. But it's
                actually not necessary,<br>
                the behavior doesn't change whether the init script
                writes to the file or not.<br>
                <br>
                Considering it issues error messages in case of a
                read-only rootfs, I delete<br>
                the writing process.<br>
                <br>
                [YOCTO #4103]<br>
                [YOCTO #4886]<br>
                <br>
                Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</div>
            </blockquote>
          </div>
          <br>
          This is a start, but is incomplete, from what I can tell. As
          mentioned in the other thread, the startup script shouldn't be
          using /etc/sysconfig/ at all, in any form. We use
          /etc/default/ for our startup script config files, not
          /etc/sysconfig/. </div>
      </div>
    </blockquote>
    Yeah, I agree with you.<br>
    But when I checked the irda source code, I saw that it actually
    could ship its own init script (irda-utils-xxx/etc/irda.rc). And I
    think our init script is derived from this one. In its own init
    script, /etc/sysconfig is used.<br>
    (Of course, I still think /etc/default is a better location for its
    configuration file.)<br>
    <br>
    <br>
    <blockquote
cite="mid:CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Also, the purpose of this block was
          clearly to implement a default configuration, yet the recipe
          isn't altered to ship a default configuration to provide
          equivalent functionality.<br>
        </div>
      </div>
    </blockquote>
    In its source code, there's a default configuration file, and we
    don't use that. I think there might be a reason.<br>
    So I'm not sure about this one.<br>
    <br>
    If you have a patch to fix the irda issue properly, send it out and
    I'll rebase my remote branch and drop this one.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <br>
    <blockquote
cite="mid:CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
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

--------------070901010107000902000106--
