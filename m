Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 128086A9D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:56:11 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so8199894pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PfeYyLa0GbhmMr9KitjKrclWb08J5pPzUoEu7IDVbCM=;
	b=HAZIhWX3N/vVQqScdR2gAu21qODIaAmAHVbiDQPMsLdIWfRPQu7VaCiSWnMrVZlesZ
	CoC1u5Zw6tnpkR+G/enKV/cYnqN0xofLUoVaNAhljIww6z/MYeRgY3/MjSmBZA4uPjCG
	Kgy+gGbl0FfwUMy8mBEIBdK9N7g02YWfEDG3x9PI3CqNMmb39y3fIrr4m9G9n63tYBxH
	chiSYS5eY8CD03K9dmMi0ztgvUNrm+Jvv3hfDHDc1xis2hGPvo+BG9XWF7w8t4LN3nAL
	gPsX5ORkyNjZz4FQqMRjOA9/xLn4ofrb4ssqQz09mI9M0bMtSb+dPMOAplaWO3kQykgq
	Ll/A==
X-Received: by 10.68.139.33 with SMTP id qv1mr13771399pbb.93.1370944572117;
	Tue, 11 Jun 2013 02:56:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Tue, 11 Jun 2013 02:55:52 -0700 (PDT)
In-Reply-To: <1370851201-30757-1-git-send-email-net147@gmail.com>
References: <1370851201-30757-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2013 10:55:52 +0100
Message-ID: <CAJTo0LZpELh4JirKqCka+ZG=UpGNS=xxCr=t5L-cyQrRy813Pg@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQmpi9M4BFORACOes1C20u1CzEo+65ELG/QTbvUhllzxpwKS5+H7elmRLFqfV2IAh3A2oFCs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: remove unrecognized configure options
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
X-List-Received-Date: Tue, 11 Jun 2013 09:56:11 -0000
Content-Type: text/plain; charset=UTF-8

On 10 June 2013 09:00, Jonathan Liu <net147@gmail.com> wrote:
> --disable-glut and --disable-glw are not recognized since Mesa 8.0.
> --disable-glu is not recognized since Mesa 9.0.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

