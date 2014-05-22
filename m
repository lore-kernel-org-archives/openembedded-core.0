Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (unknown [209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 505FB6116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 19:15:22 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so3385677yha.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lDMw8y0KHtkoj6zBnwNauMbUcnWHr60JfnGXvvbzdl0=;
	b=oS39uh7C4VWQffS0A5o9TH1va1+VTENDIqbuiYqZT192JiA2euuyyxAZJYbSd+KbLB
	dN3jjIddueI1uGKGnMiukn6okge4KHxzxTqjiZOV9f9YQwOn+m6oM/B9O9iLTzcZecor
	7Rvc1n+cZ0BmKsBuj1PqcQ+VnoFyESBYPJRzh0UjRq0iNHhrICzg+H2TMsExm3cuf1Rl
	ye9fF0cdrNdL280IAMHW3jV86U5J7v393UVtCRuHgYNXfCJ9cQnD4v+9odCO6qFBhju5
	W8UtX3aHV9qOINsm6pyV4wR7jmSiuseo5ZzMx9e4b3r/wT7cINDtUOOLyKWxXiD9c8S6
	aTcQ==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr8518659yhi.148.1400786123766; 
	Thu, 22 May 2014 12:15:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 22 May 2014 12:15:23 -0700 (PDT)
In-Reply-To: <20140522190928.GC27324@denix.org>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
	<537E464F.10700@linux.intel.com>
	<CAP9ODKrmQu+dSDm-5xQUDDsLn+wG9Y96Hj-GRkQunqFyTw4kig@mail.gmail.com>
	<20140522190928.GC27324@denix.org>
Date: Thu, 22 May 2014 16:15:23 -0300
X-Google-Sender-Auth: 51_jIK9n_8PfmJ2BaufK_BW7KfQ
Message-ID: <CAP9ODKotEwuu+sTYC1+Rd_huy6vYTU2C82-Yy4EJSG0bqr_bYg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [daisy-backport][PATCH 0/6] Daisy backports
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
X-List-Received-Date: Thu, 22 May 2014 19:15:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 22, 2014 at 4:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, May 22, 2014 at 03:56:40PM -0300, Otavio Salvador wrote:
>> Hello,
>>
>> (Adding Denys in Cc)
>>
>> On Thu, May 22, 2014 at 3:47 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 05/22/2014 11:27 AM, Otavio Salvador wrote:
>> >>
>> >> Hello,
>> >>
>> >> Those are the changes I have in my local backport branch which I run
>> >> on top of 'sgw/daisy' branch.
>> >>
>> >> Chen Qi (2):
>> >>    tcf-agent: add systemd support
>> >>    gdb: add PACKAGECONFIG for babeltrace
>> >>
>> > These are already in my branch
>>
>> Good.
>>
>> >> Denys Dmytriyenko (3):
>> >>    cryptodev-linux: move to recipes-kernel to be shared with module and
>> >>      tests
>> >>    cryptodev-linux: create common .inc file to be shared by module and
>> >>      tests
>> >>    cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
>> >>
>> > I have pulled these for testing, but we don't normally enable new
>> > functionality in point releases.  I would like to get a clear justification
>> > as to why these are needed to be back-ported.
>> >
>> > Please provide more details on the cryptodev functionality and why it should
>> > be backported.
>>
>> We need those to use crypto support in some SoC as is the case for
>> Freescale (in meta-fsl-arm) and TI (in meta-ti). Unfortunately this
>> has been sent late in the release but with the drop of ocf-linux it
>> makes sense to provide cryptodev in my opinion.
>>
>> Denys?
>
> Did you miss the 4th patch in the series adding the actual cryptodev-module?
>
> Otherwise I'd support this backport. ocf-linux was dropped before the release,
> but complete cryptodev replacement didn't make in time for the release and was
> added afterwards. The partial cryptodev support was for the header file only
> and assumed that the kernel had been patched with the rest of cryptodev device
> driver...

Oh, I think I dropped it during the rebase by mistake.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8e12e0ccf75749c682ac310c648166425a295b37

But Saul did include it in the branch :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

