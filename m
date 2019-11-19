Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 469C87F883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 18:21:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t20so25678699qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g3DaclwY9K8ZqaCEJqoLnLu/D8fenZnj+aXNY/vqdoU=;
	b=RmFhyDjVS6rOD8o2Quo4656mt56esn1sbwqEHu4qzZDc9goOz6BS8QVJgGN3qyzKur
	arHw/RJd2zzdpc8hH7E9GVei13HrrPXYe9pfB5XPfogL83BI7/NoYIvaILbHJDJtA4Zv
	3MG5ENg1Qc1olAjvt3WA1Pt7NCvWZuYXN8xSamlbNXMwyV8nVCjSZC+eJDDYU7/3WWyk
	iGIl8KZbX0oE6XQtZ5Vw683eDDtMrGCPeE+2GYpHLPLmrhvyeTiMYupwL7fNyCieeWPF
	hGsdUWKCfhFDPktpC9KmhDB3+3XpUSJtUTlgo2B/XN1n+VqR0PtsEJtjoBId3/iJQDbu
	fAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g3DaclwY9K8ZqaCEJqoLnLu/D8fenZnj+aXNY/vqdoU=;
	b=HGHayutW58A+d/qtuDkpLg083SfaaNb2h6hfnmUNUdv/TmhY3I1snDKojSr2x/JT0I
	jGHVaGXrvMlBuwYczutwhVhHfBugjxBK5zWXU4v/wak447oCjnkvGONurrimnunkv2ed
	qA+mhflyt+ZeCy1fM/7cs4Oify7rKGOI8i/LRIynZml2eBMfs7fh4E4w6WtKHoooTYhl
	82BszUiIiu71I5T44DSUlh5G2M9yld/ET7qhrg9g/TvCu04paYYTwrCQQip1LSriMnmX
	r66H6pFm2SrqGDW8fpDHXbwtfbOsttNtA/+LUSf8xZiKotD1hECtkZCyvgND0XSm4PuN
	fawg==
X-Gm-Message-State: APjAAAUmh3y5mUOUh7y91+GxFfiNMI+RvvmY1sirs5r8SVXKvyvRCWmc
	JDEzbdtmJe0vB9GieAIZPFK9ecIy9RX2zfCiIHo=
X-Google-Smtp-Source: APXvYqwgoDJY8BmYdHfxivrR2xgH2IgDKUybwHqriMdMQicjb1H39QQdl0Ef1LbvJV+4oebuZr1aqxT9AQPTFOV44lA=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr34076063qta.88.1574187694656; 
	Tue, 19 Nov 2019 10:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
	<CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
	<CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
	<709581ab-081f-432d-8631-caac81d40a60@Spark>
	<CANNYZj-q73f8hbQbn1wxqjrNhJbvsoefqQyqJtGqLoxrA_2b9Q@mail.gmail.com>
In-Reply-To: <CANNYZj-q73f8hbQbn1wxqjrNhJbvsoefqQyqJtGqLoxrA_2b9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 10:21:08 -0800
Message-ID: <CAMKF1spdQG3aXgy3yGUYA0u3adnkAv3BcrEe6PJhCfY-xr59fA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 18:21:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 10:14 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I never said they are modifying files in place, I think you misunderstood=
 me somehow. 'Archive' in this discussion is a folder on a server with tarb=
alls, not a tarball.
>
> Maybe it's easier if I provide clickable links:
> https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/
> https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/Archive/
>

I see that they are still carrying a release from 2013 in
https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/, I am hoping
that they do keep the tarballs in this location for long enough. So
it might not be such a bad thing to move to using it, I was thinking
the cycle is smaller

> Alex
>
> On Tue, 19 Nov 2019 at 19:08, Christopher Larson <kergoth@gmail.com> wrot=
e:
>>
>> The whole point of having PV in the filename is ensuring it won=E2=80=99=
t change out from under us. If they=E2=80=99re modifying files in place tha=
t=E2=80=99s going to cause us headaches whether we pull from archive or not=
 due to checksum changes.
>> On Nov 19, 2019, 9:46 AM -0700, Alexander Kanavin <alex.kanavin@gmail.co=
m>, wrote:
>>
>> On Tue, 19 Nov 2019 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>
>>> If I was asking you to store the tarball some place in arctic then I wo=
uld understand your concern but in this case I am not able to. can you desc=
ribe why using archive location is not suitable here perhaps that will help=
 me
>>
>>
>> The archive location is missing several latest releases of man-pages, wh=
ich are only available from the main location. Which means that we always s=
hip an out of date version of manpages, and aren't aware (via version check=
 tooling) that later versions exist.
>>
>> Alex

