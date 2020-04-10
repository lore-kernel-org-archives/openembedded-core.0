Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.3010.1586490273082230852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 20:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=GqRuk449;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=523; q=dns/txt; s=axis-central1;
  t=1586490273; x=1618026273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NwK4aTtRWOniVNRzvJIMdoutgJm3vPk/gASe6VAltx4=;
  b=GqRuk449JepnRV2bAbDFkV3Hdz+pUqxgBJJFDxn8J5l4jI5SGWTygLYZ
   bjduFo8ctcO+g0LxcLnQREC+UlE4gTaMxZMqdz49xI7OiDC6Dlt56QnWm
   LEh/qdISjnGhothMmw0lOklJolrTZw/uz0oe1foKv20fR9etoGbyrucM0
   WGhW7+6+4fRKpEcIRtHEfG4m8VfSirCKCTT3AoYbrZ7T7Biryicufbaik
   5ujiqqAvnWXtZj32Z8aHcU10r0fxzKooRqWSgrHwYfzFrz0TEpNy6cA0Y
   PJIjhbbCwJGzNSOMQ/gevu9/Spbi9I4T/Vbane7w+xX7xH46J3I+UeKgQ
   A==;
IronPort-SDR: mNq9MBA9w+MjO/G03rjLW3J6BC3DxgsgtJReDIAJiVUO7ODK2CZfn16kJvKP5vFDiSFKgmCms9
 ZSHDxo2ILf6KRgxxXfUDlADNbXOKPP+wwkkw8ztYup2zXJ3xThhq5abzhIXiPuhMHEx9SvRmjS
 PaC67q5caw1pGyohzhpTVsXzaTwD4c0N0VumDYLyqczLaeB7tV+2ZjsLnOcmQdkZgXNhU/LDHU
 GsrvT18+la3NHxho1Iai92oNvKxTfLGsRIO7LjULrP//na/fxzbJgUD2G+igT13UDPQGjw69Yl
 pNo=
X-IronPort-AV: E=Sophos;i="5.72,364,1580770800"; 
   d="scan'208";a="7304320"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "bkylerussell@gmail.com" <bkylerussell@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "wesley.lindauer@gmail.com" <wesley.lindauer@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] patch: don't strip GitApplyTree patches
Thread-Topic: [OE-core] [PATCH 1/1] patch: don't strip GitApplyTree patches
Thread-Index: AQHWDikmQvg3i21jiUuZd5fx3jqDvqhxt8PQ
Date: Fri, 10 Apr 2020 03:44:26 +0000
Message-ID: <bb3e559e1e1042e4a2ef485890acad1f@XBOX03.axis.com>
References: <20200409044116.27070-1-bkylerussell@gmail.com>
 <20200409044116.27070-2-bkylerussell@gmail.com>
In-Reply-To: <20200409044116.27070-2-bkylerussell@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of bkylerussell@gmail.com
> Sent: den 9 april 2020 06:41
> To: openembedded-core@lists.openembedded.org
> Cc: wesley.lindauer@gmail.com; Kyle Russell <bkylerussell@gmail.com>
> Subject: [OE-core] [PATCH 1/1] patch: don't strip GitApplyTree patches

You want to change the prefix "patch:" to, e.g., "patch.py:" to=20
differentiate it from a change to the patch recipe.

//Peter

