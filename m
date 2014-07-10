Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id F14096ACD6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 14:46:41 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so324812qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 07:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=agXVkgl0ONo0HUlhiJ/wctqZuHVn47znnwzUMYKNBjM=;
	b=EuGfpVkIp2DEnvjXrYoXZNSPTvTVMSCjYj9yTBFEiyouDGP+5yWR9iJOmuc8gvB5dJ
	x9D3jlzUKcbiua9QMvm868o+DEESYMJStvKp/ITdQ4KfB9OnVvEEOY5AUPz25xcXgiKu
	r8sHM++MWkYjbHQArS8t8iqgnVooVQgK0Qze1zbgqajvHDx0DjeQ/WNgOCrydVgaM9Ee
	J6hCbWVniW07L8lFKTuvK1P6np2YAPOHwwhGBD/xiAF7IwR6YkUximwVr9QR+mXPpefW
	zb6GAR53QnrLzhIhCBHqeiINTinkLo7cerbZcHWPCbi9kA+L0PczHhNTrA+xPve8p4so
	9fkw==
X-Gm-Message-State: ALoCoQmmu2Z3gUVmaNGOyUhlQeTFZfMXTJmuGvjkNK7DdhcjrZzfnfzUiChWq+i+IjdzbVEAKpPC
X-Received: by 10.224.124.74 with SMTP id t10mr82365925qar.78.1405003601322;
	Thu, 10 Jul 2014 07:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 10 Jul 2014 07:46:21 -0700 (PDT)
In-Reply-To: <53BE9A21.8060606@linux.intel.com>
References: <cover.1404997871.git.roxana.ciobanu@intel.com>
	<56d5da369a640da16ac88ce325b12636d17e0400.1404997871.git.roxana.ciobanu@intel.com>
	<53BE9A21.8060606@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jul 2014 15:46:21 +0100
Message-ID: <CAJTo0LZrUCY5Fh97H06nEoROHcLkZB9R7xUjEC8SGLD7EvtYvQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] latencytop: fix mount error
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
X-List-Received-Date: Thu, 10 Jul 2014 14:46:50 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2014 14:50, Saul Wold <sgw@linux.intel.com> wrote:
> I think Ross's suggestion of using stat() to check for the existance of a
> file in debugfs would be better.

At least one good way of checking if a directory is a mount point is
to compare the device of / and /debug using stat().  For example:

$ stat -c %d /
2049
$ stat -c %d /sys
13

Different devices, so /sys is a mount.

Ross

