Return-Path: <hans.beckerus@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 08324615F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:30:49 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m6so7593638oag.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=q+SmdT/7/aXdxTEa+dIMR1AlUGMcT29awjNMfm0WTbI=;
	b=erDbSM+1N6qhCBsa5KdXVfz7Qhz1rINLxRKN4QeAFP9f4oeT5cjuu7aQ2C36YRPjoq
	tOsVQlOKqP0CtXs/SdLwvTqmWi07QboICwi07cpU6dlhHS9A6oKKITDDnu551415ignV
	awrYmpAxmgEFzuBftLvm7WP4FDrzy1vTJyuLPxPHBnhP48Pl0s+lttMPvpGOXgcrE6Ir
	wJbCZDc2qfW6Df8dwg8HlaWWmbSwQRueCU1n7kbTVv8wYJXxH5ad6QGcYgO4swceKx2A
	Dpw74NffVYcZnEmSC7INvLh/UMeLvb3bQx7z7h+irHFdwiLUPVvcTit0AfiK57dKFSV5
	3RhA==
MIME-Version: 1.0
X-Received: by 10.60.84.165 with SMTP id a5mr526377oez.83.1378816251217; Tue,
	10 Sep 2013 05:30:51 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Tue, 10 Sep 2013 05:30:51 -0700 (PDT)
In-Reply-To: <CANyK_8eQB9KEs5NMXEhysakBrFzkBcGCBRs0=v3Kh6vxNYo0_g@mail.gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
	<CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
	<CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
	<CAFyqS9rHuWo+DXkBxCmtPwzeunMe01y-swKjYKjUkQ_YcofXqg@mail.gmail.com>
	<CANyK_8eQB9KEs5NMXEhysakBrFzkBcGCBRs0=v3Kh6vxNYo0_g@mail.gmail.com>
Date: Tue, 10 Sep 2013 14:30:51 +0200
Message-ID: <CAFyqS9qs5YpbA2q_WLZb95qq_pGY-dezGMC1k7C5xAou2iCsAA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 12:30:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 2:13 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 10 September 2013 13:06, Hans Beck=E9rus <hans.beckerus@gmail.com> wro=
te:
>> On Tue, Sep 10, 2013 at 2:00 PM, Paul Barker <paul@paulbarker.me.uk> wro=
te:
>>> On 10 September 2013 12:44, Hans Beck=E9rus <hans.beckerus@gmail.com> w=
rote:
>>>> Could someone please verify if this patch (original v3 post) can be
>>>> saved without line-feed corruption? It seems very client dependent how
>>>> a message is saved, irrespective of source format. Some client seems
>>>> to cut lines like crazy, others does not.
>>>>
>>>> Thanks.
>>>> Hans
>>>>
>>>
>>> Looking at "Show Original" in gmail still shows this to be garbled.
>>> Perhaps save it as a .patch file and attach that to an email? That
>>> should prevent any mail client from touching it.
>>>
>> Oh. But hang on here. Is it allowed to commit patches in the form of
>> an attachment?
>> Then why are we at all messing with the formatting and using git
>> send-email to avoid white-spaces etc?
>> If attachments are allowed then that will definitely save me some work ;=
)
>>
>
> Ok, I've looked again and
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> doesn't mention attached patches as allowed. This is what the -contrib
> repos were created for, perhaps you could request access to
> http://git.openembedded.org/openembedded-core-contrib/ and push a
> branch there, then send a pull request.
>
Yes, or I will just try to find a simple stupid mail client that does
not mess up the formatting.
I will try later today from a different client. That will be the last
attempt. I am making a complete fool out of myself already ;)

Thanks.
Hans

> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk

