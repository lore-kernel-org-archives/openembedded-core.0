Return-Path: <hans.beckerus@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 523096BD93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:06:36 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id t7so1546569qcv.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=xHG/Q10dwijsfQxXW+d3LGmhHvzhMT1EorJSE2WGz+k=;
	b=qsYyiSGYVw6keEtWVbE3dgazcATQd5exMYjBtlp0UYTVfHBUeTyWNucN0ml8gux31s
	ogIdx4aQPEMqaPH0kMlFjmqE4GFJxaMINt7UPw/30fjd13OtTzDXpM1iUGLntWWg/uHu
	RS/bwDltStRZ1HA7mzVljPkHVeiIY0+Ez+OWABDrW92mWnpKmLeLQnCgCtou/pUEDJ7S
	lrqtY/+loHtVkO05ZdVKljM4EHQ0IGWsfzy5gFZ+OpPeGzW2ae49zTE0p5hHonKaXJt9
	IJ5TI7fuZT7I46h+dn7MWtNgFtSsSmNyK+3ua26BnVDa7bCPLeLsJAUwx9J4cMmWlGtp
	qznA==
MIME-Version: 1.0
X-Received: by 10.49.27.226 with SMTP id w2mr14193403qeg.32.1378814797700;
	Tue, 10 Sep 2013 05:06:37 -0700 (PDT)
Received: by 10.49.57.197 with HTTP; Tue, 10 Sep 2013 05:06:37 -0700 (PDT)
In-Reply-To: <CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
	<CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
	<CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
Date: Tue, 10 Sep 2013 14:06:37 +0200
Message-ID: <CAFyqS9rHuWo+DXkBxCmtPwzeunMe01y-swKjYKjUkQ_YcofXqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Sep 2013 12:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 2:00 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 10 September 2013 12:44, Hans Beck=E9rus <hans.beckerus@gmail.com> wro=
te:
>> Could someone please verify if this patch (original v3 post) can be
>> saved without line-feed corruption? It seems very client dependent how
>> a message is saved, irrespective of source format. Some client seems
>> to cut lines like crazy, others does not.
>>
>> Thanks.
>> Hans
>>
>
> Looking at "Show Original" in gmail still shows this to be garbled.
> Perhaps save it as a .patch file and attach that to an email? That
> should prevent any mail client from touching it.
>
Oh. But hang on here. Is it allowed to commit patches in the form of
an attachment?
Then why are we at all messing with the formatting and using git
send-email to avoid white-spaces etc?
If attachments are allowed then that will definitely save me some work ;)

Thanks.
Hans


> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk

