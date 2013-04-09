Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPbjE-0001Ke-5H
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:49:04 +0200
Received: by mail-oa0-f47.google.com with SMTP id o17so7549272oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=qhylnZaJZcfneQ8lC+r9ehfFsrcccBu/r3zWDqp4Rrg=;
	b=dB0gkKdEAENm2zAmepvKZecnNRooX23OdWOROkCLl5I/YcxyGUvVOl7X6xYxOBeUH3
	QVyuRoIfAwEvNdeUZ49c/4piBDVgKcgSjrVWN1iRrlBT8AmQriDE0BOxSxPQmIK8I0R5
	xCdcM7uT1RTZuPJ7Ha8kmalfOXGDLUjzlHAk4tCfj7FSnBmwVot65G30BlZcuLSPDguR
	UueW6JGAk1yoAfZftxm/+KzeTsRz0KZBtFdUAUmFMfR8juYPAbkEEg8n9LLr3l3hYGNz
	/G/qD2/j9fX+uTeZQTA8Xn6AbkuONOpNsxd+6W6FdnXfaNb86v1+eDqypijUqjOxDyAX
	RVqw==
MIME-Version: 1.0
X-Received: by 10.60.93.7 with SMTP id cq7mr19045964oeb.40.1365525103379; Tue,
	09 Apr 2013 09:31:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 09:31:43 -0700 (PDT)
In-Reply-To: <51643879.30605@windriver.com>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
	<3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
	<BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
	<1365520076.12407.88.camel@ted> <51643879.30605@windriver.com>
Date: Tue, 9 Apr 2013 13:31:43 -0300
X-Google-Sender-Auth: BEr9_oEFkokwRC6dWMmigWhUYCM
Message-ID: <CAP9ODKqqa7Vy_qaEap6+OD+8WfTjdeTqLJM5z=S2WctiJpyGTQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 16:49:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 12:49 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 4/9/13 10:07 AM, Richard Purdie wrote:
>>
>> On Tue, 2013-04-09 at 16:44 +0200, Koen Kooi wrote:
>>>
>>> Op 9 apr. 2013, om 16:41 heeft Koen Kooi <koen@dominion.thruhere.net> het
>>> volgende geschreven:
>>>
>>>>
>>>> Op 9 apr. 2013, om 16:36 heeft Otavio Salvador <otavio@ossystems.com.br>
>>>> het volgende geschreven:
>>>>
>>>>> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>>>>>>>
>>>>>>> Along with v182 upgrade udevd was moved to ${base_libdir}
>>>>>>> making scripts like init-live.sh to fail in finding udevd
>>>>>>>
>>>>>>> Fixes [Yocto #4046]
>>>>>>>
>>>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>>>> ---
>>>>>>> meta/recipes-core/udev/udev.inc    |    3 ++-
>>>>>>> meta/recipes-core/udev/udev_182.bb |    2 +-
>>>>>>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>>
>>>>>> We needed a decision on this. I've rewritten the commit message and
>>>>>> merged it. Most of the feedback was about the commit message, not the
>>>>>> patch itself. There were also no better proposals for how we could
>>>>>> actually fix the bugs we were seeing.
>>>>>
>>>>>
>>>>> If I read the thread right, it had two NACK's. So it wasn't a cosmetic
>>>>> commit log issue.
>>>>
>>>>
>>>> 4 replies to the patch:
>>>>
>>>> 1) me asking about the commit log
>>>> 2) me NACK'ing the patch
>>
>>
>> Without any constructive way of fixing the issues. As I've said,
>> "fixing" the other scripts does not work. Nobody has proposed any
>> reasonable realistic way of unbreaking the multilib support which worked
>> prior to the udev upgrade. Nobody has actually taken the time to even
>> understand what is breaking as far as I can tell.
>
>
> Let me task a whack at this.  If the binary belongs in /usr/lib/udevd/ (or
> /lib/udevd/) then that tells me it's being treated as a libexecdir and not a
> "libdir".  So the 64-bit versions of udev should NOT be installing into
> /usr/lib64/...  (nor /usr/lib32/...)
>
> If that is the case, and all multilibs end up in /usr/lib/udevd (or
> /lib/udevd) then the multilib system should continue to work as expected.
>
> (Note, prefer /lib/udevd myself... but that is a separate issue.)
>
> If this sounds reasonable, I can try to make the changes and test the
> multilib config.  But I am far from a systemd/udev expert!

This was my proposed fix when Ross asked me about it. I also did
comment on this in the bug and it seemed ignored.

Another thing, systemd's udevd will be named differently, as:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/initrdscripts?id=1b99640481882d23dc3ded41d9f2aef906f77e67

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


