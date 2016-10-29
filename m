Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50E436FFED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 21:15:57 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id y123so1845310vka.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PHU2eed2X49t11712JgUlRc/2kutCSEveQKCQWzYoTY=;
	b=c+wPQjiKm18wIv4Fxjn2XvYOdo4ElqOf0eLLM++hEByZ0r5FNwaVSvGjwHCzKRcPEL
	4npNvBXTRgFOwr6RXfwGTeXLJW4wadH6lCBUcUqADB5aCRYW6dW7cObqWJuq/Dw2/qvu
	QRveCF3O76f6jdX/Hi8nY2evFXxpFZ/oDYPezANLcSY0PgldOXOYhiTS8RZuSq+TOby2
	i0DDhEaafpijytS5oN3V96hw9jIwAFJfaUWrkMfyK4hvHDUqPScsy2uS+f6nK/JHO8b0
	m5FOrPYQ3RReLva+xDzkNQR6VmDPIgkQcdv2BWn6+MUNCuYHTaJVPRLWfXbWVEQ7HeEl
	CBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PHU2eed2X49t11712JgUlRc/2kutCSEveQKCQWzYoTY=;
	b=fkErmSKA9da1osWadfmYP6CZqKbuasxCL88ovYgedOddGAFseum0rNOamZKk3B8MgB
	oZQibnyzqSVjy4gn4WtYBJInInF/54WUVhKk51kjaK9uSwl7Y/qNfHF7kNmlRtOdsiFS
	fXPIT8MDmEXyCe3FtDRoE8LYNcdIaT7XbDZWu55XWA0FoCKijd44AK0PMXRjjUgCTGXk
	DKyb0UPOLvI7FR4p76iOxVKmtXMMS7+zcEdeVaP+2ck6RipZcg9NBdY+aLYpuwiV+nGs
	FePTu9/3fRPe9XkDm6HP1ztTe3cdJOecKBbig8CV8uffq6tV+dnDo1u/4YtdPgWz0pk/
	AzwA==
X-Gm-Message-State: ABUngvegputvtem1QgytXnAfmr2CHJcGC/q7h8liBIZ2tWgyCPPwUsAzWztpMy2yZi8lJ1QTCaaoMvOTt1lSHA==
X-Received: by 10.31.180.132 with SMTP id d126mr18053778vkf.139.1477775759107; 
	Sat, 29 Oct 2016 14:15:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sat, 29 Oct 2016 14:15:28 -0700 (PDT)
In-Reply-To: <deb371d6-ee5c-8730-e235-f37b13f6cc9d@scypho.com>
References: <20161028143627.15891-1-linus.wallgren@scypho.com>
	<D2F9E708-19E4-4967-AAF5-5D9C1D9941EA@gmail.com>
	<deb371d6-ee5c-8730-e235-f37b13f6cc9d@scypho.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Oct 2016 14:15:28 -0700
Message-ID: <CAMKF1so_4pLL+Ou9982Fvi4okEv+0EB80k6Qsvhf5GtYe8e1ww@mail.gmail.com>
To: Linus <linus.wallgren@scypho.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Reload configuration on package install
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
X-List-Received-Date: Sat, 29 Oct 2016 21:15:58 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 29, 2016 at 12:52 PM, Linus <linus.wallgren@scypho.com> wrote:
> I do believe so, quickly looking through a debian stretch package I found
> that it uses deb-systemd-helper, as part of the init-system-helpers package,
> which does reload things if anything changes:
>
> https://sources.debian.net/src/init-system-helpers/1.45/script/deb-systemd-helper/#L588

thanks. Seems ok to me.

>
> On 2016-10-28 20:00, Khem Raj wrote:
>>
>>
>>> On Oct 28, 2016, at 7:36 AM, Linus Wallgren <linus.wallgren@scypho.com>
>>> wrote:
>>>
>>> When a systemd service file has changed it is required to reload
>>> systemd's configuration. Otherwise changes to a service file will not be
>>> picked up during package upgrade.
>>
>>
>> while this seems reasonable. Does that happen on other distros using
>> systemd
>> too ?
>>
>>> ---
>>> meta/classes/systemd.bbclass | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>>> index d56c760..7e51ed6 100644
>>> --- a/meta/classes/systemd.bbclass
>>> +++ b/meta/classes/systemd.bbclass
>>> @@ -29,6 +29,10 @@ if [ -n "$D" ]; then
>>> fi
>>>
>>> if type systemctl >/dev/null 2>/dev/null; then
>>> +       if [ -z "$D" ]; then
>>> +               systemctl daemon-reload
>>> +       fi
>>> +
>>>         systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>>>
>>>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>>> --
>>> 2.9.3
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

