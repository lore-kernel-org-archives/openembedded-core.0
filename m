Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD946B1ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:17:36 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so4348803obc.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fclMzWdaHTMsBVouVluQiA8/8e2vfHG+M7dHDfJwqKA=;
	b=WCymESfP0wq6rb0dwzJfXhvOikEUe2muBIe07gN6sXJs8uOGrKS33/ND1oidU9CQl2
	LUzi4+3bh6ki9BOXqqyRxJeeuFAPrMSqGCnLzl2LnG8X6ntj3AB1DbXM42UyDmloglqz
	SxFpfKzqePM9VcWc3wGSVPiovbszaJSz4RiZQu7TK2DTDxl8Of4wbp5g3zA5CjAN4mZH
	f9lDwImRezADr9LFCQSxr9QHbx+iHQlBqKXMPEisoG3P+y3pp2rMyyGeGQ1a6iDjtBF+
	rCu+at+SqGb4ByKTmtePsHArmZ6O5m/rGPNpjwUTj8eMcnOY0c1eO2Vhvud5Uf3WovzT
	KlaA==
MIME-Version: 1.0
X-Received: by 10.60.124.228 with SMTP id ml4mr2056547oeb.47.1375377456502;
	Thu, 01 Aug 2013 10:17:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 1 Aug 2013 10:17:36 -0700 (PDT)
In-Reply-To: <CAOMwXhO-g9N3b0b27jrmZYbgDwPDNziJFF9_ryGbXF+RgBZyCw@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
	<CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
	<1981575.9KzFInvyxm@helios>
	<CAOMwXhO-g9N3b0b27jrmZYbgDwPDNziJFF9_ryGbXF+RgBZyCw@mail.gmail.com>
Date: Thu, 1 Aug 2013 14:17:36 -0300
X-Google-Sender-Auth: 5lkPmSCzA8Zx9KKSpgfz7tc6WYw
Message-ID: <CAP9ODKr3g-rSDftBo9uyeUGJUFn2dzSRjgySRxoK8CNOSH3z7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 17:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 2:09 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Thu, Aug 1, 2013 at 6:02 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>
>> I'm afraid this is not practical. The ability to specify the value for
>> MACHINE
>> and other variables from the external environment is not just there for
>> folks
>> running bitbake manually from the command line, but also external scripts
>> as
>> well, and they could quite legitimately set it to the same value that has
>> been
>> specified in the configuration file and showing a warning in that case
>> would be
>> undesirable.
>
>
> Oh yeah, it cannot happen with compiler outputs the same way? Answer is: it
> can.
>
> You can add another feature later though if you wish to suppress warnings.
> That makes sense to me.

It makes sense to not add the warning. Too many warnings just confuse
users and does not provide anything useful as users just ignore them
in the end.

>> I'm not sure I understand the value of showing this warning in any case.
>> The
>> system is not going to do anything that the user won't expect - the user
>> specified the value of MACHINE on the command line and that's the value
>> that is
>> being used. The fact that it is the same as what's in the configuration
>> file is
>> incidental.
>
>
> Have you used gcc, clang, etc? Do you have experience with warnings in
> general? They are there in certain cases because the programmer may have or
> probably made a mistake. It is a lot easier to figure out at that time than
> debugging very hard later...

<sarcarsm>
I am sure we all in Yocto community NEVER used GCC/CLang...
</sarcarsm>

Did you EVER read your own messages? Please do.

> Actually, it is even getting more serious in your "script" case where it
> would be totally hidden by the script if it is not logging properly, and you
> would only realize an issue later.
>
> Surely, we all copy paste wrong on a daily basis, and we also write "foo"
> instead "fow" and "bar" at times. So, I do not follow your comment. Nothing
> to reinvent the wheel here, just follow the general practice that other
> software developers have figured out along the decades.

That's the point; we are folloing Yocto general practice and doing it
different here won't help. Just confuse.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

