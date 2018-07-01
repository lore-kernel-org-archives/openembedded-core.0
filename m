Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB1D6093A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jul 2018 14:24:30 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id 31-v6so6703684plc.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=znO1HJguLbNceos+uguKp48dtrbMXh8TskxErG1UCjg=;
	b=Fr824jCedyv/LZehdLjR7iNFW1QhAWkyUxjWw3Lzv/1CPtDRM1TYHCjBV2KQZyiq59
	oBX1lpn7Y8m7j2caBljsDOrixmkZgigfrWgFwaSVRktWkR6MM37OkleTs3NpBCHPrP53
	OYMwV2lh+0REfFhRigj9phK+XSIE5qywUKLk+14Uay7Y+1G3IB9OOGflBcxGTRjBWdLb
	as0OdJO4cwn9QIzHgi7O+uJuv6Y6VlvhlCydVviuIgs7TKf/riL+mfVNT0FNSgCb7Tpf
	iUs06VKwYz1SMQrE9nZdPoCVaUFsMV+E2VQ05QzlCipXOP1Qpx6IDLnzC7vjifh19cxb
	/qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=znO1HJguLbNceos+uguKp48dtrbMXh8TskxErG1UCjg=;
	b=A/AfLR6dPyi7l9J6fMdREBT164saqOzzShvOyC5DBRlFDGOOC70g6ZD0zy6/GLPJHP
	eIdWJULfqfGN3rAaT+KZsnFP9PhWkD9+WZlQqnFnnzwRBNMF8qmWA63tYKSJxY39cKXA
	wcP2UlDlTv9aKeg6Im7GB3O7LgtU3uojwoWsYiXo+HTxqjgutQ86iOvbPwn2hQXQyox/
	YA6cLzfJBLsC9BbMzu53TSKIlxvSUlkgZPVZSgewNTGSqYQQM26x3BAcyzXuHIfkPA1m
	JBDnHxwiMcTwAD6diYZ7GfWC/gua+DQkAZ8fOv9bQh+siBXzX64Tiw7uYORIWKnyZ5Hn
	J5/g==
X-Gm-Message-State: APt69E2vPwZ4caXvhOdeDW9T0J3iRmcgVBlDnAPD/OW9TzkGBMf3ZQIk
	NHpKoBVjCcQG6VWs8LhdO7KqgA==
X-Google-Smtp-Source: ADUXVKKrz+CSURk95JIsI07cjxGAoRTin9Kq3UHo8tW0qw0PRUf1PnaJveuqYqQ9T0KJcJJkbaZNkQ==
X-Received: by 2002:a17:902:aa48:: with SMTP id
	c8-v6mr22362820plr.132.1530455071519; 
	Sun, 01 Jul 2018 07:24:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:f9e4:5e2e:71ed:81e4?
	([2601:202:4000:1184:f9e4:5e2e:71ed:81e4])
	by smtp.gmail.com with ESMTPSA id
	p1-v6sm21555085pfh.58.2018.07.01.07.24.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jul 2018 07:24:30 -0700 (PDT)
To: Christopher Larson <kergoth@gmail.com>
References: <1529865828-13206-1-git-send-email-akuster808@gmail.com>
	<CABcZANkEA37r6a3wsBsTLirvT5dZ2o+AOpWXONPiXPgRf=5=Cw@mail.gmail.com>
	<fa121093-4696-356f-8f27-96a6573a6bab@gmail.com>
	<CABcZANkCbhzH-_Q-djjJa6-W4JVE3yMogenCf+w97C+7oNwVdQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ebd79893-7f8a-fce0-2a46-ba46951c2f80@gmail.com>
Date: Sun, 1 Jul 2018 07:24:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkCbhzH-_Q-djjJa6-W4JVE3yMogenCf+w97C+7oNwVdQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: update 4.4.1
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
X-List-Received-Date: Sun, 01 Jul 2018 14:24:30 -0000
Content-Type: multipart/alternative;
	boundary="------------5BB6DB5577F1E16401569A82"
Content-Language: en-US

--------------5BB6DB5577F1E16401569A82
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 06/29/2018 06:53 PM, Christopher Larson wrote:
>
>
> On Fri, Jun 29, 2018 at 1:40 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 06/29/2018 08:13 AM, Christopher Larson wrote:
>>
>>
>>     On Sun, Jun 24, 2018 at 11:43 AM Armin Kuster
>>     <akuster808@gmail.com <mailto:akuster808@gmail.com>> wrote:
>>
>>         include several CVE fixes.
>>         CVE: CVE-2018-5733
>>         CVE: CVE-2018-5732
>>
>>         LIC_CHKSUM_FILE updated to SPFX format
>>
>>         https://kb.isc.org/article/AA-01571
>>
>>         remove several patches now included in update.
>>         Shared libarary support is now enabled in configure+lt, use it
>>         and revert to autotools-brokensep
>>         Refresh patches
>>
>>         alings support with bind 9.11.x
>>
>>         add libxml2 support to configure.ac <http://configure.ac>+lt
>>
>>         Signed-off-by: Armin Kuster <akuster808@gmail.com
>>         <mailto:akuster808@gmail.com>>
>>         ---
>>          meta/recipes-connectivity/dhcp/dhcp.inc            |  19 +-
>>          ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-
>>          .../dhcp/dhcp/0003-link-with-lcrypto.patch         |  13 +-
>>          .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    | 109
>>         +++++------
>>          .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-
>>          ...re-argument-to-make-the-libxml2-dependenc.patch |  40 +++-
>>          .../dhcp/dhcp/0010-build-shared-libs.patch         | 208
>>         ---------------------
>>          ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81
>>         --------
>>          ...correct-the-intention-for-xml2-lib-search.patch |  13 +-
>>          .../dhcp/dhcp/CVE-2017-3144.patch                  |  74
>>         --------
>>          .../dhcp/{dhcp_4.3.6.bb <http://dhcp_4.3.6.bb> =>
>>         dhcp_4.4.1.bb <http://dhcp_4.4.1.bb>}          |  12 +-
>>          11 files changed, 120 insertions(+), 475 deletions(-)
>>          delete mode 100644
>>         meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
>>          delete mode 100644
>>         meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
>>          delete mode 100644
>>         meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
>>          rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb
>>         <http://dhcp_4.3.6.bb> => dhcp_4.4.1.bb
>>         <http://dhcp_4.4.1.bb>} (65%)
>>
>>         diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
>>         b/meta/recipes-connectivity/dhcp/dhcp.inc
>>         index e943707..2eb3513 100644
>>         --- a/meta/recipes-connectivity/dhcp/dhcp.inc
>>         +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
>>         @@ -8,7 +8,7 @@ easier to administer devices."
>>          HOMEPAGE = "http://www.isc.org/"
>>
>>          LICENSE = "ISC"
>>         -LIC_FILES_CHKSUM =
>>         "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
>>         +LIC_FILES_CHKSUM =
>>         "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
>>
>>          DEPENDS = "openssl bind"
>>
>>         @@ -24,7 +24,7 @@ SRC_URI =
>>         "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz
>>         <http://ftp.isc.org/isc/dhcp/$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz> \
>>          UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
>>          UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>>
>>         -inherit autotools systemd useradd update-rc.d
>>         +inherit autotools-brokensep systemd useradd update-rc.d
>>
>>          USERADD_PACKAGES = "${PN}-server"
>>          USERADD_PARAM_${PN}-server = "--system --no-create-home
>>         --home-dir /var/run/${BPN} --shell /bin/false --user-group
>>         ${BPN}"
>>         @@ -48,11 +48,21 @@ EXTRA_OECONF =
>>         "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
>>                        
>>          --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
>>                        
>>          --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases
>>         \
>>                        
>>          --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases
>>         \
>>         -                --with-libbind=${STAGING_LIBDIR}/ \
>>                          --enable-paranoia --disable-static \
>>                          --with-randomdev=/dev/random \
>>         +                --with-libbind=${STAGING_DIR_HOST}/usr \
>>         +               --enable-libtool \
>>                         "
>>
>>         +#Enable shared libs per dhcp README
>>         +do_configure () {
>>         +       cd ${S}
>>         +       cp configure.ac <http://configure.ac>+lt configure.ac
>>         <http://configure.ac>
>>         +        autoreconf -i
>>         +       ./configure  ${CONFIGUREOPTS} ${EXTRA_OECONF}   
>>         +       automake
>>
>>
>>     1. Why run automake when autoreconf already runs automake?
>     it caused errors when I did not included.
>
>>     2. Why override do_configure and reproduce what's already in
>>     autotools-brokensep rather than doing the cp in a
>>     do_configure_prepend?
>     I did that first and it did not work. The README regarding *+lt
>     says it needs "autoreconf -i". I am only doing this as the current
>     version of dhcp has a patch to create shared libs. The isc dhcp
>     solution to this is their configure.ac <http://configure.ac>+lt. 
>     I would rather no do this but someone needed shared libs.
>
>
> We already run autoreconf -i in the default do_configure, I see no
> reason to be duplicating half of its logic when all you need to do is
> replace the default configure.ac <http://configure.ac> with the +lt
> version before that.

cool. that does seem to work.  V2 being sent shortly.

thanks for the push.

- armin
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


--------------5BB6DB5577F1E16401569A82
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/29/2018 06:53 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABcZANkCbhzH-_Q-djjJa6-W4JVE3yMogenCf+w97C+7oNwVdQ@mail.gmail.com">
      <div dir="ltr"><br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Fri, Jun 29, 2018 at 1:40 PM akuster808 &lt;<a
              href="mailto:akuster808@gmail.com" moz-do-not-send="true">akuster808@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <p><br>
              </p>
              <br>
              <div class="m_1440340043775474453moz-cite-prefix">On
                06/29/2018 08:13 AM, Christopher Larson wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr"><br>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr">On Sun, Jun 24, 2018 at 11:43 AM
                      Armin Kuster &lt;<a
                        href="mailto:akuster808@gmail.com"
                        target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">include
                      several CVE fixes.<br>
                      CVE: CVE-2018-5733<br>
                      CVE: CVE-2018-5732<br>
                      <br>
                      LIC_CHKSUM_FILE updated to SPFX format<br>
                      <br>
                      <a href="https://kb.isc.org/article/AA-01571"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">https://kb.isc.org/article/AA-01571</a><br>
                      <br>
                      remove several patches now included in update.<br>
                      Shared libarary support is now enabled in
                      configure+lt, use it<br>
                      and revert to autotools-brokensep<br>
                      Refresh patches<br>
                      <br>
                      alings support with bind 9.11.x<br>
                      <br>
                      add libxml2 support to <a
                        href="http://configure.ac" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">configure.ac</a>+lt<br>
                      <br>
                      Signed-off-by: Armin Kuster &lt;<a
                        href="mailto:akuster808@gmail.com"
                        target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
                      ---<br>
                       meta/recipes-connectivity/dhcp/dhcp.inc         
                        |  19 +-<br>
 ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-<br>
                       .../dhcp/dhcp/0003-link-with-lcrypto.patch       
                       |  13 +-<br>
                       .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch 
                        | 109 +++++------<br>
 .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-<br>
 ...re-argument-to-make-the-libxml2-dependenc.patch |  40 +++-<br>
                       .../dhcp/dhcp/0010-build-shared-libs.patch       
                       | 208 ---------------------<br>
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------<br>
 ...correct-the-intention-for-xml2-lib-search.patch |  13 +-<br>
                       .../dhcp/dhcp/CVE-2017-3144.patch               
                        |  74 --------<br>
                       .../dhcp/{<a href="http://dhcp_4.3.6.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">dhcp_4.3.6.bb</a> =&gt; <a
                        href="http://dhcp_4.4.1.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">dhcp_4.4.1.bb</a>} 
                              |  12 +-<br>
                       11 files changed, 120 insertions(+), 475
                      deletions(-)<br>
                       delete mode 100644
                      meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch<br>
                       delete mode 100644
meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch<br>
                       delete mode 100644
                      meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch<br>
                       rename meta/recipes-connectivity/dhcp/{<a
                        href="http://dhcp_4.3.6.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">dhcp_4.3.6.bb</a>
                      =&gt; <a href="http://dhcp_4.4.1.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">dhcp_4.4.1.bb</a>} (65%)<br>
                      <br>
                      diff --git
                      a/meta/recipes-connectivity/dhcp/dhcp.inc
                      b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
                      index e943707..2eb3513 100644<br>
                      --- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
                      +++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
                      @@ -8,7 +8,7 @@ easier to administer devices."<br>
                       HOMEPAGE = "<a href="http://www.isc.org/"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://www.isc.org/</a>"<br>
                      <br>
                       LICENSE = "ISC"<br>
                      -LIC_FILES_CHKSUM = <a
                        class="m_1440340043775474453moz-txt-link-rfc2396E"
                        moz-do-not-send="true">"file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"</a><br>
                      +LIC_FILES_CHKSUM = <a
                        class="m_1440340043775474453moz-txt-link-rfc2396E"
                        moz-do-not-send="true">"file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"</a><br>
                      <br>
                       DEPENDS = "openssl bind"<br>
                      <br>
                      @@ -24,7 +24,7 @@ SRC_URI = "<a
                        href="http://ftp.isc.org/isc/dhcp/$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz</a>
                      \<br>
                       UPSTREAM_CHECK_URI = "<a
                        href="ftp://ftp.isc.org/isc/dhcp/"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">ftp://ftp.isc.org/isc/dhcp/</a>"<br>
                       UPSTREAM_CHECK_REGEX =
                      "(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/"<br>
                      <br>
                      -inherit autotools systemd useradd update-rc.d<br>
                      +inherit autotools-brokensep systemd useradd
                      update-rc.d<br>
                      <br>
                       USERADD_PACKAGES = "${PN}-server"<br>
                       USERADD_PARAM_${PN}-server = "--system
                      --no-create-home --home-dir /var/run/${BPN}
                      --shell /bin/false --user-group ${BPN}"<br>
                      @@ -48,11 +48,21 @@ EXTRA_OECONF =
                      "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases
                      \<br>
                                     
                       --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases
                      \<br>
                                     
                       --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases
                      \<br>
                                     
                       --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases
                      \<br>
                      -                --with-libbind=${STAGING_LIBDIR}/
                      \<br>
                                       --enable-paranoia
                      --disable-static \<br>
                                       --with-randomdev=/dev/random \<br>
                      +               
                      --with-libbind=${STAGING_DIR_HOST}/usr \<br>
                      +               --enable-libtool \<br>
                                      "<br>
                      <br>
                      +#Enable shared libs per dhcp README<br>
                      +do_configure () {<br>
                      +       cd ${S}<br>
                      +       cp <a href="http://configure.ac"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">configure.ac</a>+lt <a
                        href="http://configure.ac" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">configure.ac</a><br>
                      +        autoreconf -i<br>
                      +       ./configure  ${CONFIGUREOPTS}
                      ${EXTRA_OECONF}   <br>
                      +       automake<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>1. Why run automake when autoreconf already
                      runs automake?</div>
                  </div>
                </div>
              </blockquote>
              it caused errors when I did not included. <br>
              <br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div>2. Why override do_configure and reproduce
                      what's already in autotools-brokensep rather than
                      doing the cp in a do_configure_prepend?<br
                        clear="all">
                    </div>
                  </div>
                </div>
              </blockquote>
              I did that first and it did not work. The README regarding
              *+lt says it needs "autoreconf -i". I am only doing this
              as the current version of dhcp has a patch to create
              shared libs. The isc dhcp solution to this is their <a
                href="http://configure.ac" target="_blank"
                moz-do-not-send="true">configure.ac</a>+lt.  I would
              rather no do this but someone needed shared libs.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>We already run autoreconf -i in the default do_configure,
            I see no reason to be duplicating half of its logic when all
            you need to do is replace the default <a
              href="http://configure.ac" moz-do-not-send="true">configure.ac</a>
            with the +lt version before that.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    cool. that does seem to work.  V2 being sent shortly.<br>
    <br>
    thanks for the push.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CABcZANkCbhzH-_Q-djjJa6-W4JVE3yMogenCf+w97C+7oNwVdQ@mail.gmail.com">
      <div dir="ltr">-- <br>
        <div dir="ltr" class="gmail_signature"
          data-smartmail="gmail_signature">
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
    </blockquote>
    <br>
  </body>
</html>

--------------5BB6DB5577F1E16401569A82--
