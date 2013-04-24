Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV1Fi-0004au-NJ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 17:05:03 +0200
Received: by mail-vb0-f52.google.com with SMTP id w8so1705775vbf.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 07:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=KGF7rnKLSuotjcG7Tn0O66XOmJcXEJu3ywrD90yJQ3U=;
	b=oDCYgvOvfLGDolz3RuWmDdBAePeJa0lq88l0axGpHMMdGB5RXSzRAvULG/vayq4AGn
	GVftJz+8DqXS6xwOplBa180uK2iOa6ORiY6nyftsBaoHSLYnPKmquaUkFi4E9qm+mAf6
	ADdKdajGo92EPD2S1kzHOH52Giv/f7HaZZZfVTk8PYG9twwBN0sI5vwGTAFO+ytek83Z
	iskEt8cZXqqE7FA4xQH0FXq1AO8BI1zBslxwMYrnkjKxTu4ucuaO2snBSaCeOctMEwu1
	s2kq1Fx694ua81hF+BiRswMPyoD7NkexCLzUiKz2emBgFCizBg3gAVNVZwBBOr+hTERf
	XsFg==
X-Received: by 10.52.117.212 with SMTP id kg20mr861561vdb.55.1366814836398;
	Wed, 24 Apr 2013 07:47:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 24 Apr 2013 07:46:55 -0700 (PDT)
In-Reply-To: <5177ED28.8000701@communistcode.co.uk>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<CAJTo0LbLaycJ1YNRynLSGPpaMWunj3e=RZFn0ENVGVqd-djJ1A@mail.gmail.com>
	<5177ED28.8000701@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 15:46:55 +0100
Message-ID: <CAJTo0LZpnXqrNRrOq3DtvojkyhTgkpbwHjLn4DSsaCY+o3GsyQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQlwoeVRu9LEYH1xrL+P7p6TBcxTd3AzTiozlbsoEivZpijpzEe9cWihnAgkrHE8mLPm7PWq
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: update to 1.13
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
X-List-Received-Date: Wed, 24 Apr 2013 15:05:12 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2013 15:33, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Run time tested on a beaglebone, armv7a.
>
> Specifically ethernet provisioning. I needed a patch present in 1.13  which
> was my motivation for pushing ahead.

Doing a qemu run would mean a lot as connman upgrades are great at
breaking the configuration there...

Ross


