Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D84B676294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 16:25:44 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so3906282igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Zihdx1KKD5C1/JJEPH54KY1mscx3MFlftUwWCBtGjbA=;
	b=EY/wD5geGsMX19FbYO9KNV0T6CnVCx8gXZZX329vf0Lxn2TThmBCcPVAP3hmGP2y66
	Wb+7cqfRodgLf29MTx3a+dOcuXb3BSmPCUcoX4kX3FH1D8kEQ407uFVxkwVfAmmADnAR
	un3gjyVnnTv0ewCwOLVdhhXOL1k+qEmkieQf/igPE69TD2eTtowmu7yJBAfSCVIl5MTt
	/G87Vf2U7zHxoC/t1ZfRQ+8+ysFXhCUsvxJokeoPzT7jI/4TT4u6w1GWoN2xmLMFwCSN
	STLN4L2ujGgKaAlrp1ijbF3xtDXzRDpEkkC9KLhm1bPBRg2nJLjMpJL2FPYusiGHH03E
	uOgQ==
MIME-Version: 1.0
X-Received: by 10.50.50.197 with SMTP id e5mr4472442igo.64.1447172744720; Tue,
	10 Nov 2015 08:25:44 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Tue, 10 Nov 2015 08:25:44 -0800 (PST)
In-Reply-To: <CAP9ODKo1o+FAk+_B0pgSvCdU1AYQ-Bn+m5Sp1kNfbyQ=71E+vA@mail.gmail.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
	<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
	<56420AE4.1090500@linux.intel.com>
	<CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>
	<56420F4A.9030507@linux.intel.com>
	<CAP9ODKo1o+FAk+_B0pgSvCdU1AYQ-Bn+m5Sp1kNfbyQ=71E+vA@mail.gmail.com>
Date: Tue, 10 Nov 2015 17:25:44 +0100
Message-ID: <CALbNGRRaP3PiKW1J3-njDEy4d7B0tqVkw-tgi9ERwBEJ7v52uw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Tue, 10 Nov 2015 16:25:45 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 4:39 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Nov 10, 2015 at 1:37 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 11/10/2015 05:29 PM, Otavio Salvador wrote:
>>
>>>> PACKAGECONFIG alone is not sufficient; to build the bindings properly,
>>>> the
>>>> package also needs to inherit vala.bbclass:
>>>>
>>>>
>>>> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/classes/vala.bbclass?h=akanavin/gobject-introspection-experimental
>>>
>>>
>>> and this belong to meta-vala (or other). This reduces the core and
>>> this is something we really should to push for.
>>
>>
>> If this class is moved to meta-vala, how do you make packages in oe-core
>> inherit it, or otherwise do what it does?
>
> bbappend files? :)

What get's solved or better by moving back and forth recipes and adding appends?

Andreas

