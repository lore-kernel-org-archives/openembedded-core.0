Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDDD60B06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 04:58:40 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 66so20355709otd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=+0J+m7o3bOgpuAKG73v6CppgJv1BEotnLJbl4EgFUDg=;
	b=HAcCiK+ojdpt8zonURM7G/G1InqxeqW3K7IyWy1v42PAJugookEHQs8+HsBZTbj5gQ
	4maeWT3ySmMXCyDm3Pu6/yYf4UT2S57eXDYg7z5LNUYfzbj6g3KS3jd2f6PMoeJMHdlb
	/cEVwfBa6u37RCCG/1aUjEAdo6DlXvaldTSuhSOv32/MCSdgXhv8SmVtzEXkd+IsTuEd
	JaGXRnenZVXH5rEIMgCNh/bNc+zsH111zeTCvFuGT/0i4QRh8toJeJcO8jmFG6yAqVuU
	ENh6v7cEBWgv/zsN151V5qOY9pQWhRpk/xIEBCa0xJKROl2rtY/qeQAnscECs3K73q8p
	BHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=+0J+m7o3bOgpuAKG73v6CppgJv1BEotnLJbl4EgFUDg=;
	b=d8ihcaCNR9qYlw6iBttIgzB/cHZUWFoQNpz1VsX40orQcHOAo045BfE8yI5J2jy7UC
	ALeMCRwMjBJcir6yKGokRbZqjziyLrjYpzUCtrz0UZxWWjG5Mq47Y4ZHd+XZb996JWUF
	BFES1MN2npiGt9vrm2nUN01UDGghyUklfusHrQ+70p4I8VPtCyVP5ihvKnAONMS/8Ut/
	HWdXMbvkzYMeXtOmEfbeXsrDgr5O7JMxaXm2RjM41Q/o/ZgaIoM5pG4FhuhzyMgFMWey
	YIAvTtYFba0rp4o0Tj6ZoyE2Aeq9M1Sz69ZECOM89H7Btk1La2HtsJdxyHunjVNV19mE
	cC6Q==
X-Gm-Message-State: ANhLgQ1TvPeHvsk+XOG9KcTD6bIPsVUfd5u27T6Tc8Q2HfRP/ClevYJB
	nhIAeIPQOHYVuSsQHG/FI5Ezs7sxyTo=
X-Google-Smtp-Source: ADFU+vutDV4r6N/B0iDeIkVqFq5LQa5y139Z2qV5dZ0vYXSMoNpTz8GhgAME4jUzil9YiYxgTnpd4g==
X-Received: by 2002:a9d:ac5:: with SMTP id 63mr2252661otq.239.1584421120641;
	Mon, 16 Mar 2020 21:58:40 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id k17sm719085oic.45.2020.03.16.21.58.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Mar 2020 21:58:39 -0700 (PDT)
To: "Chen, Qi" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200311222249.29880-2-jpuhlman@mvista.com>
	<DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
	<a5332339-6281-76fd-e23e-3ee2ed762720@mvista.com>
	<DM6PR11MB34987CF94AFA084E609D4270EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <893056b5-2095-a84e-553b-d6278adfc579@mvista.com>
Date: Mon, 16 Mar 2020 21:58:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB34987CF94AFA084E609D4270EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0ggMi8yXSBnbGliLTIuMDogQ29ycmVjdCBtdWx0aWxpYiBjb25mbGljdA==?=
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
X-List-Received-Date: Tue, 17 Mar 2020 04:58:40 -0000
Content-Type: multipart/alternative;
	boundary="------------89787DF83C9D757AA50BFCAE"
Content-Language: en-US

--------------89787DF83C9D757AA50BFCAE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Do you have ptests turned off?
Looks like all the test checking is done in do_install rather then 
do_install_ptest. I think I need to add a check for the existance like 
the change above the added one.

On 3/16/2020 9:31 PM, Chen, Qi wrote:
> MULTILIBS ?= "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "armv7vethf"
>
> I think you can use these two lines to reproduce the problem with 
> multilib enabled.
>
> Regards,
> Chen Qi
> ------------------------------------------------------------------------
> *发件人:* Jeremy A. Puhlman <jpuhlman@mvista.com>
> *发送时间:* 2020年3月17日 12:02
> *收件人:* Chen, Qi <Qi.Chen@windriver.com>; 
> openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *主题:* Re: 回复: [OE-core] [PATCH 2/2] glib-2.0: Correct multilib 
> conflict
> Just standard x86/i585. What are you using for your mulitlib. 
> ilp32/aarch32/arm7?
>
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> X86ARCH32 = "i586"
> DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
> TARGET_ARCH_virtclass-multilib-lib32 = "i586"
> TARGET_LD_ARCH_virtclass-multilib-lib32 = "-m elf_i386"
> ALTBINDIR_SUFFIX_virtclass-multilib-lib32 = "32"
>
> What does your -e look like for the recipe that fails?
>
> On 3/16/2020 8:30 PM, Chen, Qi wrote:
>> This patch is causing regression in case of qemuarm64 multilib for 
>> me. The static-link.test file is not there, resulting the `mv' 
>> command failure. I've sent out a patch to fix this problem, but I 
>> don't know what's your environment. So please help review.
>>
>> Regards,
>> Chen Qi
>> ------------------------------------------------------------------------
>> *发件人:* openembedded-core-bounces@lists.openembedded.org 
>> <mailto:openembedded-core-bounces@lists.openembedded.org> 
>> <openembedded-core-bounces@lists.openembedded.org> 
>> <mailto:openembedded-core-bounces@lists.openembedded.org> 代表 Jeremy 
>> A. Puhlman <jpuhlman@mvista.com> <mailto:jpuhlman@mvista.com>
>> *发送时间:* 2020年3月12日 6:22
>> *收件人:* openembedded-core@lists.openembedded.org 
>> <mailto:openembedded-core@lists.openembedded.org> 
>> <openembedded-core@lists.openembedded.org> 
>> <mailto:openembedded-core@lists.openembedded.org>
>> *主题:* [OE-core] [PATCH 2/2] glib-2.0: Correct multilib conflict
>> From: Jeremy Puhlman <jpuhlman@mvista.com> <mailto:jpuhlman@mvista.com>
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com> 
>> <mailto:jpuhlman@mvista.com>
>> ---
>>  meta/recipes-core/glib-2.0/glib.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib.inc 
>> b/meta/recipes-core/glib-2.0/glib.inc
>> index 23c347dbf7..edecc51fdb 100644
>> --- a/meta/recipes-core/glib-2.0/glib.inc
>> +++ b/meta/recipes-core/glib-2.0/glib.inc
>> @@ -128,6 +128,9 @@ do_install_append_class-target () {
>>                          rm 
>> ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
>>                  fi
>>          fi
>> +        if test "x${MLPREFIX}" != "x"; then
>> +                mv 
>> ${D}${datadir}/installed-tests/glib/static-link.test 
>> ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
>> +        fi
>>  }
>>
>>  # As we do not build python3 for windows, makes no sense to ship the 
>> script that's using it
>> -- 
>> 2.13.3
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
>> 	Virus-free. www.avg.com 
>> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
>>
>>
>
> -- 
> Jeremy A. Puhlman
> jpuhlman@mvista.com  <mailto:jpuhlman@mvista.com>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------89787DF83C9D757AA50BFCAE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Do you have ptests turned off?<br>
    Looks like all the test checking is done in do_install rather then
    do_install_ptest. I think I need to add a check for the existance
    like the change above the added one.<br>
    <br>
    <div class="moz-cite-prefix">On 3/16/2020 9:31 PM, Chen, Qi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR11MB34987CF94AFA084E609D4270EDF60@DM6PR11MB3498.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span>MULTILIBS ?= "multilib:lib32"<br>
        </span>
        <div>DEFAULTTUNE_virtclass-multilib-lib32 ?= "armv7vethf"</div>
        <div><br>
        </div>
        <div>I think you can use these two lines to reproduce the
          problem with multilib enabled.<br>
        </div>
        <span></span></div>
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
          face="Calibri, sans-serif" color="#000000"><b>发件人:</b> Jeremy
          A. Puhlman <a class="moz-txt-link-rfc2396E" href="mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</a><br>
          <b>发送时间:</b> 2020年3月17日 12:02<br>
          <b>收件人:</b> Chen, Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>主题:</b> Re: 回复: [OE-core] [PATCH 2/2] glib-2.0: Correct
          multilib conflict</font>
        <div> </div>
      </div>
      <div>Just standard x86/i585. What are you using for your mulitlib.
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
        <div class="x_moz-cite-prefix">On 3/16/2020 8:30 PM, Chen, Qi
          wrote:<br>
        </div>
        <blockquote type="cite">
          <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
            This patch is causing regression in case of qemuarm64
            multilib for me. The static-link.test file is not there,
            resulting the `mv' command failure. I've sent out a patch to
            fix this problem, but I don't know what's your environment.
            So please help review.</div>
          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
            <br>
          </div>
          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
            Regards,</div>
          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
            Chen Qi<br>
          </div>
          <hr tabindex="-1" style="display:inline-block; width:98%">
          <div id="x_divRplyFwdMsg" dir="ltr"><font
              style="font-size:11pt" face="Calibri, sans-serif"
              color="#000000"><b>发件人:</b>
              <a class="x_moz-txt-link-abbreviated"
                href="mailto:openembedded-core-bounces@lists.openembedded.org"
                moz-do-not-send="true">
                openembedded-core-bounces@lists.openembedded.org</a> <a
                class="x_moz-txt-link-rfc2396E"
                href="mailto:openembedded-core-bounces@lists.openembedded.org"
                moz-do-not-send="true">
                &lt;openembedded-core-bounces@lists.openembedded.org&gt;</a>
              代表 Jeremy A. Puhlman <a class="x_moz-txt-link-rfc2396E"
                href="mailto:jpuhlman@mvista.com" moz-do-not-send="true">
                &lt;jpuhlman@mvista.com&gt;</a><br>
              <b>发送时间:</b> 2020年3月12日 6:22<br>
              <b>收件人:</b> <a class="x_moz-txt-link-abbreviated"
                href="mailto:openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">
                openembedded-core@lists.openembedded.org</a> <a
                class="x_moz-txt-link-rfc2396E"
                href="mailto:openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">
                &lt;openembedded-core@lists.openembedded.org&gt;</a><br>
              <b>主题:</b> [OE-core] [PATCH 2/2] glib-2.0: Correct
              multilib conflict</font>
            <div> </div>
          </div>
          <div class="x_BodyFragment"><font size="2"><span
                style="font-size:11pt">
                <div class="x_PlainText">From: Jeremy Puhlman <a
                    class="x_moz-txt-link-rfc2396E"
                    href="mailto:jpuhlman@mvista.com"
                    moz-do-not-send="true">
                    &lt;jpuhlman@mvista.com&gt;</a><br>
                  <br>
                  Signed-off-by: Jeremy A. Puhlman <a
                    class="x_moz-txt-link-rfc2396E"
                    href="mailto:jpuhlman@mvista.com"
                    moz-do-not-send="true">
                    &lt;jpuhlman@mvista.com&gt;</a><br>
                  ---<br>
                   meta/recipes-core/glib-2.0/glib.inc | 3 +++<br>
                   1 file changed, 3 insertions(+)<br>
                  <br>
                  diff --git a/meta/recipes-core/glib-2.0/glib.inc
                  b/meta/recipes-core/glib-2.0/glib.inc<br>
                  index 23c347dbf7..edecc51fdb 100644<br>
                  --- a/meta/recipes-core/glib-2.0/glib.inc<br>
                  +++ b/meta/recipes-core/glib-2.0/glib.inc<br>
                  @@ -128,6 +128,9 @@ do_install_append_class-target ()
                  {<br>
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
                   # As we do not build python3 for windows, makes no
                  sense to ship the script that's using it<br>
                  -- <br>
                  2.13.3<br>
                  <br>
                  -- <br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a class="x_moz-txt-link-abbreviated"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                  <a
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                </div>
              </span></font></div>
          <div id="x_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
            <table style="border-top:1px solid #D3D4DE">
              <tbody>
                <tr>
                  <td style="width:55px; padding-top:13px"><a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                      target="_blank" moz-do-not-send="true"><img alt=""
                        style="width:46px; height:29px"
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"
                        moz-do-not-send="true" width="46" height="29"></a></td>
                  <td style="width:470px; padding-top:12px;
                    color:#41424e; font-size:13px;
                    font-family:Arial,Helvetica,sans-serif;
                    line-height:18px">
                    Virus-free. <a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                      target="_blank" style="color:#4453ea"
                      moz-do-not-send="true">
                      www.avg.com</a> </td>
                </tr>
              </tbody>
            </table>
          </div>
        </blockquote>
        <br>
        <pre class="x_moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="x_moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com" moz-do-not-send="true">jpuhlman@mvista.com</a></pre>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a></pre>
  </body>
</html>

--------------89787DF83C9D757AA50BFCAE--
