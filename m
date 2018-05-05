Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id E84A074D9F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:52:30 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id a3so15182144uad.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hLGWqG1Lfeyha1iiGWIIqFBTCK/x2oUP6qMNtFdAtTQ=;
	b=IOcFOKk8PFiuG7FTuqjcTqHU6oOSBTh66so2V2nJC7JEul0UZiey6Gg/rprRSAy+L/
	H4jCL85MonTasStZ/QR0KoO5wURQfJsdDYJFYlhYPEs5ispRZ9XXa7+Xv4R12dkVn282
	1RItpxc9mc88EAU/xTZqYt248i5hT0kXUEPcfHogS5WeZYgBIuGNBjCqeQPMJMKJZ+aZ
	Wyiqw4fo3xeL1llYuqcYMnhQ5HOq0762cTCiV+Q4SaEcpfsVrSIgD2z5O1Hcs6vFxcdD
	dfvfYJ1Q+XMc0uj6yK2m5WhOgeRLNwI2Wt5sU93btS9GJL2dVfbn7IyT8KyFRhtBTa12
	faZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hLGWqG1Lfeyha1iiGWIIqFBTCK/x2oUP6qMNtFdAtTQ=;
	b=aeKVA6Xce0yjUXwQiAbk5WY1d2ReqHTJBEuF7qdaE0l9414RwUJnzgYXeqh6j1Ght+
	MBhI4C5JLvk4cFyV2QBTwQQwFEEoUjNycF4VBtOwxi8Oc2zIj85ojpG+mw7ANSTUs7rI
	cDPUZsJVDILIPhMeTLTipQeXYg3FDeFAlGossTQ1H0a1PlCWVBZqvvZkGPugHHVvun94
	lq44Jr0BwwDVQGZVXZSN5psqH8Df+TXEN0+oqTxcFnS57m/uxHopKrniJH+6JtzPKpV1
	YAreWp4KxK45TW4VTqzu4Z7SCl51ndTr+QgnHG9AQwnCqQ66kFHf4XX9BSvbACGLCZg5
	eAbA==
X-Gm-Message-State: ALQs6tC8ZpTTXPnI6ScKyWr8pqXR+3kRd/BdjBgx5w1DJ8UpbrkiVKBK
	WG+VLL/RKR45xyYHMSihoIzJg9XHD+rJSzDgmMc=
X-Google-Smtp-Source: AB8JxZpEcW3RKyUaByzIMEb2R0sDR/U9RbwvhqsPSBYnytK7v44+v9t0TITG+YG29wu7W54j1Btnw5aACree8CDwVcA=
X-Received: by 10.159.55.102 with SMTP id a35mr26043156uae.66.1525481551415;
	Fri, 04 May 2018 17:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Fri, 4 May 2018 17:52:31 -0700 (PDT)
In-Reply-To: <8ba5b8b622744aa783b1963437fc1cce@XBOX02.axis.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
	<1525474370-7913-8-git-send-email-armccurdy@gmail.com>
	<8ba5b8b622744aa783b1963437fc1cce@XBOX02.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 4 May 2018 17:52:31 -0700
Message-ID: <CAJ86T=VccJNFFB=NaL8ahXBY6vA3mdo=bGJoCP1SNc4dvh2igg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] rpm: move ASNEEDED over-ride into the rpm recipe
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
X-List-Received-Date: Sat, 05 May 2018 00:52:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 4, 2018 at 4:23 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This patch does not remove ASNEEDED_pn-rpm = "" from the
> meta/conf/distro/include/as-needed.inc file.

Yes, I noticed that just after I hit send :-) Ross, should I send a
v2? For the series? For just that one patch? Or can you fix it in mut?

> Also, shouldn't ASNEEDED_pn-openobex = "" in
> meta/conf/distro/include/as-needed.inc be moved to the recipe
> in meta-oe to complete the patch set?

Yes. The patch needs to be accepted in meta-oe before the over-ride
can be removed from oe-core.

  http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/118033.html

