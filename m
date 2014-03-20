Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4532D6B5B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:26:36 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so2028388ykq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6F2nDdvo3d9G9nU1eXs8OCgZKhvPSnDraKR9fZx4L90=;
	b=C8lDYBsvjJOq15t6UGF/qAW/IGFmPXR5Eqyq5/lMk8o0NbSI+2PR/TXTKDDg8K/jQJ
	x+s7YfhCPMw8+AT+Y2uN2/MHfv2XNazgHJxwxCxpdgtzk880OoSwosHfx9INmn1ajCRC
	ESR9P8HMcIlmJ7eqcObJ7zydbvoEzdUsZg9vyNFVYEn383HXEOR2BCFMhSSzHR20gxJR
	dOwV2GaUtas+dGxVwftYiCV2XooUU0RhCERApBl7DvTup8ioaz9rAu4cAFHcJUFxTy8b
	l0AShAXouHczWU2cU0ph9mdoqj179T4ZCTE6ARrV3l5g/RR5YUb7w/c9KJBXqlVjpaZu
	VtQw==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr573531yhb.155.1395318397745;
	Thu, 20 Mar 2014 05:26:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 05:26:37 -0700 (PDT)
In-Reply-To: <CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
Date: Thu, 20 Mar 2014 09:26:37 -0300
X-Google-Sender-Auth: bV0r7aCSpevPfJxeVRI6hqGKUrI
Message-ID: <CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 12:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 9:16 AM, Laszlo Papp <lpapp@kde.org> wrote:
> On Thu, Mar 20, 2014 at 11:59 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Thu, Mar 20, 2014 at 8:34 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>> On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>
>>>> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>>>>
>>>>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>> +PEER=127.0.0.1
>>>>>
>>>>> That doesn't seem like a very useful default.  We also can't use the
>>>>> NTP pool by default, so this should copy the behaviour of the ntpd
>>>>> package in meta-networking and default to no peers, and not start if
>>>>> none are specified.
>>>>
>>>> And the initscript is missing LSB headers.
>>>
>>> Just like the other similar scripts.
>>
>> This does not mean we ought to make the problem worse so add it for
>> new ones. If you are in good mood, send a fix for the others too ;)
>
> I do not think this is a problem. Could you please point out what
> functionality it breaks? Send patches for the others, and I will make
> this cosmetic change for this one, too. Consistency is more important
> than a mess of different styles, especially when it comes to cosmetic
> changes like this.

Koen and I think it is important. So consider this my NACK for the patch as is.

You are free to do whatever you want.

> That said, Ross had a good point - although that is not critical
> either, and since everyone is overriding the default, it could work
> without that - , so I will update that one.

Better.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

