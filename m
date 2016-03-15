Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id BD7776FFCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 22:37:15 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e185so40149240vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Y8xqlqPP+bQgSanrM3FeMXYdRL4Ax5N6ezoLOrtqYxc=;
	b=FGdpsuKNzGP84RnZvDx9j0HTxjn4u5hhe51c81n0bfcFZrbN3XEdS8dD/njVnLHU/k
	a4vt759tHBFi/1Hr+hlPyyv+KNC/rbYlHkWjgWEBp696pcv1fl4s1qoIreiYmSpIYnmn
	MD+d09xCD+YLzeQ21Rh+BDwhqJ54+uP+L3IE+AvPrL0ogLOaLCtsC8bsG8SK+t544KPm
	IjLRLSqA4E0lD09z2SzydOVX1UU7TjiTxm21M6/Z+GyIWkkua4/7Qe7o5NLNl8TTA5Wh
	gKm+N05Wiei0YKEJbvqvsk4MXj+icQxGQ7EqXXjcqP+H3wQ8mQTTuVsxnx8nJnnm91Vb
	Gxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Y8xqlqPP+bQgSanrM3FeMXYdRL4Ax5N6ezoLOrtqYxc=;
	b=eDl/hTNaLhCqKJwJhA8nhEXILKzlDRWw+qRTo3wWzHg6Gu8duqkGg49uNv6IBproYn
	WI+ZHqaM0S4MI/lUo2osdQ60NMwWc6FkRln7BbOre1z96i5yQ9yNhat6yRnCfs28blrS
	kxG58rIYUVS6kA2di2R+C/GJaTjHhrWUAY6lo2Dsllw0dkff3ZcqzbHRmplocLzZQOOG
	hM0a2CAJPv69du1/usKUBxGu27DNHp94iElOg3iuAm5a5WtXsaCQ5lVktbVXxjE65I0I
	ElV4OYycC+z/tsSWx7ypTns/rAinhQc33rhdZT8XxQxWf3DPXdJmY7XQsgkUFXHxmtn3
	ZWlw==
X-Gm-Message-State: AD7BkJKc3l2vvMiF72dc5DuRe+Ui9p4y4I5eWP/xgftqmsbotIDXk3PnQMqV5jqM+REsDBh5j1dS/xUZrBkeIQ==
MIME-Version: 1.0
X-Received: by 10.31.162.82 with SMTP id l79mr650658vke.76.1458081435950; Tue,
	15 Mar 2016 15:37:15 -0700 (PDT)
Received: by 10.159.35.45 with HTTP; Tue, 15 Mar 2016 15:37:15 -0700 (PDT)
In-Reply-To: <53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
	<CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
	<53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
Date: Tue, 15 Mar 2016 23:37:15 +0100
Message-ID: <CALbNGRQwKQpougA7Jus51MKUsC=TmAiqf0mptLUebeodsB6_yA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Tue, 15 Mar 2016 22:37:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 15, 2016 at 11:29 PM,  <alexander.kanavin@linux.intel.com> wrote:
>>> This is because python3-config does not contain the version within
>>> itself,
>>> it reports the version of the python interpreter that it is run with. So
>>> NOTABUG.
>>
>> If its supposed to report the version of python pack its coming with
>> and not the interpreter its run with
>> then how do you decide its not a behavior change ?
>
> Apologies for being terse. I should've explained that when building
> recipes that make use of this script, it will be run with the native
> python (instead of host python) because native python will come first in
> the PATH, and so the version reported will be correct, because native
> python will match target python. This is set up in pythonnative.bbclass
> for python 2, and in python3native.bbclass for python 3.
Sorry but I don't get it: The script reports the version of host's
python which might be different from what we are building native and
cross. When something is trying to link against python libs and is
using this script this crashes for host's with python < 3.5. This is a
bug. It should be either corrected or using of pkg-config should be
enforced if possible.

By the way: What was wrong with the shell script exactly? We have used
it for long time and it reported the correct version.

Andreas

