Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B570F78958
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:31:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id e194so794191wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nz+4iPlj7gv0xVd/7ZSfUPJRm99eeDa0OEhoT379S/4=;
	b=BQUoa6a4WEjwhJ7NvdH3tpC/PhbwGZ/dLXGKQOs2V4M+NJFpA+ITiX8QKZZ6gvAU57
	65iOud9b3MRnI/PjwT+4TJ1bAFtylo4NITFyxaKGtm4ElbwijzvbxCE1SGTPX+UCSRKi
	xiPZrY3ZcNqar5IPxWdXraeSZyRCFJ5Bu0T34KC/7/BuJiwzSDR215VgJNMovmiO4+Wh
	bpB5x0FUMhIqvJ9jj1cazXy61sbLY2PDeEHZi5K/TqANa34qSYiH13tnZVCwIBF0YO1Y
	2hYs/5nNES+Lf2+flBo1HmoU5O4/TvhgkevPd27vvtjXIbt2VzkA5zTELqxhQyQix49U
	LAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nz+4iPlj7gv0xVd/7ZSfUPJRm99eeDa0OEhoT379S/4=;
	b=Cj2c9GyKMi1Rgpao/XHTJC75kTnsKYxivkMgEivr48TFHfls41NmYvzVilHGtu3o4Z
	Msa4/pSiSanERI2L1a5cqCavj0XlXJI7cJwjDQnOnT4yia2bhqgxZsc+sx8KI8EpATsW
	qGIKLttrC8rBuce2m3Lk0ulgaoen01q2TyLq/Oz1qa3/0wup+5zdHGkua4sjhtmo33wZ
	kgKrmZA60cnvJWxbygc2hx30tqwi+LOMycNhJn6crQhlotFnE9OmMQSkqvXS20+mZ0xf
	oNnewWFvg23mxWbSX79JuYiXFppQyn1gUhFOTJcHN34HWAHK7ZPMtxqpQ6VV2rQVYIa6
	Iw5g==
X-Gm-Message-State: AElRT7FGz3K0ys2WriokWqjO12CNI/Xto7Rd/Bln04lr6mjJ0M2aA3qP
	p85u7XX6X/Eb3suDDBfJVCzq0CZZynbu88BLiy0=
X-Google-Smtp-Source: AG47ELv3yfOwh7S974fCG7JCrp0qXE9yGyOzZ08M4LmslD4UlhtVyE6zjdEuNZ0xA5Y9laxyzsQMY8LjBZz45zPmcgk=
X-Received: by 10.28.21.210 with SMTP id 201mr803078wmv.151.1521520263486;
	Mon, 19 Mar 2018 21:31:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 19 Mar 2018 21:31:03 -0700 (PDT)
In-Reply-To: <CAJTo0LYDmdGjrixdE21h_V-8PvnbZEJ5kPqxSL3F72eofm6cFA@mail.gmail.com>
References: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
	<CAJTo0LYDmdGjrixdE21h_V-8PvnbZEJ5kPqxSL3F72eofm6cFA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Mar 2018 21:31:03 -0700
Message-ID: <CAJ86T=V0o1jbd2JcW-34-08P+N+HQsV8Z5i1w_UgM-ond8Xt+w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Rajath C S <rajathcs.1996@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: system lock down in middle of build
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
X-List-Received-Date: Tue, 20 Mar 2018 04:31:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 3:38 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 March 2018 at 20:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>> so i am workin gon yocto development on my PC as well as on my laptop.
>> I have also worked on it on others systems, but the strange thing is only
>> on my PC & laptop the systems gets logged out automatically in the midst of
>> target build.
>> Is this a bug?
>>
>> PS: both my PC & laptop are of high-end configurations

Sounds like it could be related to the issues discussed in this thread:

  http://lists.openembedded.org/pipermail/openembedded-core/2016-December/thread.html#130610

Unfortunately that thread ended without any real conclusion but there
are some suggestions on how to debug - e.g. try to determine which
recipe / task is running at the time the session gets logged out.

