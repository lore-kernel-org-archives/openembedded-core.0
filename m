Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 24FC16011D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 03:49:09 +0000 (UTC)
Received: by ioir85 with SMTP id r85so197148996ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 19:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IDvq47Qif1IB4O0gpMMjgxr6XTDg72kZKcK4gppc+BI=;
	b=vBRyVCsT4p+ySdlBRRmD+1dZNgMXk88J6qbhl7ftae3x0uIYPwUjz1vVMfTSfcn0BA
	dy0rwz46FLUXv+Pe2bvXSZqCG46/ijgH3ymmE3cUSJoENhsyEr1UQch7HT4vM8BT8Iiv
	aZf3HS0qRGxBS8z5aQGhm5pqKiJl/u5pEBG5VFYwIlpDn1GYh2Zs7R4B62O6n1+G61mK
	T4uVyQX7qPABt+4zf/nM3pUKzKaN8dyTe7WWJrtbSinBnYs8FuE5Am6vy6P85Vw22wNP
	JZ3+qgILwQb8T5qtsm0fMfQ+Mnoxcd5qfzUxNSIfcjfb0TeOMcGYQpb68LgLzxCLIz6P
	V+mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IDvq47Qif1IB4O0gpMMjgxr6XTDg72kZKcK4gppc+BI=;
	b=zcOsQjkqa6JfDKiMGjGy3eeop56/4odIWUlh/4dO8JttfKH5t6uTQyXIe4VKpRfsW7
	mLEjdGl0CANdrvfLFTVM5DNW3LbflCtqrGFsoaqVi5OpUharY3uVXSyxiJ/2k8aVGXa5
	gLP28ztJgcCuuQm6Q7wkfbTDsAHmYQQP0bwp+mD+8/1QM7Tj17vcjqJm1pEhcvufF6Ft
	FjYs1KT+WagBQInYAQ4GJWFv4ulCe4OVj5mhYRnVtSxFnJrieAy0o3zbLpHjOrqMFMdA
	XKke8I0FZ69NDaHR5zyEt/gT/7KUtpq67vXUb8oedStFKoxhv9iMbDGrITUpn3NWghAg
	VwKw==
X-Received: by 10.107.38.83 with SMTP id m80mr70800600iom.98.1448941750451;
	Mon, 30 Nov 2015 19:49:10 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Mon, 30 Nov 2015 19:48:50 -0800 (PST)
In-Reply-To: <1448873434-34150-1-git-send-email-fang.jia@windriver.com>
References: <1448873434-34150-1-git-send-email-fang.jia@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 30 Nov 2015 22:48:50 -0500
X-Google-Sender-Auth: q9gLX80PluuYMgrfeo0qA3otlq8
Message-ID: <CABcZAN=zqR_W8S=eUNAZ4R95QsCsv7eB+ym4hanSHfeBXZHgJg@mail.gmail.com>
To: Fang Jia <fang.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts.bbclass: unset command_not_found_handle
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
X-List-Received-Date: Tue, 01 Dec 2015 03:49:11 -0000
Content-Type: multipart/alternative; boundary=001a1140ca025603590525ce0a22

--001a1140ca025603590525ce0a22
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 30, 2015 at 3:50 AM, Fang Jia <fang.jia@windriver.com> wrote:

> On Ubuntu-system, When sourcing the env.sh from an exported sdk, and
> running a bogus linux command (for example "asd"), a core dump of
> python is usually generated.
>
> Unset the command_not_found_handle to fix it.
>
> Signed-off-by: Fang Jia <fang.jia@windriver.com>
>

Will this syntax be valid for non-bash environments? What about dash and
zsh? You have to be careful to use portable constructs in a script which is
sourced like this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140ca025603590525ce0a22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Nov 30, 2015 at 3:50 AM, Fang Jia <span dir=3D"ltr">&lt;<a href=3D"mail=
to:fang.jia@windriver.com" target=3D"_blank">fang.jia@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3jh" class=3D"=
a3s" style=3D"overflow:hidden">On Ubuntu-system, When sourcing the env.sh f=
rom an exported sdk, and<br>
running a bogus linux command (for example &quot;asd&quot;), a core dump of=
<br>
python is usually generated.<br>
<br>
Unset the command_not_found_handle to fix it.<br>
<br>
Signed-off-by: Fang Jia &lt;<a href=3D"mailto:fang.jia@windriver.com">fang.=
jia@windriver.com</a>&gt;</div></blockquote></div><br>Will this syntax be v=
alid for non-bash environments? What about dash and zsh? You have to be car=
eful to use portable constructs in a script which is sourced like this.<br>=
-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kerg=
oth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - =
Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1140ca025603590525ce0a22--
