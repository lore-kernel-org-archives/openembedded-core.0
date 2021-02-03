Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.10132.1612364069390882236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=g0PQdvwg;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.221.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0809520B7192;
	Wed,  3 Feb 2021 06:54:27 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0809520B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1612364068;
	bh=5bVUJNp6cwEjeVBp/VB4RodeZBTu+wkDOiJUtBuU3mI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=g0PQdvwgSYukqCOArtuxWriI9Vgq1QSEbbVE72dtcSS+fj1Hx1UV9TtKjkmN4aziS
	 OK+XGhCUSH8CnUo1mts+Pi96cVRnlPh3oxrJGgMo078/XptB5t+DHLpi591+3hIjwn
	 TYD+W9ncaPzs6Iez5jwWdgm2rYb+5XnC7Nxjx3CQ=
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-core@lists.openembedded.org
References: <20210203084257.26778-1-anbelski@linux.microsoft.com>
 <YBp0r/IvR1vFubjt@korppu>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <30a17ea8-3af9-026b-64eb-5d25f34bae77@linux.microsoft.com>
Date: Wed, 3 Feb 2021 15:54:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YBp0r/IvR1vFubjt@korppu>
Content-Type: multipart/alternative;
 boundary="------------5BFA4C0A4382F24EF157CA59"
Content-Language: en-US

--------------5BFA4C0A4382F24EF157CA59
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/3/2021 11:02 AM, Mikko Rapeli wrote:
> Hi,
>
> On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
>> The naming convention needs to be help so the CVE is recognized as
>> fixed by the tooling.
> Yocto CVE checker does detect CVE patches also from patch comments so
> this change is not needed for that. This is sufficient:
>
> poky$ git grep CVE-2020-35457
> meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457
>
> Is there some other tooling that you are referring to?

I should have read meta/classes/cve-check.bbclass before :) Looks like 
it was a wrong impression on my side, that the filename needs to match 
there, also when working with older versions. Thanks for the 
explanation, indeed there's no action required on this, I didn't refer 
to any other tools.

Regards

Anatol

> Cheers,
>
> -Mikko
>
> 
>

--------------5BFA4C0A4382F24EF157CA59
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2/3/2021 11:02 AM, Mikko Rapeli
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YBp0r%2FIvR1vFubjt@korppu">
      <pre class="moz-quote-pre" wrap="">Hi,

On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The naming convention needs to be help so the CVE is recognized as
fixed by the tooling.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yocto CVE checker does detect CVE patches also from patch comments so
this change is not needed for that. This is sufficient:

poky$ git grep CVE-2020-35457
meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457

Is there some other tooling that you are referring to?
</pre>
    </blockquote>
    <p>I should have read meta/classes/cve-check.bbclass before :) Looks
      like it was a wrong impression on my side, that the filename needs
      to match there, also when working with older versions. Thanks for
      the explanation, indeed there's no action required on this, I
      didn't refer to any other tools. </p>
    <p>Regards</p>
    <p>Anatol<br>
    </p>
    <blockquote type="cite" cite="mid:YBp0r%2FIvR1vFubjt@korppu">
      <pre class="moz-quote-pre" wrap="">
Cheers,

-Mikko</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5BFA4C0A4382F24EF157CA59--
