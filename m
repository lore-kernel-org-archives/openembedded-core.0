Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQNs4-0006wn-Fw
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 21:41:08 +0200
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 12:27:41 -0700
Received: by mail-ia0-f197.google.com with SMTP id j5so5407703iaf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 12:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=XG6IAYTG+aJlZilfSAEJ6f0B67dm+4td1HKPd0+cPik=;
	b=ASsFWW6PtFVME4NBABW/FWhrlVW3wOvckua6GStUBeM7uLad2vA15kkuR5tzrTGYdp
	UE0+7qYgO/V4qCRyOt8StCaz1YFgwzSM20AEP1cGZaznYKjPUui3xhxNKehlDWL0nX7X
	OGh0oFjfVDAOOPwOTJ6J+iF4RBKklmjL11Dv17bagVkxCSXdR0F9QgqaQevBkPM1BsyQ
	c4XEL5YCUnVtZe2gkYPIIW3iWBEX4iKVSnLdsrsNYIZiGAvA4AU5ixnAfKj3szEnjbpo
	ryEMjojNZLt03QJz7tHzo+TniaRvWsBpLC0OGWbZAhpCZmHym45Yplzrgse/urFxg+O2
	1Bvw==
Received: by 10.182.225.5 with SMTP id rg5mr7957937obc.49.1350934061000;
	Mon, 22 Oct 2012 12:27:41 -0700 (PDT)
Received: by 10.182.225.5 with SMTP id rg5mr7957920obc.49.1350934060779; Mon,
	22 Oct 2012 12:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Mon, 22 Oct 2012 12:27:20 -0700 (PDT)
In-Reply-To: <5085800A.4060600@r-finger.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 20:27:20 +0100
Message-ID: <CAJTo0LZ=Z803V-joHd17qeMqm3XaNGEnJavSeb=LBzqcLW9AbQ@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQmc6vhaN561s9tsG+sfVrtrf6aS8mP2cH9oa1XaziDvQQ8zUR3ZW0VudoqF3+OUGnzqghx5oFDcfc8XJrJqSQU3Qc8lqpA/t20GlpR2qA6AiUzUBOrzZIET+NQi/1dZqoB39LwYjXhIZUy6T+Aay2WI1hkTPI1gkoT26rQ50z+wuYflZsQfIYKM5ylzjOMpIRY7YNVf
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 19:41:08 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2012 18:19, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> Our
> current difficulties stem directly from trying to pretend this is not
> the case, or that mesa is somehow more than just *a* GL provider. IMHO
> the correct thing to do here is:

Mesa is the only free GL provider, which does make it useful in an
open source build system.

> a) Make the mesa packages machine specific so we can control compatible
> machines and preferred providers to match the HW realities,
>
> b) Split the ginormous mesa recipe, so that it is, for example, possible
> to stage mesa gl without mesa egl, so that we can accommodate HW that
> wants to use bits of mesa.

This would be the "complication packaging tricks" that I alluded to in
the original mail.

Ross


