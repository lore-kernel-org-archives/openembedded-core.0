Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 141CE608DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 04:02:51 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id h17so1652374otn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 21:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=nORx+C+hNvCy+wtM3U9b7x2PkMro7Ld/VP2WYAyA21Y=;
	b=KWOjLA8w/fyRrIUwnUiFVJYBsivricAA6k1tzoG7l1EUEkn0+AJHeEDDGFij4V9DzJ
	DR23TKVBHcmbza/z7DXAaQM3pRJunjk3myjZUb1+UvFHC9fw/TDXPPOBBv92vpV4ZZ4T
	xXhzOD+8Wxs/6PY4vnPm73a2ZNcjWZfLAKxdqcrIjIKPQCzvgtIC4Md+btC/mvsKuDRN
	7/x0dFfjgottHd9moc+XPt6qfkda0UzxsLl5ZgHxpmsvPM+THJbyY2P3NYxbF1hqz2Wm
	xDHpt5iBBXIYQsnF/ELZznVrtFsd8YNhaofquWiB2DXfkKb5oL7yUKM0zk8hJgTV+guX
	LeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=nORx+C+hNvCy+wtM3U9b7x2PkMro7Ld/VP2WYAyA21Y=;
	b=eC8Qn6r8k5CdNOqs1zFmPvkpSxbSpknSwvf6ErlogiICKnmOB5BTg66A5bG6o4RUy6
	ax3hUIZ/Bx+4sxwQFuCG2dg2iNn+huiZr99xPlD9Gl8TQH4oDf+uEhF5F8K+DvbZfv4X
	hIw3Ds2uJMztwyZyraO+cVh2ZKWSXaICEtH2JOcpa7tjMlhwLNNrjuQ34iTe34SNIkuJ
	y9GiEaYyoOFzIGz+8+7+2PYmTdCre41S+ndU9n6Mc/V/p/PLrj4WXmkVfh8b7svMryPm
	j+tYQVF/xuwIHnPtt9SCQbn6pIfeZy738HIS3zE7qjB71oFEiKN0MGDCN4n1ko7zNSKT
	EG+g==
X-Gm-Message-State: ANhLgQ0RGNGimccXf2HNjEELijhKtDHYeLemthijDdRxptUw0R9QMIbH
	680cYtvrIM7gB5fVx1PghfESbBGpx+Q=
X-Google-Smtp-Source: ADFU+vtHPRM6EOMe26hx4kIvv5/cqwR0OtQ2VtfZ6dvJzaOW9DErIQDsiD039MJMbBYs/y6d1Cc96Q==
X-Received: by 2002:a9d:2264:: with SMTP id o91mr2106497ota.328.1584417772329; 
	Mon, 16 Mar 2020 21:02:52 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id e11sm678471oie.3.2020.03.16.21.02.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Mar 2020 21:02:51 -0700 (PDT)
To: "Chen, Qi" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200311222249.29880-2-jpuhlman@mvista.com>
	<DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <a5332339-6281-76fd-e23e-3ee2ed762720@mvista.com>
Date: Mon, 16 Mar 2020 21:02:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvMl0gZ2xpYi0yLjA6IENvcnJlY3QgbXVsdGlsaWIgY29uZmxpY3Q=?=
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
X-List-Received-Date: Tue, 17 Mar 2020 04:02:52 -0000
Content-Type: multipart/alternative;
	boundary="------------FFA6C90A25D0E47670EBB855"
Content-Language: en-US

--------------FFA6C90A25D0E47670EBB855
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Just standard x86/i585. What are you using for your mulitlib. 
ilp32/aarch32/arm7?

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
X86ARCH32 = "i586"
DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
TARGET_ARCH_virtclass-multilib-lib32 = "i586"
TARGET_LD_ARCH_virtclass-multilib-lib32 = "-m elf_i386"
ALTBINDIR_SUFFIX_virtclass-multilib-lib32 = "32"

What does your -e look like for the recipe that fails?

On 3/16/2020 8:30 PM, Chen, Qi wrote:
> This patch is causing regression in case of qemuarm64 multilib for me. 
> The static-link.test file is not there, resulting the `mv' command 
> failure. I've sent out a patch to fix this problem, but I don't know 
> what's your environment. So please help review.
>
> Regards,
> Chen Qi
> ------------------------------------------------------------------------
> *发件人:* openembedded-core-bounces@lists.openembedded.org 
> <openembedded-core-bounces@lists.openembedded.org> 代表 Jeremy A. 
> Puhlman <jpuhlman@mvista.com>
> *发送时间:* 2020年3月12日 6:22
> *收件人:* openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *主题:* [OE-core] [PATCH 2/2] glib-2.0: Correct multilib conflict
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc 
> b/meta/recipes-core/glib-2.0/glib.inc
> index 23c347dbf7..edecc51fdb 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -128,6 +128,9 @@ do_install_append_class-target () {
>                          rm 
> ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
>                  fi
>          fi
> +        if test "x${MLPREFIX}" != "x"; then
> +                mv 
> ${D}${datadir}/installed-tests/glib/static-link.test 
> ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
> +        fi
>  }
>
>  # As we do not build python3 for windows, makes no sense to ship the 
> script that's using it
> -- 
> 2.13.3
>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
> 	Virus-free. www.avg.com 
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
>
>
> <#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------FFA6C90A25D0E47670EBB855
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Just standard x86/i585. What are you using for your mulitlib.
    ilp32/aarch32/arm7?<br>
    <br>
    require conf/multilib.conf<br>
    MULTILIBS = "multilib:lib32"<br>
    X86ARCH32 = "i586"<br>
    DEFAULTTUNE_virtclass-multilib-lib32 = "i586"<br>
    TARGET_ARCH_virtclass-multilib-lib32 = "i586"<br>
    TARGET_LD_ARCH_virtclass-multilib-lib32 = "-m elf_i386"<br>
    ALTBINDIR_SUFFIX_virtclass-multilib-lib32 = "32"<br>
    <br>
    What does your -e look like for the recipe that fails?<br>
    <br>
    <div class="moz-cite-prefix">On 3/16/2020 8:30 PM, Chen, Qi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        This patch is causing regression in case of qemuarm64 multilib
        for me. The static-link.test file is not there, resulting the
        `mv' command failure. I've sent out a patch to fix this problem,
        but I don't know what's your environment. So please help review.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Regards,</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Chen Qi<br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>发件人:</b>
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core-bounces@lists.openembedded.org">openembedded-core-bounces@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core-bounces@lists.openembedded.org">&lt;openembedded-core-bounces@lists.openembedded.org&gt;</a> 代表
          Jeremy A. Puhlman <a class="moz-txt-link-rfc2396E" href="mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</a><br>
          <b>发送时间:</b> 2020年3月12日 6:22<br>
          <b>收件人:</b> <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>主题:</b> [OE-core] [PATCH 2/2] glib-2.0: Correct multilib
          conflict</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">From: Jeremy Puhlman
              <a class="moz-txt-link-rfc2396E" href="mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</a><br>
              <br>
              Signed-off-by: Jeremy A. Puhlman
              <a class="moz-txt-link-rfc2396E" href="mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</a><br>
              ---<br>
               meta/recipes-core/glib-2.0/glib.inc | 3 +++<br>
               1 file changed, 3 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-core/glib-2.0/glib.inc
              b/meta/recipes-core/glib-2.0/glib.inc<br>
              index 23c347dbf7..edecc51fdb 100644<br>
              --- a/meta/recipes-core/glib-2.0/glib.inc<br>
              +++ b/meta/recipes-core/glib-2.0/glib.inc<br>
              @@ -128,6 +128,9 @@ do_install_append_class-target () {<br>
                                       rm
              ${D}${datadir}/installed-tests/glib/gdbus-serialization.test<br>
                               fi<br>
                       fi<br>
              +        if test "x${MLPREFIX}" != "x"; then<br>
              +                mv
              ${D}${datadir}/installed-tests/glib/static-link.test
              ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test<br>
              +        fi<br>
               }<br>
               <br>
               # As we do not build python3 for windows, makes no sense
              to ship the script that's using it<br>
              -- <br>
              2.13.3<br>
              <br>
              -- <br>
              _______________________________________________<br>
              Openembedded-core mailing list<br>
              <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
            </div>
          </span></font></div>
      <div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
        <table style="border-top: 1px solid #D3D4DE;">
          <tbody>
            <tr>
              <td style="width: 55px; padding-top: 13px;"><a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" moz-do-not-send="true"><img
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"
                    alt="" style="width: 46px; height: 29px;"
                    moz-do-not-send="true" width="46" height="29"></a></td>
              <td style="width: 470px; padding-top: 12px; color:
                #41424e; font-size: 13px; font-family: Arial, Helvetica,
                sans-serif; line-height: 18px;">Virus-free. <a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" style="color: #4453ea;"
                  moz-do-not-send="true">www.avg.com</a> </td>
            </tr>
          </tbody>
        </table>
        <a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1"
          height="1" moz-do-not-send="true"> </a></div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a></pre>
  </body>
</html>

--------------FFA6C90A25D0E47670EBB855--
