Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE66873BBE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 16:47:44 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so25020498wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jun 2015 09:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JTt9eijw3tnKpJOTY97T4c1EXYiLC9ZhJl11OoAzQF0=;
	b=F3Vg4DB1Wa7LXsxIzinbR72v509sPwnLkbHz3UVgO6yF/g+Q5Xf0uJMb7NUlDXEIca
	boXK3b59MnIowypZglXLTNQrgZzqWQrKgG1D5YpXWuAzqjFYHsqxXkjDlqyNJcSKmD1O
	x/5/7QsfoDPSm4hLo7HZq6VKw3H8jzkQMWUApNejE5/kb34usjt/Th4sh7QLzEhyxeTW
	wn8F+ZSc/VvxKEulAOIZZ69hytzpDG3m9QdOqrOml8RPaexTDuntm4m/aJskuyWQtLhh
	+oArX78VKfpEIo6YNA22krsbgExmAxWmC7HX8cVV7QwpRHrqtxfywZ2O67SCFYWAea5j
	uXNA==
X-Gm-Message-State: ALoCoQnzAajmAY+RxK2MZ9QDtRQife6FFaap7G27TFfrukaTxtmtHaZOsRQ8ereuHBx0Zt4pGzky
X-Received: by 10.194.185.8 with SMTP id ey8mr8155515wjc.118.1433522865355;
	Fri, 05 Jun 2015 09:47:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.61.87 with HTTP; Fri, 5 Jun 2015 09:47:24 -0700 (PDT)
X-Originating-IP: [87.63.77.14]
In-Reply-To: <CAP9ODKrF7Ny8LnnAhGc9ZYZEY3p+PQ201vDZwCTq7dqzwGfVqw@mail.gmail.com>
References: <1421415523-29824-1-git-send-email-andrei.gherzan@windriver.com>
	<CAK18fxF0+4OvqPFq36yyaH7LFbi9P0sNHxr1xNdqd=sJdjzyQg@mail.gmail.com>
	<CAP9ODKrF7Ny8LnnAhGc9ZYZEY3p+PQ201vDZwCTq7dqzwGfVqw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 5 Jun 2015 18:47:24 +0200
Message-ID: <CAK18fxEy6CrDbPmNF7UScqs8Y9tkUBagUGUqw35mi1sMhnxZnA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: holger@windriver.com,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: Don't create /var/tmp, log directories
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
X-List-Received-Date: Fri, 05 Jun 2015 16:47:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 17, 2015 at 6:37 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Adding Armin in Cc.
>
> On Fri, Jan 16, 2015 at 11:43 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> Hi guys,
>>
>> On Fri, Jan 16, 2015 at 2:38 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>>
>>> /var/tmp and /var/log are symlinks created by base-files and point to
>>> their
>>> respective directories in /var/volatile.
>>> With this patch we avoid systemd-tmpfiles runtime errors like:
>>> systemd-tmpfiles[108]: chmod(/var/tmp) failed: No such file or directory
>>>
>>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>>
>>
>> Could you please cherry-pick this into the dizzy branch too? Thanks.

Ping.
-- 
Andrei Gherzan
e: andrei@gherzan.ro
w: www.gherzan.ro

