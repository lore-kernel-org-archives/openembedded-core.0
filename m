Return-Path: <zeenix@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 584B67839D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:59:28 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u19so19259097qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Qs1TgGgNUGiYr+EHf1JX438sBKfWmV/ANY3TyNi//0o=;
	b=F1TVZ7aXLLoiu5Fd/PEptSH4R8qVlUfSRmtdwjc6SXXQcCvyEtrmcBjm8sOPLC6z8B
	JTtHXYfXf3m+4n6h1+liuHp7deKAric1wPRE4F3sEz20aGwJIMDpf9KjvAbXziOek93G
	P1g03Dj3WcPjP46a6ve8cXX5qLpCC72XAstmw7zY4KmU6SsV6P3h2VivV++gluwcMx6W
	WcxWSG5253Ix6YfrHfjIHMY/Sq1YzMnvFEPEIPRooTZ8Bv8RpXazEOm0vbyiNwoXLtBn
	7mlIC8qwp0Zq3HtR2ypBjV5i4RBGFZhYfgMuWsqbkQYsrdhKsSpcGJFsyaKv+d4ZTf3v
	PR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Qs1TgGgNUGiYr+EHf1JX438sBKfWmV/ANY3TyNi//0o=;
	b=APaq7ruvKV2RLytvbWoFV5boictWKZCgmdLibA+przTv87iQkrj3/ym8HN2AvfvhjA
	4EZ38FFODWwNf1jxL5SqummcFblOxsyv2vwOa3THaG1fuxyowD8G65Jxi8DbtGvGzWAA
	i2NF01gpjG4ZznQibu/SDoNW97SsyT34DPJfr2QXyxGxvTFar/+E000K3E7ubKAfGjeW
	qi+Bj5I5NfITolU0gcTiRZ61TgX3tPROV0GqQc5EtB0/WqrUghDsOEuwXz0FCy8qhyuU
	4kULPkM9yxoNPyfIFOhmi6CF6LwYMf4D+dcUxighBEzDIvQcrtSnFX6eNk1ScQ5/ohND
	GAYw==
X-Gm-Message-State: AKS2vOyLs57LbbZMRqPwNLx1mqZpZr6mwmB5JjECRGV+9brFwhkRhw0Y
	a91Jm5xZSwVZ15WFmKJOHxS5PAxdRKMB2HQ=
X-Received: by 10.200.1.71 with SMTP id f7mr6629163qtg.172.1497531570209; Thu,
	15 Jun 2017 05:59:30 -0700 (PDT)
MIME-Version: 1.0
Sender: zeenix@gmail.com
Received: by 10.200.11.203 with HTTP; Thu, 15 Jun 2017 05:59:29 -0700 (PDT)
In-Reply-To: <20170529060935.8093-2-erik.boto@pelagicore.com>
References: <20170529060935.8093-1-erik.boto@pelagicore.com>
	<20170529060935.8093-2-erik.boto@pelagicore.com>
From: "Zeeshan Ali (Khattak)" <zeeshanak@gnome.org>
Date: Thu, 15 Jun 2017 14:59:29 +0200
X-Google-Sender-Auth: g_jtccDSVNYCce29G-8XgFGhpio
Message-ID: <CAAa3hFMMxVRMRNufBenQ7E1G3stW0Xvu8xeE94MPfOa-J35axA@mail.gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Thu, 15 Jun 2017 12:59:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Has this been already merged? I ask cause there is a small change
needed for large-enough rootfs:

> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
> index 07418fcda1..6cdcfa3068 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>              time.sleep(10)
>              self.power_ctl("cycle")
>          else:
> -            status, output = conn.run("reboot")
> +            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")

Should instead be:

+            status, output = conn.run("sync; { sleep 1; reboot; } >
/dev/null &")

Otherwise, syncing happens as part of reboot (unmounting) and reboot
takes much longer than testing code expect it to and hence fails if it
tries to access/ping the target while reboot is still in progress.

If the patch has been applied, I can send an additional patch;
otherwise I can send a revised version of this patch.

-- 
Regards,

Zeeshan Ali

