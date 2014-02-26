Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id E4B056F3A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 22:37:27 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ec20so343052lab.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 14:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=Nrhcks6fPzvye7+E74peec5bh/mATNboxYmLOFfbNrU=;
	b=F5MiB6AiWkmfW+TJbCp2nih87lS2A7D4lHZS8aMP98C5hMnWQm5IQ96WK+t/euJzrX
	6fuEjccYnNsQirWBPznZGVXXo4OP1cgNxaG0PODGpKPmKSmAcyScEo31ty8CWbf9FKgT
	Ekv2JOtUEceUJ7nBsx+Sx9hAMqydGcCmfwUwOsTxbm85Bd+yetZ/UgpF+IDy+CP4SUh7
	SYvTj+uGHyGqLbI4P44lkKwoklFhnCjHUhXVuu1hA6ADvCry/G+TzoQXDLRdOkYuBLcR
	0cFzjTpk2P9IYs2cHUFJGAgfEWdX+wTh8nHEBOZD7BV7y30Fxjm2zBul+b4c3xpoLeue
	QVDg==
X-Received: by 10.153.8.194 with SMTP id dm2mr115325lad.54.1393454247549;
	Wed, 26 Feb 2014 14:37:27 -0800 (PST)
Received: from [192.168.43.169] (c-5eeaaaa5-74736162.cust.telenor.se.
	[94.234.170.165])
	by mx.google.com with ESMTPSA id uf9sm2984969lbb.14.2014.02.26.14.37.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 14:37:26 -0800 (PST)
Message-ID: <530E6CA5.2000408@gmail.com>
Date: Wed, 26 Feb 2014 23:37:25 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>, 
	=?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>	<1389366908.19102.223.camel@ted>	<52D3DDFB.8080803@gmail.com>	<1389616915.14987.4.camel@ted>	<52D53A6C.30808@gmail.com>	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>	<1390044007.14987.151.camel@ted>	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>	<1390326205.874.95.camel@ted>	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>	<1390596961.24755.21.camel@e130.pbcl.net>	<1390995512.24655.62.camel@ted>	<da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>	<1391191631.28575.7.camel@ted>	<fca6c32db2694c3c9c8a3f0130a3c039@DM2PR03MB368.namprd03.prod.outlook.com>	<52F9F668.9020002@enea.com>
	<2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com>
In-Reply-To: <2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com>
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Wed, 26 Feb 2014 22:37:28 -0000
Content-Type: multipart/alternative;
	boundary="------------090308000709050803090000"

--------------090308000709050803090000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


On 2014-02-26 19:29, alexandru.sardan@freescale.com wrote:
> Hi David,
>
> Sorry for the late reply.
> I'm not familiar with the procedure for submitting a patch to Poky.
> Could you walk me through the process?
>
> Meanwhile I've attached the patch to this e-mail. It's been tested
> on e500v2, e5500 and e6500.
>
> Kind regards,
> Alex

Hi,

You patch looks fine to me. A couple of comments though:

You should use git send-mail to send it to oe-core, and your patch on 
GCC needs an upstream status.
i.e. Plans of how and if this will be upstreamed to GCC.

Details:
https://wiki.yoctoproject.org/wiki/Contribution_Guidelines

Was able to build a working SDK compiler for p1025twr.

When this has brewed in the Autobuilder for a while, it should be 
backported to dora as well.

Br,
David


>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> David Nyström
>> Sent: Tuesday, February 11, 2014 12:08 PM
>> To: Sardan Alexandru Cezar-B41700; Richard Purdie
>> Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
>> linux verses linux-gnuspe"
>>
>> On 2014-01-31 19:17, alexandru.sardan@freescale.com wrote:
>>> Hi,
>>>
>>> Sure, I'll do this and also some more extensive testing
>>> on the boards.
>>>
>>> Thanks,
>>> Alex
>>>
>> Hi Alex,
>>
>> Whats the status on this ?
>>
>> Br,
>> David
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------090308000709050803090000
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 2014-02-26 19:29,
      <a class="moz-txt-link-abbreviated" href="mailto:alexandru.sardan@freescale.com">alexandru.sardan@freescale.com</a> wrote:<br>
    </div>
    <blockquote
cite="mid:2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com"
      type="cite">
      <pre wrap="">Hi David,

Sorry for the late reply.
I'm not familiar with the procedure for submitting a patch to Poky. 
Could you walk me through the process?

Meanwhile I've attached the patch to this e-mail. It's been tested
on e500v2, e5500 and e6500.

Kind regards,
Alex</pre>
    </blockquote>
    <br>
    Hi,<br>
    <br>
    You patch looks fine to me. A couple of comments though:<br>
    <br>
    You should use git send-mail to send it to oe-core, and your patch
    on GCC needs an upstream status.<br>
    i.e. Plans of how and if this will be upstreamed to GCC.<br>
    <br>
    Details:<br>
    <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Contribution_Guidelines">https://wiki.yoctoproject.org/wiki/Contribution_Guidelines</a><br>
    <br>
    Was able to build a working SDK compiler for p1025twr.<br>
    <br>
    When this has brewed in the Autobuilder for a while, it should be
    backported to dora as well.<br>
    <br>
    Br,<br>
    David<br>
    <br>
    <br>
    <blockquote
cite="mid:2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com"
      type="cite">
      <pre wrap="">


</pre>
      <blockquote type="cite">
        <pre wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core-bounces@lists.openembedded.org">openembedded-core-bounces@lists.openembedded.org</a>
[<a class="moz-txt-link-freetext" href="mailto:openembedded-core-bounces@lists.openembedded.org">mailto:openembedded-core-bounces@lists.openembedded.org</a>] On Behalf Of
David Nystr&ouml;m
Sent: Tuesday, February 11, 2014 12:08 PM
To: Sardan Alexandru Cezar-B41700; Richard Purdie
Cc: Udma Catalin-Dan-B32721; <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
linux verses linux-gnuspe"

On 2014-01-31 19:17, <a class="moz-txt-link-abbreviated" href="mailto:alexandru.sardan@freescale.com">alexandru.sardan@freescale.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hi,

Sure, I'll do this and also some more extensive testing
on the boards.

Thanks,
Alex

</pre>
        </blockquote>
        <pre wrap="">
Hi Alex,

Whats the status on this ?

Br,
David
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>

</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090308000709050803090000--
