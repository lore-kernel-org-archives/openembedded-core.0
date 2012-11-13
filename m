Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYJhC-0005vV-7C
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 17:50:46 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Nov 2012 08:36:46 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so1219111oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 08:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=llVWwggSLQPZGAi3yzNHdRiUnX2JoH06rMu9TSNDlYY=;
	b=VA1usZbw8lgrljJ9q/1cPC/8zmIop7ad5ZtCFAzLs7NYAcElCtFwSsfSxt6Upn1EJa
	XuZIYDnhnBOrXla8lo1lKpRe77Nz7W0VUJLCQVPjxXhOYrb5esj1tSwYw4sIwPUDHcvH
	nYjllDlByVrZAwL1QG4m+E3kcORbfs63GmYoJOlybLnojMO6QctAY4bWW85eR4BtuBQP
	bv3vtUrWr3DRlr5QaqOFsQR0vBRYs/WAGdD4cXdnVb1REirWiP29IzQT+66LVErbfk6E
	tCgtp8WhxgI5uacYudLD8+N92vCIsqZ06iIJyAkzMsOvJ/uFlclfielKtWszWv24mVt1
	HQhQ==
Received: by 10.60.2.103 with SMTP id 7mr2651105oet.79.1352824597328;
	Tue, 13 Nov 2012 08:36:37 -0800 (PST)
Received: by 10.60.2.103 with SMTP id 7mr2651096oet.79.1352824597169; Tue, 13
	Nov 2012 08:36:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Tue, 13 Nov 2012 08:36:16 -0800 (PST)
In-Reply-To: <1352749931-10687-1-git-send-email-radu.moisan@intel.com>
References: <1352749931-10687-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2012 16:36:16 +0000
Message-ID: <CAJTo0LZpERoiq0E5o=B++uL=aLc0xt-Ze1rz5QNwZt9EqxnZnQ@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQmR07+KUqwzuIb8IbiYu4B/R+NqyGZt8KHcG9IGO2pZqbSJQ7oS112O8nImunkSdn+t2nq2OtZEBOswnwmhaT18Joy46aeA3UlYZIkwGAdYU9aZI9cwx7UH8TjSS2tljJGqXEnwSV/hiGze8kp9vvb2IqOUApf6yCry9w68v2xQaFSV8fIwq9tZ/ppV5B9kPGNqTsD8
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initrd: add recovery feature
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
X-List-Received-Date: Tue, 13 Nov 2012 16:50:46 -0000
Content-Type: text/plain; charset=UTF-8

On 12 November 2012 19:52, Radu Moisan <radu.moisan@intel.com> wrote:
> +# wait for the udevd to settle
> +echo "Waiting for udev to settle..."
> +sleep 3

Pasting from Otavio in the other thread for this patch just to make
sure it doesn't get lost:

> This doesn't work for all machines as the time need depends on the machine
> performance and the number of devices connected.
> You can use the trigger --settle in udevadm.

Ross


