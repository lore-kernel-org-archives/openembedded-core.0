Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UATOl-0005Jb-9I
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:53:45 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so4036894wey.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Pr0pey6y9TRF4OUkPcxbn7UDG4PKdBsGmWr4eZNEb5U=;
	b=NhJu+QBVNrYrS1Z59cbPBzZCXTbFQrHvvrHmnv4iKknjxGjtJPGiC+YtLr0PHUadhP
	XB2dDhpzfYljDuhrF/k+DwyE6V+iZF2S+7XVfGLnYY6kC7lrEEuYGfSzzqQssJX64XVk
	SxY7pB9fVH5h5pTAD3Pl5jHOUsCxyJd/vI7SmRsKofsK7evE1gLcjV+NqTRSq68/HGTy
	/7B/IqgFGaKbSL19WpfOq6Ydiz8PzLaaOv3JYLCrLzzYf+B+1APw8hxhUcj7/nMEid1C
	EgGNBwu6aJOq43vzFJbfAJUDc2RLVAwok9MT5LIRyPYMtvesad389G6vcUVWSBHE1yBP
	LJ2g==
MIME-Version: 1.0
X-Received: by 10.194.5.196 with SMTP id u4mr29707703wju.47.1361918223568;
	Tue, 26 Feb 2013 14:37:03 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Tue, 26 Feb 2013 14:37:03 -0800 (PST)
In-Reply-To: <512D2EA6.7090700@linux.intel.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
	<512D2EA6.7090700@linux.intel.com>
Date: Tue, 26 Feb 2013 17:37:03 -0500
Message-ID: <CAHUNapR+Zgsw59+M0fAYv35BaA5Evc=+N2XJHUwzFn-KgDVYXw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
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
X-List-Received-Date: Tue, 26 Feb 2013 22:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 4:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 02/26/2013 09:53 AM, Trevor Woerner wrote:
>> On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> * Summary:
>>>   [...]now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>>>   to copy the files to the image.
>>
>> For a while this had me confused because I somehow thought you were
>> proposing using the Linux kernel's debugfs to create filesystems (i.e.
>> mount -t debugfs none /sys/kernel/debug).
>
> It is confusing, unfortunately, debugfs is provided by e2fsprogs, not
> something of our making. If you would prefer another name for
> mkdebugfs.sh, that's fine. What would you propose?

mkextXfs.sh ?


