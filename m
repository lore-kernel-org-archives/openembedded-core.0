Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2789C71C05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 23:25:04 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id q130so116649762qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=11DzD1iSHTbvIiymR49DEqJ9+rV16JUSLFc1xp+hpx0=;
	b=jkDyiObUXSQkf5UCQiqNpzsIvSPDAKf0dZlX2l11K5dXHDwxfJVDDw03GJyBatJ8Mh
	tFKSZxL3rq3neSVtT8B8AXLAxgKMjjpOKE+Bqu21f/1eUK4j1onQkFooWEo6iwG5L55C
	h/6HKkJJQaeT1CCSQP4uCYwcrHCG3QPELkqu6vag78RWddCJL/LIzdJReaH9Hrh0YPNa
	vmc0vGrkd0IaiEuk4cLvQ/CvDlIMiWJm9PVmqGNAODPW+dMVNMP+zlFUaDWbVVTjMcuU
	cJnEEn8EtyVzywGcQP20swOOSPfhMI5HShyQ0/HRfjjlgcYwaGvTuGaQ9lYddpBeb6cV
	Jfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=11DzD1iSHTbvIiymR49DEqJ9+rV16JUSLFc1xp+hpx0=;
	b=PTGkkXKYRPyOj9mq5owN2zkv9fFw/BSDgLroznnQ3L3SPv9UrFgm1SZzNs88VVaIP6
	u5lb/N8zqC58Py+RWNeJ9psWVdrhqYed5PU0ZAXgN6zFomLE7+h9OdoWwHHw0AJQuFn9
	5/bslLdBR7m8NEyDIjZhgLAVSyjkWdx8bSeUmj/vD7wXeP3Zf48maVRbwJRE9YI0nQ2r
	oe80szKhFV7lx1GQPetaYEhJLvdsgsafK0y4u98jTmS/JnEZ0PjgRac+f1Mnx0fmeWZw
	5/QRfPRsOT+mmjQ4gMOuloJQCR2dtqhrO1OEpWVGaOKsRJeFSZHK8GitIGgiHmt5AYrr
	h11A==
X-Gm-Message-State: ABUngvdtwbn4FYsxmiuB/mh6BHKS7L8qea91myrnWV4/0tqeB5g8f4qGwpuST/zLmjTrd18AJWtrofFBZCtVkAUY
X-Received: by 10.55.8.20 with SMTP id 20mr17248855qki.3.1478301905961; Fri,
	04 Nov 2016 16:25:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 4 Nov 2016 16:24:45 -0700 (PDT)
In-Reply-To: <CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Nov 2016 23:24:45 +0000
Message-ID: <CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Fri, 04 Nov 2016 23:25:07 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60f9d846054081fbfe

--001a114c9d60f9d846054081fbfe
Content-Type: text/plain; charset=UTF-8

On 4 November 2016 at 21:25, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> So in order to get the build error you are seeing, that means that
> SYS_getrandom is define to NR_getrandom (in syscall.h), but that
> NR_getrandom is not set to the right syscall ID. That makes it quite
> inconsistent.. could we be mixing HOST and sysroot content here?
>

No, I checked the files in /usr on the host, as this is a native build it
should be linking against the host libc.

$ grep -r getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom

Yes, looks like Debian headers are a bit broken.

Ross

--001a114c9d60f9d846054081fbfe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2016 at 21:25, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:18w"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m158313c25fcb7cd9">So in order to get=
 the build error you are seeing, that means that<br>
SYS_getrandom is define to NR_getrandom (in syscall.h), but that<br>
NR_getrandom is not set to the right syscall ID. That makes it quite<br>
inconsistent.. could we be mixing HOST and sysroot content here?</div></blo=
ckquote></div><br>No, I checked the files in /usr on the host, as this is a=
 native build it should be linking against the host libc.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">$ grep -r getrandom</div><div class=3D"gmail_extra">x86_64-linux-gnu/=
bits/syscall.h:#define SYS_getrandom __NR_getrandom</div><div class=3D"gmai=
l_extra">x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrand=
om</div><div class=3D"gmail_extra">x86_64-linux-gnu/bits/syscall.h:#define =
SYS_getrandom __NR_getrandom</div></div><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Yes, looks like Deb=
ian headers are a bit broken.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div></div>

--001a114c9d60f9d846054081fbfe--
