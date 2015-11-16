Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8A03D6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:37:36 +0000 (UTC)
Received: by ioc74 with SMTP id 74so165110476ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=RgMH/o+gZIucmwPEZmXz3gq9vBWzkq3I3xQN4Pr3FZw=;
	b=wbQm+BgI/Szm6WuY+2IQ4huqzq6jd7wg4iqfqYBjsl0AAawQW6zLm0H3rfCZ/1ImNw
	TZ1Oa1lbeXFByxcfZAkGlbXRVD2LkPKqnw9/5sk4EtzfptILQ6++hG5OxJUSoM4onW8X
	zGvJYDiUFpQv22/RD9dxN0Hb2gRp4NYyWSFnlzaxpWTCX4WUoQe3kAPkZzRPMIWn11Cj
	vWwoNg4pF6Yxaqg/wZsTih/UaUtX49YZUwNeOdL5KT+/2EKFT1ct/GY3C04Bi/nzBhyO
	jIyk9+w+QjU2kZTmVnDd83n6G5Stwl9T3CBIxWQJjEyRce2uF1hHFPB9YcrJ2d9MTfed
	lB1A==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr37343936ioi.133.1447691856896; 
	Mon, 16 Nov 2015 08:37:36 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 16 Nov 2015 08:37:36 -0800 (PST)
In-Reply-To: <CABcZANknN7g5b5k+tBh=S9u8uGZPCDgR58be3PK4R8_A7n5DkQ@mail.gmail.com>
References: <CALbNGRQVDT0mdYJUrhP5A-Tkzoo1pE-L=ApsidqJXsHyenNz1w@mail.gmail.com>
	<CABcZANknN7g5b5k+tBh=S9u8uGZPCDgR58be3PK4R8_A7n5DkQ@mail.gmail.com>
Date: Mon, 16 Nov 2015 17:37:36 +0100
Message-ID: <CALbNGRRov2ec=yj52yHkJ=QiYaWNEtefvJ0fQFg0NnDPVquMXQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: hostname issues
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
X-List-Received-Date: Mon, 16 Nov 2015 16:37:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2015 at 4:57 PM, Christopher Larson <clarson@kergoth.com> w=
rote:
> On Mon, Nov 16, 2015 at 7:14 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>
>> for xfce-session we have some very bad workaround entering machine
>> name to /etc/hosts [1]
>>
>> I looked into this and found (let's assume ${MACHINE}=3D'foomachine'):
>>
>> * basefiles: By default /etc/hostname contains 'foomachine'
>> * netbase: /etc/hosts contains '127.0.0.1    localhost.localdomain
>>    localhost'
>>
>> Shouldn't this be
>>
>> /etc/hosts: '127.0.0.1    foomachine        localhost'
>> or
>> /etc/hostname: 'localhost.localdomain'
>>
>> To test do
>>
>> 'ping foomachine'
>> or
>> hostname -f
>>
>> What do experts say?
>>
>> [1]
>> https://github.com/openembedded/meta-openembedded/blob/master/meta-xfce/=
recipes-xfce/xfce4-session/machine-host.bb
>
>
> I'd suggest just installing nss-myhostname for sysvinit, and for systemd,
> systemd already includes the myhostname nss plugin, so it just needs
> enabling in nsswitch.conf (I submitted a patch recently to make it do tha=
t
> by default).
Thanks a lot - that looks promising. Will give the systemd nss path a
test with your patch.

Andreas

