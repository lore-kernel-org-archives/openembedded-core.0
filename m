Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHxoD-0002w9-4j
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 15:42:05 +0200
Received: by dadz8 with SMTP id z8so1205343dad.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=727oqlH1VdTM72/qTqkv2G826lqjTCQME6XyTdaaaMM=;
	b=rglsMPO5yUOm1KBh23yCtMZwWcFg66U1ytcW4GArbpGDk6zUi0nvsMmUynnVCCjz44
	DvIBL56k/f6hSDrfIZ6eJ4qbW/3H1inF8DPzZXGsNB9sHD2MrKRtImQ+2FmndlPG6PR0
	uXIwlNcAzGD7RN2cvf0D2hUYSw1eP71p9QEfp6DTQ8I5ETycNMxyaAq62BRGeNtco5ED
	z7PVReBxcgP/4sUuzAzHwzsddraFCkR5AMdqU/KaHlk3Y3m7wTegSjfIRymOlHmhAACg
	rj4sNT9F+hWPIGG9bETiWP6BFBYjfOJ9LSWBfYZkv+T+NnJfkB3143a3QBcKrWv04TcB
	vtEg==
MIME-Version: 1.0
Received: by 10.68.73.138 with SMTP id l10mr38234276pbv.22.1334151165503; Wed,
	11 Apr 2012 06:32:45 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Wed, 11 Apr 2012 06:32:45 -0700 (PDT)
In-Reply-To: <1750426.snX9VXDpzX@helios>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAsGkFkBnFXfWzcx6UTm12SY39=VU6SFKT_iTsxH6=wmtg@mail.gmail.com>
	<1487451.qaDevSNUCm@helios> <1750426.snX9VXDpzX@helios>
Date: Wed, 11 Apr 2012 15:32:45 +0200
Message-ID: <CAAQYJAsC5ww789p2-zemnBPVmy1QhX5Ljr=KhpAut7+P4GLOig@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 13:42:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 11, 2012 at 3:18 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 11 April 2012 14:15:57 Paul Eggleton wrote:
>> FWIW, I can report that with a patch to the rule such as this
>> one
>
> Just to clarify, I meant Andrea's patch to the udev rule, not the NACKed
> kernel patch.
>
> Cheers,
> Paul
>
In fact the patch had been already NACKed :

https://lkml.org/lkml/2010/11/9/270

Dmitry Torokhov
"No, if device does not provide true pressure readings it should not send
ABS_PRESSURE events. Please fix your userspace."

I think this can explain what's happening.

For the specific case, instead of changing the rule, we could just add
a new rule for that s3c2410 based on the ATTRS{modalias}.

Regards

Andrea


