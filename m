Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 03F00719EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:44:55 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t79so8369302wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wU8w2245V+/7WCmF4ifHA+oUCUmWKl0qkwXrFCmUXLk=;
	b=jTUsNOwOfB7e3gjEdHidf7DS8q5k7bIByCPOWUJKSuj/Y0TPtmwYWX1/TFbYnN4s4X
	YFDNJchOOXnVCvXcjm4qYlF0B8lAtdoNb/xUC2jzOV8sPGqmjQV0vNr0qyE/Y/0C8sCx
	xMgLzke7nIT0kUHwvNZ4GA3sypSxz1B2myvRva9lKRRXWUa9SYR4BEH2Uca8jwISU/jj
	c3KNbMvr41I+KQ5LQEs7wJxgNZTEAm7QLcMNnddkXuomDW4i4+vxi5pxg9KThkgGUUX5
	XA3YuJqU/Z/qFtg2jUwTvMatGgAGFPYJez/reMww1/3sdq9bjRIFgsKSiXqlizYWZjfh
	rLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wU8w2245V+/7WCmF4ifHA+oUCUmWKl0qkwXrFCmUXLk=;
	b=IujFo3lgeZ9+gHQe3w2DxZn1lcazot0Sa/5lu0iIGI4Qp0fRvIV8vMzxtYz8guYWBT
	sKLudTEmV20aSHIwpbvCNzhxvt1EASZzKM27JSCxrVxrOGrpZwjybkSo57ELh8syV2tO
	cw43CfWyb6vb7tfpfeil+yNOZ1kLK/S77laBys59Y0sx2Xi5dOQQEyT7bKmFtyR3XXJl
	H5lcLQwF3AkTpBRoBv7wew2HI3H3lp6ItDM48G0bQBA+VmyR6yTUrGIuldycHvxpX9ds
	6RJ3/bcbISN1oWkkoPbk8wRyZHEgme0ur8pbbFjny6Y6e/b8DoMrLDdPeFVetBbmsLFn
	U0MA==
X-Gm-Message-State: ABUngvfNruqBib2mrOjikqqB6tDJyxZkk60NEUZKHRVv3FHrHk4vkxx8q2iDTTi8mxzAV29E2/Do0bVrqvyPrA==
X-Received: by 10.28.189.69 with SMTP id n66mr3498513wmf.35.1478202296450;
	Thu, 03 Nov 2016 12:44:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Thu, 3 Nov 2016 12:44:55 -0700 (PDT)
In-Reply-To: <lywpgnv3f4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lywpgnv3f4.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 3 Nov 2016 12:44:55 -0700
Message-ID: <CAJ86T=Wr6+ri8SAfxKLrj9wFnQGBq_sbgDkRbup_0b4M0iJ0Ew@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, jeremy.rosen@smile.fr
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Sanity check fails with 'ccache'
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
X-List-Received-Date: Thu, 03 Nov 2016 19:44:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 1, 2016 at 4:35 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hi,
>
> with 'morty', sanity check fails with
>
> |    Please install the following missing utilities: C Compiler (ccache gcc ),C++ Compiler (ccache g++ )
>
> I think, parts of 89f55bf8e9d633cfb508a0885a462afb561c7cee should be
> reverted.

+1

The sanity check changes cause problems when ccache is enabled:

  http://git.openembedded.org/openembedded-core/commit/?id=89f55bf8e9d633cfb508a0885a462afb561c7cee

>
> Enrico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

