Return-Path: <max.oss.09@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id BBDD6601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 08:00:42 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id bg3so27962558obb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=x4sH5Jgo1479+vf0nfAQY+YL0yzasYorZJTzfkQ7mHY=;
	b=hgrMwevar98eFRq3lGhN02mDeOhMHbjDFJ+iROmJeyBvwftcHTself8J0IJLHm150i
	bBEPLhKIXES8S4zsgV/6dh3QyxWx4sECXrFWbNz5eNJ1AljUcs0kWZxv02kp0D8vIStj
	Zk3yHY2r7SPAL05iw6IvwLBIuCpgi0MYG90Dr/iQO9AyQbUPimQou8+S+FUzSlfKEHfF
	vsKh4hPBt0fScaoLufR460GDNXBw/UrLNhn7DIKh1HbrPKamRZBjyZwTIqfUMam0qv80
	lLXQxOSiJ0NQ95UTMqHnwGLwlFTu6Qcoh7/ucTk+SW0p1dJYEch5wbtu+6m1n15bYOsh
	egmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=x4sH5Jgo1479+vf0nfAQY+YL0yzasYorZJTzfkQ7mHY=;
	b=mLhQ7lG2T6EuE99yM4/VkWwBsn8l3B5GAY+ZwXgZwdXm6yFAKWWN50MQKk4FHsS2/B
	ng8qdeJURQdmZYf54DbCBXzUPBewiwi29fYcd7HeB1ZV6MykzQPGsFZ8IQHxs8DSzGvq
	QKd3Wr6JuMSGXezkyKBwPs1uivgbKJpY7ev+Hdz1SpXfDxXU2Hl2u/+DUBjdtq5fJNlB
	OoPa2jKQ8PvcUocb3QGl0JCUFk1icX1qAkh6BX8oUNwtnDZsZ9Bgmr73EvMXPytRCbJz
	JAluWfLuJnpi79j0p3x32Om1PkdzIgOhzQ3cRsBvCW6F71+u+GDjOl/sHfANfbd/gXO6
	BLrw==
X-Gm-Message-State: AD7BkJIYIJ4POQAHoVNpoBN5X67gqZhdhzMLUsiBy2Db2IXnL1PkwpLP0Udl37QRAbj/cfZSCV3XwUYgYrXg3A==
MIME-Version: 1.0
X-Received: by 10.60.129.166 with SMTP id nx6mr3456335oeb.13.1459756843027;
	Mon, 04 Apr 2016 01:00:43 -0700 (PDT)
Received: by 10.157.5.203 with HTTP; Mon, 4 Apr 2016 01:00:42 -0700 (PDT)
In-Reply-To: <CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
Date: Mon, 4 Apr 2016 10:00:42 +0200
Message-ID: <CAEHkU3XvFjr8dCV48E7zvtWPDwJ1Vht=Q02MdM9C+KM0-N=s9g@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 08:00:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas

I guess Richard refers to this one:
http://cgit.openembedded.org/openembedded-core/commit/meta/classes/package.=
bbclass?h=3Dmaster-next&id=3Decb56a6ae0c870af680da03db9d39703b525fc98
Max

2016-04-04 9:56 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>:
> On Mon, Apr 4, 2016 at 4:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>> I added some text to bugzilla. The gist is: In poky the sources are
>>>> not deployed.
>>>
>>> I don't understand that. If you mean playing sources in the -dbg
>>> packages, poky does that too. Is there some specific configuration
>>> Angstrom makes which triggers this?
>>>
>>> There was a bug in master recently which broke source file deployment
>>> into -dbg packages but that was a bug everywhere which was then fixed
>>> when we realised.
>>
>> Max, somewhere in thread you indicated angstrom 2015.12 release which
>> would be actually using jethro
>> and if it has been recently fixed in master than it would explain why
>> it worked on poky/master and not on angstrom
>> may be this fix should be cherry-picked to jethro.
> I checked Angstrom master but did not find matching commit. Which
> commit are you referring to?
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

