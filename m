Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41BB86FF9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 20:33:45 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f82so45604063wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lZtjVQpEuTpvl6lY0bJ4e9Xmkg/5HJgvfYiGvagCJFI=;
	b=FWlFTj2tTRyKnRlm0k+k5RgJlw0OM+dX9Q6CZPmHkdo11o/KaIqyKWLmukS+jJLGGv
	lUmWTF6hKavUUCgs6Crup/7KB5x6KXXqx06L/eFQzWEWEfTIl3djtYU7nd1DlfJaPFew
	+x+vMmyV1A0K8gtKljel4H2uibaN0yIU4RlTd7dOxX8YLzMAkWH82ma33L8fKIWUJxUw
	OLsbDDhU68UG3hZwjT5eg3c+PqbHjck1P3V7yKQvdMw+SG2tackqNSgL/NjimKXp0Ify
	EjbdGmL7MG9wBflhf2BVIFPDQGXY7lyh4muUwJwmvLTsfQeIncUke1Pa6rkf0PaEfd0W
	zeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lZtjVQpEuTpvl6lY0bJ4e9Xmkg/5HJgvfYiGvagCJFI=;
	b=M/uykI1Jzy/AifRFbfMrx81X5hMa1rT3sh7TUwmH+XYiJ8yoXvUyvN3I4CTILKpSwB
	9CwXy4Y/MraY+fZxDlp/z27WjSR1LEJ+l1lkj8c3JvUTbUIZ3kbwnwqC/lU7Ilf4I9pO
	OBiUbLuf/+rzUoDpwnYt/vOUSWcEhZD88D+s5QnGj0/zh9oCpikfb0nHBm4EYx5DDmo0
	npXLzcxsTlColQcyBhn8GDdZXh+5mfv2J+kqp7Bj5ywqAKk+7vPQiptfxh3BUsgUYF/L
	wZcTOimP10yemrlrjEJLiVgXTw9zCSJ/33ozYdqxG1tw+uVaCEYnEkVH9yMxFj5TTP0g
	hOmw==
X-Gm-Message-State: AKaTC028MwyZCQkCioQgRtvVb6bFGMTlEkWQnnplt2yCQ6qj4mIJnb0jCUVr7LgjospOzscayAE0W3LMUa1nLA==
X-Received: by 10.28.144.70 with SMTP id s67mr62103wmd.138.1479846826712; Tue,
	22 Nov 2016 12:33:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Tue, 22 Nov 2016 12:33:45 -0800 (PST)
In-Reply-To: <lyk2bvn1za.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
	<CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
	<lyoa17n2ot.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYMQP__k=as6kbPtuU=JK8ZeJ4ucOdTw8NDoefO-+upPw@mail.gmail.com>
	<lyk2bvn1za.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 Nov 2016 12:33:45 -0800
Message-ID: <CAJ86T=W8Ldn02-EgMhntW=pKNd=xF+P4Xi3VYchcy8Mw4s2Zrg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 20:33:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 4:16 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> "Burton, Ross" <ross.burton@intel.com> writes:
>
>>> Is this check really so useful? gcc + g++ are elementary tools which can
>>> be expected.
>>
>> But they're not if BUILD_CC is overridden.  For example if the host gcc is
>> actually too old/new for OE to work and BUILD_CC has been set to point at a
>> different compiler.
>
> then, you will see a '<your-gcc>: command not found' very early in the
> build and every developer knows that '<your-gcc>' could not be found.
>
> When a misconfiguration is difficulty to detect or causes hidden breakage,
> sanity checks are important.
>
> But in this case, the check causes much more harm than it tries to solve
> (it will trigger e.g. for 'gcc -m32' too).

The existing check_gcc_march() sanity test can already do a much
better job of verifying BUILD_CC than check_app_exists(). If
check_gcc_march() could be generalised (e.g. renamed check_gcc() and
updated to always confirm that BUILD_CC can successfully compile
something) then the check_app_exists() test could be safely removed.

> Enrico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

