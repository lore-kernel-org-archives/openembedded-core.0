Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEAA773A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:49:13 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f81so69985062iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Nlfh/TzJHx2dc3MRCKmrhcTaz7jiryZmFsmAhkQJ7Yk=;
	b=I3pJ0iDkXDC+ZOU0Bo4bKyW2cWIvw9GRrnLxsM2QrR+e7WBg4knCnp3ZvFexN8P/j1
	GX3ahZMjLiA7y082vfIetqBbsu1SVajH/kitbXqndB0wZi7DVVPlweKwMEtWFDQsDXBj
	rtfK3PTOr6SHdwHTGb5SDrjwCbMSkaxvOyz6s4RSxNyPiWDvH7uXD0ZCgxa15a+FKa0q
	kzYjcSS1/zw4Ws098u9bJp+j677YRQi6LvGaLL0Ty80bdWZGY9bD5dJflcan2Gffo7Wg
	x5ihg1WnL+7ByL/FyODZz9J0Cm0n4TK3bIBw6JqqkKWrGsqzFbGXd2ktGh/Os0nsbywa
	BYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Nlfh/TzJHx2dc3MRCKmrhcTaz7jiryZmFsmAhkQJ7Yk=;
	b=iuDanNwJc84ALZ3xxNH6+HT0w8D/P92UWKhee/5HxTASFXaDY11cFX2wvw9dPdoh1b
	dNhHZYjfU+2mm5XZLTOa0n5pyyUI9yHErpZWYC75P1UkUIRhf3RzkHcqyzGscXQHc2w8
	xfSS252jbJ9su0g+TxXTctW97PO7qHRSNmsLQNEDTFDEZMJ5vpiPKDS37ok9R+fJbm0K
	iAtFlslNHPQ7aAZ37i3ka/a5PUpMoDR6JsyrQlqitYSmoxgOjlUEh3ZDlMdqIQMEoBT6
	EFeRqrY4VA+ThxTDfOXM47ChWboq4Y8Uq2GNESPd01K8RVxL/xFZ6EBfkDzNh7qEw94N
	zM6g==
X-Gm-Message-State: AG10YOS4qRSd//jm2jGeheHJLsjs9u52orWqMQ+Qt0oo8dj440wB47pQXHtVdwcplIA5X4Dl/DgQslVL+pBpgQ==
X-Received: by 10.107.34.79 with SMTP id i76mr6218423ioi.195.1454532553930;
	Wed, 03 Feb 2016 12:49:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 12:48:44 -0800 (PST)
In-Reply-To: <CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
References: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 12:48:44 -0800
Message-ID: <CAMKF1spEjpwvpZ5SsYPgOpSAiAX9D+_OnOhdytS28_J3KC58HA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Wed, 03 Feb 2016 20:49:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 12:37 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 February 2016 at 19:07, Ricardo Neri
> <ricardo.neri-calderon@linux.intel.com> wrote:
>>
>> udev-cache uses find and xargs, which are provided by findutils. It also
>> uses gzip, which is provided by gzip. These utilities need to be present
>> when udev-cache runs. Thus, add them as RDEPENDSs.
>
>
> This is only true when you're not using busybox, which provides find and
> xargs itself.
>
>>
>> +RDEPENDS_${PN} += "gzip findutils"
>
>
> The dependencies should be on the udev-cache package, surely.
>

I was wondering if busbox provides these applets then why pull them in
explicitly like this

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

