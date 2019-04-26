Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 551397D69B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:29:59 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id s4so1815825pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=4YhGBr15t9M2FMnHBkkAwXGaRaRJLy+//hnymsEMAjI=;
	b=acKnXHnB1KGO5tCnSuHsFz1e75pIc/dc+n1nLSTwKJkpHlGmyiPq61MwswTKNjR+Ut
	33hykC0oB3GJL/YBd3MtJvyPA8KlomVDd5knrRNmM8TrTYK5AnyzLleFWsg/sHu5y5DI
	vmKvQqq9ZhoN0Gn99DhkC5UhECQ3ByC4J/OB93a1nlg+4p3Kwl6wf7FO7pKW3AMEUDyS
	OsBLDMI1U8v9Qa7hhdtufTFiX29CISY0hHguAXBbIfPV3WaD10MDdxTyBVcu8Qz0RZm9
	1yme5/zr5icIw2EEZM8ifx2BwunT1+5JM0hz/dhikBgYJ8mAHzFT3sDopYNy6Y3KT/Q1
	hovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=4YhGBr15t9M2FMnHBkkAwXGaRaRJLy+//hnymsEMAjI=;
	b=Gr7J1qSc4Yo2REEPglcAzK+tq0b6vSn7bjC1Xe5mvu5p9xBmxQhRqGUwRIFbbq1z2P
	yE69papboF/JJWxeMF1tnSYu+LzI+2dTCaqipFVZICLlySr7jPTsHz/06OeWA7cig0y/
	ieD3bZo+CK6vQWwem2s5EwyotikZeRogyENn0aCbkmnB0JiRFU6EgiRMUzho31uI5thn
	+VaEQ9WWYsnpc2vy9nW2rnpBgm6ZdC9F8qoKPz+9XergQIcEyKuDqxfRoCOTvB7lAUbT
	vLl/5D7RLdq8zEdlSmYSmC5OUqeDnf6eEGvcZTuuCoqeZnXH151GuY4j5WrSqFCvGZJT
	qzvw==
X-Gm-Message-State: APjAAAU8i+dbnuGFpi2LgkwPIwqXcUuokpQf3Xb9DHP7oy7se+kySqi0
	h4Cu0m5SSJh5pOPdj4C937wOCNoW
X-Google-Smtp-Source: APXvYqymseJInwdvgMLixm0AcQjvjM5o8O5r1qjb70YSRx2QuU+5ezwj0smLyUvor9KcH1C16JZYfg==
X-Received: by 2002:a65:6294:: with SMTP id f20mr43391155pgv.415.1556289000234;
	Fri, 26 Apr 2019 07:30:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4107:c4f1:f56d:2679?
	([2601:202:4180:c33:4107:c4f1:f56d:2679])
	by smtp.gmail.com with ESMTPSA id
	u62sm42085697pfa.124.2019.04.26.07.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:29:59 -0700 (PDT)
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>,
	"'yocto@yoctoproject.org'" <yocto@yoctoproject.org>,
	"Eggleton, Paul" <paul.eggleton@intel.com>,
	"'richard.purdie@linuxfoundation.org'"
	<richard.purdie@linuxfoundation.org>, 
	'Michael Halstead' <mhalstead@linuxfoundation.org>,
	"Erway, Tracey M" <tracey.m.erway@intel.com>,
	"'sjolley.yp.pm@gmail.com'" <sjolley.yp.pm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6fe6873c-a35c-65e6-507b-1244610e7e3f@gmail.com>
Date: Fri, 26 Apr 2019 07:29:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com>
Subject: Re: QA cycle report for 2.7 RC2
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
X-List-Received-Date: Fri, 26 Apr 2019 14:29:59 -0000
Content-Type: multipart/alternative;
	boundary="------------BCD7BA7A0A436D6EF0927943"
Content-Language: en-US

--------------BCD7BA7A0A436D6EF0927943
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Sangeeta,


On 4/25/19 11:27 PM, Jain, Sangeeta wrote:
>
> =A0
>
> QA cycle reportfor 2.7 RC2:
>
> =A0
>
>  1. No high milestone defects.=A0
>  2. Test results are available at following location:
>
> =B7=A0=A0=A0=A0=A0=A0=A0 For results of all automated tests, please ref=
er to results
> at public AB [1].
>
> =B7=A0=A0=A0=A0=A0=A0=A0 For other test results, refer to attachment [2=
].
>
> =B7=A0=A0=A0=A0=A0=A0=A0 For test report for test cases run by Intel an=
d WR team,
> refer attachment [3]
>
Since "compliance-test.compliance-test.LSB_subset_test_suite" was run,
can you share the changes made to /opt/lsb-test/session file?

||

Can I get clarification on how
"compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone" was run?

Regards,
Armin
>
> =B7=A0=A0=A0=A0=A0=A0=A0 For full test report, refer attachment [4]
>
>  3. No new defects are found in this cycle.
>  4. No existing issues observed in this release
>  5. No ptests are failing in this release which were passing in
>     previous release. No timeout issues.
>
> =A0
>
> QA Hint: One failure was observed on public AB:
>
> =A0
>
> testseries | result_id : qemuppc |
> oeselftest_centos-7_qemuppc_20190414221329
>
> runqemu.QemuTest.test_qemu_can_shutdown
>
> =A0
>
> No bug filed for this issue, as it appears to be an intermittent
> failure and worked on rc1 test run.
>
> =A0
>
> =3D=3D=3D=3D=3D=3D=3D Links=3D=3D=3D=3D=3D=3D=3D=3D
>
> =A0
>
> *Link to testresults:*
>
> =A0
>
> [1] - https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc2/testresul=
ts/
>
> =A0
>
> [2] - 2.7_RC2_results_merged.zip
>
> =A0
>
> [3] - 2.7_ rc2_intel_wr_merged_report
>
> =A0
>
> [4] =96 2.7 _rc2_full_report
>
> =A0
>
> Thanks & Regards,
>
> Sangeeta Jain
>
> =A0
>
>


--------------BCD7BA7A0A436D6EF0927943
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Sangeeta,<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/25/19 11:27 PM, Jain, Sangeeta
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;
	mso-fareast-language:EN-US;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:366490912;
	mso-list-type:hybrid;
	mso-list-template-ids:1418230706 1141440527 1141440537 1141440539 1141440527 1141440537 1141440539 1141440527 1141440537 1141440539;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:981421318;
	mso-list-type:hybrid;
	mso-list-template-ids:1690970774 1141440513 1141440537 1141440539 1141440527 1141440537 1141440539 1141440527 1141440537 1141440539;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1041327440;
	mso-list-template-ids:-636176784;}
@list l3
	{mso-list-id:1937203185;
	mso-list-template-ids:-1141324152;}
@list l3:level1
	{mso-level-start-at:3;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"
            lang="EN-US">QA cycle report<span style="color:black"> for
              2.</span>7 RC2:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"> <o:p></o:p></span></p>
        <ol style="margin-top:0cm" start="1" type="1">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo3"><span style="mso-fareast-language:EN-MY" lang="EN-US">No
              high milestone defects. 
              <o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo3"><span
              style="color:windowtext;mso-fareast-language:EN-MY"
              lang="EN-US">Test results are available at following
              location:</span><span style="mso-fareast-language:EN-MY"
              lang="EN-US"><o:p></o:p></span></li>
        </ol>
        <p class="MsoNormal"
          style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l1
          level1 lfo5">
          <!--[if !supportLists]--><span
            style="font-family:Symbol;mso-fareast-language:EN-MY"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
            style="mso-fareast-language:EN-MY">For results of all
            automated tests, please refer to results at public AB [1].<o:p></o:p></span></p>
        <p class="MsoNormal"
          style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l1
          level1 lfo5">
          <!--[if !supportLists]--><span
            style="font-family:Symbol;mso-fareast-language:EN-MY"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
            style="mso-fareast-language:EN-MY">For other test results,
            refer to attachment [2].<o:p></o:p></span></p>
        <p class="MsoNormal"
          style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l1
          level1 lfo5">
          <!--[if !supportLists]--><span
            style="font-family:Symbol;color:black;mso-fareast-language:EN-MY"
            lang="EN-US"><span style="mso-list:Ignore">·<span
                style="font:7.0pt &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
            style="mso-fareast-language:EN-MY">For test report for test
            cases run by Intel and WR team, refer attachment [3]</span></p>
      </div>
    </blockquote>
    Since "compliance-test.compliance-test.LSB_subset_test_suite" was
    run, can you share the changes made to /opt/lsb-test/session file?<br>
    <pre><code>
</code></pre>
    Can I get clarification on how
    "compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone" was
    run? <br>
    <br>
    Regards,<br>
    Armin<br>
    <blockquote type="cite"
cite="mid:015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com">
      <div class="WordSection1">
        <p class="MsoNormal"
          style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l1
          level1 lfo5"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"
          style="margin-left:72.0pt;text-indent:-18.0pt;mso-list:l1
          level1 lfo5">
          <!--[if !supportLists]--><span
            style="font-family:Symbol;color:black;mso-fareast-language:EN-MY"
            lang="EN-US"><span style="mso-list:Ignore">·<span
                style="font:7.0pt &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
            style="mso-fareast-language:EN-MY">For full test report,
            refer attachment [4]</span><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p></o:p></span></p>
        <ol style="margin-top:0cm" start="3" type="1">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo3"><span
              style="color:windowtext;mso-fareast-language:EN-MY"
              lang="EN-US">No new defects are found in this cycle.</span><span
              style="mso-fareast-language:EN-MY" lang="EN-US"><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo3"><span
              style="color:windowtext;mso-fareast-language:EN-MY"
              lang="EN-US">No e</span><span
              style="mso-fareast-language:EN-MY" lang="EN-US">xisting
              issues observed in this release</span><span
              style="color:windowtext;mso-fareast-language:EN-MY"
              lang="EN-US">
            </span><span style="mso-fareast-language:EN-MY" lang="EN-US"><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo3"><span style="mso-fareast-language:EN-MY" lang="EN-US">No
              p</span><span
              style="color:windowtext;mso-fareast-language:EN-MY"
              lang="EN-US">tests are failing in this release which were
              passing in previous release. No timeout issues.</span><span
              style="mso-fareast-language:EN-MY" lang="EN-US"><o:p></o:p></span></li>
        </ol>
        <p class="MsoNormal" style="margin-left:36.0pt"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US">QA
            Hint: One failure was observed on public AB:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US">testseries
            | result_id : qemuppc |
            oeselftest_centos-7_qemuppc_20190414221329<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US">runqemu.QemuTest.test_qemu_can_shutdown<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoPlainText"><span
style="font-family:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:EN-MY"
            lang="EN-US">No bug filed for this issue, as
          </span><span
            style="font-family:&quot;Calibri&quot;,sans-serif">it
            appears to be an intermittent failure and worked on rc1 test
            run.</span><span
style="font-family:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:EN-MY"
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US">=======
          </span><span style="mso-fareast-language:EN-MY" lang="EN-US">Links<span
              style="color:black"> ========<o:p></o:p></span></span></p>
        <p class="MsoNormal"><span
            style="color:black;mso-fareast-language:EN-MY" lang="EN-US"> <o:p></o:p></span></p>
        <p class="MsoNormal"><b><span style="mso-fareast-language:EN-MY"
              lang="EN-US">Link to testresults:<o:p></o:p></span></b></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY">[1]
            - </span><span style="color:#0070C0"><a
href="https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc2/testresults/"
              moz-do-not-send="true"><span style="color:#0070C0">https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc2/testresults/</span></a></span><o:p></o:p></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY">[2]
            - 2.7_RC2_results_merged.zip<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY">[3]
            - 2.7_ rc2_intel_wr_merged_report<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY">[4]
            – 2.7 _rc2_full_report<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"
            lang="EN-US">Thanks &amp; Regards,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-MY"
            lang="EN-US">Sangeeta Jain<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
  </body>
</html>

--------------BCD7BA7A0A436D6EF0927943--
