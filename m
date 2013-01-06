Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrzQS-0005jm-Jy
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 00:14:44 +0100
Received: by mail-vb0-f52.google.com with SMTP id ez10so18251812vbb.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 14:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=reOV4aj2G8AUta9EUAqPuJVgNbolzzMhWPYk7f6N3vM=;
	b=D83sNJCA1fcdYEWCM0i6hmG2b41u/iZKoeU2E20wcxZkh+RZI33xg7K/O2R6mDR4fX
	tnz+O4jDr7Xs+DnskOTJZ6XKAW5MP1ZwU9IfQbUxc/bMlqcKLEvdSIwM8PH6pAglui3J
	irr5Tzc7c/5xgZytYprG9UVOMmGgLgn5LotAgsvtKmFvAL2ojMyxWNIo0wdRz/OmEVju
	9ZpXmmHDRRt2GI+PhtP4Bnv0hTCfW5JaS1n8JXAbekJts472rwHb6emKl5/1kiXVj1qE
	qVNdqrOB2vt1FFVKRNse+SrtCnDApqB1uIJN3D0KnfNu+GlAd9zuFnGiY6juZrw8m2U/
	SBjw==
MIME-Version: 1.0
Received: by 10.220.106.133 with SMTP id x5mr1964773vco.61.1357513175708; Sun,
	06 Jan 2013 14:59:35 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Sun, 6 Jan 2013 14:59:35 -0800 (PST)
In-Reply-To: <CAF6bG8d=vOeaS4agL0cw1NBsqC4iZhyQWspTMkVp6NDpm0GiYg@mail.gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<50E71AAE.7010106@linux.intel.com>
	<CAF6bG8d=vOeaS4agL0cw1NBsqC4iZhyQWspTMkVp6NDpm0GiYg@mail.gmail.com>
Date: Mon, 7 Jan 2013 00:59:35 +0200
Message-ID: <CAF6bG8ck6EAPZ37SS1ZS7qtecawEsw91AGd73NcbtOUqBV9ieA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Sun, 06 Jan 2013 23:14:45 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2013 20:23, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 4 January 2013 20:08, Saul Wold <sgw@linux.intel.com> wrote:
>> On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
>>>
>>> Add obsolete-automake-macros.patch that replaces automake macros
>>> no longer supported by automake-1.13 with modern constructs.
>>>
>>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>>> ---
>>>   .../file/file/obsolete_automake_macros.patch            |   15
>>> +++++++++++++++
>>>   meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
>>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>>>
>>> diff --git
>>> a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>>> b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>>> new file mode 100644
>>> index 0000000..61ee062
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>>> @@ -0,0 +1,15 @@
>>> +Upstream-status: Not sent
>>> +
>>
>> What does "Not sent" mean here?  Is it Pending? You plan to submit it?
>
>  It meant that I'm about to send it. I sent all the other such patches
> to upstreams (and updated Upstream-Statuses) as a last thing before I
> sent patch series to oe. But with "file" I noticed that they had
> released new version just while I were working. So I left it to wait
> for me to check if patch is still needed upstream. It isn't - simply
> updating to new upstream version could be solution for oe. I'm only a
> bit worried about release announcement wording that release with such
> big internal changes is for the adventurous - others should stick to
> previous release.

 Checking "file" mailing list now a couple of days after the release
it seems the warning was in order - many reggressions reported. So I
guess we stick to patching old 5.11 version.


 - ML


