Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.5251.1610810208874009368
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 07:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=AOTLwOwi;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F77213.versanet.de [89.247.114.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3451020B7192;
	Sat, 16 Jan 2021 07:16:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3451020B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610810208;
	bh=h1k5shg/SSSIwx58DpztJorQA3dOdRjifuR22v8TbYo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=AOTLwOwiSPuH69TeozQywaaWvmTonC5hNoKE4qvlxQge6cDos1g0hg5a81Tp4cbg2
	 ATiNVxHc6cqA1R8tA/tTXpoyx1VW1JPIFHrOx85AP/OA5Ae7ldbJtNZsc9gMn3tRJi
	 3b0Lj4h4u9LCB7ONYmbFCIZARLeLmhZnTXG+nzXQ=
Subject: Re: [OE-core] [PATCH] appliance: Add vhd & vhdx support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
References: <20210114130123.20507-1-anbelski@linux.microsoft.com>
 <c045063783cf4d1abf831aed2845cc651446062d.camel@linuxfoundation.org>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <726a21a5-18f7-5463-c072-ecbeabf98f83@linux.microsoft.com>
Date: Sat, 16 Jan 2021 16:16:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c045063783cf4d1abf831aed2845cc651446062d.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------888818CFF3F71FE5073B3F29"
Content-Language: en-US

--------------888818CFF3F71FE5073B3F29
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 1/15/2021 11:12 PM, Richard Purdie wrote:
> On Thu, 2021-01-14 at 13:01 +0000, Anatol Belski wrote:
>> From: Sinan Kaya <okaya@kernel.org>
>>
>> This patch brings support for generating VHD/VHDX from WIC. It touches
>> different areas but it needs to be applied at once for all the parts to
>> concert. The patch could be split, if needed, otherwise considering
>> OE-Core as target.
>>
>> Signed-off-by: Sinan Kaya <okaya@kernel.org>
>> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
>> ---
>>  =C2=A0bitbake/lib/toaster/orm/models.py                  |  4 ++--
>>  =C2=A0meta/classes/image-live.bbclass                    |  2 +-
>>  =C2=A0meta/classes/image_types.bbclass                   | 14 ++++++++=
++++--
>>  =C2=A0.../images/build-appliance-image_15.0.0.bb         |  4 +++-
>>  =C2=A0scripts/runqemu                                    |  8 +++++---
>>  =C2=A05 files changed, 23 insertions(+), 9 deletions(-)
> I had to split the patch into two pieces, one for bitbake and one for
> oe-core. In testing we see:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/3166
>
> which looks like there may be a missing qemuXXX-native dependency?
>
> (not quite sure which native recipe provides qemu-img)

Thanks for the test run, I'll check the issue and will split the patch.

Regards

Anatol

> Cheers,
>
> Richard
>
>
>=20
>

--------------888818CFF3F71FE5073B3F29
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/15/2021 11:12 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:c045063783cf4d1abf831aed2845cc651446062d.camel@linuxfoundation=
.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, 2021-01-14 at 13:01 +=
0000, Anatol Belski wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Sinan Kaya <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:okaya@kernel.org">&lt;okaya@kern=
el.org&gt;</a>

This patch brings support for generating VHD/VHDX from WIC. It touches
different areas but it needs to be applied at once for all the parts to
concert. The patch could be split, if needed, otherwise considering
OE-Core as target.

Signed-off-by: Sinan Kaya <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:okaya@kernel.org">&lt;okaya@kernel.org&gt;</a>
Signed-off-by: Anatol Belski <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:anbelski@linux.microsoft.com">&lt;anbelski@linux.microsoft.com&gt;</a>
---
=C2=A0bitbake/lib/toaster/orm/models.py                  |  4 ++--
=C2=A0meta/classes/image-live.bbclass                    |  2 +-
=C2=A0meta/classes/image_types.bbclass                   | 14 ++++++++++++=
--
=C2=A0.../images/build-appliance-image_15.0.0.bb         |  4 +++-
=C2=A0scripts/runqemu                                    |  8 +++++---
=C2=A05 files changed, 23 insertions(+), 9 deletions(-)
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I had to split the patch into two pieces, one for bitbake and one for
oe-core. In testing we see:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/23/builds/3166">https://autobuilder.yoctoproject.o=
rg/typhoon/#/builders/23/builds/3166</a>

which looks like there may be a missing qemuXXX-native dependency?

(not quite sure which native recipe provides qemu-img)
</pre>
    </blockquote>
    <p>Thanks for the test run, I'll check the issue and will split the
      patch.</p>
    <p>Regards</p>
    <p>Anatol</p>
    <blockquote type=3D"cite"
cite=3D"mid:c045063783cf4d1abf831aed2845cc651446062d.camel@linuxfoundation=
.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Cheers,

Richard

</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------888818CFF3F71FE5073B3F29--
