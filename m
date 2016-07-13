Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id DCDE86E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:50:15 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id s63so35464669qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mgIDH9NzPc1uiHRI8NCfKrgQa95v5YcqcOw2tG/tj0Y=;
	b=rRIUcIOw0+IKPGy7nkJIwXeZ+Z+AbY+n71y8zMgDdxsMvE/qKxABW2zEMavygJ2oyc
	ntlPjCypCvotCJP+x3FShvuEA891bDwaezZeycPda/3w/hc8Tm+15CmDxwOKAZO5e8vW
	vyyLAVGwYBTT8uRV8FKLiEMQgrXsHDPhgMbPPPzJGZzU5zYg2pzhvlpM6UWkvAN79iiD
	iJe7VyB5RuQhjOZU5YA81lluRayeXyghG2tRqo3wZh8CHhlZf9xhBcwdOVLOFF5Cg+nR
	szPkYNmNNLFjjG2LnpC5zNt2WWmBKdWrwidjckGYoRGkZjjwbsT/P7zJKv3YJGH2Z1/O
	HTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mgIDH9NzPc1uiHRI8NCfKrgQa95v5YcqcOw2tG/tj0Y=;
	b=HwA627lRum40mgYXIM/e060CjZt5mxNlodld3SlHoXu07F2y3B/Zu6H18sk5/2ag1m
	224jOR79ZihmMXWxMIU12wmIGZhQ5Xdddh6nLYxoOI0ROy9TORZwz4iT+g9KOoaPcFjY
	No/rTUQsMkPQJ6eTCCiNOa8BLcbxqchFQkS/w9bx6Wq/cPkjqh+7siMiWA/PF9HF1o3Z
	j7/O6TJjbYpXCSfMl4uQTlPs9VvjKNOs/Hc3HZD1maIKqXrKsPaHsElrKiVluhdB7lXg
	mY7nMb0Esnywsb9JVij5Wxp+PuMitZQBN4K8qGC4O/RvT7eM8DIf0S8Htds7Zm02KbC3
	G6gQ==
X-Gm-Message-State: ALyK8tJaX5A6Zf1a5vFcueZNNcast6e0jlogrrqQF/g9yI1iiJFD4tAdzFCht6feidDIpt18xg9Uhy+kKmdM0w==
X-Received: by 10.55.97.18 with SMTP id v18mr7980851qkb.102.1468392615857;
	Tue, 12 Jul 2016 23:50:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 23:49:46 -0700 (PDT)
In-Reply-To: <CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 23:49:46 -0700
Message-ID: <CAMKF1soqaVG8mY-M7Gz77iLzLnp++15K=D56K+vDYPXrtcFp=A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Wed, 13 Jul 2016 06:50:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 12:31 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 16 May 2016 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:
>>> As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
>>> upgrade. But all my patches are based on 1.10 now so it is fine with
>>> me as well so please send the v2.
>>
>> If 1.11 is around the corner then why not work on 1.11 ( pre-release ) itself
>
> There's not much to work on as far as I can tell: 1.11 should be a
> simple upgrade with trivial patch changes.
> As I said, I'm totally fine with waiting a couple of weeks until 1.11.
> On the other hand I haven't seen any reasons to start packaging a
> pre-release -- why this one if we normally don't do it?

There has been 1.11 release done for quite a while, are you working on
sending an upgrade for it ?

>
> Jussi

