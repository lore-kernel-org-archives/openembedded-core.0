Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rmof9-0003om-KA
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 16:39:59 +0100
Received: by qcsp14 with SMTP id p14so1411792qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=jWGaqr23lRDO4IHNZbl4fZRUh7rjNnzg0aaUKBrsTcY=;
	b=VsQGY5qkexG0L30gdIsz9RURMntmTmW45FRoSicgxivepV24lnNklh4+coE5hrvKlz
	kGyt+QSakzrhYLeBOxugf3tq5rzkjlkqqqEhzoKxd6e80BLsst4Df2F7l/Y60asMrbcv
	7LcbxQmPW4QbjHEXq1Oh3h0d5jo4w9yff2wbw=
Received: by 10.229.78.158 with SMTP id l30mr4456293qck.96.1326727943234; Mon,
	16 Jan 2012 07:32:23 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.186.149 with HTTP; Mon, 16 Jan 2012 07:32:02 -0800 (PST)
In-Reply-To: <lyty41ro95.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
	<lyty41ro95.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 16 Jan 2012 08:32:02 -0700
X-Google-Sender-Auth: HB2d0ne-zzyHFzTkbqlRQ_QYMR0
Message-ID: <CABcZANkAfrhbi13Mr4jfVmNsfkMG7hVF2KYw-MXN9GZHbKfE9A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Mon, 16 Jan 2012 15:39:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 12, 2012 at 7:25 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Christopher Larson <kergoth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> ...
>> +# natives don't generally look in base_libdir
>> +base_libdir_virtclass-native = "${libdir}"
>
> I do not think that this should be done per recipe (afais, at least
> libusb is affected by the same issue).
>
> Adding '-L<baselibdir>' and the '-Wl,-rpath-link' + '-Wl,-rpath' options
> to BUILD_LDFLAGS would be a more general solution.

Alternatively, could simplify the layout of the native sysroot and
adjust things in the native class. It could make a certain amount of
sense, as it makes more sense for our structure for native to match
the host than it does the target.
-- 
Christopher Larson


