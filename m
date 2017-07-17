Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC8B677D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 19:10:33 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id v202so55028565itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gtHRCw+h9y51X1ODhTCehq/McrHqSAP7t8rn/BwAFCM=;
	b=ZniwLCSBLv1Jt++9eN0zSLS9ashbvCjs177MhF5O3ecSMFSwdUh2Es2JuBQwwNQwOY
	+tl71d5/8TgYN0Mkfb/b1FTjfSp3Iwu2UFuqCmfVtO6wApzubtma3qMyK0n/+ffdlvAp
	VYq4vvdvUsBYh0us7CcTTdWt1PNZcWu4XsG3lcsjZ82yNQtMDrl7aDTO76AjjnmHblKh
	ozZd70uFnIzFOCLdjdZnk3t4d/Db2jbCBpNF/YQUctwtIjmFUeB4sjS8pccr3V4LhM2h
	ccPrkv/cqQzr8ExG1lc+jEmpS+TMaQ4Pohc3PlHyKbbiJ0388c8DStQY6691WgHqCt/U
	ib9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gtHRCw+h9y51X1ODhTCehq/McrHqSAP7t8rn/BwAFCM=;
	b=A6AjkAKyZSLM9JQyN01MRxqmMAYWhSf0B2CD4uPFU1cLg/Kj6IDbXl7Bk4LoP0batP
	8EYb84LoaFYfdFgRtsBMsE8wnKBxBq3iibKuoUFL9uVYjQcLjWWDCjlrtBb9AXIEW/0e
	RJbDRtTW/mK48bFWTltOOg86/gJciqJxtkF4rnwGZ2RhI+nYv7OfsQ+QLs3qwxUqcuvJ
	oqYFKkIvnypyVZKLQ5f8QVZZokCCUsEORO3YEcoCgGu35hgNYo6xDvahyjveeoUQ+vom
	nwxy2KHhCpo2w2OlMsqyFigbmrf9MWDf889MLB20ZsVygw5R1oRx6TDRqFBaYRZ2r1LI
	OxAA==
X-Gm-Message-State: AIVw1121ztZ8cuLIt63+M9g+6my1dqhlHbGklpIhTs8QfdOr4w1iImkX
	vB5sh7aUyzCnN+Bq7CHf5fIN9nJjIx90
X-Received: by 10.36.120.67 with SMTP id p64mr6920909itc.23.1500318634472;
	Mon, 17 Jul 2017 12:10:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Mon, 17 Jul 2017 12:10:13 -0700 (PDT)
In-Reply-To: <144ced22-b4b7-2923-97d0-b1046e117f3d@xevo.com>
References: <20170710221833.11413-1-mkelly@xevo.com>
	<144ced22-b4b7-2923-97d0-b1046e117f3d@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jul 2017 20:10:13 +0100
Message-ID: <CAJTo0LaeKR_h3=Cx9DBDvDidp+CS1gdegq+UqDUS9aB1b6kerQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] licenses.conf: enable CDDLv1 license
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
X-List-Received-Date: Mon, 17 Jul 2017 19:10:34 -0000
Content-Type: multipart/alternative; boundary="001a114a9ebe4241ff05548827d6"

--001a114a9ebe4241ff05548827d6
Content-Type: text/plain; charset="UTF-8"

Merged into my staging branch this morning, thanks.

Ross

On 17 July 2017 at 18:10, Martin Kelly <mkelly@xevo.com> wrote:

> (ping)
>
>
> On 07/10/2017 03:18 PM, Martin Kelly wrote:
>
>> The CDDL license is now used by open-vm-tools in meta-openembedded, so
>> we need to add it in order to prevent warnings.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>  meta/conf/licenses.conf | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
>> index d210a0e940..3e2d2589ab 100644
>> --- a/meta/conf/licenses.conf
>> +++ b/meta/conf/licenses.conf
>> @@ -105,6 +105,10 @@ SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
>>  SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
>>  SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
>>
>> +#CDDL variations
>> +SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
>> +SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
>> +
>>  #Other variations
>>  SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
>>
>>
>>

--001a114a9ebe4241ff05548827d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged into my staging branch this morning, thanks.<div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 17 July 2017 at 18:10, Martin Kelly <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">(ping)<div class=3D"HOEnZb"=
><div class=3D"h5"><br>
<br>
On 07/10/2017 03:18 PM, Martin Kelly wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The CDDL license is now used by open-vm-tools in meta-openembedded, so<br>
we need to add it in order to prevent warnings.<br>
<br>
Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=
=3D"_blank">mkelly@xevo.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/licenses.conf | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf<br>
index d210a0e940..3e2d2589ab 100644<br>
--- a/meta/conf/licenses.conf<br>
+++ b/meta/conf/licenses.conf<br>
@@ -105,6 +105,10 @@ SPDXLICENSEMAP[AFL-1] =3D &quot;AFL-1.2&quot;<br>
=C2=A0SPDXLICENSEMAP[AFLv2] =3D &quot;AFL-2.0&quot;<br>
=C2=A0SPDXLICENSEMAP[AFLv1] =3D &quot;AFL-1.2&quot;<br>
<br>
+#CDDL variations<br>
+SPDXLICENSEMAP[CDDLv1] =3D &quot;CDDL-1.0&quot;<br>
+SPDXLICENSEMAP[CDDL-1] =3D &quot;CDDL-1.0&quot;<br>
+<br>
=C2=A0#Other variations<br>
=C2=A0SPDXLICENSEMAP[EPLv1.0] =3D &quot;EPL-1.0&quot;<br>
<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--001a114a9ebe4241ff05548827d6--
