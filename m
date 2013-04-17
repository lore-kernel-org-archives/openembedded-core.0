Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USXLV-0003da-Ta
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 20:44:44 +0200
Received: by mail-ea0-f176.google.com with SMTP id h14so236819eak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=S987yKfJu1a6ZZ8JSUHmBSN2w8sL6nZ5hzm+4tHgIzM=;
	b=HhW+aG0PLQd6AtfmBWnMkXu4a3SJNnNF3uogGHiw7HSBUtbg+aTRk8sZ76924uKssw
	uexZMZ33zjTW16U4Ezr4GhzKPqQhfJoCiBizkQo1KvqWe06nOHAXMpwti352zb3VUQKb
	qnwQ4uIXeOkrcVMmLANxGfKNQiEmJEXBpGuAwIW6SQ7jYUprO4sjdjDlmfuRbPlaS6Vg
	jwhE5cN13NOyJqWXRR4qLw5v7GEHVp0ZRlhdOtvZ+BFcRhsZhYQw6XrRUoY11nHBhXFP
	SLO/hEgNBSk+aRFdFstpQ5oIYgAiG5MoafdOAaSdnnwfHgcgxOhPZtFwXSBiKflo3eMo
	6ovw==
X-Received: by 10.15.48.4 with SMTP id g4mr20833600eew.28.1366223229818;
	Wed, 17 Apr 2013 11:27:09 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id x42sm10763342eee.0.2013.04.17.11.27.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 11:27:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3344072.3yQMCnL6TJ@helios>
Date: Wed, 17 Apr 2013 20:27:07 +0200
Message-Id: <B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnb/gikcNbcG4MphEUXPTk8c1ewrosVkILbKqDLYwGc9mqawUBqAvPgIHqSdCBhGuN7c7pz
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 18:44:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2013, om 11:37 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 17 April 2013 11:03:30 Andreas M=FCller wrote:
>> On Wed, Apr 17, 2013 at 10:28 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Tuesday 16 April 2013 23:42:08 Khem Raj wrote:
>>>> On Apr 16, 2013, at 11:28 PM, Andreas M=FCller
>>>> <schnitzeltony@googlemail.com>
>>>>=20
>>>> wrote:
>>>>> sorry again me with another issue. I updated all layers from =
master
>>>>> few hours ago and built from scratch. On first boot with systemd
>>>>> postinst never finishes. I see only:
>>>>>=20
>>>>> [**  } A start job is running for Run pending postinsts
>>>>>=20
>>>>> and ** are moving around.
>>>>>=20
>>>>> Does anybody else face this one?
>>>>=20
>>>> ran into same issue. I disabled post installs to run on boot
>>>=20
>>> Could you guys please try to debug this and find out what is hanging =
here,
>>> because with core-image-minimal and systemd I don't see this =
problem, the
>>> run- postinsts script finishes as expected.
>>=20
>> are you using opkg as I do?
>=20
> I wasn't, however I was under the impression Khem was also using rpm. =
Now I am=20
> using opkg, and what I can see is that run-postinsts does take some =
time on=20
> boot but it does appear to eventually finish and I don't get any error=20=

> indicating it failed; systemctl doesn't appear to list run-postinsts =
(although=20
> I don't know whether it should or not.)

I get a similar result here, but I have to rerun all postinsts with =
gconftool to make the packages actually work. I'll update OE-core =
tomorrow and try to get some more debug info. Systemctl says postinsts =
ran for 3 and a half minutes, a big improvement over the 60+ minutes for =
the same image built against 1.3.


regards,

Koen=


