Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF126011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 21:02:08 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id r78so22155382oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2V30odttAkiNZ/MvtJZsa22YYJ0+ugi8M3bU9Vu2llE=;
	b=K8nmkRsNB5zPM6Uhp7LgNwDD889AoNz/fajospInmCm0L4sUk7E6XZgfSiJ/hkc4mh
	NOeOhNRiVDmLFH1okI0krrALwmLoWeBk06wZ7LMpHuY9JJ+3snFr1eVwGgLnVGF7wpZt
	lRddOaj1r8OhDoT4QfD8MYuSfZ53AXo550kb8b4PIlfcTU1Nj9IPeJi9LPqq0GeSvawm
	PpologEAorfj9zwP/1y/YDn1Ly41XEh+bhAVYnKl/eSkLtf3VINtY/oXWLJkRan0PoTb
	8/Hr6O1Yj5d/sSgUrmyshOwiIte+loijjpEPVFx2rGyd2rirp50AJMXe6AwS09rjN6dO
	ByCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2V30odttAkiNZ/MvtJZsa22YYJ0+ugi8M3bU9Vu2llE=;
	b=TkEpCBHwA/r77dZVTbZMDj+d0jGDCGj7pSa6RhYE0TF++pQ4y3ei9gwDHZo56C/I1K
	6SFMLRRRuaKhOl2v/2a048VAV/dJPvoCD5A2TziPHrTRhR2V2XvJV/xwfNdpf2g5Ni3y
	uPreLXvQujpIkJ0KV5O/1IWs6BU4s5AJzhDIXYdmdgu5y3+2IQ1Upcv03Iiza1/4eq6h
	zaqEb8n4q+gp+WSyuvWQs11suVdPJ+ABT71p36bg+O0rOvhIobOE82nV93TFf4vTuq1c
	FR121SeIVlNp4AOBIfFSx9+wtpUcX3u5nlncRKWgu/5SMFDOv5OWuSt+sIDrVDeRXhQN
	rqhw==
X-Gm-Message-State: AOPr4FWjRL2b1ZrSol3+Hbgu2WGe/KK7Ud7FwnsHMQAdSk9hefHe+vke7KDu7FadZo84vO+pt+tszkP8VVHIoy4C
X-Received: by 10.202.102.222 with SMTP id m91mr2146838oik.79.1461099728887;
	Tue, 19 Apr 2016 14:02:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.77 with HTTP; Tue, 19 Apr 2016 14:01:39 -0700 (PDT)
In-Reply-To: <49E8A3AC-D4EF-4CCB-9CEA-1CA8E0A6425D@dominion.thruhere.net>
References: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
	<49E8A3AC-D4EF-4CCB-9CEA-1CA8E0A6425D@dominion.thruhere.net>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 20 Apr 2016 00:01:39 +0300
Message-ID: <CAHiDW_EFx5JvzNwY0=MmHNaf0=MMDA1CBz6Z8o3JhbqEtEwNVA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xinput-calibrator startup question
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
X-List-Received-Date: Tue, 19 Apr 2016 21:02:10 -0000
Content-Type: text/plain; charset=UTF-8

On 19 April 2016 at 21:24, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>> Op 19 apr. 2016, om 17:12 heeft Jussi Kukkonen <jussi.kukkonen@intel.com> het volgende geschreven:
>>
>> Hi Koen,
>>
>> I was looking at xinput-calibrator in preparation for bug 9365 "Remove
>> xtscal in preference of xinput-calibrator", and I'm wondering if you
>> remember the logic behind this commit:
>>
>> commit 6464bcd67d10ab9967ac83c27c413c1014be707e
>> Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Wed Apr 30 11:33:23 2014 +0200
>>
>>    xinput-calibrator: fix XDG launch
>>
>>    In the move from meta-oe to OE-core XDG based launched was dropped
>>    without noting it in the commit message, so fix that regression.
>>
>>    Gnome-session will now launch the calibrator again.
>>
>> The commit installs the app desktop file in the XDG autostart
>> directory. But we already have a XSession script for a similar purpose
>> -- the result in Sato is that xinput-calibrator runs twice (and I
>> would expect that to happen in gnome as well)?
>>
>> I'd like to either not install the desktop file or install it in
>> applications directory, so please let me know if the reasons for the
>> above commit might still be valid.
>
> They are still valid, XDG is still the right place to launch it.

I was hoping for a little more detail... I wonder why is xdg autostart
better than xsession in this case (this does not seem obvious to me)
and if it is, shouldn't the xsession script have been removed when the
autostart desktop file was added? It seems clear that the current
setup is broken since both autostart methods are used.

Jussi

