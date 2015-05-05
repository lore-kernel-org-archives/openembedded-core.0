Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8F060557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:40:22 +0000 (UTC)
Received: by wiun10 with SMTP id n10so155687165wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7EHYcJw9mzXnM+1XFbEfWSB7xbzc26iyHAvE+cARF9s=;
	b=kFl/IWKPX53n+PgRwrzYW3UbskT9u3/dBB/lBAkFAWKEt6cEiJynR0LQar9QyYzOIG
	qzUsBrKFm8hm4lfPxqDx9WOJcXIrqbe61MF0PKhVemD+bxELXDdYZ8eOJNSzKe7XTv12
	RcYT4swRHPy+IKvzfmkZE/GOAHSlPUZgB1nOhyNsx3RBHDG3Z4jNun/GL6yO8a61daDZ
	SecHMwpUeZMWpG2J1Kv9g/zo42TEpKbT+sefxR/U02Y9Ze3PB3JqRCcT2Sw7ARaN3NgU
	6q6pHRO03W4eTK/8M6YHK1dB4PpJ+kvaMHAOb09cDB8QSwMt7HerDAZs4lemp2jZciud
	8Srw==
X-Received: by 10.180.11.236 with SMTP id t12mr6115476wib.19.1430847623612;
	Tue, 05 May 2015 10:40:23 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Tue, 5 May 2015 10:39:43 -0700 (PDT)
In-Reply-To: <CAGXeWg=6c28bYgZsOVe0E18AwD6Q1AECZopu9T4EEQuVRbU0ng@mail.gmail.com>
References: <1429720746-20096-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0LZkVGZTVBueVpwFaTvmiK_3vsXRB45abKSs0--fbVWzZw@mail.gmail.com>
	<CAGXeWg=6c28bYgZsOVe0E18AwD6Q1AECZopu9T4EEQuVRbU0ng@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Tue, 5 May 2015 19:39:43 +0200
X-Google-Sender-Auth: qUUNjAA2oVAR5KZ8nH7W0HrccHY
Message-ID: <CAGXeWgk3Ljr7ZAuX9HsR5RFKHpqv0Gbg0bvGOf5z4nmEdpQA5A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: tprrt <tprrt@tupi.fr>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-systemctl-native: fix checksum error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 17:40:23 -0000
Content-Type: text/plain; charset=UTF-8

Thanks you Ross, that was it the problem.

On Tue, May 5, 2015 at 7:10 PM, Thomas PERROT <thomas.perrot@tupi.fr> wrote:
> Hi,
>
> Yes, I used combo-layer to create combined repository.
> -----------------------------------------------------------------------------------------
> http://fr.linkedin.com/pub/thomas-perrot/37/436/876
> https://plus.google.com/u/0/111501193434241021399
> https://github.com/tprrt
>
>
> On Fri, May 1, 2015 at 10:41 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 22 April 2015 at 17:39, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>>>
>>> ERROR: systemd-systemctl-native: md5 data is not matching for
>>> file:///home/tprrt/dev/oe-build-easy/combination/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690
>>> ERROR: systemd-systemctl-native: The new md5 checksum is
>>> 751419260aa954499f7abaabaa882bbe
>>
>>
>> The LICENSE in oe-core definitely has the md5sum 4d92[...].  Are you using a
>> tool to create a combined repository that is overriding the LICENSE file?
>>
>> Ross

