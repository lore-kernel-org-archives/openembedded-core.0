Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D514B7EE19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:16:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so78405191wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=V3d0tdipJYoJ4kJ0qL4SqjMSsA50jDxuwhWp6CieA1U=;
	b=hOjgBOP7b6ozmQ5TxW3XWSQpGPwyFTac3E8TN1icId/TtJLU9qcnXuLU4aphVVXpXq
	QwC37yGSlrpdNwUnc8TsKnAv+QwBz9kJYpfV8b/hc7mjnF8srLmNDAPDPMyXry8NGSIN
	fDPV9O6MrFqBd8lflAIP/PsvdKhZrv2oFC98U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=V3d0tdipJYoJ4kJ0qL4SqjMSsA50jDxuwhWp6CieA1U=;
	b=CCmdtb4PNQiTVvlyh+A5VR8rqq8xD6OB5QFF7B1j5Nnx1Nbna1QePU8R5qVwe9kN+p
	0ryHM6dTcRET/JOpa/TATmKUm2IkNKbfemRNIxj6Oduik4rwhBVxjskEd3LeogroI5GE
	uo8WNOcqfd4A21pVsfNHuqtqbTXl7JF2AXPiaMF5FUhntMm11QnhXfQLojexx2ao86SH
	nIms9OI74PncU6pZeqWnA0Rc9OQar1s1ykw67PRJL+GOB3GzW/GAQoToLu1D5bCjfFTX
	I/DKzJXUOKcGoi845uA1x0rzRv4h/pa74vbbiufpZh2YOndr8UoKczhl6sAq4q9cTZ+z
	r43Q==
X-Gm-Message-State: APjAAAVQObj9xAV4FFq4BjSgoXT38pSlvp0QW3gqgCLNS6JO8aJVru3g
	4paUzsAPvY7BFpRal8JLhLUBug==
X-Google-Smtp-Source: APXvYqyAXj4pvoYRUhmTZUdhH7svn23F43Dv2rVF8gqZWSwJT42Z+XYug1aK4fOKgWRdLl2yzmR2Bw==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr5038615wmj.94.1565100996627; 
	Tue, 06 Aug 2019 07:16:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z19sm65187859wmi.7.2019.08.06.07.16.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 07:16:35 -0700 (PDT)
Message-ID: <837f692b83714ef0ed412288121e817e7790dae3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 06 Aug 2019 15:16:34 +0100
In-Reply-To: <CANNYZj_4QNNfHr+9rke06rGDrfh-0C9PwqfnAYrT6urf5k62wA@mail.gmail.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
	<b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
	<CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
	<CANNYZj_4QNNfHr+9rke06rGDrfh-0C9PwqfnAYrT6urf5k62wA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 14:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 16:05 +0200, Alexander Kanavin wrote:
> On Tue, 6 Aug 2019 at 15:22, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > I think the issue might be actually in the QA check where it looks
> > beyond the recipe's immediate RDEPENDS (and then fails or not
> > depending on whether those indirect dependencies have been
> > packaged). I need to better understand what happens there so will
> > add some printouts first. The problem does happen with latest
> > master.
> > 
> 
> I can confirm that this bit in insane.bbclass is non-deterministic:
> 
>                 # Find all the rdepends on the dependency chain
>                 while next:
>                     new = []
>                     for rdep in next:
>                         rdep_data =
> oe.packagedata.read_subpkgdata(rdep, d)
>                         sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
>                         if not sub_rdeps:
>                             continue
>                         for sub_rdep in
> bb.utils.explode_deps(sub_rdeps):
>                             if sub_rdep in done:
>                                 continue
>                             if
> oe.packagedata.has_subpkgdata(sub_rdep, d):
>                                 # It's a new rdep
>                                 done.append(sub_rdep)
>                                 new.append(sub_rdep)
>                     next = new
> 
> It only fully expands the dependencies if all of them have been
> already packaged. As there is no mechanism to ensure that package_qa
> runs after packaging all of the recursive RDEPENDS, this is causing a
> race between packaging them, and running the package qa check.
>
> I think the right way to address this is to actually drop the
> recursive RDEPENDS resolution, and only consider the immediate
> runtime dependencies. Alternatively, we may introduce additional task
> dependencies to fix the race. Thoughts?

I partly agree with this. There is:

insane.bbclass:do_package_qa[rdeptask] = "do_packagedata"

which does help the situation by forcing package_qa after all the
runtime dependencies.

I suspect the real problem is that it can also see RDEPENDS for things
it doesn't rdepend upon...

You might want package_prepare_pkgdata() from package_pkgdata called
for package_qa's context on a separate directory, then to use that as
the pkgdata to resolve against?

Note that package_prepare_pkgdata() called for do_package is different
than package_prepare_pkgdata() called for do_package_qa as the tasks
have different dependencies...

Cheers,

Richard








