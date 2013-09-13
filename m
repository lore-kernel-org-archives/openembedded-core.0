Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5A76F60FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 18:35:15 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1441017obc.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=idm+tvGURs+qfD6oj20J/j6i+QvnyrUtxKXl4brb6/Y=;
	b=RaVzc+3EooNCijOjTpiEEKEnoOppxIO00I7Uqi9pVbIgJ+WL4tKCCIWOpPV8oJKIQI
	2e9lzIaaZbkfVCR8YRcIHhab5Ut7KL+6GYRg3zurIr5Ke9cohYIyFg4uj+9kAidzalH+
	8l/f8CEDQpld5Bol2SOAlUQW/NTbp/ZaePpuob0nZxB+Fug2EPUIZJW0ZoFgwipi9S0X
	ErZk82TtqIOCAx/QPB1NuEV/rztuHCQMA9V3U1k2M2feUVzwkMFCKPXZ9diRqi6pIA4V
	HK3LEXy9NYKij/29+XZtDyuwHLGypBdzCxO6sJSSW1LdyqUZtGFPugGYk3e4qX1yJ3bS
	n1UA==
MIME-Version: 1.0
X-Received: by 10.60.132.178 with SMTP id ov18mr13297864oeb.39.1379097316683; 
	Fri, 13 Sep 2013 11:35:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 13 Sep 2013 11:35:16 -0700 (PDT)
In-Reply-To: <52335229.6020406@gmail.com>
References: <20130913075635.GA3573@ad.chargestorm.se>
	<CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
	<52335229.6020406@gmail.com>
Date: Fri, 13 Sep 2013 15:35:16 -0300
X-Google-Sender-Auth: tmqksJmCqqrEYKEwIX1s-mDuleQ
Message-ID: <CAP9ODKoyDD+g81iNs76xtnMSjavSEk8o5jd1=MQqp_MM=y5N=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hans Beckerus <hans.beckerus@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 18:35:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 2:58 PM, Hans Beckerus <hans.beckerus@gmail.com> wrote:
> On 2013-09-13 7:32, Otavio Salvador wrote:
>>
>> On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander <anders@chargestorm.se>
>> wrote:
>>>
>>> As I've started to bring our internal distro and machines up to the
>>> lates oe-core, I've got some issues with the u-boot-fw-utils to
>>> u-boot-fw-utils-cross transition.
>>
>> Right.
>>
>>> In my old branch, I used u-boot-fw-utils_2011.06. This used to compile
>>> and package fw_printenv(setenv) just fine.
>>>
>>> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now built
>>> using HOSTCC instead of the cross-compiler. The old recipe used to
>>> include:
>>> EXTRA_OEMAKE = 'HOSTCC="${CC}"'
>>> as u-boot defaults to build everything under tools/ using HOSTC.
>>
>> Yes; this is intended to be used in the host. I can add support for
>> use in target as well (or help you to do it).
>
> Honestly I do not understand this change at all? fw_printenv typically
> *always* executes on the target since it dumps the contents of the U-boot
> environment from a shell. Why would you want to build it for the host? That
> does not make sense. Unless host is the same as your target which I doubt
> could be considered the normal case, or?

It depends on how do you intend to use this. It can be used to mangle
environment during image processing.

I will cook a patch and send for testing, so we get target ones back.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

