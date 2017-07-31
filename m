Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8600E7837E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 04:31:09 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id t201so38383686wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 21:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+FiMPCYNoemcnFLj1skyZVvzAkL7d+RJA+ZPW1UY7w8=;
	b=eIobWMZMY7WkCdtcWKXjR/pMogSaBDOh7TPf4IuxWucAlFYMUECJPgxZ3JIockccWa
	DGIjSK1ecVfu+ttC2npSQpNruMid7Hsga0dPVW/4bgjNwy/dno1hj7ZB5ZqwgIsZrI2p
	9+LAS3MOFQkVIlp+kPXUu+Tsn/4/3RO2I+FT4EC+NN/Vgayz+pr4PCyOVrVmIDHyVjhR
	ddNvnxnZPEagcd18Cm+Xnox6qC7ON+8FSsXZH2q3hOO2wzc5RPPGXz+iutY9E7m2tkbQ
	GK4sZX0ldOVtsOkd35Xibt0wQXb8zjq3PUmazgZeZDO4F64yF+3CJqyGBDJeJfuTwRER
	lyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+FiMPCYNoemcnFLj1skyZVvzAkL7d+RJA+ZPW1UY7w8=;
	b=SrFCoelcrp+VEVTHo7dP96P2QRrRMIJ9Qx2AY2FcGAg+lNu3bqlxhYJlU8WZTw0pam
	m3zPE6lyGRRFZmWLayRjA2cReRPL2EWeEna+5lREt+WF7uXCHgvU0gkDn52Z87jfflqP
	WsfPiJwaH40vUxBHsydg2t+PFM6JZjkLjOzbWkUPUVuvDH16Rh6xwEeCEm85ZbF2I6Tt
	qXXLqezx/WCCsRFLi/hFU6szGLwmmd2t47WOKnZTwN/AqeLqn+NqKXaXUEl/v6WpWKuX
	heVuZCRIgxZdTBjobFWO61zUCisEYuggrAe/GXFGENUw9Sf5VQoUQaQoQE6auueYAnI0
	27GQ==
X-Gm-Message-State: AIVw113NQ8N3ZgQraQs6EbqCUFeHU8uNzGRN0tsB7XtNjr8WNBXV9PYi
	/FA2oLjRGhDukahacAHEnUe4I7bckA==
X-Received: by 10.80.164.18 with SMTP id u18mr12910373edb.250.1501475471120;
	Sun, 30 Jul 2017 21:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Sun, 30 Jul 2017 21:30:40 -0700 (PDT)
In-Reply-To: <a15e5c58-8834-3fec-3f8e-b848d8381ee6@gmail.com>
References: <CAMKF1sqWosmxhDABfXu59DvPHmxMNybw0_5qprvbo+jHDoN+GA@mail.gmail.com>
	<a15e5c58-8834-3fec-3f8e-b848d8381ee6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Jul 2017 21:30:40 -0700
Message-ID: <CAMKF1spWSv+HK1mpwToskZdADa4ga1kFOa4H2aWNcvCMUkLQFg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Pyro] backport request
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
X-List-Received-Date: Mon, 31 Jul 2017 04:31:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 30, 2017 at 8:23 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 07/28/2017 01:08 PM, Khem Raj wrote:
>>
>> Hi Armin
>>
>> Please consider
>>
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=5d3df78367be0afbfe001b4fa776a98a82e6ce54
>
>
> does
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=pyro&id=cc48789276e0f91b37f1d89e418c87ee8bcc2d2f
> work?
>

I guess yes.

Cliff,

need to bump to latest SRCREV on pyro for oe-core in template.

> - armin
>
>
>>
>> for your next pyro backport list.
>>
>> Thanks
>> -Khem
>
>

