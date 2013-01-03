Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqtOL-0006ml-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 23:36:01 +0100
Received: by mail-vc0-f179.google.com with SMTP id p1so15665515vcq.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 14:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kso64q+Y0ujKFFzkSwV92VazJNCdGKFUItl5gtSpqRQ=;
	b=fzwBybx3qOc2UbjPhKMp1iybvt1y3bz8ujoFpYTZEiDJ5467mKf3DfAa/+Ue1QdZR7
	HAmYFfCzVeGMAe16lCT2A+mvvdDPcgM+2NpJwlOerg8L53Pts+qoU4nzY0Yhpj0AGwQ5
	CpsN/VBAtTDZ7CegBKdNojxqEEAAVzOF0ndEyNaST3jfAzjqjR9VX4nGxum/xVdvG/bg
	jrPb4UKYFq+6Ag433tad2W25yAlqxJiiwM/Lbzt6qbBRonDKOsgTKb9BjPjSDLf9Z2Qa
	cW39OiuCd993YkVSKWFoE0NVTZ+CnlomdTf+x+Semm0HDxLQxsUHZVJ3y4664yGY9Z8i
	IQfg==
MIME-Version: 1.0
Received: by 10.58.49.130 with SMTP id u2mr78069542ven.0.1357251656529; Thu,
	03 Jan 2013 14:20:56 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Thu, 3 Jan 2013 14:20:56 -0800 (PST)
In-Reply-To: <CAF6bG8eM827RGkAYvV_xwFx7MBy25OLS=kqYwHthNrDHGpRLYQ@mail.gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<160EE236CFD44F58901B43D12D55934D@intel.com>
	<CAF6bG8eM827RGkAYvV_xwFx7MBy25OLS=kqYwHthNrDHGpRLYQ@mail.gmail.com>
Date: Fri, 4 Jan 2013 00:20:56 +0200
Message-ID: <CAF6bG8ddqhBEUWQ_emhJQiUo2v=Dr4h-g5OsprLYy8eBcA0UEQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/15] popt: disable tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 22:36:01 -0000
Content-Type: text/plain; charset=UTF-8

On 3 January 2013 23:49, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 3 January 2013 23:22, Ross Burton <ross.burton@intel.com> wrote:
>> On Thursday, 3 January 2013 at 20:36, Marko Lindqvist wrote:
>>> Use of $(top_srcdir) in TESTS is an error causing automake-1.13
>>> to abort. Disable the tests completely.
>>> +Upstream-status: Not sent

 This should be "Inappropriate" of course, not "Not sent" as if it's
proper patch I've not yet sent for some reason.

 Many other Upstream-Status could be already changed from "Submitted"
to "Accepted" or "Fixed", but those one can find out following the
ticket numbers already there.


 - ML


