Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CA4EC77109
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 06:39:00 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f65so74287205wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Hld0noVsWQZ+EnPg42e2stjHBMlfLkHjZYxTzLkYF+Q=;
	b=I794qPgXqGxwu5FI/z9GAY8L4kudtADWmzSS9llRgJ2KO3d1PSyNIL7w17x4zdnm7g
	7yu3lqd9x093V/hR0WpDyxxqKHrpKK5r1Rsd9EQu/F5A3NfQpoBN5nAXuZbcNA4g7CaX
	tt1J3Ue3S6vpGawvXVuPaBNZh4MKiGNa260/Zibo+83Z/IJpzogrYOISYAjG0yZqLrln
	te/iRImZ0Nwz9lkGUB11+SJhYativbXQiZb1C2giDi3J5QtvD0/fcQJyWnSyBMtuQ7dO
	sLenzeCAJlWlLaZJ+gQGF4KFs+Tko2OZUMMNg6w8vhUB1TGE3DtIA0JNCqgBMCYSw0dp
	Fh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Hld0noVsWQZ+EnPg42e2stjHBMlfLkHjZYxTzLkYF+Q=;
	b=V4CFyDCPNXCvJQMu54lC1DVyS/S5fOZrT8QhubgpfiqGTh3xUr5ROLGbPZkCKHVrGo
	RvJoLvcAfwwHkevrmM53xEMBW2Gg6SEdrnHJ06S4Wy1/22bpfekYUY+p5jeRfFGV72CQ
	MIAk3VEYak9tXidHJcfYbD5mx8TDHxGGAq4qR1PHwddE3cSmPWvV5MegGEt9svr1X7h7
	8dhSEME3bISenEjL3to6e4S5naN84qkEBSnR3GgPPz3Li+NAfhkRhU0ewbV7FlEPlzLJ
	hEMiuPjI+CK/tAdWfEpj+rdRtnyRES8kln3bhx6DS4cDZedz3XVxRBC9gLRvgCcZzp/3
	S8aw==
X-Gm-Message-State: AEkoouuHpPVQ5ZlWdCHM4G7a5hpSnzhJbrHlDW3YLnLzt5KCt9FlxVupeNbeoW3Nxa4y1A==
X-Received: by 10.25.89.15 with SMTP id n15mr4844686lfb.163.1471243140559;
	Sun, 14 Aug 2016 23:39:00 -0700 (PDT)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f22sm3590929lji.13.2016.08.14.23.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Aug 2016 23:38:59 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
Date: Mon, 15 Aug 2016 08:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Mon, 15 Aug 2016 06:39:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/08/16 12:01, Burton, Ross wrote:
> 
> On 20 July 2016 at 08:53, Kristian Amlie <kristian.amlie@mender.io
> <mailto:kristian.amlie@mender.io>> wrote:
> 
>     on our krogoth build the systemd network service does not start, and it
>     seems to be because of missing users, which has already been fixed on
>     master. I've cherry-picked the two patches that fixed the problem for
>     us. Note that they are not written by me, but by other people on this
>     list. I hope they can be applied to krogoth.
> 
> 
> Can you send the two patches to this list, with the [krogoth] tag in the
> subject, and your signed-off-by to confirm that you've tested them?

So, I did what you asked. Is there anything else missing?

-- 
Kristian

