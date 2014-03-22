Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id C79E96FA49
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 14:03:00 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so3558908pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 07:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=osRm6Siwg+1HIY+q5J59jAgUUH/kwZVOiPlq2dscD2U=;
	b=CzGzvIoML3Ap8lxfzEtYIwqjr/j1tXJtM0d8/qB9+eDPp6rNgsNc/L7TaYOrtefOAU
	c1GaEIeRFFaHpgUuTHXcBJ/KKYLSFdblo+LAPU+yVQfQPX+ZYJ56MTe2EERurwMr8IQK
	xuaZ5lksw+NXTAEfVLPk1O/k1dMEbrS19v+pZMOD/QvbC0KTFforW0eqbl9Ht37YY9pu
	FtWMHYlY8L0jnV3ZtAMvb/mmVmONNXhkIQwxWFGs9S16xYp2QwyfiNu/mCN6SSUNskaB
	0yIpYu7Z+OfFOOiGwRTlJXeyVMkPO3Q6nRAP1uXmQl4UBv/XJIiomPqFIRCWAh8lM5Ze
	xULA==
X-Gm-Message-State: ALoCoQldDS1682JhkJJZOWrpp0cgTmqi4d7sr68/pcX0ozsacQimYhTQOQrCISyZQ1xddoDh0mjE
MIME-Version: 1.0
X-Received: by 10.66.139.100 with SMTP id qx4mr38515653pab.141.1395496982058; 
	Sat, 22 Mar 2014 07:03:02 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Sat, 22 Mar 2014 07:03:01 -0700 (PDT)
In-Reply-To: <20140321143939.GI3726@jama>
References: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
	<20140321143939.GI3726@jama>
Date: Sat, 22 Mar 2014 14:03:01 +0000
X-Google-Sender-Auth: yAAcIFstCxiD7CHLZNnJIdIRz5c
Message-ID: <CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Sat, 22 Mar 2014 14:03:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 21, 2014 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 21, 2014 at 01:59:15PM +0000, Laszlo Papp wrote:
>> On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
>> >> This init script is adding support for sysv and no more. This is also
>> >> indicated in the first line of the commit message. I am sorry, but I
>> >> will not test it systemd and with other systems
>> >
>> > You're not being asked to test with systemd.  You're being asked to
>> > add LSB-standard sysvinit-specific headers to a sysvinit script.
>>
>> In my understanding, people were referring to two issues:
>>
>> 1) not working with systemd and what not compat modes. This is not
>> something I will test any soon.
>
> Other people already know it's causing the issues without LSB headers,
> so if you just add them, you don't need to test it with systemd, other
> people who care about systemd will do that for you or at least be OK
> with adding this script, because it will have LSB headers (so it should
> work fine in systemd world).

If someone is really interested in systemd, et al, unlike me at this
point, I guess it is not a big deal to get an LSB header from someone
to get it integrated into my change?

If no one cares about that, then why bother? So, if someone sends this
to me I will integrate it, otherwise there is no point since that
means no one cares.

But then again, this should not still block the change as it can be
added incrementally. I am not sure if it is a good idea to block a
feature because it does not provide another feature, too.

