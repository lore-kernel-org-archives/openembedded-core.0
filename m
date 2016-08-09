Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 09C1F7706E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 09:22:16 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 109so542214uat.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CH4wxUBGEIZBBckQie4pG76Ba3FEJkfjiNUb+eMvS94=;
	b=wfXFo0rKoVdbGhbOFxHwZN1vuiCfyPaMQE/XulmI28HvRCn4Q81e6djfycBd6wBaI5
	/PkyzBzfUwBg8ugiBbm76bA+UC6hMS603DzMOaJ/5B2ljh/aVeAQUvyrpqHY7z0wQhiq
	yziQtt00IIW0FUjky6Hcgi5pn5f9RfLiV+pUiteSWUud29QrZ9+1dv2mZQGQhfhHwxqF
	lsrtuTWQpAqYYC98uq0sAP8MNpD+Nsp6f1wYz7lZTrutveMcz2UbVMp9YuZBu51KNHoK
	dhcruHTiqfADs/O0aQoa/+7GD78zlWY9jztYrIBaKXgf6kqyVKCQrdimA6oSo7E0g6/r
	PRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CH4wxUBGEIZBBckQie4pG76Ba3FEJkfjiNUb+eMvS94=;
	b=Dpaco9ZdWeV7bD9Pb+K9TZqf4fgMKNdbo6cNr7z6hM9cBMAkJjg8UrqynL77T11R87
	bZvJZw4mUoCOjUlkZBmWkbZ/LuHUq5YQ0bW6EHLv4RIpzECaI6Czz9H9yp7Tpdw6c8j6
	DFeNNZFUpVOVzQXwMwWtDr/ETf6zDifNJ0uEzo3/6dkJHHj4HIr2LIJ40Hp5hMtS2QYp
	zjmi7p5UwDfJ0hEHktYxyoIhZ6SHnFqtE4AyYipXfbYYY24Za5rCWZm8yC7fAGAqpLB4
	KAZb5W68ayoJUNHp5nV+QZM5uajqiFYfS2Cgh61b1jUWeCuYfbCe29MSPkn5kQSp7e4n
	R5WA==
X-Gm-Message-State: AEkoouveBPhpXzqrjfcM4ire5oulb4DT1OEEhQNU50KUNTZ00pNA20Hla7O9+XLX/5UEtBpXdAQpUK1JxJK16w==
X-Received: by 10.31.218.198 with SMTP id r189mr49051075vkg.30.1470734537067; 
	Tue, 09 Aug 2016 02:22:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Tue, 9 Aug 2016 02:22:16 -0700 (PDT)
In-Reply-To: <CALbNGRSP+nbV045-UaW_bZXv0iwnTe-MhjMLe3NEqAeg=-6Lyw@mail.gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
	<CAP9ODKr5zc+cB-iGcze7Uq8DswUko=2cReYhWLyURe5DwLuE2Q@mail.gmail.com>
	<1741854.t2UPzGOPnl@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRSP+nbV045-UaW_bZXv0iwnTe-MhjMLe3NEqAeg=-6Lyw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 9 Aug 2016 11:22:16 +0200
Message-ID: <CALbNGRTfPz3h=G3WJG88ShDtCJjgFj1zTk0kT=Ri+k_N6d=tog@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Tue, 09 Aug 2016 09:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2016 at 9:31 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Jul 31, 2016 at 11:17 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Sat, 30 Jul 2016 08:00:45 Otavio Salvador wrote:
>>> On Fri, Jul 29, 2016 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > From: Herve Jourdain <herve.jourdain@neuf.fr>
>>> >
>>> > Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
>>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ---
>>> >
>>> >  meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
>>> >  1 file changed, 11 insertions(+), 7 deletions(-)
>>> >
>>> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>> > b/meta/recipes-kernel/linux/linux-dtb.inc index 74f5ef8..8528d64 1006=
44
>>> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>> > @@ -33,12 +33,13 @@ do_compile_append() {
>>> >
>>> >  do_install_append() {
>>> >
>>> >         for DTB in ${KERNEL_DEVICETREE}; do
>>> >
>>> >                 DTB=3D`normalize_dtb "${DTB}"`
>>> >
>>> > -               DTB_BASE_NAME=3D`basename ${DTB} .dtb`
>>> > +               DTB_EXT=3D${DTB##*.}
>>>
>>> Bashism, no?
>>
>> No:
>>
>>   http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.ht=
ml
>>
> Anything wrong with this patch. The orinal patch was sent end of May!
>
Should read before sending... What I meant:

Is there anything wrong with this patch? The original patch was sent
end of May, there were pings / a resend but it was never applied. Why
I insist: It is necessary for RaspberryPi's open source (VC4) patch
series pending for very long time.

Andreas

