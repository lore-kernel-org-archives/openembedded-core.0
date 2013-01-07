Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsBs3-00023Y-Rz
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:32:04 +0100
Received: from mail-qc0-f200.google.com ([209.85.216.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 04:16:53 -0800
Received: by mail-qc0-f200.google.com with SMTP id l42so29499020qco.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+x9ceWicNPY4/hWVi3z4VFmzWCo7g+5PfBmGi498QTw=;
	b=fIB7RvciEatW4kdCIOKu3ugXm9z87ufv0N1cQq2NfprVxvv7amtTG42PBT6cMa5inL
	KT7X0tZQO673THF0ugs/Q5+6ZSDqdSugcQqMtnQlgY40sQHstLI+iM2K1jLq/Htu8xEg
	1c37dF8e4TruAZ6x6lnV6+xHwnHuMUiv7Zzlxh8cChrMa3rGZdGuHIodZ6Bx86SgLSeZ
	OF8eXOcx5sQe9kU5+VnNyzkkoFZh0ExL/MhGLkJmqjPG+MgRqQFBfa1j+NTIiVeGJl0g
	nbK2sX0d/o2wxy2OdyK47Zf+tbxpsjKaXByYlADKngi83U5BmzlugftL3O+5r9PvK+F7
	zRKQ==
X-Received: by 10.52.72.232 with SMTP id g8mr71994817vdv.69.1357561012173;
	Mon, 07 Jan 2013 04:16:52 -0800 (PST)
Received: by 10.52.72.232 with SMTP id g8mr71994814vdv.69.1357561012101; Mon,
	07 Jan 2013 04:16:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 04:16:31 -0800 (PST)
In-Reply-To: <CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
	<CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 12:16:31 +0000
Message-ID: <CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQlLUmHeHAeBDYQmH3ngPDAuMCm/K65FOTCIZtXEHbCvDZ62aMGzGFEHtK9Veli2KRhKZbdRS83XT5l8jaC20ldH/2FmhHFMFC0BsqhvImV9ETgP73Dq4HfXm5dCX4n4bGAbSKmnzVKx6hk5BNkf+RnSMA+wls56vgkCVpb4UXq5GVK7ryIkXLaDB+I5KkIrrBAHTMm2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 12:32:04 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 12:11, Marko Lindqvist <cazfi74@gmail.com> wrote:
> What's the correct status for fixes that are not really backports,
> but have happened independently in oe and upstream?
>  - If practically identical, still mark as "Backport"?
>  - If different solution, "Inappropriate [not needed]"?

If you did it and then later discovered it's happened upstream
independently, it's essentially a backport.

Ross


