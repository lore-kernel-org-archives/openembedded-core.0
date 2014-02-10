Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C66EB6E746;
	Mon, 10 Feb 2014 07:31:56 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id k19so6061752igc.5
	for <multiple recipients>; Sun, 09 Feb 2014 23:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+rphmacguwuYXClqmWhioiFfMudzHVWYQId4YZRoq8g=;
	b=Ngk6omCDdM2y0U6KV8m8vdgqGVuYVTi2Nz7PcQkDhF9AU1cYb2ZkfvRuw8DZsoIYfs
	mCl/8bn+fac02ojVM1suCATGChqK5u6kvwHFoSZCiWFa9LiY5AxJgDUBFyidlf/RUMyh
	TuVsctL11zwwHtPo5qvIZ8bSjCq7Ytt89o8i2hMciFLFRgQYWr5gjc3hMQYgZOwJ72Kq
	9qOmp8xff6uhTrCDLwOtPm0fXsYMHS+g0OpZMU86R9rxqs6Oi2zwejrIbHFPDgfNIS/5
	JBy2034vS8NMCAlsSGyRhMNZuQXpo2y2tj+hVYKzu6KLZIECtMqFNMNCKk67atvK/rFI
	AaIQ==
X-Received: by 10.43.65.145 with SMTP id xm17mr14324912icb.35.1392017517706;
	Sun, 09 Feb 2014 23:31:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sun, 9 Feb 2014 23:31:27 -0800 (PST)
In-Reply-To: <31681ec9-08a2-426e-b3d2-72f6c0d22073@AM1EHSMHS015.ehs.local>
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
	<31681ec9-08a2-426e-b3d2-72f6c0d22073@AM1EHSMHS015.ehs.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Feb 2014 23:31:27 -0800
Message-ID: <CAMKF1srC03NP0XkoL2Qy9X7hRt_FhQy3tG_rf=mbqhYvJ=soig@mail.gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
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
X-List-Received-Date: Mon, 10 Feb 2014 07:31:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2014 at 9:32 PM, Nathan Rossi <nathan.rossi@xilinx.com> wrot=
e:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Sunday, February 09, 2014 2:08 AM
>> To: Patches and discussions about the oe-core layer; openembeded-devel;
>> yocto@yoctoproject.org
>> Subject: [OE-core] [RFT] eglibc 2.19
>>
>> Hi all
>>
>> I have staged a branch with eglibc 2.19 upgraded recipes here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/egli=
bc-
>> 2.19
>>
>> These are not final recipes there may be tweaks needed like adjusting
>> SRC_URI
>> later on.
>>
>> please help testing it out in your environments and machines
>> I would be happy to help out with issues we find
>
> Hi Khem,
>
> I have given it a test with the machines on the meta-xilinx layer, specif=
ically ARM Cortex A9 and MicroBlaze architectures. And there appears to be =
no issues.

Thanks for the report.

>
> Also I couldn't access your eglibc source tarball because of pesky corpor=
ate web filters, so I used a direct svn export of the upstream repo at the =
revision 25243, I assume there should be no differences?

there are no functional differences.

>
> On a side note, I haven't seen any mention of what is next regarding oe-c=
ore and eglibc. Since the eglibc project has closed its development (http:/=
/www.eglibc.org/archives/patches/msg01327.html), and that 2.19 is the final=
 version. Are there any plans to switch oe-core to using glibc for the futu=
re? Just curious is all.

Sure there definitely are and we discussed it in Last OE meeting on
IRC recently, we will plan moving to using glibc after 2.19, so these
will be last 2.19 eglibc recipes.

>
> Regards,
> Nathan
>
>>
>> Thank you
>>
>> -Khem
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

