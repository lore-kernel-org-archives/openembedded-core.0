Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65E0662135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 06:26:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5K6Q462007584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Jun 2016 23:26:04 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sun, 19 Jun 2016 23:26:03 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
	<9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
	<CAJTo0LY+hui18g90d4NZbD0JQjh0miqkn2uPTbRTxtUqFTPbuA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57678C80.2050503@windriver.com>
Date: Mon, 20 Jun 2016 14:26:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY+hui18g90d4NZbD0JQjh0miqkn2uPTbRTxtUqFTPbuA@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd-bootchart: add recipe
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
X-List-Received-Date: Mon, 20 Jun 2016 06:26:05 -0000
Content-Type: multipart/alternative;
	boundary="------------000505080603060405010104"

--------------000505080603060405010104
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2016 02:36 AM, Burton, Ross wrote:
>
> On 17 June 2016 at 04:36, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     +DEPENDS = "libxslt-native libxslt-native xmlto-native
>     docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
>
>
> Can we not disable documentation?

Hi Ross,

There's not available option to disable it in its source codes.
Do you think we should try to add one for it? Or we just leave things as 
it is?

Best Regards,
Chen Qi

>     +SYSTEMD_SERVICE_${PN} = "systemd-bootchart.service"
>     +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>
>
> Enable by default, I'd suggest.
>
>     +do_configure_prepend() {
>     +    # intltool.m4 is a soft link to /usr/share/aclocal/m4, delete
>     it and use the one in our sysroot
>     +    rm ${S}/m4/intltool.m4
>     +    cp ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4
>     ${S}/m4/intltool.m4
>     +}
>
>
> IIRC just deleting the file should be sufficient, as we'll pull it in 
> from the sysroot automatically.
>
> Ross


--------------000505080603060405010104
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/18/2016 02:36 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY+hui18g90d4NZbD0JQjh0miqkn2uPTbRTxtUqFTPbuA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 17 June 2016 at 04:36, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2v7" class="a3s aXjCH m1555c6f7c14e78e2">+DEPENDS
                = "libxslt-native libxslt-native xmlto-native
                docbook-xml-dtd4-native docbook-xsl-stylesheets-native
                intltool"<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Can we not disable documentation?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    There's not available option to disable it in its source codes.<br>
    Do you think we should try to add one for it? Or we just leave
    things as it is?<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LY+hui18g90d4NZbD0JQjh0miqkn2uPTbRTxtUqFTPbuA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2v7" class="a3s aXjCH m1555c6f7c14e78e2">
                +SYSTEMD_SERVICE_${PN} = "systemd-bootchart.service"<br>
                +SYSTEMD_AUTO_ENABLE_${PN} = "disable"<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Enable by default, I'd suggest.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2v7" class="a3s aXjCH m1555c6f7c14e78e2">+do_configure_prepend()
                {<br>
                +    # intltool.m4 is a soft link to
                /usr/share/aclocal/m4, delete it and use the one in our
                sysroot<br>
                +    rm ${S}/m4/intltool.m4<br>
                +    cp
                ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4
                ${S}/m4/intltool.m4<br>
                +}</div>
            </blockquote>
          </div>
          <br>
          IIRC just deleting the file should be sufficient, as we'll
          pull it in from the sysroot automatically.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000505080603060405010104--
