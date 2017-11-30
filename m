Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEB1784DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 22:59:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 9so509499wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 14:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=trSD/BZUrXfugQHbiVxR1+Q7Tryrv68b9R7TYJxiuSM=;
	b=K2W5BqR0BFAlZXT9D3nwMOZInp6u+QHjCM53jp2kBWrjn3mXNabZfKBX9ZBevSZycT
	CpZCpD8eYDJg22SGfG2muAQS7TNUNzv02LONgSc6SMiRNtE07DZC52cwABEeeYv3ufvi
	/OCLPsIRpLnjGU9PeJKv/I6s2ZXGeIDz3m41Btos1wJ7g3wNTckmWrwvw93T5g0JGZrU
	f6RcPc+gCjNa9BZaSVnZrOs9S1t0Vy9M175Aj+W8woD346Gsgo2GQnlbtHyvtZSk5v+t
	QLx6n3iE0Du1rZAVYcInbybCqYaOBMbVIu4Z+554uRIe965edx7z1EznPACSp9vGWxPz
	qFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=trSD/BZUrXfugQHbiVxR1+Q7Tryrv68b9R7TYJxiuSM=;
	b=ZOOUPwrykE5YeIzqjF3tLUEtVvKpC9za7Cpdmb+Lqj6rPbzMzd2TyDWnA9GqvWXzVa
	KQvDxJaRB7XupV/rUU6V8//ZJw7jH7fx+Nzi1H6tpHqECwEW8Ss30BDnzFU1cXd2O4j3
	y3AiHec5t/plOP1TrCidFRR46neRND5NLlvMrrdNu1tTlj2Rrl56rwa05KJNhSL1A6Ch
	kEQ2ep9hsyXdQZpRkv81ECA4AY9rRCp3CYrhzI3CoS5EHmlKVsfialbgC1ajkkYffnIv
	s/O7UwEK1UHqrpl/epfuE3hY7ka/FEjbaguXVlANeoQX4DcKAZM8prg2CW+YXXuW98vA
	tIXQ==
X-Gm-Message-State: AJaThX555qsG4TsayqZc+nxntlrFKAdf+FTN6vtnhB1UW8mV3J7U8nJC
	NYHggNhhGFVy4wjh49mJFvgwOko+GlHAwV5rokQ=
X-Google-Smtp-Source: AGs4zMYghFwS7/xiaPAhfmq+k6XnhlyikwL1dVv6BgYKL/gZI0mCboLLdQ+9ed5MRe8nYHl80OuYePeyLfkWF4HZJFI=
X-Received: by 10.28.31.137 with SMTP id f131mr2893173wmf.110.1512082761745;
	Thu, 30 Nov 2017 14:59:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Thu, 30 Nov 2017 14:59:21 -0800 (PST)
In-Reply-To: <CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 30 Nov 2017 14:59:21 -0800
Message-ID: <CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Thu, 30 Nov 2017 22:59:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 30, 2017 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Nov 30, 2017 at 12:20 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl_git.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> index 932c9a2..db26b4f 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -57,10 +57,11 @@ do_install() {
>>         oe_runmake install DESTDIR='${D}'
>>
>>         install -d ${D}${bindir}
>> +       rm -f ${D}${bindir}/ldd
>
> Doesn't lnr take care of removing old file ?

Apparently not:

  $ touch foo
  $ lnr xxx foo
  Traceback (most recent call last):
    File "/.../openembedded-core/scripts/lnr", line 21, in <module>
      os.symlink(target, linkname)
  FileExistsError: [Errno 17] File exists: 'xxx' -> 'foo'

