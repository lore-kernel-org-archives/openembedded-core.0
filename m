Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrGek-0007qS-O3
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 00:26:34 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so17436884vbn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 15:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b6ZqkdTLsjKJqYkOeKAXWliCR4ktDHczfK+w0NtfH/M=;
	b=XPMZuZgAXjJp+hACqkm6du7hecCT8dxT9qSedYq7gZEYIkx8/drR5fH2ioLrAVgJxw
	celWjTx3dtiIXKEAaZX7VQFSg+/SZncZ58pUV0Pe9alpiAWfjg1Pxl5JHgYfdWnpgCaV
	C6wwo4zm38GhYbOVaMDpuf43x3eRWSrxDtOyMq/gv7t0pt/eb+BPA09mfo/JJ1JommJQ
	JXcQzqLsBCzy1zCIay++mp7FwYDaFRyNtvXPC7pIb2Ja09DLHXyZjeEvNvf05rMyZZPw
	o7mDKmqNEpD0HxuUyDOCKpgQ92VJl9433psgM6W9f2MrHnJScl5yHJtpZXNNb9ZIUvrB
	CB/g==
MIME-Version: 1.0
Received: by 10.58.45.105 with SMTP id l9mr30471372vem.13.1357341084768; Fri,
	04 Jan 2013 15:11:24 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 15:11:24 -0800 (PST)
In-Reply-To: <CAF6bG8cgn7h2DKehjVEU5HmNurCqNC2VFMCAVBOjZbbW=h4VdA@mail.gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<50E755FE.90604@linux.intel.com>
	<CAF6bG8cgn7h2DKehjVEU5HmNurCqNC2VFMCAVBOjZbbW=h4VdA@mail.gmail.com>
Date: Sat, 5 Jan 2013 01:11:24 +0200
Message-ID: <CAF6bG8c=knEQNzYrzU7YUCvQn3fgF083eJLG_bj2nUki1w50nw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Prepare recipes for automake-1.13 (batch 1)
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
X-List-Received-Date: Fri, 04 Jan 2013 23:26:34 -0000
Content-Type: text/plain; charset=UTF-8

On 5 January 2013 00:42, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 5 January 2013 00:21, Saul Wold <sgw@linux.intel.com> wrote:
>> On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
>>>
>>> In practice there is three categories of changes in automake-1.13
>>> that cause packages to break. From that follows that virtually all
>>> problems fall to three categories, and all packages suffering from
>>> problem of the same category get virtually identical fix.
>>>
>> So these need the automake-1.13 update first?  I have the 1.12 version but
>> have not seen the 1.13 version yet.
>>
>> Just want to confirm that.
>
>  No, the other way around. These are needed in place before we can
> even consider automake-1.13. They are compatible with several versions
> back.

 I've of course tested them with both automake-1.13 openembedded
(patch for this update not submitted. If someone else needs it, I can
of course send it) and against current master automake 1.12.


 - ML


