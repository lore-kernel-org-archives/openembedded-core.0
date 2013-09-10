Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 15DB460F25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:13:39 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so4955822vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=EaAWtWwMFgz9cq2e2l/c16Mk/bxPjGVqBsFLqwQYn1M=;
	b=1DnvArZhSkhr7HxjBFFeCgsorQrFD2fFWSJDT8OagGjT7CyVEKECG9yV15XyJQt37m
	NEUI/MTQ3ZmhAwGvYUDg/bOmXQVE34WkkatSggkmPG1FfPaLMnGySE4VGQp+jNyjFWcX
	4UZGGXBPlTkBouc+BrrCjFMQKIygwMdIq1DMYbfVjadS/y/eBpxJPJMJhg5ixUef07Ta
	6iXQB9S6nVFCSxXHtAX82DpnV62tgUbm5Lf/jocnTfJwak3SV/geH/wOUNaQrNnD4P97
	3i7NVFvrLnG5hwzVMEv6U0Jsy1orF5zd61ykw7j6e8idFQxNA8ar9IlX9YpznWcgJdKp
	NgkA==
X-Received: by 10.221.40.10 with SMTP id to10mr1206091vcb.22.1378815220505;
	Tue, 10 Sep 2013 05:13:40 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.155.17 with HTTP; Tue, 10 Sep 2013 05:13:00 -0700 (PDT)
In-Reply-To: <CAFyqS9rHuWo+DXkBxCmtPwzeunMe01y-swKjYKjUkQ_YcofXqg@mail.gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
	<CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
	<CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
	<CAFyqS9rHuWo+DXkBxCmtPwzeunMe01y-swKjYKjUkQ_YcofXqg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 10 Sep 2013 13:13:00 +0100
X-Google-Sender-Auth: VRw-g0M8wQIaeendxGwNHt6purI
Message-ID: <CANyK_8eQB9KEs5NMXEhysakBrFzkBcGCBRs0=v3Kh6vxNYo0_g@mail.gmail.com>
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
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
X-List-Received-Date: Tue, 10 Sep 2013 12:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10 September 2013 13:06, Hans Beck=E9rus <hans.beckerus@gmail.com> wrote=
:
> On Tue, Sep 10, 2013 at 2:00 PM, Paul Barker <paul@paulbarker.me.uk> wrot=
e:
>> On 10 September 2013 12:44, Hans Beck=E9rus <hans.beckerus@gmail.com> wr=
ote:
>>> Could someone please verify if this patch (original v3 post) can be
>>> saved without line-feed corruption? It seems very client dependent how
>>> a message is saved, irrespective of source format. Some client seems
>>> to cut lines like crazy, others does not.
>>>
>>> Thanks.
>>> Hans
>>>
>>
>> Looking at "Show Original" in gmail still shows this to be garbled.
>> Perhaps save it as a .patch file and attach that to an email? That
>> should prevent any mail client from touching it.
>>
> Oh. But hang on here. Is it allowed to commit patches in the form of
> an attachment?
> Then why are we at all messing with the formatting and using git
> send-email to avoid white-spaces etc?
> If attachments are allowed then that will definitely save me some work ;)
>

Ok, I've looked again and
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
doesn't mention attached patches as allowed. This is what the -contrib
repos were created for, perhaps you could request access to
http://git.openembedded.org/openembedded-core-contrib/ and push a
branch there, then send a pull request.

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

