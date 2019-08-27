Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5CECC7E08E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 13:25:42 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id j25so13393875vsq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DbVKc7yYFsAdf75E0WuBFwpQxbTIkH1iwKgGKT1cH3c=;
	b=lNuLLeCgCh9qm7rT8QQAbrsznprGEotTiYo3RPEjtEcth0hkzlB9UOuGE1jiV+RCL6
	9U8d9V4vWBXB2MNOF4ltPEYPwZogeHUEZiB1L+Okqjb4/oej47ZhCfIyptKKHUXoehgs
	UgOK/7kHLufBqhAQzA5oWCi5T1CqD646qVfJilu3vuPmr38Pt4vz67auHWrWSKHt1aGC
	mNV/AVj7EoStV7VmPB5pFC7g/drntqIICg0abGlrKErMpZ1cCk2gPtIpBxvpmEsLLuM+
	lkGu9hVRL4OdFT0KOvDy8n9/VV7s1mHoPzL/+nKblU6lUDOzedQhhbjEEW+CeFLkXTOa
	P0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DbVKc7yYFsAdf75E0WuBFwpQxbTIkH1iwKgGKT1cH3c=;
	b=i/Fxtee6x0eVV5LCOK8LUFCFQZde0dLYgkXqtMTz1yjtJxXaphIMZ/PI2lKBVdeBvj
	UpzEeYz6qcxqxWMMizB5TZVrnS+9c1awmuhAH9Yf8IJw5l4m4goYaLrX+Bedk+2Rn0Ay
	skdiRrqTUNgezBr6zilXgVw0616v3sa9IeaREu97XYNMfAPNkrK9Q7S1Hdj8Re7Eym+M
	iqIW7av9MgY7h3Z28Ge3bEKG94Q/7JQD92nvhHNtQNlkVjrTvdm4VJYOudLaczoTgsc6
	i2YXYfvLFL2O4pzRGS9CTYQM0d0fkSEQlicYzFX1+PcLHoBZiGaOOvIavhUhxhVxCz6r
	szrw==
X-Gm-Message-State: APjAAAWE7AB7Y6n7o/73cOuYYUkbqIMvF5gHDfOG1nHmvAqAmBCPtrMW
	bhVo5WYyFKOe6eO9Xt/Ok3ei6ipQarHzfU7L/Ak=
X-Google-Smtp-Source: APXvYqzzOqGrXNXRgFXoZXGcu1HP5VLf07vq+dyVyJairojrEeiES3S6xzrgV5vKLUKWhFqnmImUfKsh4Y9ld8QFUKU=
X-Received: by 2002:a67:347:: with SMTP id 68mr13659207vsd.35.1566912343298;
	Tue, 27 Aug 2019 06:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
	<CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
	<de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
In-Reply-To: <de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2019 15:25:32 +0200
Message-ID: <CANNYZj95TRH_+XELYLHGaBrg5gFfgOrpV+pvL5EjfQiXXWavEA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 13:25:42 -0000
Content-Type: multipart/alternative; boundary="0000000000009dd7e0059119351e"

--0000000000009dd7e0059119351e
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2019 at 15:08, Joshua Watt <jpewhacker@gmail.com> wrote:

> RSS doesn't clear out the sysroots if it goes back and executes previous
> tasks as part of a rebuild. As such, if perl gets added by a later task,
> then bitbake goes back and re-executes the task (I don't remember
> exactly which one... do_configure maybe?), perl may be present when it
> wasn't before.
>

I am still not understanding. The sysroot is populated once before anything
in configure/compile/install/package executes. How would perl then
magically appear later on in the sysroot?

Alex

--0000000000009dd7e0059119351e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 27 Aug 2019 at 15:08, Joshua Watt=
 &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">RSS doesn&#39;t clear out the sysroots if it goes back and=
 executes previous <br>
tasks as part of a rebuild. As such, if perl gets added by a later task, <b=
r>
then bitbake goes back and re-executes the task (I don&#39;t remember <br>
exactly which one... do_configure maybe?), perl may be present when it <br>
wasn&#39;t before.<br></blockquote><div><br></div><div>I am still not under=
standing. The sysroot is populated once before anything in configure/compil=
e/install/package executes. How would perl then magically appear later on i=
n the sysroot?</div><div><br></div><div>Alex<br></div></div></div>

--0000000000009dd7e0059119351e--
