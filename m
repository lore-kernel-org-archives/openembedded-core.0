Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80F6D7C446
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:39:27 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i10so9415094ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R8WF5Xp9xFWM4oYH5CXQZJ/A0KgsyIstCnPxr7hzJfE=;
	b=Igzh3Ga69kKN3efLQyRuYj+eMBrG5nr7hAlLFTyRShjR6CBNIVLpSl6GcAtOqgruWK
	j0L0TstsWGL7DlLirgjKzSdduW8FobJWXw5BEe7MZwuKGyNrNQM+IKxJVS/37Anxggiu
	Oz96sbnh8xbA1gReCgc5rHmLklf6MHLakpZmrU8S4fV5gJfxXiN9Yo6pcUlyaxI5974w
	Ri0OypBcAZ05WpZWsfI3Rng6vdPvjsz40YcnDva2i1KML2bjQ55RnTFMN7bHBY/ZYKb4
	zLSaC8dW0qh61e75lZzfd5Z6EzOBSOE7oPSj70qK7Kox7oiNd8xp7WSSNgTNw9GopBjB
	AbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R8WF5Xp9xFWM4oYH5CXQZJ/A0KgsyIstCnPxr7hzJfE=;
	b=r+2SkEs6y4eRfwbImMGf9FJQu3r/hYl5/swvGLsZDMdoN2yTUYYGE/K17FTdAK6Fo7
	pmuWm60oYQudOT6GuGkjy/6XEO38sK/OSQoJk2G+017DirClNRrHovD/1GSu9BwoeywR
	5SfJZOGtQO4+yWF5+MVBczhuFRr+VCIoqCQPW5kWhWCphQe27pSi8ILMMZx8f5TfAdhg
	BAoSvH7lFFGxsSU/r3r8kOamcfz+HHGLG1vOmWHVOkfB6ftffuoTTS40IEWckR0xRrCJ
	6nv5qwkq1UOzQgJbYA6YvrmpRvRXBn0J5G0YWmcAMFp7KVLgBAlMxCreuDCJKiBOEAS0
	uAJA==
X-Gm-Message-State: APjAAAW5t+MQr0NXfB5yY216caPKpl8ydubjLziB2dCyJizjUuBRtx04
	WhmvDslFEM8a7p6IHiWnHcz/og77sm3qT1sjtz+MrzXTJAg=
X-Google-Smtp-Source: APXvYqzcOArJoXtt1C/W8Hpx3lOhDPsaqQhZqIDUnXdHOP0oguhHg+VX16djB9Xm4C7fUSQwD10DJ87KJB7EJdBcr6g=
X-Received: by 2002:a24:c204:: with SMTP id i4mr12926191itg.83.1558615168645; 
	Thu, 23 May 2019 05:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190523122941.21058-1-schnitzeltony@gmail.com>
In-Reply-To: <20190523122941.21058-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 13:39:17 +0100
Message-ID: <CAJTo0La2B39+ZuN6t40xz_g2MoDo44kow6g4RA6L_8YGfin0VQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: add help packages based on languages selected in IMAGE_LINGUAS
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
X-List-Received-Date: Thu, 23 May 2019 12:39:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why -help- and not -doc?

Ross

On Thu, 23 May 2019 at 13:30, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> This is the one-line mentioned in [1].
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/1=
99769.html
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta/lib/oe/package_manager.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
.py
> index 2835c1ddf8..bd2432f6d3 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -566,6 +566,7 @@ class PackageManager(object, metaclass=3DABCMeta):
>
>              for lang in split_linguas:
>                  globs +=3D " *-locale-%s" % lang
> +                globs +=3D " *-help-%s" % lang
>
>          if globs is None:
>              return
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

