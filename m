Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86AF078987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:41:07 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d13-v6so7199527itf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ly1s3DdBm+sr1OxtgKkcdKSKaYTCMmwguuGZLSBjmPw=;
	b=Ur7je3hdG0G/bAbkoPliDK5QOkUtzjVAtfOcIVBWSaPOegFLJ/XJrG7NqEtquTUtAJ
	g2tSZrQR4IW2ebFjuEsBiZchsiRtdLsSebBqd53rBnlON471aLWcLelHQp727v2v+ftt
	C62AkM+IlGTkP1kXcGtKWMxuevnC98Vw79TzulFOsMEQJr+EFVdZWrlnWO+6ArpOCiZ5
	0xMYRR2LWshCnpKat+zrJO/pUFCYMHcWDn7yd54F6fEpRFqoeclL7+N0e8uOeK9oR+Ud
	NHKeXiYnHhKmx7otz4L6MkZxzOzLm01UphcAOX5d1A/MvV6uxhTfMLYsDfbgoe9fTWzu
	O1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ly1s3DdBm+sr1OxtgKkcdKSKaYTCMmwguuGZLSBjmPw=;
	b=pNv2xqgAB+AqxmVuneCgHdK4zxDvJhA652OZcvxUqQ73pQt1YPrf8cRd3RE10qQNg5
	/kSN8OwcSV10+iPZoUbjUJUWTmxq5dH6/O0D5Cqno8q/fz8Ms95T2kOFJnkRRmOBVOZw
	SrEqhy70X+fX/DRlFxVc2VTIn/xmTPQTG1sufy/gUQ5SH4xLhHo8oeHxYWFvGlkI7Wmq
	VAgoEKo3tnAkcpRf5P6vYMix1f902K1dy2IVMs+T8r7qupbJSjskQxE5GsOphj5wLaxn
	tz0zuHpUO4g0U3i6PO04G5R4YQCddZsr4OI4yKW4UXhS11Vvck8bP56BzDp2gYxMHEXW
	jGUg==
X-Gm-Message-State: AElRT7Foek1t3yWKdsXh+0XCSYAIWWmAIwddUQXAOKUKBoJlcR7EuydC
	PdHoRBj3WtsH7Z5zA5Kaxmh3ctptDOaga5kKO61TYA==
X-Google-Smtp-Source: AG47ELtKmn8AEIAZlqIaZHu2EvSZ4YfWPqW/tucW3VuTI0lLcNMMgSqyMzACw3VkU0wA/l5XFN6Sg1cb2mkDq9GSvXE=
X-Received: by 2002:a24:4a53:: with SMTP id
	k80-v6mr4682091itb.45.1521643269293; 
	Wed, 21 Mar 2018 07:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 07:40:48 -0700 (PDT)
In-Reply-To: <ccc3ea2f-f22a-930a-8912-489963dae8f4@linux.intel.com>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
	<dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
	<CAJTo0LbxDGNrJH8tDiCgMKoSHUsK8Q17BUH=UVkY8zDBAm70+g@mail.gmail.com>
	<833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
	<CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
	<61d1ecb9-e4a6-8d26-9bcc-76c7c42abb7f@linux.intel.com>
	<b65227e0-d37f-6ae6-9f4c-4c535460143e@balister.org>
	<ccc3ea2f-f22a-930a-8912-489963dae8f4@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 14:40:48 +0000
Message-ID: <CAJTo0LbtW7mP6p14ZfZAP-uVpvvQRxZjgoJnz7CbwBGUS3rDuA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMuKAmTE4?=
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
X-List-Received-Date: Wed, 21 Mar 2018 14:41:09 -0000
Content-Type: multipart/alternative; boundary="0000000000008ab6050567ed2e0b"

--0000000000008ab6050567ed2e0b
Content-Type: text/plain; charset="UTF-8"

Monthly seems like a good enough cadence to give everyone time to review
the mails, send the mails, get reviewed on the list, go through the
autobuilder, and eventually reach master.  Too fast and AUH will be sending
nagging mails for a patch which is shortly being merged.

Can we stop bikeshedding now? :)

Ross

On 21 March 2018 at 14:31, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/21/2018 04:24 PM, Philip Balister wrote:
>
>>      Which brings me to a question: what is a good schedule and cadence
>>>>      for AUH runs? Currently it's run on the 15th of every odd-numbered
>>>>      month (so January, March, and so on), but I thought of shifting it
>>>>      one month forward, so it doesn't land right in the middle of a
>>>>      feature freeze. Thoughts?
>>>>
>>>>
>>>> How long does a single run take, and why not run it every month?
>>>>
>>>
>>> Just a bit longer than a day, maybe 30 hours, if it needs to update the
>>> typical amount of 100-150 packages. I'll shift it to monthly then.
>>>
>>
>> Maybe bi-weekly? Could that help reduce the number of upgrades needed
>> for each run?
>>
>
> Only if the maintainers take those reminders as high priority items, and
> actually send out the patches quickly, and then those patches make it to
> master. All that needs to happen within those two weeks. Otherwise, the AUH
> will just re-run the same set.
>
> Alex
>

--0000000000008ab6050567ed2e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Monthly seems like a good enough cadence to give everyone =
time to review the mails, send the mails, get reviewed on the list, go thro=
ugh the autobuilder, and eventually reach master.=C2=A0 Too fast and AUH wi=
ll be sending nagging mails for a patch which is shortly being merged.<div>=
<br></div><div>Can we stop bikeshedding now? :)</div><div><br></div><div>Ro=
ss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
21 March 2018 at 14:31, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanav=
in@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 03/21/2018 04:24 PM, Philip Balister wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
=C2=A0=C2=A0=C2=A0=C2=A0 Which brings me to a question: what is a good sche=
dule and cadence<br>
=C2=A0=C2=A0=C2=A0=C2=A0 for AUH runs? Currently it&#39;s run on the 15th o=
f every odd-numbered<br>
=C2=A0=C2=A0=C2=A0=C2=A0 month (so January, March, and so on), but I though=
t of shifting it<br>
=C2=A0=C2=A0=C2=A0=C2=A0 one month forward, so it doesn&#39;t land right in=
 the middle of a<br>
=C2=A0=C2=A0=C2=A0=C2=A0 feature freeze. Thoughts?<br>
<br>
<br>
How long does a single run take, and why not run it every month?<br>
</blockquote>
<br>
Just a bit longer than a day, maybe 30 hours, if it needs to update the<br>
typical amount of 100-150 packages. I&#39;ll shift it to monthly then.<br>
</blockquote>
<br>
Maybe bi-weekly? Could that help reduce the number of upgrades needed<br>
for each run?<br>
</blockquote>
<br></span>
Only if the maintainers take those reminders as high priority items, and ac=
tually send out the patches quickly, and then those patches make it to mast=
er. All that needs to happen within those two weeks. Otherwise, the AUH wil=
l just re-run the same set.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--0000000000008ab6050567ed2e0b--
