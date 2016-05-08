Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0F863731A4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:13:45 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n62so12157508qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 May 2016 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0I5bLAhFMmSMgCFsPR2dMXmS4zpogC+ebBwEiKlIoYk=;
	b=DvQl4rPO/lMRaw4n49oagc7urEritVIhWR451yvvTAZWkGUhsxlCVIh3W8GaJdQv/u
	QnVQQDPrrn+LvkD7zV5R10sEK2vBa7NG4dY8XmX6PhixcgEQq9JOCn1oWwHKUoT1wSR+
	FbjhEzCTyL3DCI3fG/WOxdshuBFJGZ3wxxwQsQu/i1Cw/BO7J8v/Hl6DuvA478ryyX2Q
	TeMEh+xMeQQunii+Bcd1+lkqwQ7gbxIxbRx/0fIkxnl6g5+5fKOJMdOQR8mogE4k6BUR
	UR30ZKLPs9pmMKLB0bgfr5XzXsyWtEoDc7DRmPClIuQVirNXML+MyNX53p/fBePseX0j
	PFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0I5bLAhFMmSMgCFsPR2dMXmS4zpogC+ebBwEiKlIoYk=;
	b=Lk/V07BnNHsfY0gAcHtnOoCtcydEwO8fhwlpisnaZyb5zJCiSMMAJ/qsIOisVpSc0z
	/wnlefvWZZkKcdV1IPath3+xTRFGERp8iqWLUpqm0u7T3sdAUN7veSGkfFgwiXnSHCnf
	QS9CTdnFrR1XmIBy1gxHu8B5nghU5rpb9cG/c4Ta7aSHJsM74uZQcjnLrXTP/uLbEuiQ
	nXjexGdmnf+PxwkkWPMWTfei7CB8soEmaseU39vTJMyxrVN8n8ff/gQojuHlQh/sRbyQ
	7joZB0aOlJ0Vlp46/NuDNk5v4CnT3lv+5jvnrxwE/Pl/AVLLY5ij6O1xxEpONBUMQMsn
	WQYQ==
X-Gm-Message-State: AOPr4FVEZRFSEab6EaewMqz7E0L4JebjJ0QIRBpIMbaf2N7RfraVwwFV+9l0J8vMfN0mQDdKySPvSEVyeFzJgQ==
X-Received: by 10.55.74.9 with SMTP id x9mr31993432qka.81.1462731226264; Sun,
	08 May 2016 11:13:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 8 May 2016 11:13:16 -0700 (PDT)
In-Reply-To: <572F7DA7.8020904@denx.de>
References: <1462712432-6214-1-git-send-email-marex@denx.de>
	<81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
	<572F751E.2030604@denx.de>
	<CAMKF1sp1aRCsY_oB3xXTsYmmXdzqmDoMX60E59fWdAib0tsDrw@mail.gmail.com>
	<572F7DA7.8020904@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 May 2016 11:13:16 -0700
Message-ID: <CAMKF1sq_Ugh8uFONQA5xdxyYgiCXbJEUaf3FyrRdy+=iDYR1=w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Sun, 08 May 2016 18:13:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I will just fold it into my series.

On Sun, May 8, 2016 at 10:55 AM, Marek Vasut <marex@denx.de> wrote:
> On 05/08/2016 07:31 PM, Khem Raj wrote:
>> I was just trying to avoid patch conflict :)
>
> If you want me to repost updated patch, just let me know, but the fix
> will be really trivial in this case ;-)
>
>> On Sun, May 8, 2016 at 10:19 AM Marek Vasut <marex@denx.de
>> <mailto:marex@denx.de>> wrote:
>>
>>     On 05/08/2016 07:06 PM, Khem Raj wrote:
>>     >
>>     >> On May 8, 2016, at 6:00 AM, Marek Vasut <marex@denx.de
>>     <mailto:marex@denx.de>> wrote:
>>     >>
>>     >> The oldest kernel version for nios2 is 3.19.0, set it so, otherwi=
se
>>     >> qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
>>     >> message from glibc.
>>     >>
>>     >> Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>>     >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>>     <mailto:richard.purdie@linuxfoundation.org>>
>>     >> ---
>>     >> meta/conf/bitbake.conf | 1 +
>>     >> 1 file changed, 1 insertion(+)
>>     >>
>>     >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>     >> index 1c4175f..2f5db22 100644
>>     >> --- a/meta/conf/bitbake.conf
>>     >> +++ b/meta/conf/bitbake.conf
>>     >> @@ -405,6 +405,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_=
SYS}"
>>     >>
>>     >> OLDEST_KERNEL =3D "2.6.32"
>>     >> OLDEST_KERNEL_aarch64 =3D "3.14"
>>     >> +OLDEST_KERNEL_nios2 =3D =E2=80=9C3.19"
>>     >
>>     > if you don=E2=80=99t need it on krogoth, then I would suggest to h=
old this
>>     patch for master since
>>     > I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x
>>     minimum
>>     >
>>     > see
>>     >
>>     >
>>     https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d=
13ce158db29954bc6dabe
>>
>>     I don't mind either way. I need 3.19, not 3.2 though, so your patch =
does
>>     not help me if I understand it correctly.
>>
>>     >> STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-s=
ource"
>>     >> STAGING_KERNEL_BUILDDIR =3D
>>     "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>>     >>
>>     >> --
>>     >> 2.7.0
>>     >>
>>     >> --
>>     >> _______________________________________________
>>     >> Openembedded-core mailing list
>>     >> Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     >
>>
>>
>>     --
>>     Best regards,
>>     Marek Vasut
>>
>
>
> --
> Best regards,
> Marek Vasut

