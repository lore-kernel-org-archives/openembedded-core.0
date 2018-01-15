Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDBE719B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 20:26:06 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id w14so1594911itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 12:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RaRUYnkJdLPtbNtPeRej25WidVS78iU0Qojcs6ioTco=;
	b=wmKG+Zs2BDQoawZKFHUMpLU9ZzhGWazb6QVBd3PH5nU8wJU1bPdBmpxAJDECS5Mbhv
	2Qv/zpvXyeEBi+Hfwg99d3xJjBRH0118oIW/8KBOucHab1BcaWtjm0k2qq+IvhKQ8wXM
	TiyiEo/o3X1gL5BIpgvIVA8dm0JlXsLGQB1uXbKO+NJg91YidFBhw3U+zUh4cWuxCdqU
	0hr9JB2qHkp/UZlEVVW0szVRZZxi9MZF2+hZJUATQE94mDcTg14P7HlxIcWvlwaJD6IU
	vh1xZLeSB+FG1US2TekMo735WE3v8fe6nBJVptIbFvanNRkk6b3/gYjeX7db+3WX+AVE
	pjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RaRUYnkJdLPtbNtPeRej25WidVS78iU0Qojcs6ioTco=;
	b=bKLABcgi9F/l3WXCAW4jf2ePtmEXZ3vKfEzwOeVcjOuk5tCIQchF5q+p7KsjnOO8SJ
	yFnGW/0t1eog1rhcoApFwYoRzFl8OGiUESZiJQ8vY4gjSe78pUrsQGTzc/6k1PGuLfKF
	aJsMGcrRG2c34i3U2sCcwr2s4p5KMC1Cr0WelJ28GsiAmDa/qd1dzntXlwW09UMHPiYe
	fyu60IUBppGzQHXCoJzj1VKPi28ls9yCpiwiU8XpFY1zc8Nsv26UmdYRHbZCoE/k9tgp
	+SWx3+5eqwC4KL1e5jO08CoMb2K1jbW7wUPJqbpIO5TZ49mEx6gTJd4FVSsEWYRKUtMv
	wA0A==
X-Gm-Message-State: AKwxytfGinHTI1TnKLr/tgzGHqqaFkdabO77aQNToTTzdRC3uBIyFP/2
	cRXMV75iikP/6nSKKcDYGRvewiU9w/oY8vudDUAD6g==
X-Google-Smtp-Source: ACJfBotVRmOFZTGeg7jP3PI70dJu78i400mYbCCkz9a0rZt8BLFg1DR3IC9fh0VTdBAe70W6fn4NzhfLuwrwM8j2Ek8=
X-Received: by 10.36.86.20 with SMTP id o20mr11736410itb.53.1516047968461;
	Mon, 15 Jan 2018 12:26:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Mon, 15 Jan 2018 12:25:48 -0800 (PST)
In-Reply-To: <ec3a3f09-6047-b703-287b-f8e837ffccc2@linux.intel.com>
References: <20180115172530.D4C50440002@auh.yoctoproject.org>
	<52a32ba3-ed28-976f-f7a1-f296ba86918b@linux.intel.com>
	<ec3a3f09-6047-b703-287b-f8e837ffccc2@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jan 2018 20:25:48 +0000
Message-ID: <CAJTo0Lb-fXYxP2O17NQJC_JNOo3swrb9i33F2q53NZYPD9zKxA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-01-15
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
X-List-Received-Date: Mon, 15 Jan 2018 20:26:07 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea9f7b390562d66cf8"

--001a1144d5ea9f7b390562d66cf8
Content-Type: text/plain; charset="UTF-8"

On 15 January 2018 at 18:21, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 01/15/2018 07:38 PM, Alexander Kanavin wrote:
>
>> On 01/15/2018 07:25 PM, alexander.kanavin@linux.intel.com wrote:
>>
>>> Recipe upgrade statistics:
>>>
>>>      * Succeeded: 1
>>>          iso-codes, 3.77, Alexander Kanavin <alexander.kanavin@intel.com
>>> >
>>>
>>
>> Yay!
>>
>> Dear all, please bear with these emails, there'll be a few more. I'm now
>> setting up AUH to run in an automated, unattended fashion; it's gonna be
>> awesome.
>>
>
> Alright. In about 10 minutes, a cron job will start that will attempt
> upgrading *all* of oe-core recipes, and results (both successful, with
> patches, and failures, with error messages) will be mailed to respective
> maintainers. This will be repeated on the 15th of every odd-numbered month
> (so six times a year).
>
> Please take those emails not as irritating noise, but as a polite reminder
> to keep oe-core up-to-date. Suggestions for improvements also appreciated.
>
> (I've done my best to test this, but it may of course also fail in various
> spectacular ways).


AWESOME NEWS.

Thanks Alex for the work reviving AUH!

Ross

--001a1144d5ea9f7b390562d66cf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 January 2018 at 18:21, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 01/15/2018 07:38 PM, Alexander Kanavin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 01/15/2018 07:25 PM, <a href=3D"mailto:alexander.kanavin@linux.intel.com=
" target=3D"_blank">alexander.kanavin@linux.intel.<wbr>com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Recipe upgrade statistics:<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 * Succeeded: 1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iso-codes, 3.77, Alexander=
 Kanavin &lt;<a href=3D"mailto:alexander.kanavin@intel.com" target=3D"_blan=
k">alexander.kanavin@intel.com</a>&gt;<br>
</blockquote>
<br>
Yay!<br>
<br>
Dear all, please bear with these emails, there&#39;ll be a few more. I&#39;=
m now setting up AUH to run in an automated, unattended fashion; it&#39;s g=
onna be awesome.<br>
</blockquote>
<br></span>
Alright. In about 10 minutes, a cron job will start that will attempt upgra=
ding *all* of oe-core recipes, and results (both successful, with patches, =
and failures, with error messages) will be mailed to respective maintainers=
. This will be repeated on the 15th of every odd-numbered month (so six tim=
es a year).<br>
<br>
Please take those emails not as irritating noise, but as a polite reminder =
to keep oe-core up-to-date. Suggestions for improvements also appreciated.<=
br>
<br>
(I&#39;ve done my best to test this, but it may of course also fail in vari=
ous spectacular ways).</blockquote><div><br></div><div>AWESOME NEWS.</div><=
div><br></div><div>Thanks Alex for the work reviving AUH!</div><div><br></d=
iv><div>Ross</div></div></div></div>

--001a1144d5ea9f7b390562d66cf8--
