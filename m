Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id D2F4E6B8C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:06:05 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so978009oag.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fbeObwo1Hw/OJIaAfvFL45IQalY8/k2SAKNoZuDyOK4=;
	b=FnJTyJblUdUwTAl4VgWuBX5B5CZ35/uWKRzDiOaQvmTqVQ/e4fUEzXOTF2QWZwBTPF
	xNxE7Jcal1KS7JakvdR4SZ7rnbxS8Dn343PDUrIxrreBhZNm2HXTUZmid1DUJPgUx6sj
	yxI5+FbvsCHHMhFmQW9UlAla7Hbl4y3h9jvpAzhgbudmCi7wbVab+BIwPmqL+Rjjq+lu
	Q4iDrSa+QwUzSO82s9d6+yC9wsMcaUxkumA8Ezc+8KIol6ytPgDJxcgZEEvnqzqCLWjY
	0sNGi6D+QmS+jBAwLPOrrIAE7Exu7TAJITyE0tcmUh6p/ascXdE0/q3C3S2Fy2Ytr3HV
	dmnw==
MIME-Version: 1.0
X-Received: by 10.60.140.168 with SMTP id rh8mr2114296oeb.76.1377011166210;
	Tue, 20 Aug 2013 08:06:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 08:06:06 -0700 (PDT)
In-Reply-To: <1377009976.25999.98.camel@ted>
References: <cover.1377008073.git.sgw@linux.intel.com>
	<1377009976.25999.98.camel@ted>
Date: Tue, 20 Aug 2013 12:06:06 -0300
X-Google-Sender-Auth: BxjHrxVa_DT67ueqplQbDHIOrV0
Message-ID: <CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/25] Final Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 15:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 11:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-08-20 at 07:28 -0700, Saul Wold wrote:
>> Richard,
>>
>> This has been ACK'ed by Ross and Paul, I re-ordered the tune file
>> usage patches and will create a patch to clean up the comment that
>> Ross mentions.
>>
>> I agree with Ross on the texinfo patch, his name is there in the
>> email.
>
> Merged, thanks!

Thanks for merging the patches but one change, the poky.conf change
(http://patchwork.openembedded.org/patch/55893/), has not been merged.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

