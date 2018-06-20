Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3267475529
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 19:07:53 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id s187-v6so378851vke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K2TJpHXsX3GnRs+a1LEl5IF55SkjobW3BvL8LsRhMxk=;
	b=Ep9GeO9aok7PgoOLiHhdG4UUQyiuxFLh7D4vXVplAkbtighph22T89k2xCHXuqZKkU
	4Cv50a9tHBVY0slVwP97kYJJh5/fmSy9RUWs92+z1Su880PablgWTgn6LVdwieKTjhBE
	ip9UBGcJcfftlpSGqHfUHhYmBZyBP1uhM1yA4HIofOzbKqn8Flp5fkl1CESCGBZ1KurA
	pBdDtwgxoYxTe5DUlzgSva+qNTvTyxL6KPVjPIEnAu+Tuu92GvN34ZBPqLBsP/1N5kH1
	L/C77biNOaZegSsq+CcOZo2SS4p1zdo5vOxJNynHXuVgXpvhUGaGemJB9/HdMnvZhvGV
	DSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K2TJpHXsX3GnRs+a1LEl5IF55SkjobW3BvL8LsRhMxk=;
	b=PAi5qltEf/fybvLYWoEaKeFQMn6JFceF/Qa7j6VjTNZE70pY9Xx9ESxJMA07HeWQqR
	sBLOGe4EsFLgl2nk+KIOFczrEYeyfgBuK64V5e+B+oIf7qZ+HikqTynQBrFBWLnzxTqj
	LLmZ4JLGuQethdMABEhBHnrZ28RaIsq4282zhvU8Y8NvZr0rkhLwKBk1HwFzrrjhS/PL
	tP6LrL695fWtlrLdouE/CB92nQ8w9UKwvc2AOWu69WePTnUZApsCLBXGahlcdAGF40pR
	hNR2Kmmh55VE7sfPx6HFOIzVAnBBcE/xO76h26hKAuP9Lrqa8FzHkZr+TRn4LEdgd+qa
	VIhg==
X-Gm-Message-State: APt69E3wiINl8Q2H9fFYExXmhAZ2XICqcCeHAbeDHjHy5SBmf6sVmJnl
	dZx2u3YjVmmMI6FCS7IFtcBBQpEfwuZgGy8gjK0N1g==
X-Google-Smtp-Source: ADUXVKLVOR5fX+TrGtoY7XjtMjFGYu5Y6p8Fl4X6Jkzgsq4RHju8lDyhq9XBV+Z90w4dQva+shd+L3jd5Lzdy1XUgXY=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr12058293vkd.174.1529521674930; 
	Wed, 20 Jun 2018 12:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 20 Jun 2018 12:07:54 -0700 (PDT)
In-Reply-To: <DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
	<DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Jun 2018 12:07:54 -0700
Message-ID: <CAJ86T=VVumy=u-OT9voyVJ-SBcO+tW=Pf-M8S5FXxHXzgVycsg@mail.gmail.com>
To: Tobias Olausson <TOl@hms.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Wed, 20 Jun 2018 19:07:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 8:29 AM, Tobias Olausson <TOl@hms.se> wrote:
> Hey,
>
> Sorry for top posting. I have done some testing of this during the day, a=
nd it seems that this only works if you run "export MKUBIFS_ARGS_foo" and s=
imilar in whichever config file contains those settings (such as a machine =
conf).
>
> I would have preferred a combined shell/python solution, but that seems t=
o be trickier than I thought, since there is code in place that looks for I=
MAGE_CMD_multiubi specifically (in image.bbclass), and I have not been able=
 to override that. Any ideas of making this work without the export hack ar=
e welcome.

The general approach would probably be to use a single bitbake
variable with delimiters and then have the shell script split it. It's
not trivial though (especially since MKUBIFS_ARGS would need to
continue to be defined without delimiters in the non-multiubi case).

But anyway, the original multiubi code was merged without questioning
this so questioning it now is really just nitpicking. Either multiubi
doesn't actually have any users or they are all smart enough to
realise that these variables need to be exported to make them work.

(RP, note that you currently have the buggy v3 version of this patch
in master-next rather than the v4).

>
> Cheers,
>
>  Tobias Olausson
>  Development Engineer
>  HMS Industrial Networks AB
>
>
> From: Andre McCurdy <armccurdy@gmail.com>
> Sent: Tuesday, June 19, 2018 8:33 PM
> To: Tobias Olausson
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add option=
al size to ubi vols
>
>
> On Tue, Jun 19, 2018 at 8:09 AM, Tobias Olausson <TOl@hms.se> wrote:
>> From 1d15f0d3c516351e6540a912367bcb22f9c25bbf Mon Sep 17 00:00:00 2001
>> From: Tobias Olausson <tol@hms.se>
>> Date: Mon, 18 Jun 2018 15:01:53 +0200
>> Subject: [oe-core][PATCHv4] image_types.bbclass: add optional size to ub=
i vols
>>
>> Instead of hard coding the ubi volume to be just large enough to fit the
>> root file system, one can use a variable to set a preferred size.
>>
>> Signed-off-by: Tobias Olausson <tol@hms.se>
>> ---
>>  meta/classes/image_types.bbclass | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types=
.bbclass
>> index 00a00d318f..2a0a7994c9 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -164,10 +164,22 @@ multiubi_mkfs() {
>>                 local vname=3D"_$3"
>>         fi
>>
>> +       # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for m=
ultiubi
>> +       if [ -z "${vname}" ]; then
>> +               local ubi_vol_size=3D${UBI_VOL_SIZE}
>> +       else
>> +               eval local ubi_vol_size=3D\"\$UBI_VOL_SIZE${vname}\"
>
> This looks odd. Presumably it (and the multiubi code from which it's
> derived) relies on the _<VOLUMENAME> suffix variables
> (MKUBIFS_ARGS_foo, UBI_VOL_SIZE_foo, etc) being exported from bitbake
> to the shell?
>
> I didn't find any discussion about that from when the original
> multiubi code was merged though. Are there any multiubi users who can
> clarify?
>
>> +       fi
>> +
>>         echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
>>         echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
>>         echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_S=
UFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>>         echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
>> +
>> +       if [ -n "${ubi_vol_size}" ]; then
>> +               echo "vol_size=3D${ubi_vol_size}" >> ubinize${vname}-${I=
MAGE_NAME}.cfg
>> +       fi
>> +
>>         echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
>>         echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.=
cfg
>>         echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

