Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SoHoc-0006tg-8f
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:32:06 +0200
Received: by qcad10 with SMTP id d10so5328021qca.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S8JIBWHItEXNOHGR7pUJEVuf98iIwteSUu4CIqagtLo=;
	b=y9NpbmGjVq42l0SZxr8F1cziuLvJt4ICoOrD5RGzxNJgH9Eeo1mrOVZYecC/cy9gkw
	DivtzzYy4j0mdsBPdG6OXzFw005iuGaFVbiQoL7DRGHYWYpzysfYQCZWT1oFmmYTuF9Y
	Hq2OM0laLqqMvcEM4OC2RHazYHrn7jPZZ0UcxybWP9GYteK5n+Z1+YcV1XWlbYXnqsL3
	i3Cx3QXSTy2ieOXEt28Nt2rYw3Sr2OKW2wB2WLufuQY6rsxAozmn7FigUyXR6cx2Hzhm
	ZAo+jZFQCg8NssNhPS4Zg9tNyPoiOGRD5pgQXdy/iqz3xI78CDiFsrKY3/+PNBvyfn+O
	RzBQ==
MIME-Version: 1.0
Received: by 10.224.45.8 with SMTP id c8mr69740261qaf.29.1341854456197; Mon,
	09 Jul 2012 10:20:56 -0700 (PDT)
Received: by 10.229.41.5 with HTTP; Mon, 9 Jul 2012 10:20:56 -0700 (PDT)
In-Reply-To: <1341853718.6761.218.camel@trz-ThinkPad-T420>
References: <cover.1341845577.git.bruce.ashfield@windriver.com>
	<1341853718.6761.218.camel@trz-ThinkPad-T420>
Date: Mon, 9 Jul 2012 13:20:56 -0400
Message-ID: <CADkTA4MoTogopyfa1C31M9A+iO8+--Ub7yMJ6eYwjhN5VBvtUQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update 3.4 SRCREVs (perf + unionfs fix)
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
X-List-Received-Date: Mon, 09 Jul 2012 17:32:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 9, 2012 at 1:08 PM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Mon, 2012-07-09 at 10:59 -0400, Bruce Ashfield wrote:
>> Saul/Richard,
>>
>> I was waiting on the resend of Tom's perf series to send the updated
>> kernel parts for this. That's out, and the kernel parts now need to
>> be updated.
>>
>
> There are also perf patches for 3.2 - did I miss the updates for those?

Nope. I got distracted and didn't fire up the git-send-email on them, doing that
now. :)

Bruce

>
> Tom
>
>> I've also staged a unionfs build fix along with the perf updates.
>>
>> Cheers,
>>
>> Bruce
>>
>> cc: Tom Zanussi <tom.zanussi@intel.com>
>>
>> The following changes since commit f40ce3e1f4ceebc90b3c058dc82750829149c21d:
>>
>>   package_rpm: Avoid duplicate package generation failures (2012-07-09 11:38:02 +0100)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib zedd/kernel
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (1):
>>   linux-yocto/3.4: perf scripting & unionfs fixes
>>
>>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
>>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


