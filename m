Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A90BA6EB24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:57:59 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so19153062ykt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NDV8KBN4FvQtDwYuwii3uN2yXaaw0nH8Mfbs4mWBIpw=;
	b=A7qhwTMfLbc5N2V/QECLK9qWXQKx6AbpGTqg41DDo42Lrqo56anHkDSSxkZ50i3RhI
	QDrLknkolHXQhPfmu5eu/60kIB+8XNRD1sQtp6mIVpuIu6DCq0a8pLry8IF9ARFEVXHS
	bG0+CLKa2Eq/MHErqa+Bhcf22zIx0rayx90On1wiP1Mu+UurZnE0p0E00Dj7EfKYPuqm
	SIM+Z2f5F1ZHUBsaKZ6EmThiPe1wMmXH2gBTjyJDXNPIJe7z9bozK4/Sc2J/Je2tuq5p
	kKnoghvtr0p3cnmLS1FpqoyEqDECttoLE6oqkWQSG/vKAnoIXhne57qC2lffVEboOItx
	W28A==
MIME-Version: 1.0
X-Received: by 10.236.61.136 with SMTP id w8mr1212169yhc.14.1392296280310;
	Thu, 13 Feb 2014 04:58:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Thu, 13 Feb 2014 04:58:00 -0800 (PST)
In-Reply-To: <1392295019.14081.17.camel@ted>
References: <CAP9ODKpzN6HvJmTa62es0RY_Qr7LLk26mTkbiL6b8XmRPUHs7w@mail.gmail.com>
	<1392295019.14081.17.camel@ted>
Date: Thu, 13 Feb 2014 10:58:00 -0200
X-Google-Sender-Auth: aTkox2mtRhpXlwhv-vY6axwY3os
Message-ID: <CAP9ODKpDTSysGbnjxLA=wOBKCc1dC4i=ragZyuWFt-oxRqzHkw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-dora] Pulseaudio fix
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
X-List-Received-Date: Thu, 13 Feb 2014 12:57:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Thu, Feb 13, 2014 at 10:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-02-12 at 08:50 -0200, Otavio Salvador wrote:
>> This change should be backported to dora as people are having problems
>> using x11-less distros with pulseaudio:
>>
>> otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
>> 77c4f158c6dbc8a373d2064552224f5dfe1a7bd2
>> [dora 19606eb] pulseaudio: fix RDEPENDS traversal for consolekit
>>  Author: Christopher Larson <chris_larson@mentor.com>
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
>> e230b4498790a3dfdc36ea5761807459fc96368e
>> [dora 090424d] pulseaudio: only package consolekit module when x11 is enabled
>>  Author: Christopher Larson <kergoth@gmail.com>
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> With Robert being away, I've taken care of a few of the dora
> backports...

Thanks.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

