Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1Q4Fbm-0005ME-Vx; Mon, 28 Mar 2011 18:48:03 +0200
Received: by fxm19 with SMTP id 19so3080616fxm.6
	for <multiple recipients>; Mon, 28 Mar 2011 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=rWSxdsBDPuCxUAsX54EiF3owWJHOiJLxtU0aWoRcaCw=;
	b=UmHcAgr8YROAJ8xFv9hY1UfWL9rMP9efTHfSc3hVcQslFOL20pV/ySaHAfOxAXDlXy
	1H80fTS7S2FE2eLENrca+dC5zdpRQhvkKHyqdc6r+ojyXSnhm2tTkmxa4lgj6LS5vYHj
	dvBDqoDNvYARHgTjScTh9L1dtAf499B5Y21mM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=G706emoSJSAkxrCRis1+8GhZO0ZhOk/SMLO+g6Lpy/3P0jE9P/5owCvQ8mp7+qefku
	q0p1XrBFtAvWiqPQzBFIatZXN655gXeAe559jhJiccFHL8NKJAOmTDre2fLdXMDtmGbx
	e/pne18Dvt9xDQWseLh+wWph6kMmhACwGRj3M=
Received: by 10.223.5.26 with SMTP id 26mr2160373fat.68.1301330376039; Mon, 28
	Mar 2011 09:39:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Mon, 28 Mar 2011 09:39:03 -0700 (PDT)
In-Reply-To: <1301316136.3018.189.camel@rex>
References: <4D832AA4.1020701@matrix-vision.de>
	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>
	<1301060302.3018.129.camel@rex> <4D8CA329.10407@matrix-vision.de>
	<1301064949.3018.147.camel@rex> <4D8CBCA4.2070603@matrix-vision.de>
	<1301316136.3018.189.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Mar 2011 09:39:03 -0700
Message-ID: <AANLkTikwK_F7Wep4pfj05PMrMsgcaQkBi9aUvtu07+GV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [oe] staging & using kernel headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Mar 2011 16:48:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2011 at 5:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
>> OK, so here's what I'm realizing, please correct me if I'm wrong:
>> What I did unconventionally (ie. wrong) was to use a kernel version
>> newer than my linux-libc-headers were. =C2=A0I should create a new
>> linux-libc-headers recipe, as I had done with the kernel recipe, and
>> build glibc and linux-libc-headers using my 2.6.38 kernel.
>
> We should *always* be using linux-libc-headers >=3D to the kernel version
> being used.
>

If you use newer kernel should work ok why is that a problem ? kernel
syscalls are backward compatible
and we use oldest kernel version of like 2.6.16 for eglibc to build
against so it should not be a problem
to use different versions for kernel and kernel-headers. I think your
problem lies elsewhere


