Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 879EA71B31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 21:56:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v21so12829471wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 13:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ip8OT2gNHrGxPdkm+7onQQj/XNe6xq9TBc8CHZaRqxw=;
	b=l0BnAgNXMTJj892Or1yN7f9GBZiRpILV9p4gq4VCUkobaCtHpZpc91xw1pMLr64HlD
	zu3v+quuHhfaKtLcVGGs2/2qYSQ5gVrqhMEg2YvjBxyvz5mCmYPpsR3l08MCOcMAhM/O
	k+mJTWkWRRIyHdCNQTU2RA50xA/BRX6JcI1u/mFM0dGfhXRQT3bpX0toe5lo5aXffYYI
	OW2qMJSmHyB0PWMmu0vCA53myD2fvrcQo1Do2Hv7cb0AfYZrv6AhsqIsCiTRYmriLxp3
	SFUsfhzRk0Gnwz6hcdHiOjjopBMWxBjBIPuBBI3wqUZYcX3HqthUiklgRpW4Z9ifMq9A
	xDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ip8OT2gNHrGxPdkm+7onQQj/XNe6xq9TBc8CHZaRqxw=;
	b=uffTc/Dkix7WDNAiuDgPnCJbKjT9U+PjggKiEDHcWs5N0h+PwERpfdVJrt7OpvkVD1
	gUEH1U9iSSIFc6fB6CM4eQzinbjyXoIdTxpsAa0sN54Ioa3b3LRon89znPF99Zosom5/
	FNvMmiGvII525WAl+1V3r+Ik263O74QCetW2UpPUK0eDD0h+84R4NOVVzFt5bFHPj9IS
	dDdU5ogIHlWwo2/WL7Rp0tFe2H2WwecBvDad6JyGLSvXlvMiy+g9R2kQs9WF9dmBLlmq
	OVF8qidDT3x1u3MydnxBM6l6quZbtou2nrr6czm+q4s20SNxdb7MXQwKDPhXQDi3CKG+
	BWKw==
X-Gm-Message-State: AKGB3mIi0i1w7IL2Ft2BEauu6HGOWsx61LuIfapyiIrsvPsfJGAD0NOA
	fvvmWWStvKnSdlMsgl2l/l5AfHoUa2530gszsj8=
X-Google-Smtp-Source: ACJfBotg8VWEDGfEZQ69e3MHTcZdCN4m4Pwf8IZQEvCPUqoq6nZVfyv3zCEfAeeoqj8MEMmJeo8lcHJ9UT7D28AlNgo=
X-Received: by 10.223.144.41 with SMTP id h38mr10006128wrh.228.1513806977368; 
	Wed, 20 Dec 2017 13:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.184.47 with HTTP; Wed, 20 Dec 2017 13:56:16 -0800 (PST)
In-Reply-To: <CAJ86T=WQbgUJ9ZXy79WXq8pPtySnxDH6Swi+KC9=3MJ4PzftBg@mail.gmail.com>
References: <cover.1513734733.git.liezhi.yang@windriver.com>
	<effbd3d25e0509d870f5a658dd24c93c27924cba.1513734733.git.liezhi.yang@windriver.com>
	<CAJ86T=WQbgUJ9ZXy79WXq8pPtySnxDH6Swi+KC9=3MJ4PzftBg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Dec 2017 13:56:16 -0800
Message-ID: <CAJ86T=WTzh6qO8s89GD7BxsAtdK0LU=MjGNN19zMFRu_KbJRGA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: inherit distro_features_check
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
X-List-Received-Date: Wed, 20 Dec 2017 21:56:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 20, 2017 at 1:53 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Dec 19, 2017 at 5:53 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Use distro_features_check so that we can have a uniform controller.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd-serialgetty.bb | 10 ++++------
>>  meta/recipes-core/systemd/systemd_234.bb         | 13 +++++--------
>>  meta/recipes-core/udev/eudev_3.2.2.bb            |  9 +++------
>>  3 files changed, 12 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> index d934716..d67a3c9 100644
>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> @@ -11,6 +11,10 @@ SRC_URI = "file://serial-getty@.service"
>>
>>  S = "${WORKDIR}"
>>
>> +# As this package is tied to systemd, only build it when we're also building systemd.
>> +inherit distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "systemd"
>> +
>
> "inherit distro_features_check" needs to be added too.

Oops, sorry. It's right there... I see it now :-)

>>  do_install() {
>>         if [ ! -z "${SERIAL_CONSOLES}" ] ; then
>>                 default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
>> @@ -43,10 +47,4 @@ do_install() {
>>  FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -# As this package is tied to systemd, only build it when we're also building systemd.
>> -python () {
>> -    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>> -        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
>> -}
>> -
>>  ALLOW_EMPTY_${PN} = "1"

