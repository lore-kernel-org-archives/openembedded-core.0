Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0165B74D1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 17:39:16 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x191-v6so11630974vke.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 10:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wGb3NKuax9yT5uvsIzTpxDRjqUGO02Xhdu1UDw1yqW8=;
	b=EEFYYqjBkC1tFW9w6kkbSAyMs/dg3/nGm6N/46cUk8927isAFo7OgpXPz04ye7BOL4
	nlHxhGy0JnSuyOJ+1fsm5J4mO/6nQw+lCQmOam/Da6AM7tMDc/hHH3/0NTCrhIvfSyxx
	kTWA26b9Z7vosr4nq+3L3WIGtVEcBcjAx2V7sxMiW/PX4LHw84XkwKlxy5WZEbYzp+2r
	JOxcNnrTLQJrGnb1NE1VWWLrl2s1x1UzDxnF+v2PwluZqXA9OYi6ZbIkTSA/qkG+NQZ2
	XV5+efMm1IJ5eDx/z0TEUphLvjz5+/oR7wJAQZQplBG5T3kG5xASnze8bts/vw9gTREy
	+1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wGb3NKuax9yT5uvsIzTpxDRjqUGO02Xhdu1UDw1yqW8=;
	b=htp3AX3BSWgs3KBAoUe8PoO8doADP191x9BSRmsfdhTb7Ybt+p55UocO1NVzqeoQxX
	ppmSmrNt1LtdPH+gtFoV8oKRVfp4DO9p78FoHnAaNBS2fE3Ojj3JF3gQigKK/3CVdj5Z
	5x1LmJTNJkW0fuk67u8f/xS9pOZ4L1rXriMHaZXK0wKvGODMCq158UD9K9+ZZnG3+6HB
	aa2yrXi2SzXbDFq74cJgKtGBlSe2RjilbxCAKzoWh4VhTYkao5v+Sio41EYljBYZBuVh
	yVodpD6BttkVRdMfWzb3HSa2ICMAtTJOh/wMRTWUnZ77Gntkg9XTl635YZ5RxYxLCg9c
	FUsw==
X-Gm-Message-State: ALKqPwe7vw6yaXZIiwmUyniyDdPNw3mUWuFpR6WkwweZmUc7RaPFUwDh
	UlwAq+SMtwVODn1amzHm72qAjSTKLqv6rpkwEmQ=
X-Google-Smtp-Source: ADUXVKJ3dNpppIrUyHCsHdNgpa14QMNmj+mKZ11W5rDbPzhISjObeJVnVjlapPbJHk5o5L63pFsEETAkY/qkZ5+NlJk=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr2126242vke.5.1527701957162; 
	Wed, 30 May 2018 10:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 30 May 2018 10:39:16 -0700 (PDT)
In-Reply-To: <4ab499de-5f57-520e-4951-91f15115435d@gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
	<84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
	<8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
	<20180510191612.GB1954@jama>
	<4ab499de-5f57-520e-4951-91f15115435d@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 May 2018 10:39:16 -0700
Message-ID: <CAJ86T=Xk+fUWoOM5igiD6ZBTQfb4opLooTa3HeAFHVs7GFAvDg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
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
X-List-Received-Date: Wed, 30 May 2018 17:39:17 -0000
Content-Type: text/plain; charset="UTF-8"

 On Thu, May 10, 2018 at 12:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 5/10/18 12:16 PM, Martin Jansa wrote:
>>>
>>> On second thought, this probably should be enabled using a config
>>> fragment, since its not gonna link in another library it may not be
>>> common case to justify for a default config.
>>
>> That's true, I've enabled CONFIG_FEATURE_MOUNT_NFS mostly to show how to
>> reproduce the issue.
>>
>> If there isn't interest to enable this by default, I'm fine with keeping
>> this
>> locally (to enable it only with our defconfig changes which enable it).
>
> I think keeping it as a nfsmount.cfg which then can be applied via a
> bbappend could be a good option. May be adding a PACKAGECONFIG to control
> the -I flag and libtirpc dependency would be nice too

According to the busybox config help, CONFIG_FEATURE_MOUNT_NFS is only
required for kernel versions before 2.6.23. Do we officially support
kernels that old in oe-core? Or should this be in a .bbappend etc in
separate layer?

//config:config FEATURE_MOUNT_NFS
//config:    bool "Support mounting NFS file systems on Linux < 2.6.23"
//config:    default n
//config:    depends on MOUNT
//config:    select FEATURE_SYSLOG
//config:    help
//config:    Enable mounting of NFS file systems on Linux kernels prior
//config:    to version 2.6.23. Note that in this case mounting of NFS
//config:    over IPv6 will not be possible.
//config:
//config:    Note that this option links in RPC support from libc,
//config:    which is rather large (~10 kbytes on uclibc).

