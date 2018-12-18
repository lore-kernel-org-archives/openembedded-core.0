Return-Path: <jandryuk@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F91F7BE1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:46:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id p6so12951839lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 09:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0EGFROrJU05WbX6jAlrBIMdi71VaN/K+P4c8rVjpBlQ=;
	b=loy4HL34wgrQJIV6UoV8KkbAqnQyuptbc7cPBl1+xIyeULXRCPIi+mx+SxFE+rOH5G
	INyv+QlYHczxmcuTb0+0Oi5T34a08xk59ER2tzBjlCjqHVHLsDT11tJhg+qvdCwuxgWk
	1qwJZl2TwWeSX/eIz7SAHYXREBKo6XhRNlk9WVtA1ey6fUS62z7gp1ta6rPAlwk8NN7p
	wuNT7cyt6o+goKNAN1LPDahWUry3b/l43e89Rok2gBpkwL8UDw7vZ1UrGPXTnEgHjujW
	5bKSIIvxzcHxPDE/VKX+IE+zDP2fnnnhijS/Ayc63Y2weUwfim1c2xdu1j7twm+qZgpo
	U2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0EGFROrJU05WbX6jAlrBIMdi71VaN/K+P4c8rVjpBlQ=;
	b=lRhazPxhzEpJCJ04q8gYlo/2ssqmGPzYYXDSlHIzSmoH6ZRxxMTNXn8NDk/523e0vs
	qOKSfJ5ThwobpL2GcK0nGd+9CgVO/GoJsbArOsOVuhEEUEMy+3gTz4+ienQILGOvWx7J
	aoifAmiIScNQ3QD67ZjbVc7fbUNRsqteFyP9PXUcq1Jq04lAcC7Gfd42LLlcSeUveATz
	nZuC/vZU4XDwsC1K7fvyp8XYPZNCpPz7lYcEzBxpV1T1Vkhjt7luQClKAje/Ns3c5A73
	/nMJCctvPRsAxqmvb5nBU7hdHovJSZxTyipht0fgUmS1UDd7pt1mbgZaCx+iztCxfoYQ
	cocw==
X-Gm-Message-State: AA+aEWbQwqZfT/fhIVnN41eQUxhiGBCwg4rMHNUmNwLB+HJc3QAII9UK
	PJ4CNJSioISXANp6zJKiwrzI3fn7Cc+pXXAop7M=
X-Google-Smtp-Source: AFSGD/VMlKL2fXLQvxJ+YiKtNsbMjI9prbEcUjOOmw9FM5Es1XYwfwDnwouKS3wjMl+2zEfrUGR0KKU4f6LZL5PtNII=
X-Received: by 2002:a19:4bc9:: with SMTP id y192mr10303934lfa.49.1545155171599;
	Tue, 18 Dec 2018 09:46:11 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
	<CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
	<731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
In-Reply-To: <731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 18 Dec 2018 12:45:59 -0500
Message-ID: <CAKf6xpv2UAGbBr5wOqQdZNgNe5Hra6+bF+OWy_tTD5v3wyobhw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Tue, 18 Dec 2018 17:46:11 -0000
X-Groupsio-MsgNum: 119384
Content-Type: multipart/mixed; boundary="00000000000020ec00057d4f796d"

--00000000000020ec00057d4f796d
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 4:24 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2018-12-17 at 12:21 -0800, Andre McCurdy wrote:
> > On Mon, Dec 17, 2018 at 6:44 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > On Sat, 2018-12-15 at 20:19 -0500, Jason Andryuk wrote:
> > > > As far as I can tell, pysh is working properly - it's just the
> > > > bb_codeparser.dat which is returning the incorrect shellCacheLine
> > > > entry.  It seems like I have an md5 collision between a pyro
> > > > core2-64
> > > > binutils do_install and core2-32 python-async
> > > > distutils_do_install in
> > > > the shellCacheLine.  python-async's entry got in first, so that's
> > > > why
> > > > binutils run.do_install doesn't include autotools_do_install -
> > > > the
> > > > shellCacheLine `execs` entry doesn't include it.  Or somehow the
> > > > `bb_codeparser.dat` file was corrupted to have an incorrect
> > > > `execs`
> > > > for the binutils do_install hash.
> > >
> > > That is rather worrying. Looking at the known issues with md5, I
> > > can
> > > see how this could happen though.
> >
> > How do you see this could happen? By random bad luck?
> >
> > Despite md5 now being susceptible to targeted attacks, the chances of
> > accidentally hitting a collision between two 128bit hashes is as
> > unlikely as it's always been.
> >
> >   http://big.info/2013/04/md5-hash-collision-probability-using.html
> >
> > "It is not that easy to get hash collisions when using MD5 algorithm.
> > Even after you have generated 26 trillion hash values, the
> > probability of the next generated hash value to be the same as one of
> > those 26 trillion previously generated hash values is 1/1trillion (1
> > out of 1 trillion)."
> >
> > It seems much more likely that there's a bug somewhere in the way the
> > hashes are used. Unless we understand that then switching to a longer
> > hash might not solve anything.
>
> The md5 collision generators have demonstrated its possible to get
> checksums where there is a block of contiguous fixed data and a block
> of arbitrary data in ratios of up to about 75% to 25%.
>
> That pattern nearly exactly matches our function templating mechanism
> where two functions may be nearly identical except for a name or a
> small subset of it.
>
> Two random hashes colliding are less interesting than the chances of
> two very similar but subtly different pieces of code getting the same
> hash. I don't have a mathematical level proof of it but looking at the
> way you can generate collisions, I suspect our data is susceptible and
> the fact you can do it at all with such large blocks is concerning.
>
> I would love to have definitive proof. I'd be really interested if
> Jason has the "bad" checksum and one of the inputs which matches it as
> I'd probably see if we could brute force the other. I've read enough to
> lose faith in our current code though.
>
> Also though, there is the human factor. What I don't want to have is
> people put off the project deeming it "insecure". I already get raised
> eyebrows at the use of md5. Its probably time to switch and be done
> with any perception anyway, particularly now questions are being asked,
> valid or not as the performance hit, whilst noticeable on a profile is
> not earth shattering.
>
> Finally, by all means please do audit the codepaths and see if there is
> another explanation. Our hash use is fairly simple but its possible
> there is some other logic error and if there is we should fix it.

I can definitively state I have a hash in bb_codeparser.dat with an
incorrect shellCacheLine entry and I don't know how it got there.

The bad hash is 3df9018676de219bb3e46e88eea09c98.  I've attached a
file with the binutils do_install() contents which hash to that value.

The bad 3df9018676de219bb3e46e88eea09c98 entry in the bb_codeparser.dat returned
DEBUG: execs [
DEBUG: execs rm
DEBUG: execs install
DEBUG: execs test
DEBUG: execs sed
DEBUG: execs rmdir
DEBUG: execs bbfatal_log
DEBUG: execs mv
DEBUG: execs /home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python
DEBUG: execs find

These execs looks like they could be from a distutils_do_install(),
but that's just a guess.  python-async was not in my tmp-glibc
directory when I started this investigation.  I don't know how it got
there.  I built it manually, but the resulting distutils_do_install
has a different hash :(

The correct shellCacheLine entry for core2-64 binutils do_install returns:
DEBUG: execs basename
DEBUG: execs rm
DEBUG: execs oe_multilib_header
DEBUG: execs ln
DEBUG: execs install
DEBUG: execs echo
DEBUG: execs cd
DEBUG: execs autotools_do_install
DEBUG: execs sed
DEBUG: execs tr

Is it an md5 collision?  I don't know - I don't have a second
colliding input for 3df9018676de219bb3e46e88eea09c98.

Any hashing can potentially have collisions.  A longer and stronger
algorithm reduces the chances, but there is no absolute fix.  Without
comparing the original inputs, you can't know if two inputs collided.

This openxt 8 build is based on pyro, fyi.

Regards,
Jason

--00000000000020ec00057d4f796d
Content-Type: application/octet-stream; 
	name=binutils_do_install-3df9018676de219bb3e46e88eea09c98
Content-Disposition: attachment; 
	filename=binutils_do_install-3df9018676de219bb3e46e88eea09c98
Content-Transfer-Encoding: base64
Content-ID: <f_jptuyn9u0>
X-Attachment-Id: f_jptuyn9u0

CWF1dG90b29sc19kb19pbnN0YWxsCgoJIyBXZSBkb24ndCByZWFsbHkgbmVlZCB0aGVzZSwgc28g
d2UnbGwgcmVtb3ZlIHRoZW0uLi4KCXJtIC1yZiAvaG9tZS9idWlsZC9vcGVueHQtY29tcGFydG1l
bnRzL2J1aWxkL3RtcC1nbGliYy93b3JrL2NvcmUyLTY0LW9lLWxpbnV4L2JpbnV0aWxzLzIuMjgt
cjAvaW1hZ2UvdXNyL2xpYi9sZHNjcmlwdHMKCgkjIEZpeCB0aGUgL3Vzci94ODZfNjQtb2UtbGlu
dXgvYmluLyogbGlua3MKCWZvciBsIGluIC9ob21lL2J1aWxkL29wZW54dC1jb21wYXJ0bWVudHMv
YnVpbGQvdG1wLWdsaWJjL3dvcmsvY29yZTItNjQtb2UtbGludXgvYmludXRpbHMvMi4yOC1yMC9p
bWFnZS91c3IveDg2XzY0LW9lLWxpbnV4L2Jpbi8qOyBkbwoJCXJtIC1mICRsCgkJbG4gLXNmIGBl
Y2hvIC91c3IveDg2XzY0LW9lLWxpbnV4L2JpbiBcCgkJCXwgdHIgLXMgLyBcCgkJCXwgc2VkIC1l
ICdzLF4vLCwnIC1lICdzLFteL10qLC4uLGcnYC91c3IvYmluL3g4Nl82NC1vZS1saW51eC1gYmFz
ZW5hbWUgJGxgICRsCglkb25lCgoJIyBJbnN0YWxsIHRoZSBsaWJpYmVydHkgaGVhZGVyCglpbnN0
YWxsIC1kIC9ob21lL2J1aWxkL29wZW54dC1jb21wYXJ0bWVudHMvYnVpbGQvdG1wLWdsaWJjL3dv
cmsvY29yZTItNjQtb2UtbGludXgvYmludXRpbHMvMi4yOC1yMC9pbWFnZS91c3IvaW5jbHVkZQoJ
aW5zdGFsbCAtbSA2NDQgL2hvbWUvYnVpbGQvb3Blbnh0LWNvbXBhcnRtZW50cy9idWlsZC90bXAt
Z2xpYmMvd29yay9jb3JlMi02NC1vZS1saW51eC9iaW51dGlscy8yLjI4LXIwL2dpdC9pbmNsdWRl
L2Fuc2lkZWNsLmggL2hvbWUvYnVpbGQvb3Blbnh0LWNvbXBhcnRtZW50cy9idWlsZC90bXAtZ2xp
YmMvd29yay9jb3JlMi02NC1vZS1saW51eC9iaW51dGlscy8yLjI4LXIwL2ltYWdlL3Vzci9pbmNs
dWRlCglpbnN0YWxsIC1tIDY0NCAvaG9tZS9idWlsZC9vcGVueHQtY29tcGFydG1lbnRzL2J1aWxk
L3RtcC1nbGliYy93b3JrL2NvcmUyLTY0LW9lLWxpbnV4L2JpbnV0aWxzLzIuMjgtcjAvZ2l0L2lu
Y2x1ZGUvbGliaWJlcnR5LmggL2hvbWUvYnVpbGQvb3Blbnh0LWNvbXBhcnRtZW50cy9idWlsZC90
bXAtZ2xpYmMvd29yay9jb3JlMi02NC1vZS1saW51eC9iaW51dGlscy8yLjI4LXIwL2ltYWdlL3Vz
ci9pbmNsdWRlCgoJY2QgL2hvbWUvYnVpbGQvb3Blbnh0LWNvbXBhcnRtZW50cy9idWlsZC90bXAt
Z2xpYmMvd29yay9jb3JlMi02NC1vZS1saW51eC9iaW51dGlscy8yLjI4LXIwL2ltYWdlL3Vzci9i
aW4KCgkjIFN5bWxpbmtzIGZvciBlYXNlIG9mIHJ1bm5pbmcgdGhlc2Ugb24gdGhlIG5hdGl2ZSB0
YXJnZXQKCWZvciBwIGluIHg4Nl82NC1vZS1saW51eC0qIDsgZG8KCQlsbiAtc2YgJHAgYGVjaG8g
JHAgfCBzZWQgLWUgcyx4ODZfNjQtb2UtbGludXgtLCxgCglkb25lCgoJZm9yIGFsdCBpbiAgCWFk
ZHIybGluZSAJYXIgCWFzIAljKytmaWx0IAllbGZlZGl0IAlncHJvZiAJbGQgCWxkLmJmZCAJbGQu
Z29sZCBkd3AgCW5tIAlvYmpjb3B5IAlvYmpkdW1wIAlyYW5saWIgCXJlYWRlbGYgCXNpemUgCXN0
cmluZ3MgCXN0cmlwIDsgZG8KCQlybSAtZiAvaG9tZS9idWlsZC9vcGVueHQtY29tcGFydG1lbnRz
L2J1aWxkL3RtcC1nbGliYy93b3JrL2NvcmUyLTY0LW9lLWxpbnV4L2JpbnV0aWxzLzIuMjgtcjAv
aW1hZ2UvdXNyL2Jpbi8kYWx0Cglkb25lCgoJb2VfbXVsdGlsaWJfaGVhZGVyIGJmZC5oCg==

--00000000000020ec00057d4f796d--
