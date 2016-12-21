Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B173471E15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 01:38:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b1so14193678pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 17:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=15UkST3q/3kJbwIBIDcdNxDWZydMtckAzVJ7STqiasc=;
	b=cgCxps1o+i/IUUWUW+ZOssWHZRVdGE6WPYUAjKKly9dnOLlYidkivq7s2ogK0e8uzn
	FYRx8iSsATW5ZEtxuHA+qUJDcjdKZDYwcOU7DbZy7joF+5sZQtQ2IqJeHtofeceT6hO2
	c9N6IqLHVWzv4Kwsyym2nB9GY4fAklPCFyHieyrj0fZezeonS75fqrh68vGwSnGe37wR
	7ZP/gGeMRe8dgcMhYjfzPWnhRO4Yb1BNUNOPIxwhzVezjSwIEs9cIQjrw3vs78/05Ye+
	7h9DT9ijyFNup2d+eDQYxrl2j/4a9Mp39e648bTQ693LjdvBZQNYTAC6fMcfixh1s2E4
	dd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=15UkST3q/3kJbwIBIDcdNxDWZydMtckAzVJ7STqiasc=;
	b=oE9WVLCNhxs5ZRHvM6UNaZZltr9yY3hAz6PkYrEJRg7YmLx3+6lT1R5/ziTgeu4Cwe
	LlOAbRrA51PJ3v2iZI61Qg1hPdaCtTiniX66l6Xu/BLdUH/JQXP5CMqeWoe2hT6JnoPR
	f2hHSeHrYDMj5LsFvHV3V1o+9GndjQIRZuqdS5eii2tX5ZweT6ndHv6mO8aZLqGaI8J4
	uxzKHUlrH0UMdxyG8JFkqTpEhxn4ciWaWJ0uW0QC+N4ztyr9VLxPb5suI9Fx9P1vKDWC
	WwSpKt2v0fN6JRRzKDkwFKgAz6oQ7pqRyj/tBIgsI6CPLbRkqruLaF3QQ1uxgKlgCobr
	v0ag==
X-Gm-Message-State: AIkVDXJAKPH+kKvJij2vWbl50uF7iSQjn5XpTs+o782fhiKbRIZ3r/P269OsXBoE+j8iqg==
X-Received: by 10.99.113.23 with SMTP id m23mr3483519pgc.115.1482284324994;
	Tue, 20 Dec 2016 17:38:44 -0800 (PST)
Received: from [10.22.11.123] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	l11sm41851623pfb.28.2016.12.20.17.38.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 17:38:44 -0800 (PST)
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
	<1481548821-15878-2-git-send-email-andrej.valek@siemens.com>
	<c5a2e55512d944e0855c7dd2658ad256@svr-ies-mbx-01.mgc.mentorg.com>
	<CAJTo0LbAgwJbNpiONVMP_udObfJMBhCs5SPS7so+073MjtYKTA@mail.gmail.com>
	<0e43b6ba2a2f48a4aac664939ffd027a@svr-ies-mbx-01.mgc.mentorg.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7eba88c9-3e79-c5f7-ab5d-a76f0f73564d@gmail.com>
Date: Tue, 20 Dec 2016 17:38:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <0e43b6ba2a2f48a4aac664939ffd027a@svr-ies-mbx-01.mgc.mentorg.com>
Cc: Andrej Valek <andrej.valek@siemens.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow namespace nodes in XPointer points and ranges
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
X-List-Received-Date: Wed, 21 Dec 2016 01:38:43 -0000
Content-Type: multipart/alternative;
	boundary="------------C6AD1354B4F46F15354BCB33"

--------------C6AD1354B4F46F15354BCB33
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/20/2016 01:06 AM, Ahsan, Noor wrote:
>
> Armin Kuster,
>
> Can you merge this on morty branch?
>

yep. its sitting in my stagging.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=ef5b3d9a69b6a807abb6b3e997128d484728e9ed

-armin

> Noor
>
> *From:*Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Friday, December 16, 2016 12:33 AM
> *To:* Ahsan, Noor <Noor_Ahsan@mentor.com>
> *Cc:* Andrej Valek <andrej.valek@siemens.com>; 
> openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH 2/3] libxml2: fix CVE-2016-4658 
> Disallow namespace nodes in XPointer points and ranges
>
> On 15 December 2016 at 19:05, Ahsan, Noor <Noor_Ahsan@mentor.com 
> <mailto:Noor_Ahsan@mentor.com>> wrote:
>
>     Can we merge this on morty branch as well?
>
>
> Yes, if you ping the morty maintainer.
>
> Ross
>
>
>


--------------C6AD1354B4F46F15354BCB33
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/20/2016 01:06 AM, Ahsan, Noor
      wrote:<br>
    </div>
    <blockquote
cite="mid:0e43b6ba2a2f48a4aac664939ffd027a@svr-ies-mbx-01.mgc.mentorg.com"
      type="cite">
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:#F9F9F9">Armin
            Kuster,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:#F9F9F9"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:#F9F9F9">Can
            you merge this on morty branch?</span></p>
      </div>
    </blockquote>
    <br>
    yep. its sitting in my stagging.<br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&amp;id=ef5b3d9a69b6a807abb6b3e997128d484728e9ed">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&amp;id=ef5b3d9a69b6a807abb6b3e997128d484728e9ed</a><br>
    <br>
    -armin<br>
    <br>
    <blockquote
cite="mid:0e43b6ba2a2f48a4aac664939ffd027a@svr-ies-mbx-01.mgc.mentorg.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:#F9F9F9"><o:p></o:p></span></p>
        <p class="MsoNormal"><a moz-do-not-send="true"
            name="_MailEndCompose"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p> </o:p></span></a></p>
        <p class="MsoNormal"><span
style="font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black;background:#F9F9F9">Noor<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
            Burton, Ross [<a class="moz-txt-link-freetext" href="mailto:ross.burton@intel.com">mailto:ross.burton@intel.com</a>]
            <br>
            <b>Sent:</b> Friday, December 16, 2016 12:33 AM<br>
            <b>To:</b> Ahsan, Noor <a class="moz-txt-link-rfc2396E" href="mailto:Noor_Ahsan@mentor.com">&lt;Noor_Ahsan@mentor.com&gt;</a><br>
            <b>Cc:</b> Andrej Valek <a class="moz-txt-link-rfc2396E" href="mailto:andrej.valek@siemens.com">&lt;andrej.valek@siemens.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
            <b>Subject:</b> Re: [OE-core] [PATCH 2/3] libxml2: fix
            CVE-2016-4658 Disallow namespace nodes in XPointer points
            and ranges<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div>
          <div>
            <p class="MsoNormal"><o:p> </o:p></p>
            <div>
              <p class="MsoNormal">On 15 December 2016 at 19:05, Ahsan,
                Noor &lt;<a moz-do-not-send="true"
                  href="mailto:Noor_Ahsan@mentor.com" target="_blank">Noor_Ahsan@mentor.com</a>&gt;
                wrote:<o:p></o:p></p>
              <blockquote style="border:none;border-left:solid #CCCCCC
                1.0pt;padding:0in 0in 0in
                6.0pt;margin-left:4.8pt;margin-right:0in">
                <div id=":8gv">
                  <p class="MsoNormal">Can we merge this on morty branch
                    as well?<o:p></o:p></p>
                </div>
              </blockquote>
            </div>
            <p class="MsoNormal"><br>
              Yes, if you ping the morty maintainer.<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p> </o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Ross<o:p></o:p></p>
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

--------------C6AD1354B4F46F15354BCB33--
