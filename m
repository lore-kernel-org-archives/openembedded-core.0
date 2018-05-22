Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3B274777;
	Tue, 22 May 2018 22:38:07 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id c41-v6so11732407plj.10;
	Tue, 22 May 2018 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mJ+DML3NnIEetDhESQmGNpLWLE5kbEpJaF8i3jNPDWQ=;
	b=RBAOecMVp6gkbNRcAjabQey1P9bEMYbQbVys9zeoJq8vj3hVXoiAuk8Ryx4ve6yKIX
	LsJkwaOyvmAJMzX98Pcec1guWQnuRz14WVYIQHc5hLGV60P0C+fN0jvu2Rt4xabqThMN
	T3N0lmh9E5iOV4qZN8b9gdwtH5t96S0tKMY2JgRrN8Mh5rzPSnaKNblltgQeErAlDDzS
	oIQgWYWJRUrVuHNTU44NL8Utq0fsK9jYvU+ZAMhvYDwTMiDU4gwYGZXt+PmKYifb7q+t
	OcLYczyA2oCDdd0At0TpJmrxyy1hJ3i4Wz1krhVQpto5CBZVNn8KDcDUhusrOcc5mt0f
	oP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mJ+DML3NnIEetDhESQmGNpLWLE5kbEpJaF8i3jNPDWQ=;
	b=kTtO2Fm3A1FX0dxzIPUxTKcdRoaW4uiIm0F/p4cvFXG4inJzTlymljpveC2bzzNBsx
	+ODuX+4KWTTshpH5DO9PSOy/N/KqdXWVmmHRNnzbvLESsq+G5jXNav49gtRR/oHIKkgV
	GzfMvxm7IXBg4AgFmO/jK1lIyrUDjHRBclQgLzq17aWhi+vxg+b7FSAqo8Sjl08f+CfF
	voLMPtY83fsjrbx+I2rMIvLjH6l4OjlwWnW2BVG1dnc25OkCX80ZjjYZ45M/1W2netL6
	O/Nl5J0LTSV7cCP0sZHWLF+p1D8DitHYujGbw5oDgwCcd0A13e2Ap86/MyyID7YQeMve
	mw5Q==
X-Gm-Message-State: ALKqPweY4PvEvRmfIezuNB6tqJsbfAzpZojRlpdz5QH+BhdYd5H3XWP2
	Bk8r2mWxtKgwUfmHh73lLTt0ObcoLZjLRPe30bU=
X-Google-Smtp-Source: AB8JxZpiJvZWkGt1qUd8qZ/cIXOm/bJDTJykLOCWpbA9nZIlEuBWV6eaSKNtGcahVh2691n2+aDgyslMnJxCEI1M4DY=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr326238plj.253.1527028688210; 
	Tue, 22 May 2018 15:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 15:37:37
	-0700 (PDT)
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 May 2018 18:37:37 -0400
Message-ID: <CAMKF1so9=sE=QGD=Y7YysgTUxxUjvcvDJCHtQ5saVJY9Pn44XQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 22:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Armin, I am hoping to keep working with you on various stable
releases in active maintenance.



On Tue, May 22, 2018 at 11:40 AM, akuster808 <akuster808@gmail.com> wrote:
> Hello all,
>
> After much thought, I have decided to step away from being the
> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
> kindly stepped up to continue these activities. Maintaining this was
> consuming too much of my free time and I need to focus on other things
> in the community.
>
> Thanks for the opportunity to have served you.
>
> Kind regards,
>
> Armin
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

