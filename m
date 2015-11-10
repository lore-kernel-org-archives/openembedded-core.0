Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBC274197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 16:52:44 +0000 (UTC)
Received: by igl9 with SMTP id 9so57648265igl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=jhFxQckWRPdLFYBVJH9bzdc4JNoOt21UzUwRHG6+uC4=;
	b=ArmHqTIoJwF2A0cWnvdaQz3T3bcFJ93KLATtsJk51K5xse7JdsnpvT5LquoaokuGZj
	SqhyZRVCQjKmAoaa/SWnTI2J3OEh+vLUsFtr8iKgxvr8+i0zS2u9ZY4ct6WcZQxoGNHB
	mFd03NcnPyTepNam6qy+HJ3/PD0dWLVyxpTPNVTYf2JeSUKlOkQ94BLtp/dHFiPdQaMH
	stcqHCmYwLIhhmruHTEQRxbFVD61zYgq3FAnieVn3ILs+9oKVru+gGSxZY1CXPVAN1Ax
	EXRiQTpPDECpKzkSBSP8hcV9HUrSJFo71bkzuITx8xS+iOv3Iz4/1Gd0KaB6PwSTy1J6
	f1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jhFxQckWRPdLFYBVJH9bzdc4JNoOt21UzUwRHG6+uC4=;
	b=jttZfsJWcwtATqEjjVzaKYYcIvoXspRCrO3Vr+dcK4uLDYXeWU8072hULOy8s7YbYM
	t21gmOMtCLr+zQKS7sh4beXq2DZ57oIfTLJYOiWZhVegqBX/QmvdJEhzaryZYhaolREs
	uOuN00uUr8l5WJPjLp12873WlSG6t4XxWvcM82VkBG0gpWtSuc8PnhWeEypMXPjx2FBb
	UGHbisXUqzVXV/YoI69XsjBynkyVyGQ2m7IzVeYmFdk8t2OIJj1QLqurev1rBSUTQWfq
	9K8UNOZntkcID4J+xDTptowC0P5kiX+2COJUkVuCt569sK3ZiTSSTtfOk2GYU+NNwpTy
	3TfA==
X-Gm-Message-State: ALoCoQnQNT/pSS8hhtkboqwBoNxIuylaD4EiNACeFJzlQf8H2leYx2kW7/BbHvRqhgTEf6iivtYn
X-Received: by 10.50.43.131 with SMTP id w3mr26832278igl.12.1447174365164;
	Tue, 10 Nov 2015 08:52:45 -0800 (PST)
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com.
	[209.85.213.177]) by smtp.gmail.com with ESMTPSA id
	qf8sm1629045igb.19.2015.11.10.08.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 08:52:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igl9 with SMTP id 9so57647421igl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:52:43 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.50.85.110 with SMTP id g14mr11013464igz.46.1447174363241;
	Tue, 10 Nov 2015 08:52:43 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Tue, 10 Nov 2015 08:52:43 -0800 (PST)
In-Reply-To: <CALbNGRRaP3PiKW1J3-njDEy4d7B0tqVkw-tgi9ERwBEJ7v52uw@mail.gmail.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
	<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
	<56420AE4.1090500@linux.intel.com>
	<CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>
	<56420F4A.9030507@linux.intel.com>
	<CAP9ODKo1o+FAk+_B0pgSvCdU1AYQ-Bn+m5Sp1kNfbyQ=71E+vA@mail.gmail.com>
	<CALbNGRRaP3PiKW1J3-njDEy4d7B0tqVkw-tgi9ERwBEJ7v52uw@mail.gmail.com>
Date: Tue, 10 Nov 2015 14:52:43 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqL0kirHamzrcDSc4W=RHg4Ue32WyuTMtA1zaZJiBCm0Q@mail.gmail.com>
Message-ID: <CAP9ODKqL0kirHamzrcDSc4W=RHg4Ue32WyuTMtA1zaZJiBCm0Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 16:52:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 2:25 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Nov 10, 2015 at 4:39 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Nov 10, 2015 at 1:37 PM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>> On 11/10/2015 05:29 PM, Otavio Salvador wrote:
>>>
>>>>> PACKAGECONFIG alone is not sufficient; to build the bindings properly=
,
>>>>> the
>>>>> package also needs to inherit vala.bbclass:
>>>>>
>>>>>
>>>>> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/cla=
sses/vala.bbclass?h=3Dakanavin/gobject-introspection-experimental
>>>>
>>>>
>>>> and this belong to meta-vala (or other). This reduces the core and
>>>> this is something we really should to push for.
>>>
>>>
>>> If this class is moved to meta-vala, how do you make packages in oe-cor=
e
>>> inherit it, or otherwise do what it does?
>>
>> bbappend files? :)
>
> What get's solved or better by moving back and forth recipes and adding a=
ppends?

I see no real benefit on Vala being into the oe-core; it can be add as
all the other layers we have. This helps to reduce the oe-core size.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

