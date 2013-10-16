Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id CA39A6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:37:47 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wo20so182933obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HDz7kUGpZlPCgdIkOLdCJ2FytLGdotydJCOyB69SpII=;
	b=mIs1VKtb+s31Nyjsnlllsp6856X7lY0ZCh+Dpba9XoC8lsVHLRPkaLh9jIEIFvPb6y
	kITBaHFBFRxvJM4E2y5RhS788LI2OzD/hiFAXBqojmLdnihcL9z9JPEPbCf6xpDDP7Ax
	p1jsQNOLKTrPQWMI2IdmBg484EdVPierY4sG0emKzu93bwwMLub/sJBxA6augwIkS/3N
	vJB400DJqP7HGaS+1bM6QGK1fbzEFhIIL46JUDo4PhfgcFQA8LA04ThtCU4L4+V5lYb7
	ZahmNnQHZUH1vv/aTd4gqkOvtC1sBxv8i7k3WrNtaAHPBguMs+K/C1uC1PyL9VOcUtN9
	uZhw==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr2039612obb.17.1381905469333;
	Tue, 15 Oct 2013 23:37:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 15 Oct 2013 23:37:49 -0700 (PDT)
In-Reply-To: <525E3378.3070604@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com>
Date: Wed, 16 Oct 2013 03:37:49 -0300
X-Google-Sender-Auth: LtoXYT0jkZnXd-SqT8e5Qt3llt4
Message-ID: <CAP9ODKr7hH6ADpujcqREaaayit+_gZBVOOYakQ+pRr4oX904ew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Wed, 16 Oct 2013 06:37:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 3:34 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>
> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>
>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>
>>> From: Roy Li <rongqing.li@windriver.com>
>>>
>>> [YOCTO #5287]
>>>
>>> tar failed and reported that file changed as we read it, now
>>> we workaround it
>>>
>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>
>>
>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>> of the change?
>>
>
> Sorry, I do not know the root cause, and I see many people spent
> lots of efforts to investigate, but do not find the root cause,
> sometime we suspect it is the building servers kernel issue,
> if it is true, we can not fix the building servers, we only
> workaround the code.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

