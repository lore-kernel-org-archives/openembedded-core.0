Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9B00760958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:20:51 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so1838244vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=sJyGbBPUuxv7dV1x81ur3lGITY/Hawx5uAi5o+SfGUw=;
	b=zf3ptpVt2+jIoeCIMrJWCHI/2I24OneJvywTMprWTS/Wvc4/F7q9/W1VqoWGh85hbq
	eszSjNEEXCId+2cAnnJE+HDj3Lj7hyPJMGd1vWc5nM10Y57z2qqb81LX5d8lur9Pzejx
	UqrH+qp+PJTBwh/VjwoHFpeZJ2WKZyNp+ZtNRFhBF6omop7aa/KyKffHqCOz+ycs2Lbo
	m6MazezcF0TXIHLSd441ptkWK6x30SQdV50S1onehTijAxEks4e5mdCMgEsKvtSq05jl
	FmURVjKL50j3L9Mrx239pvR0TCL7tCgJj9oROvDBy0O6KkmG/GF43ooxBZxfuX/4JGHI
	UUkQ==
X-Received: by 10.52.163.165 with SMTP id yj5mr11369694vdb.104.1375082451983; 
	Mon, 29 Jul 2013 00:20:51 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Mon, 29 Jul 2013 00:20:11 -0700 (PDT)
In-Reply-To: <1375082184-14871-1-git-send-email-lpapp@kde.org>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 29 Jul 2013 08:20:11 +0100
X-Google-Sender-Auth: G4OIRCOUPxyvBVNDxvXJfrTF1PI
Message-ID: <CANyK_8eaZJPT+gGCrn4Nfh3qRQehNE442X8pepTr+EcHiWw2HQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 07:20:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 29 July 2013 08:16, Laszlo Papp <lpapp@kde.org> wrote:
> -       busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
> -       busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)

It would be good to have some way to re-enable this if it is needed.
Maybe an 'rfkill' PACKAGECONFIG option?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

