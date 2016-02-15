Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 922D76FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 19:53:43 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b67so118051716qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 11:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mpWEgvOYUMf0Cu4s3ZABots8Ykui3AMXQ6VaYhunMYw=;
	b=ITej7affbz2N7VC9LOb+8rNEV3XBSNrhG+GmGPlg9mA0M21DsC7CzV0tLjCU9e8/O/
	5SFj81DpBWoIWYCBoJxWwYCJkNybujW2VHpyRaHILU3sZ6CmXhgky1H/w+2fBEaWpANp
	zMvIAEz2Wk3wygOeWSrqohCHxKDULhPdUWL51nFU5Gbxpx16pzlzmX1Gfe2HXdG52hJ2
	dqlZbmD+Oh1nBlCSbxfla10EWvFwafBGwkNZFeIYvRl6FcYhTnJjWdMYJ1xnKoKJ15R3
	UuI1v1UZlHCw9xbxJYIFMruKktHfQ/AZ4C5CtHQRVHE9/alP/SlFCLZ69nJIzW8MBmNw
	+pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mpWEgvOYUMf0Cu4s3ZABots8Ykui3AMXQ6VaYhunMYw=;
	b=GDN51dQN8EpTtgfapBha0HcLmI1U1BgmTCQJpHp2ZRW7hwySh5iKV3miGudf7g4kA6
	XYTRUvRLI0ERQa+iHiWy/bzcE3oZXvjVY5JMO5EnMts8Cj5KlcJ/A/tYDbLtecZGx2ge
	fF+wWLm/EuScYxlVC8C9E/kUwpc4DGiUv9W/nMgO89/m84SGxwxvB+U6BOCK9TjYkbkV
	3xxttA6dM6XxDFNOfSQsju/8us15y1sSYVcMELT8kfnuP4qVOKX26Hfhm8GQRywAZ8Bq
	CvKEp2yDKYCn/BmIpwC/EHjqb7zrlASbHAWyRMs0XvUNhpKlML+zByyIV5ua6c1VlFtb
	sP0w==
X-Gm-Message-State: AG10YORuGpRbd6udSbuORqd5pvgnMAxGx1Qo2uptFqHem/mwroQCntNJxvDk1ERO8annf0MMdRshOT4qcF5AXA==
X-Received: by 10.140.108.181 with SMTP id j50mr22367797qgf.104.1455566024455; 
	Mon, 15 Feb 2016 11:53:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 15 Feb 2016 11:53:15 -0800 (PST)
In-Reply-To: <1455557537.3118.7.camel@linux.intel.com>
References: <1454341995-18859-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAMKF1sok60noEfj_ZywoN+2Z4QkcMfZrzXbRdrQharg-ZYSX7w@mail.gmail.com>
	<1455557537.3118.7.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Feb 2016 11:53:15 -0800
Message-ID: <CAMKF1srf3kCLZkPWVh=mZ2mv+F5GdaAvHyguZvHhiRrZUtqkDQ@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime/systemd: Fix for boot time string parse error
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
X-List-Received-Date: Mon, 15 Feb 2016 19:53:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 9:32 AM, Benjamin Esquivel
<benjamin.esquivel@linux.intel.com> wrote:
> On Mon, 2016-02-01 at 10:48 -0800, Khem Raj wrote:
>> On Mon, Feb 1, 2016 at 7:53 AM, Benjamin Esquivel
>> <benjamin.esquivel@linux.intel.com> wrote:
>> > boot time string can change its format of the output of the amount
>> > of time
>> > it took to boot. It is required to handle graceful fail of the
>> > parsing
>> > errors that it provokes
>> >
>> > [YOCTO #8889]
>> >
>> > Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com
>> > >
>> > ---
>> >  meta/lib/oeqa/runtime/systemd.py | 22 ++++++++++++----------
>> >  1 file changed, 12 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/meta/lib/oeqa/runtime/systemd.py
>> > b/meta/lib/oeqa/runtime/systemd.py
>> > index 03c56ef..2b2f10d 100644
>> > --- a/meta/lib/oeqa/runtime/systemd.py
>> > +++ b/meta/lib/oeqa/runtime/systemd.py
>> > @@ -145,8 +145,7 @@ class SystemdJournalTests(SystemdTest):
>> >          except AssertionError:
>> >              self.fail("Error occurred while calling journalctl")
>> >          if not len(output):
>> > -            self.fail("Error: unable to obtain the startup time
>> > from\
>> > -                    systemd journal")
>> > +            self.fail("Error, unable to get startup time from
>> > systemd journal")
>> >
>> >          # check for the regular expression items that match the
>> > startup time
>> >          for line in output.split('\n'):
>> > @@ -156,20 +155,23 @@ class SystemdJournalTests(SystemdTest):
>> >          if check_match:
>> >              print "%s" % check_match
>> >          else:
>> > -            self.fail("Error while obtaining the boot time from
>> > journalctl")
>> > +            self.skipTest("Error at obtaining the boot time from
>> > journalctl")
>> >          boot_time_sec = 0
>> >
>> >          # get the numeric values from the string and convert them
>> > to seconds
>> >          # same data will be placed in list and string for
>> > manipulation
>> >          l_boot_time = check_match.split(" ")[-2:]
>> >          s_boot_time = " ".join(l_boot_time)
>> > -        # Obtain the minutes it took to boot
>> > -        if l_boot_time[0].endswith('min') and
>> > l_boot_time[0][0].isdigit():
>> > -            boot_time_min = s_boot_time.split("min")[0]
>> > -            # convert to seconds and accumulate it
>> > -            boot_time_sec += int(boot_time_min) * 60
>> > -        # Obtain the seconds it took to boot and accumulate
>> > -        boot_time_sec += float(l_boot_time[1].split("s")[0])
>> > +        try:
>> > +            # Obtain the minutes it took to boot
>> > +            if l_boot_time[0].endswith('min') and
>> > l_boot_time[0][0].isdigit():
>> > +                boot_time_min = s_boot_time.split("min")[0]
>> > +                # convert to seconds and accumulate it
>> > +                boot_time_sec += int(boot_time_min) * 60
>> > +            # Obtain the seconds it took to boot and accumulate
>> > +            boot_time_sec += float(l_boot_time[1].split("s")[0])
>>
>> is float right to use here I wonder,
> float is what the seconds are expressed in at the journal, like in:
>
> systemd[1]: Startup finished in 1.616s (kernel) + 13.561s (initrd) +
> 3.195s (userspace) = 26.632s
>

so its in 100th thats ok,.

>> > +        except ValueError:
>> > +            self.skipTest("Error when parsing time from boot
>> > string")
>> >          #Assert the target boot time against systemd's unit start
>> > timeout
>> >          if boot_time_sec > systemd_TimeoutStartSec:
>> >              print "Target boot time %s exceeds systemd's
>> > TimeoutStartSec %s"\
>> > --
>> > 2.5.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

