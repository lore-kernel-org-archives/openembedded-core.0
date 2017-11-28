Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 265E96FFA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 22:42:57 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id y82so33723132wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 14:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PV6iboKLXoNJHaU1CXEAHQmtWbZyNpi4vixIkBox/90=;
	b=D7ydjVR176N1r6fnlC1Bo7lmv5knPnGo5nzPLogix79NNkZbXO18ZP/mcAuMfJ3tp2
	o6dXW3hy3t1PlX3wiu1ONJG0NOPM265gB5dxPTmDRGOGIAG7GdIrG1DMdjQ1TGASbynP
	juEQddSMdihZaUH5CKc0fNBs/TWwqeTufXVE3LsMmXx+rbjP28FC4hY3O2DmWpvD2BiU
	6u76I5RJjhD3gPErHoKgdl+ySwQuTZVNCgYlcs52lWD/3ajygBUAmE9deyz04uu+JPAT
	SkxJstv5g1dse6ZB1ADCpbWJ25GBXZrefSWms4Tf3cpzQzIYWJ8ILK5pbu3v/Zo45K4T
	yGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PV6iboKLXoNJHaU1CXEAHQmtWbZyNpi4vixIkBox/90=;
	b=PGfP8uTfJN9M+JmlyW/u75yCr1+R4k7/z6Bv/BTFkVvOOiX2RY53aN2R///N7+BROH
	21vJz8FJt5DgECoUhWOBlROmRu6CVpOmarq9ljiN3xWDwdA67GTe/FTDAlycNlRbVaCD
	gLwqekAEvqrACLaNbRo0eT11yHFs7Dq8NGLgURMAu8LgIi7OVdcDkYNOoIO46WrY68kz
	DbyEfe0pTL5yeA2ymhxhApDsZnUi5YDHe7rKFZk8Jw2iXcVxQMDQwVUDBUmU2JiejvVH
	G+AI+/rxq7wyUHkP7HfMmxXfXc+s57qlv5kclhDakAUzfMRUjJ3eFnU5QRH8rt80o6py
	P/hw==
X-Gm-Message-State: AJaThX4mJdZMZTNncCfbwKz3UrNjl5WWEy4cMg+FCjAhslAjm4nK6j3V
	yP3ctZpskwk3ICunQ1ER/OJsKHL9HqnRD74SrGPUEQ==
X-Google-Smtp-Source: AGs4zMZOvjkKi4J9zMzBons7AgIMnBocqhhdSK/jXxofBH2MCNnZyiK9D/kqLpSXCRBPgktJEnD7L8WXiIhtUzXMVzY=
X-Received: by 10.80.227.193 with SMTP id c1mr4756191edm.16.1511908978603;
	Tue, 28 Nov 2017 14:42:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.169.50 with HTTP; Tue, 28 Nov 2017 14:42:58 -0800 (PST)
In-Reply-To: <CAJTo0LaN6s0YJETfvXkWLf77j_+Ssu1UyH=3V-4OHt1MLPBgTA@mail.gmail.com>
References: <CAEQ58sgvjUMZK8VfmRmgs2+G7VGQ9rL71NgTxmUg=S832_ANvg@mail.gmail.com>
	<CAJTo0LaN6s0YJETfvXkWLf77j_+Ssu1UyH=3V-4OHt1MLPBgTA@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Tue, 28 Nov 2017 23:42:58 +0100
Message-ID: <CAEQ58sjSz3sf1kaegqeGEzq3_Sq5kkh-hUOT9rS274AaBYhcHA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: connman-wait-online is not behaving properly
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
X-List-Received-Date: Tue, 28 Nov 2017 22:42:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

Thank you for your reply. It seems that it is more a systemd issue
rather than a connman one. It may be appropriate to also ask them to
see whether they know something.


2017-11-28 22:30 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
> We just ship what upstream connman provides, so you'll probably have more
> luck talking to the connman list.
>
> Ross
>
> On 28 November 2017 at 17:22, Francesco Giancane
> <francescogiancane8@gmail.com> wrote:
>>
>> Hi everyone,
>>
>> I am doing a build on the Raspberry Pi 3 for an University project. I
>> included in the core-image-minimal image the connman packages, so that
>> I have connmanctl, connman.service and connman-wait-online.service
>> enabled.
>>
>> Wired network is set up properly and so is wifi using connmanctl. I
>> can successfully connect to the board using ssh.
>>
>> What bugs me is the fact that connman-wait-online is not signaling
>> properly systemd that the network is configured.
>>
>> systemctl status network.target yields that the target network has
>> been reached so far.
>> On the same side, network-online.target is not even started (no one
>> notified it of the network being online).
>>
>> Also, connman-wait-online.service seems to not be even started
>> (reports inactive (dead)).
>>
>> What is happening? Can someone tell me what I am missing in order to
>> connman-wait-online to correctly signal network being online?
>>
>> Many thanks,
>> Francesco
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

