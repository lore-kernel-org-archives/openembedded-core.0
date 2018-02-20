Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8523878709
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 20:49:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o76so18159082wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 12:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OaiKTP75V97SrxVE3fYh/75Ni1CyLucIK9fbhHA/yOU=;
	b=WK0e5YumS8hedVshExXHUQVexmhqSMz5hRt11/dF+6s1l6MWmeiTOVBxN/GjmCxa8F
	ROdILs0LC6fs4o9aKBpQsPtDhmdTY53uUsDKNoVd8s4wCTH+KmwU6nVMmY91B8dWFwL6
	FdYY66jtN0+HwmlzCzL4KN9LgNLNW7ZJFEu1mRlAUpsHcoM4Tb8In7Hrwrn/VOmqqg/M
	/9Us88SHNhXZV46gDr7O2YekRjoOxLms/azinDw06D0EnBPNFWMKGYweUT/gGXqrOsGz
	DjU+3U2RvucLle4khwTb9qH9AC3LvVdV9IQbBctWgHA0Dy2fHJxfBtFxiNmMceoQ5uEs
	jHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OaiKTP75V97SrxVE3fYh/75Ni1CyLucIK9fbhHA/yOU=;
	b=g4G7MUEvPzN7R9jH3NJvCY4VNyMWu7JqLjtPVCpeeQCSrQjXC60jUl9kiP5MqXFP15
	XmlR8WKhGRr3wps/Qxu6UQWvzFpzedgaNW/zu6TmLTvXED6p/1WCuIR/n3S1sErfoLw/
	uje01kEv3V6sSNTUrIjLrpx7IsM0umnNyZ2mV3l6UcNJ8DdQmPCCuZIvcCO5Xzv/T0x9
	DJVLvO9MjR2l8xLkX6U5Jt4piXYYCfdmWyWhN3oMyDYm/R531b/gmyalHaN3bTv7wtI/
	S6Rk4VjAjILI1yZ8HWDsgIfOGHQRzUydTVHpmlFUEw2NTZv9TEmddutK0/gai/VgLC12
	d83w==
X-Gm-Message-State: APf1xPD+jNwD7vZZLZsgl51SySoPSGNgNQh/Bt7jVkrMb7tX1kpRUIgR
	p/bBLRVTtNDtjjN4Obt/XSD7Ob1oxPVmEAu/AQ4=
X-Google-Smtp-Source: AH8x225ABuo3y5tpnL72PzPxFA60JGBJLd/sP7W0FjCoCBVGL8Cp2UFp3rbN2NyWeQOEtLRZfKapk1lMh6sgvZREC8A=
X-Received: by 10.223.199.71 with SMTP id b7mr843100wrh.89.1519159774818; Tue,
	20 Feb 2018 12:49:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.193 with HTTP; Tue, 20 Feb 2018 12:49:34 -0800 (PST)
In-Reply-To: <CAJ86T=U=fT8tTyRPDEzk78U2qxOXB7CW=R39TOCJfwfcLwxfTQ@mail.gmail.com>
References: <1512524359-16132-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=U=fT8tTyRPDEzk78U2qxOXB7CW=R39TOCJfwfcLwxfTQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 20 Feb 2018 12:49:34 -0800
Message-ID: <CAJ86T=X7fLsJp==+bSY4BLf2kXxyWiumPKvNuS4Hv0p=wcH8tw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] bind: move libraries to own package
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
X-List-Received-Date: Tue, 20 Feb 2018 20:49:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 12:25 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Dec 5, 2017 at 5:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> From: "andreas.kling@peiker-cee.de" <andreas.kling@peiker-cee.de>
>>
>> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> (cherry picked from commit d74ebc91388941295a2321a295cdb06ee87fc38b)
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>
> Ping.

Ping again.

>> ---
>>  meta/recipes-connectivity/bind/bind_9.10.5-P3.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>> index 13724a8..8309302 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
>> @@ -67,6 +67,9 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>>  FILES_${PN}-dev += "${bindir}/isc-config.h"
>>  FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>>
>> +PACKAGE_BEFORE_PN += "${PN}-libs"
>> +FILES_${PN}-libs = "${libdir}/*.so*"
>> +
>>  do_install_prepend() {
>>         # clean host path in isc-config.sh before the hardlink created
>>         # by "make install":
>> --
>> 1.9.1
>>

