Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 048317266A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 22:58:43 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so4672574ykt.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=njzQUQ6gVU0ijZOn6Sn0SEBjvxMU2CZ1NWjUi5MpWBE=;
	b=aPAcjO3KGyairs17eKIP2/CZgDRtaN2zssFFRdK+NMG1mOKfbRjAoWc+/z2yUiKEkG
	dvAMcgJF8oYmtqDqUcU2UJ2C+MhxIeXrjPLFEmCsYP4BRpiP3dx70UyUUzVHEHIZ9mA5
	GsQD9JeTT9zDmd+ScU2BmvsKukzEh7op4ZmSfZEVfvfGiGzhXtmD+RoFDdOiBga4PFK5
	a64Z+q5HvKihjzIf0o+RvCQhHzsjjmoFAnhD9/uZtDF8oEwRvG5bZrZ5YpO5ZIZo6BwZ
	KGTgtyMPhjaLic1rP3tOurZHmj47Jj46/TzcmEA4bPGNkUaY7OD2U8bxoAn7O4XIDhDV
	vlhA==
MIME-Version: 1.0
X-Received: by 10.170.99.6 with SMTP id q6mr92331yka.105.1419548324084; Thu,
	25 Dec 2014 14:58:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 25 Dec 2014 14:58:43 -0800 (PST)
In-Reply-To: <1419544975.6428.21.camel@linuxfoundation.org>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
	<fbacfe30047277ec91144a9ecba291c3879ae6e4.1419309149.git.hongxu.jia@windriver.com>
	<1419544975.6428.21.camel@linuxfoundation.org>
Date: Thu, 25 Dec 2014 20:58:43 -0200
X-Google-Sender-Auth: sqAoS2Wj1lEU9D04e4GkPs2eI6U
Message-ID: <CAP9ODKrA_0p6c=AT_HQHLifwRs8Rx5ZbfC=U_w_rVdi6pb+LOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] directfb: upgrade to 1.7.6
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
X-List-Received-Date: Thu, 25 Dec 2014 22:58:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 25, 2014 at 8:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-12-23 at 13:09 +0800, Hongxu Jia wrote:
>> - Drop fixsepbuild.patch which has been merged to 1.7.6
>> - Drop obsolete rename-no-instrument-function-macro.patch
>
> I think this somehow breaks qt4:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/144
>
> (thanks Otavio for pointing out it was linked to directfb)

Glad to know this has been narrowed down :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

