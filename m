Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D8A4D6C8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:44:46 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so872780pdi.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=l96MWO7Zde28qHCodiN4CrhFh6EQp7dRXRVU1wPq//4=;
	b=K2nY+1c1+cQgr2U0icO4yGUu2sWkvwtkwpf/pZOGXfSifvQ25eT1KbtvaC6BMrOvaM
	CiHoeJo7EzjoI1dvezL97+rP/tZtSfZ+HvnsSt+lrLYoXqwQgp0WW6Bihm1LXGtkHduQ
	VAZvlD5LTHQsxketEww7GODlLfw573y/oBPnl2dhpnm5yNgoa0tA1P6HS42LsAhYXz1x
	T9Ukz8lZS+2yow1fbGqfyvRBuU9dvSHOR8t3I1uvtWVXKRdASD0n8zxOjIcqewBxR0xY
	UsXvdunEufvTHrMTIpx2m4SJNmF+4fU+4JR04MCgsb2QqQrPmUDyJwu+Bse/EYfIKqOk
	kw1A==
X-Gm-Message-State: ALoCoQlzVii37uZAcyhuUSG5MggRbxjs2KfDILGYdsT6n6Yq1yM7l6e4MHO8fodLS8zHEMddxvtN
MIME-Version: 1.0
X-Received: by 10.66.250.161 with SMTP id zd1mr24330186pac.136.1395319487489; 
	Thu, 20 Mar 2014 05:44:47 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 05:44:47 -0700 (PDT)
In-Reply-To: <CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
Date: Thu, 20 Mar 2014 12:44:47 +0000
X-Google-Sender-Auth: UjbkR5K6MzPRLPf-48lNjTSe-yU
Message-ID: <CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 20 Mar 2014 12:44:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 12:26 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Mar 20, 2014 at 9:16 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> On Thu, Mar 20, 2014 at 11:59 AM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> On Thu, Mar 20, 2014 at 8:34 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>>> On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>>
>>>>> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>>>>>
>>>>>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>>> +PEER=127.0.0.1
>>>>>>
>>>>>> That doesn't seem like a very useful default.  We also can't use the
>>>>>> NTP pool by default, so this should copy the behaviour of the ntpd
>>>>>> package in meta-networking and default to no peers, and not start if
>>>>>> none are specified.
>>>>>
>>>>> And the initscript is missing LSB headers.
>>>>
>>>> Just like the other similar scripts.
>>>
>>> This does not mean we ought to make the problem worse so add it for
>>> new ones. If you are in good mood, send a fix for the others too ;)
>>
>> I do not think this is a problem. Could you please point out what
>> functionality it breaks? Send patches for the others, and I will make
>> this cosmetic change for this one, too. Consistency is more important
>> than a mess of different styles, especially when it comes to cosmetic
>> changes like this.
>
> Koen and I think it is important. So consider this my NACK for the patch as is.

You are free to NACK without an explanation why it is important, but
do not expect it to weigh much that way, at least in my eyes, based on
that you are not even a maintainer as far as I know.

I also think that it is not constructive to give NACK without
answering the questions, and only telling again "It is important".
Please be more constructive and explain the real issue. That is a
better way of convincing a contributor than telling the person it is
bad what you are doing because it is bad.

There was someone today publishing a blog post how important it is to
become pragmatic to get things done. Currently, cosmetic changes are
just in the way of getting things done. The feature shall be more
important than cosmetic changes. I saw this frightening away
contributors, and features actually not getting into projects.

That being said, if you can explain your reasoning, and I find it
reasonable and worthy, I will update it.

