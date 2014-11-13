Return-Path: <wrob311@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C05D560167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 20:23:34 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id s18so39002lam.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tpbOxwCjMSoQ+DP2p8hhd0f4DAMT3BnZF210OsCT1LY=;
	b=wHcCx0NR1A01ZjFHf+SqYs8F/PscIn74FX+dp0TzdflJXM0cow2fQAYB0Wrkpkp5d5
	JPtXs+pB+cG+z39KSg9wqkUzzwjZ7SpwLlbkAo7tT0EzUj/PG4JnSQExgV8uwIWCgJ08
	gOr4FJSmVKqxecU8YQysey6cEsVI1G+v15nLROB4kKPCbyUDdqGmkLt6FN8gNvixr18v
	tNB3zqrHeiUNBKIIm7OzS6SGVYnXj7CQ3yoXAIIjVnBN8AmWz8Hcq5U2jsbNmF+01+rj
	31vYK/6bWjCHkVt6WORQxZ2wRWHaAQ3ZTUS0bo4Z4BMDYnYrBhUbQ4h/8wrEu/e0wesv
	R9bg==
MIME-Version: 1.0
X-Received: by 10.112.141.104 with SMTP id rn8mr4330642lbb.87.1415910214259;
	Thu, 13 Nov 2014 12:23:34 -0800 (PST)
Sender: wrob311@gmail.com
Received: by 10.112.163.168 with HTTP; Thu, 13 Nov 2014 12:23:34 -0800 (PST)
In-Reply-To: <CAJTo0LbHecBh1J3MqhpXzsrXmUv_963LS+VDD0Vrg_rzFukynQ@mail.gmail.com>
References: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
	<CAJTo0LbHecBh1J3MqhpXzsrXmUv_963LS+VDD0Vrg_rzFukynQ@mail.gmail.com>
Date: Thu, 13 Nov 2014 20:23:34 +0000
X-Google-Sender-Auth: d3ZWMKhpxLocvvv4cMvvnYoquW0
Message-ID: <CA+92fu_s_2_MzGSEuJKCEvKqE+GG61QANvb_Nb4jgavspT_KDg@mail.gmail.com>
From: Artur Wroblewski <wrobell@pld-linux.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Replace Python 3.3.x with Python 3.4.2
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
X-List-Received-Date: Thu, 13 Nov 2014 20:23:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 13, 2014 at 5:24 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Artur,
>
> On 12 November 2014 22:55, wrobell <wrobell@pld-linux.org> wrote:
>>
>> Replace Python 3.3.x with Python 3.4.2 (bug #6857)
>
>
> This patch has long lines so didn't survive SMTP, can you push it to a git
> repository somewhere?

I have attached it to bug #6857. Actually, some improvements to the
python manifest generation script was next step in my plan. This would
tackle the above problem in the future.

>>
>> Despite further work needed, I hope this patch can be merged, so further
>>
>> work on Python 3 support can be continued in smaller steps.
>
>
> Personally I'd prefer to see a working Python 3.4 integrated in one go
> instead of having a broken 3.4 integrated for an unknown about of time.
> Hopefully anyone else who is interested in 3.4 can step up and work on the
> outstanding issues now that this patch is public (which is another good
> reason to have a public repo with this in).

If you specify some exit criteria for this, then I can try to improve
the patch. But
please keep in mind that Python 3.3 in Yocto is broken to such extent that it
crashes due to missing essential modules.

Regards,

w

