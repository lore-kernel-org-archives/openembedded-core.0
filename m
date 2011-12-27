Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rfduy-0002hx-QU
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 21:46:41 +0100
Received: by qcqw6 with SMTP id w6so6726918qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 12:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t40Onlj6wqwOuKxVhmMUBP0ef4qRFplou28TTOQJlOE=;
	b=EtQoYu35BKsz/OLeXArtFgcD1kFMJUpy9XhFRNEosCPf3cpaadI+qcUgz/pm3Xt/3g
	WxMLi+12HdfZHhlbE0frXrUCGSoUsurLUmWyL5BhUya4UJ8RWX40dsCoYo6sfWbrkd7U
	18Dkp8iv4CS500pg4nKUuJe8DFOmUkC0/W7tw=
Received: by 10.229.77.69 with SMTP id f5mr10807516qck.107.1325018359333; Tue,
	27 Dec 2011 12:39:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.187.141 with HTTP; Tue, 27 Dec 2011 12:38:58 -0800 (PST)
In-Reply-To: <4EFA2B81.4090405@linux.intel.com>
References: <4EF0C808.8060609@gmail.com> <4EFA2B81.4090405@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 27 Dec 2011 13:38:58 -0700
Message-ID: <CABcZAN=kQT-imznF0wRWW_Nazs+YefcC2YY-yk+ckp6gjV757w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
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
X-List-Received-Date: Tue, 27 Dec 2011 20:46:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 27, 2011 at 1:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Do you need to pass d here?
>
> I am seeing errors (see
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/295/steps/shell_14/logs/stdio)

Bah, indeed, apparently my testing didn't hit any recipes using
minrev/maxrev/notrev. Will rework the patch. Grr.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


