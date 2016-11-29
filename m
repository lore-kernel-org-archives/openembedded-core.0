Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE24671AB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:51:10 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id a124so277836603ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=dgeGumGqWVMP1dJmliKcgShSuTlSwGF0woR9zBl/+qM=;
	b=Th92Ks/YBYhbJk58fSHyIocLg6NmlmJvhtAov2R5iMQ28OfRd5FOpinlpuvGIhYxBu
	gxtAszVKP0lvHKJG9AhJN3pLGIlNnFRhifbE4cQWI1eOC1sl9v+8hrXRnkuzg4ygStxf
	aD3UmxS+Qo9ofNMhtCcz/g/fH+aWcagyrYo/fpHkYEhDH1yajtYlhXJ+nXP+OcmuC2Qc
	vq7zunUoOmHKu/qWTwDbZZpqsVvFvHVTymkmgokEux1MoEF0oS+DKwIED9RI8gBiHuBQ
	F1sjMiLA+sIBZlOwiY3jRpSfXX8XJdShS+z8Opjd6qogTbLftgsm337pitjJ+0fcm1PQ
	W2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=dgeGumGqWVMP1dJmliKcgShSuTlSwGF0woR9zBl/+qM=;
	b=bJRkJYjNeO3fWnfRxBPeuBoZWGR9QOuxZLe7mXiUkxTL8tm2ZD72Mawd3wKX2bxtGg
	6lKt47txUKRxP8xE2ljZzMjSq902frLY2rRdGo9WHGM5aewD+dNGqr3I0ohwIbYdLjdK
	lUFHR5Bf23o3N9dIuW6VkiUZvMOUG/IyzBSo9rm8fn38cIq/erXGkE7ktevXuB7eojj7
	glUczj5vxD/ULA6cdaoMqSJVgW4O/2STmOIA4apU5XIMiuVIfcpHPfguPmy4JXpKqYrz
	PwcRNVVTcfzz17wJurhwxIjAlr81DhsIhVgcjbZ16vXfzHuMTICJxmeJN6q7vihVzlK1
	k7+w==
X-Gm-Message-State: AKaTC01gYgNDmzoUaYwzFmN9j7mUX1bvyOR0re1nvr9Gvc16u4Uvj5V1koR9dvi0SAacG3vw
X-Received: by 10.107.131.195 with SMTP id n64mr23257049ioi.161.1480409471648; 
	Tue, 29 Nov 2016 00:51:11 -0800 (PST)
Received: from pohly-mobl1 (p5DE8EEDB.dip0.t-ipconnect.de. [93.232.238.219])
	by smtp.gmail.com with ESMTPSA id h17sm554532ith.17.2016.11.29.00.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 00:51:10 -0800 (PST)
Message-ID: <1480409468.6873.232.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Date: Tue, 29 Nov 2016 09:51:08 +0100
In-Reply-To: <e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480362425.6873.209.camel@intel.com>
	<967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
	<1480368843.6873.215.camel@intel.com>
	<e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Tue, 29 Nov 2016 08:51:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-11-28 at 16:35 -0600, Jose Lamego wrote:
> 
> On 11/28/2016 03:34 PM, Patrick Ohly wrote:
> > On Mon, 2016-11-28 at 14:28 -0600, Jose Lamego wrote:
> >> Agree. Please provide feedback about below comments and I will submit a
> >> v3 patch.
> >>
> >> On 11/28/2016 01:47 PM, Patrick Ohly wrote:
> >>> On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
> >> More than 1 "In-Reply-To" and "References" message headers are in
> >> violation of rfc2822 [1] and may cause that some email-related
> >> applications do not point to the appropriate root message in a
> >> conversation/series.
> > 
> > Fixing that makes sense. Just add it as reason and the "why" part is
> > covered.
> > 
> >>> And I don't understand why this proposed change has the described
> >>> effect. Does changing the threading parameters change the output of "git
> >>> send-email" and thus indirectly the mail headers of the following
> >>> patches?
> > 
> > The "how" part still isn't clear to me. Perhaps I'm just dumb, but would
> > you bear with me and explain a bit more how changing the sending of the
> > cover letter affects sending of the patches?

I've tried out your proposed change with
  bash -x ../poky/scripts/send-pull-request --to=patrick.ohly@gmx.de -p pull-11827
where pull-11827 is my recent bitbake submission.

The resulting emails are still broken because that one line that you
modify isn't event used. It's under "if [ $AUTO_CL -eq 1 ]" and I am not
using the -a option that enables that behavior.

Even when I use -a, the result is still broken.

The root cause of the problem is that both create-pull-request and
send-pull-request allow git to insert In-Reply-To headers.

"git send-email --help" explicitly warns about that:

        It is up to the user to ensure that no In-Reply-To header already exists when git send-email is asked
        to add it (especially note that git format-patch can be configured to do the threading itself). Failure
        to do so may not produce the expected result in the recipient’s MUA.

>  What I'm doing
> here is to include no reference to any root message at the first call,
> then including a reference at the second call to the very first message
> in the chain, which is either the cover letter or the patch #1.

No, that doesn't work. Whether the first call uses --no-thread or
--no-chain-reply-to has no effect whatsoever, because when "git
send-email" only sends a single email, it doesn't add headers, and the
second call was left unmodified in your patch.

The right fix (tested successfully here) is to use --no-thread in the
second call which sends the sequence of patches. I'll send my  change
for review separately.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




