Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Smt0Z-0005bj-8h
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:50:39 +0200
Received: by eaal1 with SMTP id l1so3345992eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=nPwPTvR1Hs5zJIhCkNGT6w/6ohv+ifq5JPdh88q3wAM=;
	b=BKIyrsxooo3HVS4RXpC4W3c8OhCMOPzxQwUfMkDtHYNWDrrGzGPPt4EKtE1a4/WxLR
	K4XxF+DL3Qp5w2OxASX2+CT2L0/pDSra2ctk9D+jhBrM081Svkj9PTHznm49NgQ7bpEN
	/2JKcY2vj11lmQ4fRl1EyjzPLW1OXvR33UzeAPmRmeCq6uBTi6Av02ac5jggN0xuVacz
	jknUJMMtXQn8taSuYy2LmbmB0pYpPYpm33O0Akge6D8zXg3GOQU1B67x9Sx7HWm4rix+
	AwxMkvGJy8dP1Ln38KBQPywCnqgrosAVFmKNyV+H60O6u7puKYxqO5/vD9vp1pbPuNlD
	Eb5Q==
Received: by 10.14.97.16 with SMTP id s16mr6121293eef.117.1341520774495; Thu,
	05 Jul 2012 13:39:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 13:39:04 -0700 (PDT)
In-Reply-To: <20120705202306.GD3708@jama.jama.net>
References: <cover.1341498745.git.raj.khem@gmail.com>
	<20120705202306.GD3708@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2012 13:39:04 -0700
Message-ID: <CAMKF1sr7c4c3vk3DsJCM-usUD9zvSdgrZKCM0OxKfnQWLPaeZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 20:50:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 5, 2012 at 1:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jul 05, 2012 at 07:35:19AM -0700, Khem Raj wrote:
>> This patch adds eglibc 2.16 recipes. I was able to build world
>> on x86 except perf which was failing with 2.15 as well.
>>
>> I have also build and run core-image-sato on all qemus
>>
>> I did not remove 2.15 to allow some soak in time.
>>
>> The following changes since commit 5beb7176d361d4bfa279bbfab5a17b8fe4fa3b73:
>>
>>   netbase: update to ver. 5.0 (2012-07-05 14:18:19 +0100)
>
> Build and runtime tested on armv4t with bfd (om-gta02), but on armv7a
> (where I have enabled gold) it fails in do_configure already.
>
> *** These critical programs are missing or too old: ld

which package do you see this issue with ?
glibc itself is not buildable with gold. In OE-Core we use gnu ld for
linking eglibc and gold for rest of it.

>
> IIRC I've seen this with older eglibc too, but then it was working
> again..
>
> BTW: gold on armv4t is still unusable right?
>

yes. It still is. I think one option is to try binutils/master, I was
close to fixing it before I ran out of time


