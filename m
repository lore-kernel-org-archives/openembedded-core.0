Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id A6DAA79897
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 17:35:24 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id t68-v6so13488318oie.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qhOmlP9rYxjDHz12k55Pk8RmT7RvvD3wZNXwD/cQ0og=;
	b=D2PB/KxiJCxy6h2UMLasKyMws08QJyD50LVpLzvViZqVf+zX/EuMbAoYWUBercUOaP
	1gF0pcgPZ8zIYCxkabf+aDBq+c8zmFAHbyzSNHThDTWkOuSUJ8AeXPk2ybrl2S7PP5yd
	Y39S5Q38gDyGT5jd8blMArh3AXa7g2mZwxSm/Dy0sDVGtdm/M0B3pXzmG8JWqvs+HJ09
	gMIxobFRCkaRPQwFlM035jsG8DHM2Co9HGoRW3q7LklfcmMdX1O3sdqsD1tWuyGSDvEo
	3Cpqp1CQSJfxUT65grGHFATrUNHYcqIssAcTNMsDF6TUVWgwziMze/Y/sJ/DjY0pVmhb
	BpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qhOmlP9rYxjDHz12k55Pk8RmT7RvvD3wZNXwD/cQ0og=;
	b=YjQIbeFk7UeH9Z4W/XM6Xi3mqbb6YAs251qY5Da5yAhKn5X+c+keR00iOSZ/QcGp7y
	VAvEL1UBOgtYF5NEgzzIYF1dYb5bSrTjSvxBF2Yeurba3y2yHia/fCGH3B8crkmqBW7b
	XzE8YxnTytIiAP5+v2QkmCMFIkPIj0wU5TQGRa0kbqA74hBFD1P7oPWmHI+8XyF0GHO4
	RwIvKrRAG5eMVJFtTBpphg8ibSPLtkS7Zq4RvdPgl1eLBJokml4NwzYyudzcRvCZ3Tn7
	oOqo36J6WwSR81wasFEyIXqz4IplwwCiU1HvVm2oc9br6vgbQIlXzicgrhZuED65T6S0
	+/JQ==
X-Gm-Message-State: APzg51D3Dfg8JnuIbv8U5UxaV6UUfviMGUVR1liQ7aDtmU18q/JnTT6k
	QFe3efA/Vf5KmtBTGV5G7+CMINg0TiavoTAw248=
X-Google-Smtp-Source: ANB0VdYFwe4TZ0mQh5twCJaZps7df0DMzKxGV73Zbg2iRdEkitbOd57+nw2NSa2n4RuSeGoRXKwYJc+VvgdIsAHrDOs=
X-Received: by 2002:aca:dec6:: with SMTP id
	v189-v6mr9620393oig.98.1536946525472; 
	Fri, 14 Sep 2018 10:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
	<CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
	<CAJTo0LZqrgAeRbsJtW=G1f58CNSRYS8r_9Nm-4K2G1KstvA4Kg@mail.gmail.com>
In-Reply-To: <CAJTo0LZqrgAeRbsJtW=G1f58CNSRYS8r_9Nm-4K2G1KstvA4Kg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 14 Sep 2018 12:35:14 -0500
Message-ID: <CALLMt=rksKX-Yry=-Df63FFrxxVi_T8d6Z7JDizNxsn1o1m61w@mail.gmail.com>
To: ross.burton@intel.com
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 17:35:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 14, 2018 at 11:05 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 September 2018 at 16:13, Andrew Geissler <geissonator@gmail.com> wrote:
> > Nice, thanks Ross!  Looks good to me. Will you be back-porting to
> > python2 as well?
>
> Struggling to be motivated for Py2 to be honest.  Do you fancy
> duplicating the changes for Py2?  Alternatively I'll get around to
> doing it next week.

Sure, I'll get some patches tested out and uploaded based on your Py3 changes.

>
> Ross

