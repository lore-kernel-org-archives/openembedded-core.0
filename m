Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0407465CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 13:20:09 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id x49so17257183qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 05:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q9rHf8oWZk9/YfUtFjNxBhq99ZmtlTcMYN6yKAEwRYI=;
	b=TuoK7EQUjz6/5zUdYOInTnHkV/72qfyVhor/1kMBLD+GTqcRjAZwxdoAk66qMvQ1dx
	o09jZYFb7LhkR+XcP2oVreeJdwlSu1YnnqHnEIKNZSYZ9KQNAr32gZV9vW7LCVP7Ilxz
	60TCJNqA/mc+EtxOXi/gbVj7+DcHd6BSRkHG8vOh6owUayL0+wz3c02uAhxd+ksYJM5O
	aNgTJNPW6e3IGFN1Zu64r6xKUaGr3ZqeTa7KCjaZU/6Rd9VHj2Y/PxPilfb8byG6owtj
	VAj+o/Yj5MW9CBilEdxht2/lM01O/W7+2BDUZn7HCKEkqq2oAGPUFJhvYdyAo0POrDjV
	NxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q9rHf8oWZk9/YfUtFjNxBhq99ZmtlTcMYN6yKAEwRYI=;
	b=jiuUyQ3iJGE+0cjw6Raic253Dnibb5iRVOlo9tFf4Wew2XsK9lGwag6n0RR79+LP10
	jnKdzTLMDfDUUfQA3epiYPVU/HpkbgBODIMJ9itKJ0D9VmwO5Q8wpGO3O3Bp1MfA2eCc
	QhVrr/MCfaafzAu4/o8wqDmAYw8HnpuYo1OLCXVsRxoj9/7BQhs5cCO1lqQplEY03MDi
	zcg0QQIExrFUNzONHH0PUTjLdIAKd3WnpoTsveuRBuY/6FcjMJQHFTD9dzX8KASIHHWV
	0HsKCQkgrCeyr+BBr2UFSlSAEUXb7icU8/tihFUWbenPEYMBx9/8EiFida/qCZ7aKdZc
	iFuQ==
X-Gm-Message-State: AIkVDXIxQ4ZK4PUdhrM2dqTI0F7W7MhfN5K7dMX7XNz2w7+8HrcnopxP6uRi0zuQv4rqQPy3pVpmaALpKgOs6eWm
X-Received: by 10.237.62.232 with SMTP id o37mr12072221qtf.188.1484227209904; 
	Thu, 12 Jan 2017 05:20:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 05:19:49 -0800 (PST)
In-Reply-To: <7761b4f4-aa4b-bf5b-646a-e5af208a8d7e@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bd50489338d4e001bc7f5511db02792b311a3672.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com>
	<7761b4f4-aa4b-bf5b-646a-e5af208a8d7e@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 13:19:49 +0000
Message-ID: <CAJTo0LaFjA8H5WueuYXVVXwKFFTWuH20MrU32U0DxYYZRS16jA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/4] selftest: imagefeatures: skip tests based on distro features and supported fstypes
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
X-List-Received-Date: Thu, 12 Jan 2017 13:20:11 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e9ce5950545e5931c

--001a11406f0e9ce5950545e5931c
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 20:06, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> This test is pretty pointless, lets just delete it.
>
>
> why is this pointless? if this is the case, we should then remove the
> core-image-clutter.bb target
>

The test just builds an image that contains clutter, but core-image-weston
already does that and we dont really need to treat clutter any differently
to any other library.

Yes, removing core-image-clutter would make sense too.

Ross

--001a11406f0e9ce5950545e5931c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 20:06, Leonardo Sandoval <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">l=
eonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D""><blockquote type=3D"cite"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div>This te=
st is pretty pointless, lets just delete it.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    why is this pointless? if this is the case, we should then remove
    the <a href=3D"http://core-image-clutter.bb" target=3D"_blank">core-ima=
ge-clutter.bb</a> target<br></blockquote><div><br></div><div>The test just =
builds an image that contains clutter, but core-image-weston already does t=
hat and we dont really need to treat clutter any differently to any other l=
ibrary.</div><div><br></div><div>Yes, removing core-image-clutter would mak=
e sense too.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div=
>

--001a11406f0e9ce5950545e5931c--
