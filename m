Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5187199E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 23:44:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so17369904pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 15:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aexoxpZD8LYexY5KOoWp6/WG/erj0O+a2JnafeqqBoI=;
	b=KZMhCtBByA1DkbdWudb+M+yMIPKWeKair0/wuiMQ521elROki2py8ZQNWRJkf2OTB2
	xa8bXU7yqSDK57sqlTzg1tpoi+9LxcRIQPLTM84G1zhqUQG17kpQk+u8kpyKHeX4SdcC
	CEkBLAgxzTUGidJwD7iICttxxEHRh2FBIg2iOWpfDRqEJYrgc8W/QBLmc1/UKR/+OouA
	5o0rry9dXnrdJ7iVFy8Wj+ttiI0jfCr2Kvt3WAjOfgJ7FlVQ3H0rCmJPZnchLUBMi8kh
	W0vWwQHo6BpmHVpZBN/OXlBpaeLn0v5YnfC4NPfwnRS+qftpiqiNy6u+mN/m+sW/t4/Q
	gfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=aexoxpZD8LYexY5KOoWp6/WG/erj0O+a2JnafeqqBoI=;
	b=Ewr4YyeoED+M/9GRTi5kwEkurGaWgf8kV3VRmKLleZ0wtZjfsqf9/Z/dUi3hQ8zexP
	ztN0l/geVHGkf+zrEPm0EpyArZ2L4fjrykJcHzitPDyd3pglrQd9wR74zq8C0Gp5SA94
	fj7Uf09OIOqu8DqLQUtlUNDYwblPanPJUHdgDYkYiuN7yawU0UdPKuqKA5586sfUzmf7
	ZM2qWaOPonbc2wjkeyHgRaSeTNBMLOVPWKnd0OxnKN8bZFIeo5Yg+QZqzop+Fh+kcfIf
	K0TtKmbhZesN701B9/UjTLJHabA6qkw+vgB77wPRYtljSzllWlgj8S/RyB5HDanZEuvs
	vPjA==
X-Gm-Message-State: ABUngvfI28XcHts1I126dFER02rBWK5p2IRReoXrzfdoqpzoQQQGACvXl30x4IqRAkGIjw==
X-Received: by 10.99.130.198 with SMTP id w189mr2285562pgd.172.1478562253308; 
	Mon, 07 Nov 2016 15:44:13 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:dd13:b690:f36a:6733])
	by smtp.gmail.com with ESMTPSA id
	d197sm43051681pfd.38.2016.11.07.15.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 15:44:12 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
	<CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
	<20161107230047.GA7754@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <32b3605d-9c79-d1be-c6cc-80309cad7a1a@gmail.com>
Date: Mon, 7 Nov 2016 15:44:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161107230047.GA7754@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Mon, 07 Nov 2016 23:44:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/7/16 3:00 PM, Ed Bartosh wrote:
> On Thu, Nov 03, 2016 at 02:42:39PM -0700, Khem Raj wrote:
>>
>>> On Oct 31, 2016, at 3:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>>>
>>> mkefidisk.sh will soon be deprecated in favor of .wic images.
>>>
>>> Added deprecation warning to the script to inform users that
>>> this script will soon be removed from the codebase.
>>>
>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>> ---
>>> scripts/contrib/mkefidisk.sh | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
>>> index d8db3c0..a175895 100755
>>> --- a/scripts/contrib/mkefidisk.sh
>>> +++ b/scripts/contrib/mkefidisk.sh
>>> @@ -20,6 +20,11 @@
>>>
>>> LANG=C
>>>
>>> +echo
>>> +echo "WARNING: This script is deprecated and will be removed soon."
>>> +echo "Please consider using wic EFI images instead."
>>> +echo
>>> +
>>
>> is .wic image dd’able directly ?
> Yes, they are.
> 
>> We should also document, the wic steps in wiki pages e.g. http://wiki.minnowboard.org/Yocto_Project
> It's already documented in README.hardware: https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware
> 
> And in Yocto manual:
> http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html#building-an-image-for-hardware

Thanks, now can you also nudge the minnowboard.org to do the same ?

> 
> --
> Regards,
> Ed
> 

