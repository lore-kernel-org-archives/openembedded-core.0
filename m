Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBE9F77294;
	Thu,  4 Feb 2016 10:09:05 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 9so87662400iom.1;
	Thu, 04 Feb 2016 02:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5ygXi19HUAt1RYuoB3e8Z+Nw4rf9+IzMofDbR+kOzu0=;
	b=ldIkylKt60gQpmZdR0TW+1uWMaHXh2iRQFfaAIe22jbQSkWvNs8i9KcljtzbVf5nZf
	EOboy/Wy/ccnnnfMU1LYZAyGeH9Qcs35lVUpjtDEdwmrdnbtjs7n+yAOC2zvu6f85i6J
	nTLYNhMqU1vsLxjylWWsqaxS5oW8cdszSfYSQogYLrTlAPmvjve6gB/T1/TIxqMUzCxo
	7H9DZ1JcVRQUsmeopo+kQpKIAuhJpT3+zQSQbVEC4w0dXhve9XnYmAikxv6zJbFafYOL
	bXdzZJ39wZHwPS8jcLb4jeeYHyH5BHa2MvHfcEnxljkcZSRvsOfIjwDO8qZ9Vtd3Lcsi
	bVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=5ygXi19HUAt1RYuoB3e8Z+Nw4rf9+IzMofDbR+kOzu0=;
	b=dZHjhCBfrYUmdm0lXaj3KzPsbW18m+YB8IBFnqagVcNS96QFz2u5FC9HDMFOm+8ZEI
	e6jIfKnlZp9Suceb/A8GS6J1zfBK6zUe2D1RzkusgRweYy9/XRjQt+DCpKITFDrLtOin
	dvSbljuuhcexLDNq8E0J5Rk3L4Y8TL2OQUkq2n+tHU5L7BHZ53onvo2NRY8ovXVE8xLK
	JiwRY0q889VtaYxiCr78Daw0iWZjFsMBb8+Ia6xb1GXmePZ8T6zjvMnwGJ/plduGovG2
	/kKQQb2gDXGr2PrSjFsqYHQPx5IXYfxftzt6XSXbBCGy6rwwEDqnmCi/TSa5z/QwroJi
	31Sg==
X-Gm-Message-State: AG10YOT1qLMDa2yWsostYjYVkK9aX3iN4fmyfGkbQghrp7LWGTiJ6JApzGtrudenoJm/a04yf1zUp/9Amhei+A==
MIME-Version: 1.0
X-Received: by 10.107.3.220 with SMTP id e89mr7667896ioi.99.1454580545930;
	Thu, 04 Feb 2016 02:09:05 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 4 Feb 2016 02:09:05 -0800 (PST)
In-Reply-To: <CALbNGRSZ83cE_hOSPNy5J_Jjc5KFtc10uEC7MoF0VbZHUPHUfg@mail.gmail.com>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
	<CALbNGRSZ83cE_hOSPNy5J_Jjc5KFtc10uEC7MoF0VbZHUPHUfg@mail.gmail.com>
Date: Thu, 4 Feb 2016 11:09:05 +0100
Message-ID: <CALbNGRTjS3Feb9su0DPquW6rMDQcZRd6XPPkRcomgKeoL7z_ow@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Thu, 04 Feb 2016 10:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2016 at 5:01 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 3, 2016 at 3:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2016-02-03 at 12:49 +0100, Andreas M=C3=BCller wrote:
>>> Hi,
>>>
>>> while testing libreoffice language packets I found that language
>>> settings for GTK based apps are broken. Interestingly QT based
>>> applications (tested with qtcreator and lxqt) and libreoffice are
>>> working fine.
>>>
>>> I did some research and hope for some expert with helping hints.
>>> Details are:
>>>
>>> * I am testing with jethro environment
>>
>> I did wonder about http://git.yoctoproject.org/cgit.cgi/poky/commit/?id
>> =3D3b5288f0a28205289063424afc474675cbaa05b8
>>
>> or possibly:
>>
>> https://github.com/rehsack/poky/commit/46ac36953e2e76ba716c7ba42ddfe41c
>> 9a19a11d
>>
>> but I haven't looked into this much and don't have experience in this
>> area.
> Thanks and yes - I have seen these too but they are not in jethro - if
> I am not mistaken.
>
FWIW: I found an image where the language selection worked. This was based =
on

commit 4e0fb630d3bb0250ece6e2071ae49b2601ae3e57
Author:     Armin Kuster <akuster808@gmail.com>
AuthorDate: Tue Aug 11 11:11:04 2015 +0530
Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
CommitDate: Fri Aug 14 08:30:21 2015 +0100

    tzdata: update to 2015f

    Changes affecting future time stamps

    North Korea switches to +0830 on 2015-08-15.  (Thanks to Steffen Thorse=
n.)
    The abbreviation remains "KST".  (Thanks to Robert Elz.)

    Uruguay no longer observes DST.  (Thanks to Steffen Thorsen
    and Pablo Camargo.)

    Changes affecting past and future time stamps

    Moldova starts and ends DST at 00:00 UTC, not at 01:00 UTC.
    (Thanks to Roman Tudos.)

    Signed-off-by: Armin Kuster <akuster808@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

which was before glibc update 2.21 -> 2.22

Andreas

