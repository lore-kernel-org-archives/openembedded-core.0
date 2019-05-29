Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3C27E33D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:12:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w13so1726461wru.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zBXwP4ou1q/OXjsZKmdCMlzC6CCbRkLxXK0Gp/Lwv/M=;
	b=Cccvs+R1qUXsOZLlwrHCznMEpt/ky7xIDKX5GLf+RSml4ZGvwwF47Q6fCGmJMY4pqF
	z2ne/Fq0ApPmrZWhXhQD5x4t8+VezKDGvDaEuHHm2PP9qXcXDpGW9Q+eaUAathxPcmiF
	6xN72v9+XUNzznxf++EPNQmoZrntyBv/M8GXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zBXwP4ou1q/OXjsZKmdCMlzC6CCbRkLxXK0Gp/Lwv/M=;
	b=Nh2yiHXAza+x+C8JMMI8T30rn2zktkqijkJm4/Kkr9ksrZpeBeBOgek1XR9IdbzkoO
	etjitmHOx+a+nGZz3ScwFdQp3qm9jRwh42DPc4JYm9+y6G0FvzMWvXiUrmDP9elNa1dh
	e9Erz/IcF8X6QXh5vLojziV8mJJDCwU6STsV3FJkgfeZziWM4ai7TKkI32Cc3xGnHqVy
	ncVtkhVDPvxznFGsv5aAJKZtpGPSO+Krr0Y5B3ZX0W+0ficr+2Oo7uC1aZDiueHQXb/a
	xb3CEvgUnLFTziUD6Fx9OBKyPM0JdUnkrXVwdhTaaDmSeQgTzOi6izoZG32WJyBn+TUi
	+vQA==
X-Gm-Message-State: APjAAAUa4hEi2bq+jmtD6wVi6N3mOydztmSZhwisvwlM5ZTqJAxmEfqf
	BLELHqLIchiK+PV4WdzEJBr88yCmzZg=
X-Google-Smtp-Source: APXvYqwLy/bkDWf88eUfD6vwVhqWuCkHvP+6m2UsKwH4f8dQONQe+HrsNWrotbCndyOQRw36YeyVQg==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr31237604wrm.98.1559135565207; 
	Wed, 29 May 2019 06:12:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	205sm6949694wmd.43.2019.05.29.06.12.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 06:12:44 -0700 (PDT)
Message-ID: <e8e0946b42089f4bcfa406d40d75dc137d186e9b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	<sakib.sajal@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 14:12:42 +0100
In-Reply-To: <1c7fb2ac-bbda-7b16-5aee-416ad8ee5be6@windriver.com>
References: <20190528143104.30168-1-sakib.sajal@windriver.com>
	<20190528143104.30168-2-sakib.sajal@windriver.com>
	<638258f243352200f2456b43bc14bd6a83c0579b.camel@linuxfoundation.org>
	<1c7fb2ac-bbda-7b16-5aee-416ad8ee5be6@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Bash: Allow new-exp ptest to pass when run as root.
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
X-List-Received-Date: Wed, 29 May 2019 13:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 09:08 -0400, Randy MacLeod wrote:
> On 5/29/19 8:35 AM, Richard Purdie wrote:
> > On Tue, 2019-05-28 at 10:31 -0400, Sakib Sajal wrote:
> > > The ptest was failing as it was expecting non-root user.
> > > Ptests are only run as root.
> > > 
> > > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > > Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
> > 
> > Rather than patching the code with a patch which we can never
> > upstream,
> > can we run the ptest under a non-root user?
> 
> We considered that but when I looked for an example of oe-core doing
> that but didn't see one. Did I miss it/them?
> 
> I suppose the /usr/lib/bash/ptest/run-ptest script could:
>   - create a user: say 'bashptest'
>   - run the tests
>   - delete the user.
> Of course we'd need to add dependencies for the user mgmt tools.
> 
> Is that what you were thinking?

Yes, there is prior art:

$ cat recipes-core/glib-2.0/glib-2.0/run-ptest
#! /bin/sh

set -eux
useradd glib2-test
su glib2-test -c gnome-desktop-testing-runner glib
userdel glib2-test

(openssh also adds a test user)

Cheers,

Richard



