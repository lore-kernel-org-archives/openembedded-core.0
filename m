Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDC9B6E688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 19:20:28 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id k3-v6so2740739otl.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9vL+PphXR60bCYH8nt4ZN0+UNsYztlls3ytK3kfpoSk=;
	b=O6/EI9CGMQfzUpJnjIMQrKeaWhw0LpIobA9O0IdHzQf10g75biEq6JUcjTSK1kR+sF
	CY5Fh254tpFNtxPXQ9lWRQ0t3Gtd7Sx9/PXWRNn8jbyLztuc929vgrsqU+jwNpPxrFvl
	i8nfu1aFFjbVup5lOgH2neIYr4j4BZ6kMQ9UIgkkSZYdmASJKDz8sWBxD6ME+hr499Oy
	wwuvCQW47drvd5YCTeipqBEP6mXmQCifkDgUHL1eVrbs5JeXqXO/bZbob+2aPmwoKDRy
	jOn0D6JT7+95Udoh1/R+ALQmMwmCcFmQ77hKXKgmCZSbWrVv9OZwPeZsdKzQuSt8jqQm
	wmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9vL+PphXR60bCYH8nt4ZN0+UNsYztlls3ytK3kfpoSk=;
	b=l4b7zYZcOvpC9bPE9Ttu/QY4QLAhwNeoI/FIldV/y+iNBx61o7mvz0cfmmc+5n7VWW
	jauvWohhnygbL7K6yXeQ5y+sEJ11LXHujLKz3JmXxw8r9VpU6NNtjtyToLP106K6FQ0F
	h1bVAsJzd14HgQOvuhMr9R4hIsnRtBAC3SYix8seqKSIcOUMFM67fBe2PTzmbaak3XbD
	WHj89i3G2si87dPnshuQQ6L+khuhAvs33Ybx9ZmgAf+8AEjS98ByekVIhgI72gGxiaZd
	L/ZbWmc8Nj2/Q6kradojPxe+fzwEhb2ohZo9Fbt3hjUF+PYq9VKnIp+Okxz6ER0Hssp7
	CefA==
X-Gm-Message-State: APt69E0kv77/qi1I7YVAQwtbNfsSzcPDS0Gyo9pphnjphO4Z9zWKSkx/
	zNDertcUyqxfD698AxWWSRky6C/oQvHsjQ+I/wk=
X-Google-Smtp-Source: AAOMgpdKs8c1kcovNgN5neDGwzyQimJr8ZR95TFoF6kN5GbzR1NZVQwwqQqfsOYbRc4t3WXylQ5UNlHl6bDvDMamEcE=
X-Received: by 2002:a9d:2c5:: with SMTP id 63-v6mr4653064otl.155.1529954429787;
	Mon, 25 Jun 2018 12:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 12:20:29
	-0700 (PDT)
In-Reply-To: <7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Jun 2018 21:20:29 +0200
Message-ID: <CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Olof Johansson <olofjn@axis.com>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Mon, 25 Jun 2018 19:20:29 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-25 18:47 GMT+02:00 Mark Hatle <mark.hatle@windriver.com>:
> My question is "why is this a problem"?  (Why is debugging on for normal usage?)
>
> If you want to enable debugging with RPM, leaving the files is the right answer.
>  Otherwise, as mentioned in the post it's REALLY hard to debug scriptlet failures.

Not at all. I've done quite a bit of scriptlet failure debugging (in
preparation for turning their failures into actual bitbake failures),
and haven't had to look at stuff in /var/tmp once. I'm fine with
deleting them.

When debugging is enabled, rpm writes each line of the scriptles as it
is being executed into the log, so you don't generally need to look at
the whole scriptlet. And even if you do, it's written as plaintext
into the beginning of the rpm file, so just look at it with 'less'.

> As for the rootfs.py cleaning them up, it's simply not possible -- assuming they
> end up in a shared tmp dir, as you wouldn't have any idea who created them..
> this build, or another, or a system process....  (Now if they only install into
> the image's /var/tmp, thats a completely different case -- but I still question
> why debug is enabled at all.)

Then we should write them to the rootfs /var/tmp and not the one on
the host. Or even ${T} where the rest of rpm/dnf logs go. Then they
don't need to be cleaned at all.

> This suggests some (probably[*]) larger, upstreamable work done
> in rpm itself, to be able to configure that behavior. I think
> this is better than nothing, for now. Perhaps the bug report
> shouldn't be closed, and this be merged as a workaround? (It
> causes real issues, at least for images with lots of
> pre/postinstalls.)

Sorry but no. I do not want 'workarounds' as merging them removes all
incentive for you to develop a proper fix.

> Does anybody see value in what --rpmverbosity=debug brings, as
> opposed to the default level of info? Would dropping that from
> lib/oe/package_manager.py's RpmPM._invoke_dnf be a better
> solution, or workaround?

We used to have that configurable, but the default level of
information is rather useless when things go wrong, and *especially*
when scriptlets fail. So recently that has changed to always enable
debug.

Alex

