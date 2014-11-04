Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6051565D59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 02:30:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA42UaFK019478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Nov 2014 18:30:37 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 3 Nov 2014 18:30:35 -0800
Message-ID: <54583A4A.1080103@windriver.com>
Date: Tue, 4 Nov 2014 10:30:34 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Mark Hatle
	<mark.hatle@windriver.com>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>	<1415016627.5111.9.camel@ted>	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>	<5457BD7A.9020806@windriver.com>
	<CAJTo0LbukP+OZvLXK4R0nZtMbykY10Wr2PNW23+37_JfHeh8Lg@mail.gmail.com>
In-Reply-To: <CAJTo0LbukP+OZvLXK4R0nZtMbykY10Wr2PNW23+37_JfHeh8Lg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Tue, 04 Nov 2014 02:30:49 -0000
Content-Type: multipart/alternative;
	boundary="------------010802060307000005020305"

--------------010802060307000005020305
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?11?04? 01:44, Burton, Ross wrote:
> On 3 November 2014 17:38, Mark Hatle <mark.hatle@windriver.com> wrote:
>
>> We've been attempting to aggregate what we (WR) can in:
>>
>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/
>> log/?h=kangkai/qemuarm64
>>
>> But as it's unofficial and we're simply trying to keep the patches we know
>> of together..  you'll have to be patient.  The first order of business is
>> getting a functional qemuarm64.. it's MOSTLY there, but we're having
>> toolchain issues and other things that are simply higher priority for us.
>>
> Great, thanks Mark.  A functional qemuarm64 that boots core-image-minimal
> is a good step in the right direction, then we can experiment with it on
> the autobuilder. :)

There will be a few more patches from Mark for multilib, then we could 
build it on autobuilder. I'll finish it today.

--Kai

>
> Patiently awaiting patches,
> Ross
>
>
>


-- 
Regards,
Neil | Kai Kang


--------------010802060307000005020305
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014&#24180;11&#26376;04&#26085; 01:44, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbukP+OZvLXK4R0nZtMbykY10Wr2PNW23+37_JfHeh8Lg@mail.gmail.com"
      type="cite">
      <pre wrap="">On 3 November 2014 17:38, Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@windriver.com">&lt;mark.hatle@windriver.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">We've been attempting to aggregate what we (WR) can in:

 <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/</a>
log/?h=kangkai/qemuarm64

But as it's unofficial and we're simply trying to keep the patches we know
of together..  you'll have to be patient.  The first order of business is
getting a functional qemuarm64.. it's MOSTLY there, but we're having
toolchain issues and other things that are simply higher priority for us.

</pre>
      </blockquote>
      <pre wrap="">
Great, thanks Mark.  A functional qemuarm64 that boots core-image-minimal
is a good step in the right direction, then we can experiment with it on
the autobuilder. :)</pre>
    </blockquote>
    <br>
    There will be a few more patches from Mark for multilib, then we
    could build it on autobuilder. I'll finish it today.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbukP+OZvLXK4R0nZtMbykY10Wr2PNW23+37_JfHeh8Lg@mail.gmail.com"
      type="cite">
      <pre wrap="">

Patiently awaiting patches,
Ross

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------010802060307000005020305--
