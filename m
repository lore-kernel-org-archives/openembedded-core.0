Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 857197833B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 20:36:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m4so6064426pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=meh7OeIUlQyKbFexar5PiB1Uh/njYJId7NsEFXwKiqQ=;
	b=pAoVcCOXto9D+3DTpy1vuXGNoeXi8PfKhMBNWBBVdXiuC2oyXiLAoJfz30r81MpfWg
	fJ0GoS6ZDN73RUAlSmHN7UZQhG7TgRKMmNhTQ1p0JrPm6AtHLTOkdVl87cv9PDcbVAb8
	mRzP2qFQ48lCuMsGR6UXcsxk3+UsIYk8BGldKhdwfEgWX4jb2gw5ZuuJcssxjQpMPDqm
	nuaFRanNS2km4/U8WnEX5vHZu1M2KMFb/BkzIju73fwBF5/xKut+VaxX4k4urIqizhgq
	z4UOW0An8W3QFURZrnF88LRw5jNwmSBcd4KuASOTt2ucGBiqaHuflQ0PowfqrkCOMbHW
	kOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=meh7OeIUlQyKbFexar5PiB1Uh/njYJId7NsEFXwKiqQ=;
	b=uoYz7PuQpAfqzwsWsFTpzTWxqYfxbrJQyn0A4z6SCfLiSjCGX3vZnNS8TYRQzVXEJk
	kFNjSKP/ioobjUgLOrSaIed8sjhO9UQ3kDSXX0A7yBkD5K4iwO75a62ZlYPTxidA3u3n
	D/ISL36zQB9HdPXBDRKrmWlO+ncaOXWycigDVmMclEl6kC6hpeQtmmLwlMHAPxf4gZ20
	F7ZOXoMGDXxBr7xPgWJjxV8RkgrtoY95+eJYzSR0c4tRQ9KbodtUiG+dDGicWu7bDROF
	EYsUaaHlS+Edfvjye8pWD3jaXoE4J2yOFPbaN3Bfd6zgZJUTHjOKOC6CyCYMfI9L3Ghw
	/FkQ==
X-Gm-Message-State: AJaThX7fTVTDRFRA3FL11dbcLfy0ilEzVrQggm16izIW6dwQtK93Cpvv
	tGV3hFfbP7kBlCDfrlaL2UZ+cA==
X-Google-Smtp-Source: AGs4zMasC1Ab2KqSQ/STV2PZ1/wkRo20vLspkKxUDgjzeEibxv/fD+oK4zxebA6bxIZ0SrbtvYzuEA==
X-Received: by 10.99.7.8 with SMTP id 8mr6632173pgh.264.1511555768332;
	Fri, 24 Nov 2017 12:36:08 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	g10sm18320204pfe.77.2017.11.24.12.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 12:36:07 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<a8779efbc41a18d6f1c0c9d31b3706e3b47c81bc.1511294278.git.akuster808@gmail.com>
	<CAJTo0Lb4CY-MnhSgt5XWvRYqCrYDba2N5CDghpkgeKh+uoq9Uw@mail.gmail.com>
	<6e486fe6-1f4a-a36d-5885-34cfe9ff1d1c@gmail.com>
	<CAJTo0LYaRi1Jnmrrr-NwkufM452VNfroQT9BiW_2aAwQhna1VA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <201de6dd-7ff5-7fdd-db73-dadd7c174473@gmail.com>
Date: Fri, 24 Nov 2017 12:36:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYaRi1Jnmrrr-NwkufM452VNfroQT9BiW_2aAwQhna1VA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 24 Nov 2017 20:36:07 -0000
Content-Type: multipart/alternative;
	boundary="------------AD069DF0DDF8602EF8AC0888"
Content-Language: en-US

--------------AD069DF0DDF8602EF8AC0888
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/24/2017 08:59 AM, Burton, Ross wrote:
> I haven't looked into it further than verifying that reverting the
> curl upgrade makes it work again.
>
> dnf -> python -> gnutls -> curl.
k. I am setting up an env to rep this issue.

thanks,
Armin
>
> Ross
>
> On 24 November 2017 at 16:57, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 11/24/2017 04:49 AM, Burton, Ross wrote:
>>     Now I remember why this was rejected last time: it breaks dnf in
>>     musl
>>     (https://autobuilder.yocto.io/builders/nightly-musl/builds/616
>>     <https://autobuilder.yocto.io/builders/nightly-musl/builds/616>).
>     is it bugged?
>
>     - armin
>
>>
>>     Ross
>>
>>     On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com
>>     <mailto:akuster808@gmail.com>> wrote:
>>
>>         From: Armin Kuster <akuster@mvista.com
>>         <mailto:akuster@mvista.com>>
>>
>>         v2] - remove inherit
>>
>>         curlbuild.h removed from sources
>>
>>         includes:
>>         CVE-2017-1000257
>>
>>         removed patches for the following cve fixs:
>>         CVE-2017-1000254
>>         CVE-2017-1000101
>>         CVE-2017-1000100
>>         CVE-2017-1000099
>>
>>         Signed-off-by: Armin Kuster <akuster@mvista.com
>>         <mailto:akuster@mvista.com>>
>>         ---
>>          .../curl/{curl_7.54.1.bb <http://curl_7.54.1.bb> =>
>>         curl_7.56.1.bb <http://curl_7.56.1.bb>}                | 14
>>         +++-----------
>>          1 file changed, 3 insertions(+), 11 deletions(-)
>>          rename meta/recipes-support/curl/{curl_7.54.1.bb
>>         <http://curl_7.54.1.bb> => curl_7.56.1.bb
>>         <http://curl_7.56.1.bb>} (87%)
>>
>>         diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
>>         <http://curl_7.54.1.bb>
>>         b/meta/recipes-support/curl/curl_7.56.1.bb
>>         <http://curl_7.56.1.bb>
>>         similarity index 87%
>>         rename from meta/recipes-support/curl/curl_7.54.1.bb
>>         <http://curl_7.54.1.bb>
>>         rename to meta/recipes-support/curl/curl_7.56.1.bb
>>         <http://curl_7.56.1.bb>
>>         index 58f0531..830f350 100644
>>         --- a/meta/recipes-support/curl/curl_7.54.1.bb
>>         <http://curl_7.54.1.bb>
>>         +++ b/meta/recipes-support/curl/curl_7.56.1.bb
>>         <http://curl_7.56.1.bb>
>>         @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM =
>>         "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
>>
>>          SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2
>>         <http://curl.haxx.se/download/curl-$%7BPV%7D.tar.bz2> \
>>                    
>>         file://0001-replace-krb5-config-with-pkg-config.patch \
>>         -           file://CVE-2017-1000099.patch \
>>         -           file://CVE-2017-1000100.patch \
>>         -           file://CVE-2017-1000101.patch \
>>         -           file://CVE-2017-1000254.patch \
>>          "
>>
>>          SRC_URI_append_class-target = " \
>>         @@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
>>          #
>>          SRC_URI += " file://configure_ac.patch"
>>
>>         -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
>>         -SRC_URI[sha256sum] =
>>         "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
>>         +SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
>>         +SRC_URI[sha256sum] =
>>         "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
>>
>>          CVE_PRODUCT = "libcurl"
>>         -inherit autotools pkgconfig binconfig multilib_header
>>         +inherit autotools pkgconfig binconfig
>>
>>          PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES',
>>         'ipv6', d)} gnutls proxy threaded-resolver zlib"
>>          PACKAGECONFIG_class-native = "ipv6 proxy ssl
>>         threaded-resolver zlib"
>>         @@ -64,10 +60,6 @@ EXTRA_OECONF = " \
>>              --without-libpsl \
>>          "
>>
>>         -do_install_append() {
>>         -       oe_multilib_header curl/curlbuild.h
>>         -}
>>         -
>>          do_install_append_class-target() {
>>                 # cleanup buildpaths from curl-config
>>                 sed -i \
>>         --
>>         2.7.4
>>
>>         --
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>
>


--------------AD069DF0DDF8602EF8AC0888
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
    <div class="moz-cite-prefix">On 11/24/2017 08:59 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYaRi1Jnmrrr-NwkufM452VNfroQT9BiW_2aAwQhna1VA@mail.gmail.com">
      <div dir="ltr">I haven't looked into it further than verifying
        that reverting the curl upgrade makes it work again.
        <div><br>
        </div>
        <div>dnf -&gt; python -&gt; gnutls -&gt; curl.</div>
      </div>
    </blockquote>
    k. I am setting up an env to rep this issue.<br>
    <br>
    thanks,<br>
    Armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0LYaRi1Jnmrrr-NwkufM452VNfroQT9BiW_2aAwQhna1VA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 24 November 2017 at 16:57,
          akuster808 <span dir="ltr">&lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF"><span class="">
                <p><br>
                </p>
                <br>
                <div class="m_5508455879794370387moz-cite-prefix">On
                  11/24/2017 04:49 AM, Burton, Ross wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">Now I remember why this was rejected
                    last time: it breaks dnf in musl (<a
                      href="https://autobuilder.yocto.io/builders/nightly-musl/builds/616"
                      target="_blank" moz-do-not-send="true">https://autobuilder.yocto.io/<wbr>builders/nightly-musl/builds/<wbr>616</a>).</div>
                </blockquote>
              </span> is it bugged?<span class="HOEnZb"><font
                  color="#888888"><br>
                  <br>
                  - armin</font></span>
              <div>
                <div class="h5"><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div><br>
                      </div>
                      <div>Ross</div>
                    </div>
                    <div class="gmail_extra"><br>
                      <div class="gmail_quote">On 21 November 2017 at
                        20:01, Armin Kuster <span dir="ltr">&lt;<a
                            href="mailto:akuster808@gmail.com"
                            target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">From: Armin Kuster
                          &lt;<a href="mailto:akuster@mvista.com"
                            target="_blank" moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
                          <br>
                          v2] - remove inherit<br>
                          <br>
                          curlbuild.h removed from sources<br>
                          <br>
                          includes:<br>
                          CVE-2017-1000257<br>
                          <br>
                          removed patches for the following cve fixs:<br>
                          CVE-2017-1000254<br>
                          CVE-2017-1000101<br>
                          CVE-2017-1000100<br>
                          CVE-2017-1000099<br>
                          <br>
                          Signed-off-by: Armin Kuster &lt;<a
                            href="mailto:akuster@mvista.com"
                            target="_blank" moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
                          ---<br>
                           .../curl/{<a href="http://curl_7.54.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">curl_7.54.1.bb</a>
                          =&gt; <a href="http://curl_7.56.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">curl_7.56.1.bb</a>} 
                                        | 14 +++-----------<br>
                           1 file changed, 3 insertions(+), 11
                          deletions(-)<br>
                           rename meta/recipes-support/curl/{<a
                            href="http://curl_7.54.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">cur<wbr>l_7.54.1.bb</a>
                          =&gt; <a href="http://curl_7.56.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">curl_7.56.1.bb</a>}
                          (87%)<br>
                          <br>
                          diff --git a/meta/recipes-support/curl/<a
                            href="http://curl_7.54.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">cu<wbr>rl_7.54.1.bb</a>
                          b/meta/recipes-support/curl/<a
                            href="http://curl_7.56.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">cu<wbr>rl_7.56.1.bb</a><br>
                          similarity index 87%<br>
                          rename from meta/recipes-support/curl/<a
                            href="http://curl_7.54.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">curl<wbr>_7.54.1.bb</a><br>
                          rename to meta/recipes-support/curl/<a
                            href="http://curl_7.56.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">curl<wbr>_7.56.1.bb</a><br>
                          index 58f0531..830f350 100644<br>
                          --- a/meta/recipes-support/curl/<a
                            href="http://curl_7.54.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">cu<wbr>rl_7.54.1.bb</a><br>
                          +++ b/meta/recipes-support/curl/<a
                            href="http://curl_7.56.1.bb"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">cu<wbr>rl_7.56.1.bb</a><br>
                          @@ -7,10 +7,6 @@ LIC_FILES_CHKSUM = "<a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://COPYING;beginline=8</a>;md<wbr>5=3a34942f4ae3fbf1a303160714e6<wbr>6<br>
                          <br>
                           SRC_URI = "<a
                            href="http://curl.haxx.se/download/curl-$%7BPV%7D.tar.bz2"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">http://curl.haxx.se/download/<wbr>curl-${PV}.tar.bz2</a>
                          \<br>
                                      <a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://0001-replace-krb5</a>-confi<wbr>g-with-pkg-config.patch
                          \<br>
                          -           <a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://CVE-2017-1000099.patch</a>
                          \<br>
                          -           <a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://CVE-2017-1000100.patch</a>
                          \<br>
                          -           <a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://CVE-2017-1000101.patch</a>
                          \<br>
                          -           <a
                            class="m_5508455879794370387moz-txt-link-freetext"
                            moz-do-not-send="true">file://CVE-2017-1000254.patch</a>
                          \<br>
                           "<br>
                          <br>
                           SRC_URI_append_class-target = " \<br>
                          @@ -22,11 +18,11 @@
                          SRC_URI_append_class-target = " \<br>
                           #<br>
                           SRC_URI += <a
                            class="m_5508455879794370387moz-txt-link-rfc2396E"
                            moz-do-not-send="true">"
                            file://configure_ac.patch"</a><br>
                          <br>
                          -SRC_URI[md5sum] =
                          "6b6eb722f512e7a24855ff084f54f<wbr>e55"<br>
                          -SRC_URI[sha256sum] =
                          "fdfc4df2d001ee0c44ec071186e77<wbr>0046249263c491fcae48df0e1a3ca8<wbr>f25a0"<br>
                          +SRC_URI[md5sum] =
                          "428de25834ef8c04076906d6d5c04<wbr>98e"<br>
                          +SRC_URI[sha256sum] =
                          "2594670367875e7d87b0f129b5e46<wbr>90150780884d90244ba0fe3e74a778<wbr>b5f90"<br>
                          <br>
                           CVE_PRODUCT = "libcurl"<br>
                          -inherit autotools pkgconfig binconfig
                          multilib_header<br>
                          +inherit autotools pkgconfig binconfig<br>
                          <br>
                           PACKAGECONFIG ??=
                          "${@bb.utils.filter('DISTRO_FE<wbr>ATURES',
                          'ipv6', d)} gnutls proxy threaded-resolver
                          zlib"<br>
                           PACKAGECONFIG_class-native = "ipv6 proxy ssl
                          threaded-resolver zlib"<br>
                          @@ -64,10 +60,6 @@ EXTRA_OECONF = " \<br>
                               --without-libpsl \<br>
                           "<br>
                          <br>
                          -do_install_append() {<br>
                          -       oe_multilib_header curl/curlbuild.h<br>
                          -}<br>
                          -<br>
                           do_install_append_class-targe<wbr>t() {<br>
                                  # cleanup buildpaths from curl-config<br>
                                  sed -i \<br>
                          <span class="m_5508455879794370387HOEnZb"><font
                              color="#888888">--<br>
                              2.7.4<br>
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
                    </div>
                  </blockquote>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------AD069DF0DDF8602EF8AC0888--
