Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 360FA770A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:57:33 +0000 (UTC)
Received: by iofh134 with SMTP id h134so96619466iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 11:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Ew/Fd+8qh2X7hI0wXN775qw1rtCWK4WSB02Yxx3PzEA=;
	b=AM3DK3jhLYc74/6h2J//ljR1ykVfIgZE2C1AQ4/e+Tax5NWZ+YXl6yFHFiKcEI71WR
	me8sHz+hHtt5X7oIGqYVQlBF5uPQTqTOu6IhUa2qjhUKDeqj+gPFryQ+RUE0qKPpRRA/
	IBrCvBOCHHAYvukRdp4pVmYDfuqMshncZpec1qCZ6M05XqdMijWJR3C9X0EZ7hsVQo7o
	bXhzYymutms1rzdSTm4nwZ+hdwIiDSyC7jCW/YJ7y/OE3nHO2qNdNiHxf+2MjYfOfhwU
	ymb3FYHTMMS9Mi+NfmuWBLf99q6E4PZu9p+DsYbrMaM+18mMMUG25T+cFRPNx01PxOW6
	dOaw==
X-Gm-Message-State: ALoCoQnlDPpWXbWrhQj2WBPP0f/3QVUSRDV1YebD4hwReiMTpAgVVPuNhp/sfvtAR9B6k28wjW4J
X-Received: by 10.107.12.146 with SMTP id 18mr11975625iom.78.1443725853880;
	Thu, 01 Oct 2015 11:57:33 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170])
	by smtp.gmail.com with ESMTPSA id 31sm3288594iom.35.2015.10.01.11.57.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 11:57:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so1532093igx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 11:57:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.124.2 with SMTP id me2mr483809igb.46.1443725852220; Thu,
	01 Oct 2015 11:57:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 1 Oct 2015 11:57:32 -0700 (PDT)
In-Reply-To: <CAJ86T=VrarVcJ=EUup0k+=mXh=YoDLP2TyDxmZU9SYEHyc8MkQ@mail.gmail.com>
References: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
	<71039CBC-0B0A-43AF-8C7D-34D73FCFE32C@gmail.com>
	<CAJ86T=VrarVcJ=EUup0k+=mXh=YoDLP2TyDxmZU9SYEHyc8MkQ@mail.gmail.com>
Date: Thu, 1 Oct 2015 15:57:32 -0300
Message-ID: <CAP9ODKosZgR-_-UNC2kE_Y9jKpg-=Du1=Yu82-5TYP8PzrvWig@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Sorting rootfs manifest with .ipk packaging
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
X-List-Received-Date: Thu, 01 Oct 2015 18:57:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 3:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Sep 30, 2015 at 5:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Sep 30, 2015, at 3:03 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> I'd like the rootfs manifest to be sorted when using .ipk packaging.
>>> Would a patch to sort the result of OpkgPkgsList().list be acceptable?
>>> Or would the sorting be better done elsewhere?
>>
>> its not clear what kind of sorting are you looking for. It could be a good thing in general if its
>> configurable and you can explain the value add of doing it.
>
> Aim is to make the manifest for each rootfs a little more human
> readable by sorting the list of installed packages alphabetically.
>
> Currently, when ipk packaging is used, the order of packages in the
> manifest matches the order in /var/lib/opkg/status, which appears to
> be "random".
>
> It looks like RpmPkgsList().list does always sort it's results before
> returning, so adding a sort to OpkgPkgsList().list would make it
> consistent with the RPM equivalent.

Consistency is always good. So please prepare a patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

