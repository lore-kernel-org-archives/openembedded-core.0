Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 21719789FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:35:33 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f75-v6so3252226lfg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+a+liIwJDcy0TeMWMKXbQy7fxRuUZySVwTz+eEePGU=;
	b=fTUDL3eTFEic+kx1/aVjUqjRMNGiKGzJkfsHTGdrqJCmUjID8hpfe6669Owx9FtLUl
	7omII8BsDboazCGwyPC6tQ/XOXeT9Ba/PvfsRGeAnrr4642XL3O2tj/otshnl0CFmbnS
	XWuvgptlHRHE9Hr+qReH08f8fn6RuTu2d5ttasI+gzlzbGTGkpXnTVz1mYr5MhZCWNYR
	aBpIj589qK2msiGYKsx2l/dqf4L9vpi4o+CKWCjJAH0MN4X25FcSH3O4K3VBQcp6kRzF
	dSI5dv0YlnhRH09lE09pCWr7uNcz2RBv8JRfwBVKny+/MNqDV+ML4lOM5FwcWco3hFlM
	JNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+a+liIwJDcy0TeMWMKXbQy7fxRuUZySVwTz+eEePGU=;
	b=OH0LaetuSka9jKI4cUaFDQ7v3tQGCWqvO0sKoIAgv/EtWJd32iHQqWbWcp05wJnAaz
	jnxXtB+0yBMxRe8lZ3uCiBvivgZ8Gv8/mgvhb2OFuFYT+yFwGU+fk7zbbumoYZbcI+fL
	ruwyq7z0cjJp5waLqOxe9Doht8ZFwoV6xtnNt2VjbZ6eeeuDDIrVTZCvTs6RLxgBGcPG
	k7k0UBp98aMwnim/6MjtquMmQrkzYhhg6FxdowgdP4aCjzA5LaYgBxUTJSOqnNMohdd0
	J7EL5QQnRkZ+sgNcImdK/am8pLnjYDZnmvk9kNq7txf4s2wo5cjbbXJxt16sKgqd8EMk
	+2TA==
X-Gm-Message-State: AElRT7Ho3ghOpucagdWTkw5l3NWCZfhNPef6sGXdTqAWNChi4PNaqf+4
	xFt2670uw6hETDFv3E61C+r3UBlkISa6G/RC6C4=
X-Google-Smtp-Source: AG47ELvht9SOQcaY2FXimxod8sHwbdXncFH4WVTy+1TpC3CFStydIASSdE6GUcpuAbYRmKix8JEFovEPTHGoXyFX7k8=
X-Received: by 10.46.42.67 with SMTP id q64mr15857636ljq.133.1520429734499;
	Wed, 07 Mar 2018 05:35:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Wed, 7 Mar 2018 05:35:33 -0800 (PST)
In-Reply-To: <CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Mar 2018 08:35:33 -0500
Message-ID: <CADkTA4P58D1LFLCRZc6PvXa1+R2NTb1LF55EL+U7m+XbwLo4mQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9 v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 07 Mar 2018 13:35:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 7, 2018 at 3:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
>>
>> +RDEPENDS_${PN} = "bc python ${TCLIBC}-utils"
>> +# 4.15+ needs these next two RDEPENDS
>> +RDEPENDS_${PN} += "openssl-dev util-linux"
>> +# and x86 needs a bit more for 4.15+
>> +RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '',
>> d)}"
>
>
> Annoyingly this is breaking our multilib test case:
>
> https://autobuilder.yocto.io/builders/nightly-multilib/builds/852/steps/BuildImages_4/logs/stdio
>
> It's entirely possible that the test is broken in some way but it's far too
> early for me right now to comprehend the multilib matrix...

And at this point, I'm basically out of cycles for hacking on devsrc :(

I'll see about it again at the start of next week, and failing that,
bump it to the next release cycle.

Cheers,

Bruce

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

