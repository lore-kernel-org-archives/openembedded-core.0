Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id BB49360796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:31:09 +0000 (UTC)
Received: by pfbu66 with SMTP id u66so24663069pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=C7P9YUdmh4mbdDTJYv9POh3Tho31+NJDjWEWzVE6W8w=;
	b=fPJlsGxwR9DAe+bB5FEcPmFy3ULlTFY9Hf9dLDN6i/4WlD4MhsAGuksrk3TBdsgBTI
	MsYDTVnxJDQGV37GD+It2PtyuiHGk1yGDVmcS8pSukcE/c+NkrwXqDyDeB0EDX2kSZjX
	wt8xHM+moBXqT8+ifeYYhCvWYv0UYqdCjw61puZHFNaU4BsSdRll1eUxDxcDLTeAQO5B
	FdFON4FTZgkA0Xcf9SMMROakv1odDdjmWGFVYg5KMdCuR0EFWTcnU0bD6cyXAL0e1c1h
	t5V/gUUh2DdmOOhKqo+PMTGEaFi6Y7mcJjl9g9w2LD2cDjy0b9k84IDNhO0nPYzeEa4l
	6IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=C7P9YUdmh4mbdDTJYv9POh3Tho31+NJDjWEWzVE6W8w=;
	b=d8cHHFJxgix4CVHABD5eGl/80aUQnGM6eYU32rCi+s/EI29qhcfrO7h8dKfrrKjr1I
	IVuMrJ+Fu1C77ZsHr8lOUkqM6a++TKdlQiRkietudAXMWhcGzmQjV0FA3JQB9ee91L8Z
	nQmtCuFYxeVUNugLswAmunQzpzpZ34h4572I58M57hMc4duqPzX6rhEP3awchFRD02jP
	I/S3Ns46RmhclZSIAlaAG+4N9d4muv4bFbUiW+4Aq+akV+Uwg50XfgDONgcu42fUGdko
	tfLV0eMC1oyKxxDav0+EShTqk/s4QnD6gFbIrldlGg8YNg5/IXscLGc0GuZFXrzKUgnv
	4vqQ==
X-Gm-Message-State: ALoCoQk0x2X+dJASvBgocVFkduZv7B2DkdHkCDPugD+bNGaP01i8OGm6na3kxUisCOp39DzL3GhfDD0E+J7N67t84rUfXpBTHQ==
X-Received: by 10.98.69.7 with SMTP id s7mr16287125pfa.28.1449851470344;
	Fri, 11 Dec 2015 08:31:10 -0800 (PST)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	dg1sm26580132pad.18.2015.12.11.08.31.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 08:31:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pfbu66 with SMTP id u66so24662630pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:31:08 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.72 with SMTP id x69mr16450017pfa.88.1449851468425;
	Fri, 11 Dec 2015 08:31:08 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 11 Dec 2015 08:31:08 -0800 (PST)
In-Reply-To: <cover.1449850996.git.ross.burton@intel.com>
References: <cover.1449850996.git.ross.burton@intel.com>
Date: Fri, 11 Dec 2015 14:31:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrkXa9xfTYafiPNXGa4UKGqsyVWpfywge85vgY=xnuOog@mail.gmail.com>
Message-ID: <CAP9ODKrkXa9xfTYafiPNXGa4UKGqsyVWpfywge85vgY=xnuOog@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/57] Consolidated pull for master
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
X-List-Received-Date: Fri, 11 Dec 2015 16:31:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 11, 2015 at 2:24 PM, Ross Burton <ross.burton@intel.com> wrote:
> Armin Kuster (1):
>       linux-firmware: update to latest

Nack! please adjust the commit log to include the revision.

...
> Otavio Salvador (1):
>       lttng-tools: Revert wrong enforcement of Python 3.0 use
...

The runtime test utilities, found on lttng-tools, require python 3.0
so the commit log needs adjustment. Should I send a new patch
revision?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

