Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 676DB73D13
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 11:55:29 +0000 (UTC)
Received: by ioii196 with SMTP id i196so54532636ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 04:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=nHSSzEy51u28164Ws6aGUOtmxahRNwebiuwwNRySsWY=;
	b=HC7gPwWj06yM4DFzGuSYX+92rQnlhzZ3f+F3eKABRJznONeUJ4J+LM9w3QkB7UwTQm
	pF9BLAY+e8+TJks3CZUVLXu3XxQSqvYgHU4rIwQHxm/sE/nzbEyF1Ggh4J5YHG0zxMe9
	YKintFhpOIzj6TzJOgSKisLyMNjO2sl3K/fHYKwIfJf8oh4voWJVMDUKs4X6E7rCd+J2
	B5ZHCWIq0fhxRQUHb0VXF57DDTNO9mgzMUzMdUm8VYPG6K39z0T4yC1bVazG9LStvoUW
	oDi2cHDwLbK5OSic1WOUbUP8BhoX/lcxnBkUEnDMpX0LU0dJIgtMb9mrW+jYXikuqKMc
	oM1Q==
X-Gm-Message-State: ALoCoQmhxBmfGuZNYPHzsmhq1WAoSnZn+F0TCCj0Rz0L/cmEJTBkWpStZ71jREWtSjtkDLohVvmz
X-Received: by 10.107.169.41 with SMTP id s41mr38235752ioe.127.1441281329343; 
	Thu, 03 Sep 2015 04:55:29 -0700 (PDT)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com.
	[209.85.223.178])
	by smtp.gmail.com with ESMTPSA id qc1sm4382861igb.1.2015.09.03.04.55.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 04:55:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so54538786ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 04:55:28 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr41657931ioi.192.1441281328117; 
	Thu, 03 Sep 2015 04:55:28 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 3 Sep 2015 04:55:28 -0700 (PDT)
In-Reply-To: <1441261794.9573.6.camel@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
	<CAP9ODKpmtON87ZkXHP=gecSznBK_GXFAa=gAkicU2p2WV8qavg@mail.gmail.com>
	<CAP9ODKqiej_Nm_4Rrb1J-BWFwSG8hWzLZ3So_BUSKQ-gKWzCjQ@mail.gmail.com>
	<1441261794.9573.6.camel@intel.com>
Date: Thu, 3 Sep 2015 08:55:28 -0300
Message-ID: <CAP9ODKrK=LnbRoJCsu80bQtEe+AkEW50yqGD5+n+jGRYuVh5fQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] initramfs-framework: support mounting rootfs in modules
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
X-List-Received-Date: Thu, 03 Sep 2015 11:55:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 3:29 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2015-09-02 at 13:24 -0300, Otavio Salvador wrote:
>> On Wed, Sep 2, 2015 at 1:19 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> > If there is any limitation please share the use case so we can
>> > understand the need for it.
>>
>> I found the live module and understood why you want to do this.
>> Instead you could use:
>>
>> - live as 99-live
>> - move finish for 99-rootfs-mount and split as a package
>> - put RCONFLICTS and RPROVIDES initramfs-module-rootfs-mount.
>
> So you are suggesting that either "live" or "finish" do the final step
> of mounting the rootfs and switching to the rootfs? I actually wanted to
> have an initramfs which can be used in the live image *and* on a real
> disk and thus would need both, with the "live" module doing nothing
> unless booting from the live image.
>
> That's because the initramfs would also contain IMA initialization, and
> that is needed in both cases. Maintaining two different initramfs
> versions would be an alternative, but then the user and/or script which
> does the installation must be aware of the difference. It would also
> prevent embedding the initramfs inside the kernel
> (INITRAMFS_IMAGE_BUNDLE).

I see your point and it is a valid one.

However in this case, the finish change needs to be reworked to avoid
too much indenting change for no reason, the finish_enabled function
can be used for this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

