Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0376E606CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:15:41 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r68so1524567wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 05:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=isAXrkzAX1SIwfDa+LSMFrohy1GSp2WuzqLjQ55b3Vs=;
	b=sxrnclpxlHQ9006fxer9hDOjXgcVV233Zc9hLeMLMd3Jf1RG5hKeRtY8fkpV7V/m+J
	75NCXWty50Rx7Ioq7g+aOL3ir9rV0MVcWj47DLTEVHqZ9ewYMER8JcfqRglmXYhknKlK
	dh1SDEoDhq4h6YPM6/Elxa7oGrBaWKTJ/A9yYa3Zi7jxER94AlOKGmuynmdIorkeN3BN
	jKgTa+7UMlnxU5TN+J9w9DGIXvHT+il15kWfneGl+ZATJmW+n0JWGaaD0e8q/25TX0In
	pYsjB9XNTs11Pc7WnCIKYNevRYSB13zLzDkx0tG4UpmbspnW26mfChnrH/gjS/L2jFRP
	eZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=isAXrkzAX1SIwfDa+LSMFrohy1GSp2WuzqLjQ55b3Vs=;
	b=fTKSCo6EGnF9hGL2tM3YTz53HrnbrvPhNHyW5uSBY4pUxoI6SlRnYlrdiV661kucd1
	WQVaiTiy+qEjdyiui3NjXViKgFKsQdP/V7WKHHs0tSZysF5jcWzlsBy+k4rX6n92HTPx
	lfG1bkQ0Xo+/epaeHVzVVwvUbWR+7G0qt1L7FkQD7zTZpXHoI0ZXPwTGphj2z2wGd0OT
	BOrvuW6ibhvzeM1y/b+csKmX3FG0hPn2zqZWkvl2nNBEz5UovN+bJ8F+PVRvTsl6esxp
	y/nwQOQwqJU4mIo4+Id/CdfdMOstD/RPMccpaYmGIUNyRVwjVsJEGOAoJ+BM1P7o+FAD
	/T2g==
X-Gm-Message-State: AMCzsaVddNkFZ4OqjNKdQiTT96O9Z8NqG8RfBhM8wsZtqz9qivq5wRUi
	+BiaVNDfAJna5LSpchiUzcZ0M/Q2IRvZJvDzPCo=
X-Google-Smtp-Source: ABhQp+SbCZl0KaYR0QRmDF7lyG7lq25tfUFW5GD21ChfVcpN5ukXK3Z1Fs9s9sJdpqCuSYn0sBd1DHkBddCuhfIkr74=
X-Received: by 10.28.235.18 with SMTP id j18mr1618234wmh.50.1508933742776;
	Wed, 25 Oct 2017 05:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
	<CA+chaQfdT_wySFELWqaDtMC3Q-1k6MQ-0ApnwZEHmAPzvuMWcA@mail.gmail.com>
	<CA+jxWbfRDk9Fms1QtAQ6y1HQ-uVzE2Pwt_NZ8RiZC8jkMohj0w@mail.gmail.com>
In-Reply-To: <CA+jxWbfRDk9Fms1QtAQ6y1HQ-uVzE2Pwt_NZ8RiZC8jkMohj0w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Oct 2017 12:15:32 +0000
Message-ID: <CA+chaQdWrh9Xe=QP31AnAxbShOQNDx4yjQ9xJTZbDqUq1e=uww@mail.gmail.com>
To: shubhabrata sen <shubhabrata.sen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Swig dependency error while building firmware with apparmor
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
X-List-Received-Date: Wed, 25 Oct 2017 12:15:42 -0000
Content-Type: multipart/alternative; boundary="089e082fe004ba5499055c5e032e"

--089e082fe004ba5499055c5e032e
Content-Type: text/plain; charset="UTF-8"

swig-native builds swig for your host system, so that it can be executed
during the build. So your apparmor configure most likely searches for swig
in PATH and swig-native dependency will make sure it's there.

On Wed, Oct 25, 2017, 13:56 shubhabrata sen <shubhabrata.sen@gmail.com>
wrote:

> Hi Martin,
>
> Thank you for your reply. Could you please give a bit more details about
> this ? I'm relatively new to the openembedded environment.
>
> On Wed, Oct 25, 2017 at 12:28 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> you probably want swig-native dependency.
>>
>> On Wed, Oct 25, 2017, 11:09 shubhabrata sen <shubhabrata.sen@gmail.com>
>> wrote:
>>
>>> Hi,
>>>
>>> I'm trying to build a firmware with the apparmor recipe and I keep
>>> getting the following error
>>>
>>> *checking for swig... no*
>>> | checking whether the libapparmor debug output should be enabled... no
>>> | checking whether the libapparmor man pages should be generated... yes
>>> | checking for podchecker... podchecker
>>> | checking for pod2man... pod2man
>>> | checking whether python bindings are enabled... yes
>>> *| configure: error: swig is required when enabling python bindings*
>>> | WARNING:
>>> /home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.8464:1
>>> exit 1 from 'PERL="${PERL}"
>>> PYTHON="/home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python"
>>> ./configure --build=x86_64-linux --host=arm-poky-linux-gnueabi
>>> --target=arm-poky-linux-gnueabi --prefix=/usr --libdir=/usr/lib
>>> --mandir=/usr/share/man --includedir=/usr/include --with-perl --with-python'
>>>
>>> I've included the SWIG recipe in the build and I can successfully build
>>> the firmware including swig with the bitbake command but somehow the
>>> apparmor recipe can't find the swig package. Any help regarding this would
>>> be appreciated.
>>>
>>> Thanks
>>>
>>> Shubh
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>

--089e082fe004ba5499055c5e032e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">swig-native builds swig for your host system, so that it can=
 be executed during the build. So your apparmor configure most likely searc=
hes for swig in PATH and swig-native dependency will make sure it&#39;s the=
re.</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 25, 2017, 13:56=
 shubhabrata sen &lt;<a href=3D"mailto:shubhabrata.sen@gmail.com">shubhabra=
ta.sen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr">Hi Martin,<div><br></div><div>Thank you for your reply. Could=
 you please give a bit more details about this ? I&#39;m relatively new to =
the openembedded environment.</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Wed, Oct 25, 2017 at 12:28 PM, Martin Jansa <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blan=
k">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><p dir=3D"ltr">you probably want swig-native dependency.</p>
<br><div class=3D"gmail_quote"><div><div class=3D"m_8743088144790962283h5">=
<div dir=3D"ltr">On Wed, Oct 25, 2017, 11:09 shubhabrata sen &lt;<a href=3D=
"mailto:shubhabrata.sen@gmail.com" target=3D"_blank">shubhabrata.sen@gmail.=
com</a>&gt; wrote:<br></div></div></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
><div class=3D"m_8743088144790962283h5"><div dir=3D"ltr">Hi,<div><br></div>=
<div>I&#39;m trying to build a firmware with the apparmor recipe and I keep=
 getting the following error</div><div><br></div><div><div><b>checking for =
swig... no</b></div><div>| checking whether the libapparmor debug output sh=
ould be enabled... no</div><div>| checking whether the libapparmor man page=
s should be generated... yes</div><div>| checking for podchecker... podchec=
ker</div><div>| checking for pod2man... pod2man</div><div>| checking whethe=
r python bindings are enabled... yes</div><div><b>| configure: error: swig =
is required when enabling python bindings</b></div><div>| WARNING: /home/sh=
ubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/a=
pparmor/2.10.95-r0/temp/run.do_configure.8464:1 exit 1 from &#39;PERL=3D&qu=
ot;${PERL}&quot; PYTHON=3D&quot;/home/shubhabs/dists/cvp/builds/p1367/tmp/w=
ork/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/recipe-sysroot-n=
ative/usr/bin/python-native/python&quot; ./configure --build=3Dx86_64-linux=
 --host=3Darm-poky-linux-gnueabi --target=3Darm-poky-linux-gnueabi --prefix=
=3D/usr --libdir=3D/usr/lib --mandir=3D/usr/share/man --includedir=3D/usr/i=
nclude --with-perl --with-python&#39;</div></div><div><br></div><div>I&#39;=
ve included the SWIG recipe in the build and I can successfully build the f=
irmware including swig with the bitbake command but somehow the apparmor re=
cipe can&#39;t find the swig package. Any help regarding this would be appr=
eciated.</div><div><br></div><div>Thanks</div><div><br></div><div>Shubh</di=
v></div></div></div><span class=3D"m_8743088144790962283HOEnZb"><font color=
=3D"#888888">
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div>
</blockquote></div><br></div>
</blockquote></div>

--089e082fe004ba5499055c5e032e--
