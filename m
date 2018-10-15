Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB26D78A96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 15:21:43 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 23-v6so9314971pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=3LLJa2oTtkBIHcuLS5ShGXfXEHJSfIzj19+vdQ9MqMA=;
	b=MxaASx+XqaPx4iQn884cpR4DXE/VWe3144ZKyh378GCgHLK/YHJVQDiudRtjk1d7rb
	G05kAcCiZ21k25sZoLpDrMCn74xBiXpykQCeWl6I9ql6WNMzPfG7HsbnKOsmaE6tBgby
	UvKEveOHhX4KL1EXO38AAvnyd4KDeUSr8ImQA+HMyKjyneVKdu28IZ/FAQ35gOsryevE
	Rne9iiYuTzu9hf7JmD+/PYSinzh3owh87dulfNELFMVZ42q3GkjSGtRcbRHPVbRTIe4/
	E9J//sMJSYU+7xfoDg0SXjnl3bzou1QHPEc6WtrD668v7XFz+48TNxi+PkVhSsEUMwPL
	FAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=3LLJa2oTtkBIHcuLS5ShGXfXEHJSfIzj19+vdQ9MqMA=;
	b=p29aT51dICUeqzYCyGCwJyfcUCEZmWJaIioU2v0dtVBOzNqCgVnKtyay9l16uknpDY
	Pqe7pnT+NueTs64nuR9XY7zOjTbK/NC5egvGtT+UC6B7sRWtMMTJ/ZKq0tJQVS2LyKOd
	etzRvzB9KFzv/yusiGnJsHN2mTC8elbVFv/3PgWgd2OcOwvvhrTDU6w6ONK70iKh8mwI
	MDthUPtf0sVbT2geSX2u+S4boskwzZeedbCrI1Zk0Z8OktKIfhEO7CPkP+Bj+a3mIo/0
	s1B9rVHmV9RnBqBa1rzUOh6A4+6iHOBNOZffPybbcgmgAAYt2jpZtT709WLiyQKL7cwA
	khLQ==
X-Gm-Message-State: ABuFfojuCgAVWDqq9a3XdOMaW5bqY9/F2ahGa0BP5M4b4taH3NMsOidC
	s/zLkAMoHUy2WBBzX2RI8Jfbr70Z
X-Google-Smtp-Source: ACcGV61mNg7uVmDPOGRC8OiPelzn78lxhhEVyy9/3+FQNxshBdH1nNmj2yk+Zqf+JyXqNIwMNTDD2g==
X-Received: by 2002:a63:eb07:: with SMTP id
	t7-v6mr16330749pgh.441.1539616904680; 
	Mon, 15 Oct 2018 08:21:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:b4ef:f35a:90e:ac9d?
	([2601:202:4180:c33:b4ef:f35a:90e:ac9d])
	by smtp.gmail.com with ESMTPSA id
	r81-v6sm19462560pfa.110.2018.10.15.08.21.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:21:40 -0700 (PDT)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155ECEE442FB@fmsmsx123.amr.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <60b6c753-6e09-bd10-d4ff-7fb8932d200f@gmail.com>
Date: Mon, 15 Oct 2018 08:21:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155ECEE442FB@fmsmsx123.amr.corp.intel.com>
Subject: Re: YP 2.7 Planning
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
X-List-Received-Date: Mon, 15 Oct 2018 15:21:44 -0000
Content-Type: multipart/alternative;
	boundary="------------E2D4C5C2CA7C7E36BFA65EEA"
Content-Language: en-US

--------------E2D4C5C2CA7C7E36BFA65EEA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Stephen,


On 10/15/2018 08:05 AM, Jolley, Stephen K wrote:
>
> All,
>
>  
>
> We have begun planning for YP 2.7.   In prior versions, items that we
> didn’t have the bandwidth to do were assigned the target milestone of
> 2.99.  Since YP 2.7 planning has just begun, I would like each of you
> to review the bugs and enhancements in YP 2.99 and determine if you
> will have the bandwidth to own any of them in YP 2.7.
>

Do we have the feature freeze date defined yet?

- armin
>
>  
>
> In addition to reviewing the bugs under your name, also review any
> under the unassigned name to see if you have both an interest and the
> time to own any of those in YP 2.7.
>
>  
>
> Link for bugs in YP 2.99 by owner:
> https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Bugs_by_Owner
>
> Link for enhancements in YP 2.99 by owner:
> https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Enhancements_by_Owner
>
>  
>
> Thanks,
>
>  
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Program Manager*
>
> *INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124 *
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:                             _stephen.k.jolley@intel.com_
>
>  
>
>
>


--------------E2D4C5C2CA7C7E36BFA65EEA
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Stephen,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/15/2018 08:05 AM, Jolley, Stephen
      K wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECEE442FB@fmsmsx123.amr.corp.intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:2 11 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
        <p class="MsoNormal">All,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">We have begun planning for YP 2.7.   In
          prior versions, items that we didn’t have the bandwidth to do
          were assigned the target milestone of 2.99.  Since YP 2.7
          planning has just begun, I would like each of you to review
          the bugs and enhancements in YP 2.99 and determine if you will
          have the bandwidth to own any of them in YP 2.7.
        </p>
      </div>
    </blockquote>
    <br>
    Do we have the feature freeze date defined yet?<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECEE442FB@fmsmsx123.amr.corp.intel.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">In addition to reviewing the bugs under
          your name, also review any under the unassigned name to see if
          you have both an interest and the time to own any of those in
          YP 2.7.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Link for bugs in YP 2.99 by owner: <a
            href="https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Bugs_by_Owner"
            moz-do-not-send="true">
https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Bugs_by_Owner</a><o:p></o:p></p>
        <p class="MsoNormal">Link for enhancements in YP 2.99 by owner:
          <a
href="https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Enhancements_by_Owner"
            moz-do-not-send="true">
https://wiki.yoctoproject.org/wiki/Bug_Triage#2.99_Enhancements_by_Owner</a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"
          style="page-break-after:avoid;text-autospace:none"><b><i><span
                style="font-size:16.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span
style="font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.0pt;font-family:&quot;Courier
              New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></span></b></p>
        <p class="MsoNormal"
          style="page-break-after:avoid;text-autospace:none"><b><span
              style="font-size:10.0pt;font-family:&quot;Courier
              New&quot;;color:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th
              Avenue, Hillsboro, OR 97124
              <o:p></o:p></span></b></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings;color:black">(</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">   
          </span><b><span style="font-size:8.0pt;font-family:&quot;Comic
              Sans MS&quot;;color:teal">Cell</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">:               
          </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif">(208) 244-4460<span style="color:black"><o:p></o:p></span></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings">* </span>
          <b><span style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal" lang="FR">Email</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal" lang="FR">:</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif" lang="FR">                            
            <u><span style="color:blue"><a class="moz-txt-link-abbreviated" href="mailto:stephen.k.jolley@intel.com">stephen.k.jolley@intel.com</a></span></u></span><span
style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"
            lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------E2D4C5C2CA7C7E36BFA65EEA--
