Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B878371A76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:10:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z3so24252315wme.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SNxZEpWHRNTnfURBFnnZMQ7F1yrvoJO/mhGtToMNJig=;
	b=NPf0gNtYiGh01TVkF/ORTEdtxn4FjrlL2YRsTWAdXugxmLG9Eu5EPO3uniCtaxutrb
	jUfc8P7/5w148N6gIJZiPTOO6zLUqjp6AxmzMCwrhUS+TonaaqZ64fQop+dWeDrbHB4Y
	xsnUS13utUml9/kYsl499JWXjOoK40u91khbOuvu2Ve81UTCCllajyLj3eY+o+wVd67P
	eTmAOKDSkXNCOThCKkoRqF+ENE/YJrnINximsfbT+9f9tztNoh7dNWxyyFlIbfe7RHmZ
	jlLf7/YpQMWApuiLGRcWedEY2m6AJ1Fkqq3WENIZM3CBDgkLEUMb1UFoLoYPAerOuwaw
	u6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SNxZEpWHRNTnfURBFnnZMQ7F1yrvoJO/mhGtToMNJig=;
	b=WziUApdxQD9/N+UnbNv00kGzGmlVBYDsKqHaGuyauJwJVxcWYZZs73MahZPg6nqAX5
	IVdhT98ltKYNf/7KVEkhHO+QqcBhBscHDDSE5elivioy4W883L1f0SB/Xgm5ITHDuHtS
	jgk2A2k55zN3f6HMzTIK++WE6y9/cQIlyDVV4tVErVElCTUu6nnr+aVsUIBsfyvHy2re
	aiIa2SlZeb2iwkJvfXYqCml64vTrVOTZcbwYIBuhQTtM9c/qIhoKyMeDs0jrWyaiUMe7
	nweyTRV6zsTRzfkGkK74a7dwxc0xRalCsWmA20LkMoOdoZo+mg3OmBscF0UhN4XgX3+2
	dcHQ==
X-Gm-Message-State: AJaThX6+dGh8RuKYFyOaZrOV5OGVb27E/3j08rI1bLPzbA9AnrqxiPHh
	g01TltutKB3Me9MCNBpMXpggud1QEpfcLq3bxm9Ang==
X-Google-Smtp-Source: AGs4zMaaP8IUYndP/HWtSjVEtL+L+2bGPSlRIXyEhrV6Da3ljU/o3ngtLd36be+meQf+6X26rF6AlotDud/pik6KpS0=
X-Received: by 10.28.127.197 with SMTP id a188mr7517320wmd.138.1510686601487; 
	Tue, 14 Nov 2017 11:10:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Tue, 14 Nov 2017 11:10:00 -0800 (PST)
In-Reply-To: <1510654305.4049.60.camel@andred.net>
References: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
	<1510668898-21058-2-git-send-email-shashwatx.pandey@intel.com>
	<1510654305.4049.60.camel@andred.net>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Nov 2017 11:10:00 -0800
Message-ID: <CAJ86T=XcvARBBjkiaCmhqEFwZZW0ez-Spx+FY-C+6MjPGaxkOg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Image_types: use ustar format in cpio command
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
X-List-Received-Date: Tue, 14 Nov 2017 19:10:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 2:11 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Tue, 2017-11-14 at 22:14 +0800, Shashwat Pandey wrote:
>> Using ustar format due to ROOTFS size exceeding issue.
>> Ustar supports up to 8GB.
>> Where as newc support up to 4GB.
>>
>> [YOCTO #11674]
>
> Do recent kernels actually support ustar for initramfs? I thought it only
> supported newc? My 4.9 kernel certainly still only mentions newc...

Also note that the sizes being referred to are actually the "file size
limits for individual files" not the total cpio archive size.

  https://www.gnu.org/software/cpio/manual/cpio.html

What's the case where > 4GB files are needed in an initramfs?

