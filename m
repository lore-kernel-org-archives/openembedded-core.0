Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsFKV-0005YT-GY
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:13:39 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so17123833obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 07:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=mxquKK895/4KMoXCCm6BusM3Ir7MV7tkenEXzq+AYP8=;
	b=lSeb1gt8clPNxazuMX9OR528jAXsQC3Hc1Js88acJkFWC+DKUpmjXDyuPTYp5ibdh1
	G6txnCVLBbWI3V81O5fmJx132uXGu8F+9TBFqsop+oDFpJmwYoglJyL6LBJt0mF+/Gyo
	M6hXRY4eok8wYjercexv0/rIT6pEw5xhFGHdFmTxsynE2kLwVW2UkFFN1FQomfkuM596
	6kaKDlgzmndjELCrCaj+5lPnnTzhZUCxiMjJQDpge3PmJK21BH/2szmR465ahQZmd2xA
	CJc528YvtbyqRDUO8VdQOS9ZJCC3Mw/Wt1g1/HL6zAHZeBDJgpdHfWqUxWwQ0gJSwjjZ
	LWSQ==
MIME-Version: 1.0
Received: by 10.60.171.146 with SMTP id au18mr32964255oec.108.1357574309647;
	Mon, 07 Jan 2013 07:58:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 07:58:29 -0800 (PST)
In-Reply-To: <1357566365.25855.17.camel@ted>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
	<CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
	<CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
	<CAP9ODKq2UVEmG11WFNHNdvE5+-X5NW6azhaQsxxGPbC05+j8og@mail.gmail.com>
	<1357566365.25855.17.camel@ted>
Date: Mon, 7 Jan 2013 13:58:29 -0200
X-Google-Sender-Auth: BKVnVM6lq3G1sN9tY63hy-JZqjA
Message-ID: <CAP9ODKr+sZwLb5A_H6s2-SJ7kPh9T2S4B9zDt1+0B6NwzMUwYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 16:13:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 11:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-01-07 at 10:18 -0200, Otavio Salvador wrote:
>> On Mon, Jan 7, 2013 at 10:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 7 January 2013 12:11, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> >> What's the correct status for fixes that are not really backports,
>> >> but have happened independently in oe and upstream?
>> >>  - If practically identical, still mark as "Backport"?
>> >>  - If different solution, "Inappropriate [not needed]"?
>> >
>> > If you did it and then later discovered it's happened upstream
>> > independently, it's essentially a backport.
>
> The best thing is to consider how we use the information. I'd happily
> accept "Backport" in this case as meaning "the upstream latest version
> has equivalent functionality". You can note the status after the word to
> give specifics if needed.
>
>> Maybe it'd be better to not patch at all and update to the newer
>> recipe version?
>
> I don't think that is a reasonable policy in all cases. I'm not going to
> block automake on all upstreams making new releases for example.

Sure but if there're a new release with the fix it is better to
upgrade than backport the fix (with exceptions, of course).

My point is: it is good to verify if there're a new release and use it
if possible. Otherwise backport the fix.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


