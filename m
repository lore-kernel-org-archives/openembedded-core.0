Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4D11372051
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 22:09:15 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so3608630pdb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VocJAPzy2RJJUPvo7mztbUMYwWQNKbbQEKwwzA4m/3k=;
	b=Q7kXV5+s4/qmFX9lkpVsd558+7RXB2pVq/Jd5mlydo36TqzvMPhyIcjRkcr1x693cw
	RzhPJkTjl0Qa8aeFZU86PDk+emA93Gfi5Lo5CooiiHa3ld9FoA2QEWR63sB7K1wZExmS
	pHDAsQtcKO7WTSoFCYdaE+JDBQF329HjH3bTC1hoASlhWe1vA1Zt2T63OyO6+dWVNOTM
	D4RyQHPL+zV0zYQ3D3FgfuI3Ymogu7cIbkXSmTW60i547BQEFpczsRZM/sa9KDaGTsxu
	UrGnHL2rKOzLEMjkeGaTX78KK1qMAnJLFXEgtPo+T0CjvQ+e6RIQI3DIZPsRnA5YXpD7
	uX1Q==
X-Gm-Message-State: ALoCoQndUml03UQgzJ7Tz/A3r66oiO3g+NbUFW6DV5qoVU509MNkjWKxVjVQv7tGMafwNtyJ1rz8
X-Received: by 10.70.45.233 with SMTP id q9mr58087506pdm.24.1417039756629;
	Wed, 26 Nov 2014 14:09:16 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:11a:ce80:cb9f:dbea?
	([2601:c:9380:601:11a:ce80:cb9f:dbea])
	by mx.google.com with ESMTPSA id nb5sm5224440pbc.25.2014.11.26.14.09.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 14:09:15 -0800 (PST)
Message-ID: <54764F89.3020404@mvista.com>
Date: Wed, 26 Nov 2014 14:09:13 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Javier Viguera <javier.viguera@digi.com>
References: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>	<1415788406-23120-3-git-send-email-otavio@ossystems.com.br>
	<5475F954.7070808@digi.com>
In-Reply-To: <5475F954.7070808@digi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy backport] [PATCH 3/4] sysvinit-inittab: Disable the carrier detect requirement for serial consoles
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
X-List-Received-Date: Wed, 26 Nov 2014 22:09:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/2014 08:01 AM, Javier Viguera wrote:
> I see this patch has been committed in master. Could it be backported to
> dizzy?

Will look into.

>
> This fixes a problem with some commands (for example busybox 'less'
> applet) that become unresponsive when used in a serial console on some
> hardware platforms (for example a FSL mx28).
>
> A basic: 'less /etc/passwd' just hangs showing nothing and you can only
> stop it with CRTL-C.
>
> As the backport seems pretty safe in general, could it be backported?

sure.

- Armin
>
> -
> Regards,
>
> Javier Viguera

