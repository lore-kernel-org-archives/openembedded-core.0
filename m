Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 211BD77DE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:37:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521131864; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TeiwJFWXzGZOkOeKfHV93Gn1hrBUrY7S4afX7ooSsr8=;
	b=B0VVumU50RPeJ0kTdhK978t5b6MjomRxW6TMZ0QQx32MmZKF+I8rxszPXyMIaQ/ed/fm6mpF
	9ovyHxrYEIRJAamVHOABCPLyDBCU86cOgS6a1azhw1Gro2XbqEtEZRk+BV+jADH29AvcXzAf
	YgtTP71CVLXo5piXxdJW1D7RVXM=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mxa.mailgun.org with ESMTP id 5aaaa157.7f45d0a41830-smtp-out-n03;
	Thu, 15 Mar 2018 16:37:43 -0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m22so9279192iob.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:37:43 -0700 (PDT)
X-Gm-Message-State: AElRT7E0Kk0935FXCwVFM5PmqSl4CJXQP4gVbhWH860NtkTkFmogFfDi
	EOYRi/hBlIGs2GtaoTkxIHfWRQf2BYjfWpAEfUo=
X-Google-Smtp-Source: AG47ELtkYJEOk9Y1Xh47gpOrCD8ye0upI5OI4AWn2fJJX39h8wv2M3JdYkajUWQZIWBZlB9wv5eLvDGEfq9CCP6wfgE=
X-Received: by 10.107.36.204 with SMTP id k195mr9569795iok.131.1521131863561; 
	Thu, 15 Mar 2018 09:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.74 with HTTP; Thu, 15 Mar 2018 09:37:42 -0700 (PDT)
In-Reply-To: <0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 15 Mar 2018 12:37:42 -0400
X-Gmail-Original-Message-ID: <CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
Message-ID: <CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 16:37:43 -0000
Content-Type: multipart/alternative; boundary="001a114041aa625b730567761cd7"

--001a114041aa625b730567761cd7
Content-Type: text/plain; charset="UTF-8"

Definitely.  I just didn't do the git add.  I'll send out the v2 shortly.
Thanks for catching that!

On Thu, Mar 15, 2018 at 12:25 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/12/2018 12:18 AM, Derek Straka wrote:
>
>> License-Update: checksum change is due to bump in copyright year
>>
>> Resolves CVE-2017-1000158 and other potential security issues
>>
>> See https://docs.python.org/3.5/whatsnew/changelog.html#python-
>> 3-5-5-final
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} |
>> 6 +++---
>>
>
> python3-native should be updated at the same time, please do so.
>
> Alex
>

--001a114041aa625b730567761cd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Definitely.=C2=A0 I just didn&#39;t do the git add.=C2=A0 =
I&#39;ll send out the v2 shortly.=C2=A0 Thanks for catching that!</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 15, 2018 =
at 12:25 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alex=
ander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 03/12/20=
18 12:18 AM, Derek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
License-Update: checksum change is due to bump in copyright year<br>
<br>
Resolves CVE-2017-1000158 and other potential security issues<br>
<br>
See <a href=3D"https://docs.python.org/3.5/whatsnew/changelog.html#python-3=
-5-5-final" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3.=
5/wh<wbr>atsnew/changelog.html#python-<wbr>3-5-5-final</a><br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-devtools/python/{<a href=3D"http://python3_3.5.4.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>python3_3.5.4.bb</a> =3D&gt; <a hre=
f=3D"http://python3_3.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3_=
3.5.5.bb</a>} | 6 +++---<br>
</blockquote>
<br>
python3-native should be updated at the same time, please do so.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a114041aa625b730567761cd7--
