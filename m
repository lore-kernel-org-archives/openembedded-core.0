Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1B53178587
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:26:12 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id y29so194277pff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=fsaX9Sk//I7fUBKJf5ARsWXCZW40gs+NSfBfYDEAKWc=;
	b=VXooQ9debb12oSRCfpFg+2ZeM7Fo/yZpaoNXva/1E6aOkqt5heDej2Xtl14jReqH91
	mg/w+VEbMQk05HXUB7ZtNY18STyEmbVYgHlPche7ww5ZLEFPe3HiMmsdQbp1NYdsjzmH
	9zjsPvR9QSCWN7b3weuvK9UVjUNv46Ie4FUKlhsmHe+ZW4DNd4HpXU111qro+XFy+OJ2
	E3SETONANbpWh9Lvhn1YMX4IV0+Z4h3FlDKDbgZwOWxaCLEqaDPGhkrqTrpsnU6m6viT
	RVwdNoaUk494Kgs7sZLZB3SQ6aPlnR5wEC3i0ZRf8NHsF4RWonu6zmYK+YXgAVuO7jq8
	EcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=fsaX9Sk//I7fUBKJf5ARsWXCZW40gs+NSfBfYDEAKWc=;
	b=sAy5uiSmt8Wi/bHVsrPFFoGcdx2R0GLN1/xFNXLYdvRofcuzOowBVwOUFgkKHVUHrf
	ZMOYv1nABMlpHMKBq/wvM8+z/Fg5imz2M8E6NjluqjCSv/moW4dfuCQ9pDthJq7xxCKH
	LWzP+/965VKxWl1vJnkXVNf55ibXPGuRokdvwF5LxRtyxvnBTNTsIarmDTBabUS3cjv+
	RWjiZat9fr8gbVDAjCYYtNhiNM/AZBHLiRa3yEf/Ua1YV8K7as1Lib88GoAwrExq3+rR
	l0KnoQOFaWOtjvMnUISlm1KfNd2EY/+TvEqLARCgHAkkuRSy5XhCr4X7Mbk1iyGPZVKc
	LNoA==
X-Gm-Message-State: AHPjjUgb6FiOAPVb3hmpVwltVWUpU4kY/C0ootujcvFPe50AmtIdZVR+
	nUxLefYQXe/hvV2r
X-Google-Smtp-Source: ADKCNb6gBo0JNm9S51+ujxBP7wJ63ZeiMfNaDRg1U/D59+jbl0Pm9dgFeW7C+qkhMlFSEVqBW1Kosw==
X-Received: by 10.98.149.68 with SMTP id p65mr21728379pfd.301.1505417174253;
	Thu, 14 Sep 2017 12:26:14 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	g68sm8943975pfb.120.2017.09.14.12.26.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 12:26:13 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Ross Burton <ross.burton@intel.com>
References: <20170914122753.12713-1-ross.burton@intel.com>
	<CADkTA4Mn14dpJTV65T90dqN3h8cQ_tDiq7dRxV1SxJySCxsazQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <813a3cd4-e173-9de2-6c5c-0e1a370dcff5@gmail.com>
Date: Thu, 14 Sep 2017 12:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mn14dpJTV65T90dqN3h8cQ_tDiq7dRxV1SxJySCxsazQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Thu, 14 Sep 2017 19:26:13 -0000
Content-Type: multipart/alternative;
	boundary="------------D96C9E7732AFBB9DC62184BA"
Content-Language: en-US

--------------D96C9E7732AFBB9DC62184BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Bruce,


On 09/14/2017 06:13 AM, Bruce Ashfield wrote:
> .. and if anyone notices, there's a kernel part to this CVE as well.
>
> I've applied to fix to all the active linux-yocto kernels, and the 
> change will be part
> of my consolidated pull request that comes out later today.

thanks. I will merge with pyro and morty when they hit master.

- armin
>
> Cheers,
>
> Bruce
>
> On Thu, Sep 14, 2017 at 8:27 AM, Ross Burton <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     All versions of the SDP server in BlueZ 5.46 and earlier are
>     vulnerable to an
>     information disclosure vulnerability which allows remote attackers
>     to obtain
>     sensitive information from the bluetoothd process memory. This
>     vulnerability
>     lies in the processing of SDP search attribute requests.
>
>     Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     ---
>      meta/recipes-connectivity/bluez5/bluez5.inc |  1 +
>      .../bluez5/bluez5/cve-2017-1000250.patch  | 34 ++++++++++++++++++++++
>      2 files changed, 35 insertions(+)
>      create mode 100644
>     meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>
>     diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>     b/meta/recipes-connectivity/bluez5/bluez5.inc
>     index ecefb7b593e..3421c382063 100644
>     --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>     +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>     @@ -23,6 +23,7 @@ SRC_URI = "\
>          file://run-ptest \
>          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
>     'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch',
>     d)} \
>        
>      file://0001-tests-add-a-target-for-building-tests-without-runnin.patch
>     \
>     +    file://cve-2017-1000250.patch \
>      "
>      S = "${WORKDIR}/bluez-${PV}"
>
>     diff --git
>     a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>     b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>     new file mode 100644
>     index 00000000000..9fac961bcf6
>     --- /dev/null
>     +++ b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>     @@ -0,0 +1,34 @@
>     +All versions of the SDP server in BlueZ 5.46 and earlier are
>     vulnerable to an
>     +information disclosure vulnerability which allows remote
>     attackers to obtain
>     +sensitive information from the bluetoothd process memory. This
>     vulnerability
>     +lies in the processing of SDP search attribute requests.
>     +
>     +CVE: CVE-2017-1000250
>     +Upstream-Status: Backport
>     +Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     +
>     +From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00
>     2001
>     +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com
>     <mailto:luiz.von.dentz@intel.com>>
>     +Date: Wed, 13 Sep 2017 10:01:40 +0300
>     +Subject: sdp: Fix Out-of-bounds heap read in
>     service_search_attr_req function
>     +
>     +Check if there is enough data to continue otherwise return an error.
>     +---
>     + src/sdpd-request.c | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/src/sdpd-request.c b/src/sdpd-request.c
>     +index 1eefdce..318d044 100644
>     +--- a/src/sdpd-request.c
>     ++++ b/src/sdpd-request.c
>     +@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t
>     *req, sdp_buf_t *buf)
>     +       } else {
>     +               /* continuation State exists -> get from cache */
>     +               sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
>     +-              if (pCache) {
>     ++              if (pCache && cstate->cStateValue.maxBytesSent <
>     pCache->data_size) {
>     +                       uint16_t sent = MIN(max, pCache->data_size
>     - cstate->cStateValue.maxBytesSent);
>     +                       pResponse = pCache->data;
>     +                       memcpy(buf->data, pResponse +
>     cstate->cStateValue.maxBytesSent, sent);
>     +--
>     +cgit v1.1
>     --
>     2.11.0
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


--------------D96C9E7732AFBB9DC62184BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Bruce,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/14/2017 06:13 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4Mn14dpJTV65T90dqN3h8cQ_tDiq7dRxV1SxJySCxsazQ@mail.gmail.com">
      <div dir="ltr">.. and if anyone notices, there's a kernel part to
        this CVE as well.
        <div><br>
        </div>
        <div>I've applied to fix to all the active linux-yocto kernels,
          and the change will be part</div>
        <div>of my consolidated pull request that comes out later today.</div>
      </div>
    </blockquote>
    <br>
    thanks. I will merge with pyro and morty when they hit master.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CADkTA4Mn14dpJTV65T90dqN3h8cQ_tDiq7dRxV1SxJySCxsazQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Cheers,</div>
        <div><br>
        </div>
        <div>Bruce<br>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On Thu, Sep 14, 2017 at 8:27 AM,
              Ross Burton <span dir="ltr">&lt;<a
                  href="mailto:ross.burton@intel.com" target="_blank"
                  moz-do-not-send="true">ross.burton@intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">All
                versions of the SDP server in BlueZ 5.46 and earlier are
                vulnerable to an<br>
                information disclosure vulnerability which allows remote
                attackers to obtain<br>
                sensitive information from the bluetoothd process
                memory. This vulnerability<br>
                lies in the processing of SDP search attribute requests.<br>
                <br>
                Signed-off-by: Ross Burton &lt;<a
                  href="mailto:ross.burton@intel.com"
                  moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
                ---<br>
                 meta/recipes-connectivity/<wbr>bluez5/bluez5.inc       
                |  1 +<br>
                 .../bluez5/bluez5/cve-2017-<wbr>1000250.patch         
                 | 34 ++++++++++++++++++++++<br>
                 2 files changed, 35 insertions(+)<br>
                 create mode 100644 meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.patch<br>
                <br>
                diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc
                b/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
                index ecefb7b593e..3421c382063 100644<br>
                --- a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
                +++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
                @@ -23,6 +23,7 @@ SRC_URI = "\<br>
                     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
                     ${@bb.utils.contains('DISTRO_<wbr>FEATURES',
                'systemd', '', '<a class="moz-txt-link-freetext" href="file://0001-Allow-using">file://0001-Allow-using</a>-<wbr>obexd-without-systemd-in-the-<wbr>user-sessio.patch',
                d)} \<br>
                     <a class="moz-txt-link-freetext" href="file://0001-tests-add-a">file://0001-tests-add-a</a>-<wbr>target-for-building-tests-<wbr>without-runnin.patch
                \<br>
                +    <a class="moz-txt-link-freetext" href="file://cve-2017-1000250.patch">file://cve-2017-1000250.patch</a> \<br>
                 "<br>
                 S = "${WORKDIR}/bluez-${PV}"<br>
                <br>
                diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.patch
                b/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.patch<br>
                new file mode 100644<br>
                index 00000000000..9fac961bcf6<br>
                --- /dev/null<br>
                +++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.patch<br>
                @@ -0,0 +1,34 @@<br>
                +All versions of the SDP server in BlueZ 5.46 and
                earlier are vulnerable to an<br>
                +information disclosure vulnerability which allows
                remote attackers to obtain<br>
                +sensitive information from the bluetoothd process
                memory. This vulnerability<br>
                +lies in the processing of SDP search attribute
                requests.<br>
                +<br>
                +CVE: CVE-2017-1000250<br>
                +Upstream-Status: Backport<br>
                +Signed-off-by: Ross Burton &lt;<a
                  href="mailto:ross.burton@intel.com"
                  moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
                +<br>
                +From 9e009647b14e810e06626dde7f1bb9<wbr>ea3c375d09 Mon
                Sep 17 00:00:00 2001<br>
                +From: Luiz Augusto von Dentz &lt;<a
                  href="mailto:luiz.von.dentz@intel.com"
                  moz-do-not-send="true">luiz.von.dentz@intel.com</a>&gt;<br>
                +Date: Wed, 13 Sep 2017 10:01:40 +0300<br>
                +Subject: sdp: Fix Out-of-bounds heap read in
                service_search_attr_req function<br>
                +<br>
                +Check if there is enough data to continue otherwise
                return an error.<br>
                +---<br>
                + src/sdpd-request.c | 2 +-<br>
                + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                +<br>
                +diff --git a/src/sdpd-request.c b/src/sdpd-request.c<br>
                +index 1eefdce..318d044 100644<br>
                +--- a/src/sdpd-request.c<br>
                ++++ b/src/sdpd-request.c<br>
                +@@ -917,7 +917,7 @@ static int
                service_search_attr_req(sdp_<wbr>req_t *req, sdp_buf_t
                *buf)<br>
                +       } else {<br>
                +               /* continuation State exists -&gt; get
                from cache */<br>
                +               sdp_buf_t *pCache =
                sdp_get_cached_rsp(cstate);<br>
                +-              if (pCache) {<br>
                ++              if (pCache &amp;&amp;
                cstate-&gt;cStateValue.<wbr>maxBytesSent &lt;
                pCache-&gt;data_size) {<br>
                +                       uint16_t sent = MIN(max,
                pCache-&gt;data_size - cstate-&gt;cStateValue.<wbr>maxBytesSent);<br>
                +                       pResponse = pCache-&gt;data;<br>
                +                       memcpy(buf-&gt;data, pResponse +
                cstate-&gt;cStateValue.<wbr>maxBytesSent, sent);<br>
                +--<br>
                +cgit v1.1<br>
                <span class="HOEnZb"><font color="#888888">--<br>
                    2.11.0<br>
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
                  </font></span></blockquote>
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

--------------D96C9E7732AFBB9DC62184BA--
