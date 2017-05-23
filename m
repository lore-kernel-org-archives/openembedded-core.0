Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A072977E7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 17:56:21 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 7so34035742wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T6WBnSZpQpTz+bxXbi5Z/x/WA1sCohNKZRDCzMfv1xk=;
	b=Wwm3N5ee83rtc6u36BNsyhZ3L/aBXFBaJzwk7YnYRt3dENIIn2/x5EFcpfG4Z1XJC9
	Q/b/XTBVL75xT770KCAfOSPoAIaU07MhHVAZYqqGm4EfrAfHmvkH0lfSNjqGxV0LwPYW
	QGMaEpUVQsgt/ggYO4YLa6UPAKIa05sEPpE1Ja/6uBBJvOgwXO51v3xk33lSvEW6yCIw
	vy+fIEhFzW7VYG2guvr4grbxMLcCyToz85xyKp9wkQNsAlOFJ17hfWU7OCpg1V6C+ixE
	fqyaJNYkAXhngyfbI8r+284mXWU6y9cvLP00V7mXDqajZA+KR3434UWYFlUl0M6NZClu
	aIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T6WBnSZpQpTz+bxXbi5Z/x/WA1sCohNKZRDCzMfv1xk=;
	b=Y3xM0P0eLflpfsVYFxVaXUidJvnNCLZvywXosrUL8Sc3TfBdcPDoKYETLwHcldDmM+
	yRxZBLi4Nvp+EYGNxErXhJKK8iCAY9KwAFHQAU4OXzL49b0w0RSA4uAC3LSqxrnaO1CY
	uMm91g/kNuxfypOjJKeTMZInq5PVryph4lLoioktHkr0i/TSIsQNSICR8z0nn8diILF7
	Omr7zxb0GIgUzmnp87rI9dX4lt/C7tZK5jNHcyJtbl4glZ/36LDPT9Lg0t5jmyZ+N7VY
	YARUBu3VDefLulul2W68ZB4yA6P0ulI8bMtqkms56eYtmUQ0/ho6Q0NukXrRg+pSF/BN
	tAqA==
X-Gm-Message-State: AODbwcCEebaItR3Yo+xlgF18ForMMp3JLHDwIZsq+6ixbkkZ2221LcnA
	uE5KFBKDz3yF5DSryk9yijJTWVHEWk/5
X-Received: by 10.223.133.35 with SMTP id 32mr16303289wrh.200.1495562181673;
	Tue, 23 May 2017 10:56:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.65 with HTTP; Tue, 23 May 2017 10:56:21 -0700 (PDT)
In-Reply-To: <09a43b20-0aa0-beed-f019-762bb23d0a79@linux.intel.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
	<CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
	<09a43b20-0aa0-beed-f019-762bb23d0a79@linux.intel.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 23 May 2017 12:56:21 -0500
Message-ID: <CAJdd5GadD1wBi_GcWQRk92pW8WG-oUQcATLDemWXcZkCax+pjA@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 23 May 2017 17:56:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 12:23 PM, Randy Witt
<randy.e.witt@linux.intel.com> wrote:
> On 05/23/2017 08:29 AM, Joshua Watt wrote:
>>
>> On Tue, May 23, 2017 at 9:37 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>>
>>>
>>> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
>>>>
>>>>
>>>> +if [ ! -f "$NAME" ]; then
>>>> +    echo "  generating ssh $TYPE key..."
>>>> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
>>>> +
>>>> +    # Sync to ensure data is written to temp file before renaming
>>>> +    sync
>>>> +
>>>> +    # Move (Atomically rename) files
>>>> +    # Rename the .pub file first, since the check that triggers a
>>>> +    # key generation is based on the private file.
>>>> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
>>>> +    sync
>>>> +
>>>> +    mv -f "${NAME}.tmp" "${NAME}"
>>>> +    sync
>>>> +fi
>>>>
>>>
>>> All of these syncs seem quite enthusiastic, are they really needed?
>>> Writing
>>> the file to a temporary name and then mving it to the real name should
>>> result in either no file or a complete file in the event of power loss,
>>> surely?
>>
>>
>> My understanding (and observation) of most journal file systems is
>> that only metadata (i.e. directory entries and such) are journaled in
>> typical usage. The first sync is necessary in this case to ensure that
>> the actual file data gets put on the disk before we rename the files,
>> otherwise in the event of interruption journaled rename might get
>> replayed but have garbage data. The second one is more of a "force
>> operation order" sync to make sure the public file is written before
>> the private one, as a reordering would cause problems. The last sync
>> is the most optional, but I've seen it take minutes for disk to sync
>> contents if no one calls "sync", so it is very possible that all our
>> work of regenerating keys would be for naught if power is interrupted
>> in the meantime.
>>
>> I think some of these syncs can be removed. Namely, the first and
>> third one. The second one needs to be there, but can server double
>> duty of syncing data to disk and enforcing the order between the
>> public and private rename. It does mean we could get a state where the
>> public key exists but is garbage, but this should be OK because the
>> private key won't exist and it would be regenerated.
>>
>> The third sync can be removed and I can put one final sync at the end
>> after all keys are generated to ensure we won't go through all the
>> effort of regenerating the (last) key again in the event of
>> interruption shortly after, unless you would prefer I didn't.
>>
>
> The typical convention for this is,
>
> 1. Update file data.
> 2. sync file
> 3. sync containing directory
> 4. mv file to new location
> 5. sync directory containing new file (although I've seen this step left out
> before)
>
> https://lwn.net/Articles/457672/ is a good example which is linked from
> https://lwn.net/Articles/457667/
>
> But one of the important parts vs your code, is also that the example is
> only calling sync on the files/directory needed, vs calling "sync" with no
> arguments which is going to cause all data in all filesystem caches to be
> flushed.

Ah, OK. That makes sense, I will update sync to specify the
files/directory explicitly.

>
>
>>>
>>>>
>>>> diff --git
>>>> a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>>> b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>>> index 148e6ad..af56404 100644
>>>> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>>> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>>> @@ -1,22 +1,14 @@
>>>>   [Unit]
>>>>   Description=OpenSSH Key Generation
>>>>   RequiresMountsFor=/var /run
>>>> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
>>>> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
>>>> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
>>>> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
>>>> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
>>>> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
>>>> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
>>>> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
>>>
>>>
>>>
>>> Can you not continue to use ConditionPathExists to only run this unit if
>>> it
>>> needs to run?  You can prepend the argument with | to make them logical
>>> OR
>>> instead of logical AND, if I'm reading this documentation correctly.
>>
>>
>> I will try that. I wasn't aware that was an option since systemd conf
>> files are somewhat new to me.
>>
>>>
>>> Ross
>
>

