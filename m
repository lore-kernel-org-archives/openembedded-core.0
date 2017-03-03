Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 643BC71D90
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:23:32 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id q7so92573271uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 12:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MSXNkBF7DTL1Y9RTFHIRAUJ3dSA77gICDtd0F2XUyQ8=;
	b=hqxOmk4mPNulUr5ygXVFVj4S2MWa3nv3nn87Hc0Ng9bDK5uYyae3lZXl4kcOXxKniK
	coD8OriYVxZk9byXWfvWjGlENlVhKcdudaoq7jZihKCxDCP5bGDkR9ag030FZcCnXV63
	eWoxRDAP7+Z4sw2JXL9BEnqb6l8Rt8rX1PkljYxRjxoIBjhxtNgKORlLAkExlRhnF+gY
	gB4pClf5Ck50/BWVhXT7i4/zHTEreEKxq7mLh8QQyGqKF4NVU6r1jY4FumLMYnNNlg+/
	dp2FDDhAYXrDXz0bFAyH8+RWpyg5vUnGqIa4AI526gegOcRvKS70tS52Pah+1otTsTj3
	CsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MSXNkBF7DTL1Y9RTFHIRAUJ3dSA77gICDtd0F2XUyQ8=;
	b=PDVKI/v2hYGSK6XyCjELwvhwjMvfBYUBoEYcNV/MORFSwibmMHnz8tTjNNrDmNp7Fl
	eujZiuwTNrrxNzdHZc2Lo+Ots3MpPXV03Jk+fFWIC6pXVSI0erMVLHm4D3Gr1AkEMAbf
	EQyAHyWlGPOU/JUASyiI3eqApNLO9j4SJLrBSDyobFEzRyWpL7f/joXzNlRfY07g7I+Z
	UbARjCbxCGb6DGpGQvgGX/HxYRvbdRSfA8YzXO607K+79NpVUHWx4z0FAuMZDYrk57OF
	O9SElrY9epuOgVk8HKY/vV16DHOuUv6k87+09XQilH/Py+Ungf6uxFMy+asMAX5Jyozp
	t2eg==
X-Gm-Message-State: AMke39nKIwlfVVfpswt4VBHjxjQbadKv+eTzEzTL5r+K5aNJovPsXt6asZJRwAUK8cbR7otGSywJJzZsj/uccg==
X-Received: by 10.176.70.66 with SMTP id z2mr1651423uab.69.1488572613376; Fri,
	03 Mar 2017 12:23:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Fri, 3 Mar 2017 12:23:02 -0800 (PST)
In-Reply-To: <7333db9a-fda0-a8e3-6a3f-9d7700e9eda4@xevo.com>
References: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
	<CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
	<7333db9a-fda0-a8e3-6a3f-9d7700e9eda4@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Mar 2017 12:23:02 -0800
Message-ID: <CAMKF1sp+pwjdasqJ2P9hg3VgqPPr+XC-GWV0oN8V8vUvE-+yEg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 20:23:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 12:15 PM, Martin Kelly <mkelly@xevo.com> wrote:
> On 03/03/2017 12:12 PM, Khem Raj wrote:
>>
>> with  meta-clang there is no desire to support multiple versions of
>> llvm and thats why versioning was dropped however, I would still like
>> to fix the versioning if that makes it more useful.
>>
>
> OK, keeping a single version is certainly simpler. Could you clarify "I
> would still like to fix the versioning if that makes it more useful." ?
>

say if there are other apps which depend on the versioning and
otherwise would need patching to work with llvm from meta-clang, then
lets fix it in meta-clang.

> I may be missing something, but it seems like the llvm-config wrapper
> script's only job is to point to a versioned installed via
> WANT_LLVM_RELEASE. If that's the case, and if we don't intend to support
> multiple versions, wouldn't it be best simply to remove the wrapper? We
> could fix the wrapper instead, but I think that would have to involve
> reintroducing versioning.

