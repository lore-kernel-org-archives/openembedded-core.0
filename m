Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 17B8060721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:53:02 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g14so1761264iob.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TBCS8gHgkBSThWWVNQ3g+aKqgWv6hBYqtjDPgBkfSKQ=;
	b=NlBMwt39y2Tc57368wuZFFWpYvqWqxeT8HVxQAPgCsYuS4opOxSBOM5Ee9myQ62vZa
	R9grBwMZUKDZtr4PKOv46J8SLg4lUG16luKdA2wGu4I0NZ3dXe0Ywe1oxnDwJaaAqi6P
	SB2y2PlMcSPU7Vbi7comR1y7SpYcpPzDV6STsk/v37xlhmXaSkYw9gOpG0og0Qie1B49
	TCzKGGZ1aGfEV23NZrOKPKH+jz9ty9VcfvEt7ojqkphqEEg1O8dXHMqKgjkzDZz+ywfk
	JOBXMpqU9hurihIG261G9+IUy//+tM0WY/M78q8tHZOVp/whUVjNNsXTmtqSz6UjGKCt
	4tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TBCS8gHgkBSThWWVNQ3g+aKqgWv6hBYqtjDPgBkfSKQ=;
	b=U2NS9l9RCkRZDveDeg6Xvx50VShSyx9mBXvR+AR6UIGDa6L/1Q6CSSZF+Vz5S/4nNa
	rwC1RY8hDOGpW4D+obpYFI7XVoz++ZvqdgsJpHcjiRIPCQDW6ckLNHblaNsdvvqEIjSF
	00iNnPgzebg3j2v2xTP7X/3ae/nBNxO4AKcen8EH/WvheKfuxMdJR5+NFp2zp/8RiWEl
	BZrbCWnDm9+rOJqAWFMPqlLVOEd0EwTaeVVidOlmGb30nmQt33+TqRYRJNo34UKYkfDJ
	BJeMn2u2h78xVfyixMBwevglbtehRa0FL3Yf5gYSXX3wKWeP/peTFAil5FNhsu8uLugi
	8R+g==
X-Gm-Message-State: AElRT7E7KUwsFu7mlpoEj5xGJQDjayeozGw9LBuCA3943YBrw/SdRqZU
	LeHwh7SneMef9uSexjsjUsWn+RAu9Q1WLaPAWC7BmQ==
X-Google-Smtp-Source: AG47ELthlwhH+nEsGDgj23CPqEFoJ2NZ7XsR7JR61Tq7JSuNqutSf2DTQwluYDSJJex3VshSRdEqLdBUW7KJrenBju4=
X-Received: by 10.107.6.231 with SMTP id f100mr16193554ioi.23.1521543184095;
	Tue, 20 Mar 2018 03:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 20 Mar 2018 03:52:43 -0700 (PDT)
In-Reply-To: <833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
	<dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
	<CAJTo0LbxDGNrJH8tDiCgMKoSHUsK8Q17BUH=UVkY8zDBAm70+g@mail.gmail.com>
	<833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Mar 2018 10:52:43 +0000
Message-ID: <CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Mar 2018 10:53:03 -0000
Content-Type: multipart/alternative; boundary="001a113f9be4ffbcb90567d5e007"

--001a113f9be4ffbcb90567d5e007
Content-Type: text/plain; charset="UTF-8"

On 20 March 2018 at 10:07, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/19/2018 10:07 PM, Burton, Ross wrote:
>
>>     Do we have a place identified for new changes (2.6) while 2.5
>>     stabilizes.
>>
>>
>> A formal place, no.  I tend to queue stuff in a branch if master isn't
>> taking all of my energy, otherwise the patches will sit on the list until
>> 2.5 releases.  Typically master and sumo branches won't diverge until
>> post-release.
>>
>
> Which brings me to a question: what is a good schedule and cadence for AUH
> runs? Currently it's run on the 15th of every odd-numbered month (so
> January, March, and so on), but I thought of shifting it one month forward,
> so it doesn't land right in the middle of a feature freeze. Thoughts?
>

How long does a single run take, and why not run it every month?

Ross

--001a113f9be4ffbcb90567d5e007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 March 2018 at 10:07, Alexander Kanavin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 03/19/2018 10:07 PM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 Do we have a place identified for new changes (2.6) while 2.5=
<br>
=C2=A0 =C2=A0 stabilizes.<br>
<br>
<br>
A formal place, no.=C2=A0 I tend to queue stuff in a branch if master isn&#=
39;t taking all of my energy, otherwise the patches will sit on the list un=
til 2.5 releases.=C2=A0 Typically master and sumo branches won&#39;t diverg=
e until post-release.<br>
</blockquote>
<br></span>
Which brings me to a question: what is a good schedule and cadence for AUH =
runs? Currently it&#39;s run on the 15th of every odd-numbered month (so Ja=
nuary, March, and so on), but I thought of shifting it one month forward, s=
o it doesn&#39;t land right in the middle of a feature freeze. Thoughts?<br=
></blockquote><div><br></div><div>How long does a single run take, and why =
not run it every month?</div><div><br></div><div>Ross=C2=A0</div></div></di=
v></div>

--001a113f9be4ffbcb90567d5e007--
