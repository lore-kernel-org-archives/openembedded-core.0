Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T3yL4-0000Jo-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 01:58:27 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2012 16:46:21 -0700
Received: by pbcxa7 with SMTP id xa7so542303pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Hzaa6pjW76P7Io0hs4EVQNZRNeXEBha4X0kNFtx+doU=;
	b=O7JaRjdARl6q2L0BBIsmC5tt+/6ZlLnNr2WBINb4qPHka6Ur28lweR9omjuKMzlRS/
	UWGCALL8v91kU05ymSwHKEhjBOTO6boB+N/fDe2lpqI3ar/FLBmb9VmKSNlOMz4kEhrx
	BUYlLTDnZ5XDSYauQX3WBAd5HupzPVGx0hpuZEYlRI8BfdgIG3rHXLw0JPmwOkBwPeTq
	Z2CFKu4LinAQTtGAOHk3h17WomIbhO1d9nszErdyQhRBx0/epen9L/xI+E5L7GCT24hi
	JSzHGeGlmOFgn4pSa+Fw6mevfMb/GQ62Th92XTXB+dSz3Ht6XjLuCb9WX9M9VtVgGvOj
	Wozg==
Received: by 10.68.194.229 with SMTP id hz5mr45385035pbc.86.1345592780879;
	Tue, 21 Aug 2012 16:46:20 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id mr2sm2402143pbb.16.2012.08.21.16.46.19
	(version=SSLv3 cipher=OTHER); Tue, 21 Aug 2012 16:46:20 -0700 (PDT)
Message-ID: <50341DD7.1000405@intel.com>
Date: Tue, 21 Aug 2012 16:46:31 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5033B589.8080502@intel.com> <5033C94D.4080902@intel.com>
In-Reply-To: <5033C94D.4080902@intel.com>
X-Gm-Message-State: ALoCoQlJRQyCq5f6sxEglgbaAhyjAcq5WEvVeNrM7j4VFX57pYjkvpXGEFm7G4UtJLwg53Loj2Ev
Subject: Re: qemu gl changes are broken.
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
X-List-Received-Date: Tue, 21 Aug 2012 23:58:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 10:45 AM, Scott Garman wrote:
> On 08/21/2012 09:21 AM, Scott Garman wrote:
>> Hello,
>>
>> I tried building some images overnight with the latest master, and could
>> not get them to run this morning with qemu - I got an odd error that a
>> VNC server was started instead?
>>
>> Just on a hunch, I reverted the following commits:
>>
>> qemu: Fix broken accidental path move
>> qemu-git: Drop GL passthrough support
>> qemu-0.15: Drop GL passthrough support
>>
>> rebuilt qemu-native, and now qemu works correctly.
>>
>> I have no idea why qemu is trying to fallback on a VNC server, as I did
>> not have one running on my machine. I know we use VNC for our
>> autobuilder sanity tests, but those haven't been integrated into the
>> runqemu scripts as far as I can tell.
>
> This may need further research, I seem to have it working on another
> machine. I'll report back once I've learned more.

Ok, I can no longer reproduce this issue anymore, even on the original 
machine. Figures. :-/

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


