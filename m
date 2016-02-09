Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85381731E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 08:05:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g62so1859934wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 00:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ojjzYGiseIlXcA56rSwCEoD1NjQWaWNaFqUE/t8J5N0=;
	b=tbgyx1oGo+sl7GMTer9s6VCJ5h0Hjdcfxo2badjeYqFWsRAmS0KxL3xUcBVkMpSKSF
	b1piO2FUumkyZoVtcVsBIxHl8uMUN35OBJ3K+6ChlSayf13GrqLSX60dP2eOzSeCH5pn
	qJ/b0MF+8wz4TDeyyT+fDaGm+6mIR6uuc5fosK6jN5rssf4cGCoW/zqSfPlXRMQBHXvy
	HF3+/6L45OLUzCef5x06yDCC4YoDAtLYBcyg6eLZYedTj7uv6DRWgoHlfzmh/m3VtYNJ
	umnOZQFApwAa8z8ilX8ayA/jY0MPUM4t9E5pkASNnntgQN7/YP1zL5x0PgxJpiSZkq8y
	ozAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ojjzYGiseIlXcA56rSwCEoD1NjQWaWNaFqUE/t8J5N0=;
	b=aT8Hon2rA2x80XBhrokWOcHX8jxr5jBTesfZ7AX+BQ6Og5C2jqZgKC/gahCUff+rz8
	lRPLACknolWlot89IGXtbbqN8Zuh+c4dS82cJINI34l37GMqvd2GBejc2wBNCjA5EryQ
	qhoQCH+quSyr8gGqSEZ5yH3nD4oOuXyi5z1MRId5qBe4Jp0W3JYsA8eMo/Opnh+ywD3Z
	vvjuEm99DIo+8LKbB9nU5H3pc8/I+hOAP3+5nGZGosLA8OnfOpjae7VR4DvMHS+9zlRH
	QsR0yRl5MmMp7Zos278Rx3/L5MPm8+m0Ea3l7zhLrM9A7BwlYq52+Hi7ecHuSnjDPViJ
	ZWcw==
X-Gm-Message-State: AG10YOSeZJbjFLYpBqGMQSOINp/VL+a97SKMkVwcF0AX5zwVHJSlRC56fqzYXHzwCahljOrroK6rPIHpZwh1Bg==
MIME-Version: 1.0
X-Received: by 10.194.156.199 with SMTP id wg7mr37648672wjb.114.1455005115101; 
	Tue, 09 Feb 2016 00:05:15 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 9 Feb 2016 00:05:15 -0800 (PST)
In-Reply-To: <CAJTo0LaCMqE5kQR5SApPdBw-LYbdyxwtaFK+DpAfhbhU7LFScQ@mail.gmail.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
	<1454963681-18756-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaCMqE5kQR5SApPdBw-LYbdyxwtaFK+DpAfhbhU7LFScQ@mail.gmail.com>
Date: Tue, 9 Feb 2016 00:05:15 -0800
Message-ID: <CAJ86T=X3yr5YNmT+8UM5z2P8HVrWBgrvEo6=ZVqaSBtsFrFzHw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libproxy: replace PACKAGECONFIG equivalent with the real thing
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
X-List-Received-Date: Tue, 09 Feb 2016 08:05:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 2:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 February 2016 at 20:34, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> '' if incompatible_license_contains('GPLv3', 'x', '', d) == 'x' or
>> bb.utils.contains('DISTRO_FEATURES', 'x11', 'x', '', d) == '' else 'gnome' }
>> \
>
> Instead of returning 'x' or '' and then doing string comparisons, why not
> just return True or False and let if/or/else do the right thing?

Just trying to preserve the original logic to make it clearer that no
functionality is being changed.

The logic can be traced back to Paul Eggleton's original version here:

  http://git.openembedded.org/openembedded-core/commit/?id=973351cf2e338f07c11395d494193e9c62857f2d

> Ross

