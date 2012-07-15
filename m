Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SqVXG-0005VH-Gk
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 22:35:22 +0200
Received: by obcva7 with SMTP id va7so7681178obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 13:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=NiBqahFOiDWHd/OxOjoT/2V9t1YRtisjaxZwn0rm1Xg=;
	b=jyJa6dHAOBq2OVkbnstzdI9o4JCBsGTBisJRkNND1JtwosWHcXPmeeL62VdlY5mGxU
	EIPCfRBtdlJOfPhd1Ui3d1hAaBAGZ9pnt1+XCoa03p3JkV9e3temVLWKwWtyJsBQ6P+/
	K4sHgO6bs7s5jMXmyxqbO5JERpSQchJe5r9wQk/j0spx0wq3JRWZmgn5KlaW+yalM0lr
	ctfgCqWZg6rEK9v7C1KIoAlIMLyDxlVJ6nf7HFDQLbZxZgXhIlkUUCHrwqVphQmahAaE
	tQqYjtZzzz67pJ78YD40/UhgD7GOubB+/ofytF7yCJIKVkP0+FeVtppS5DI6Qj/kVFII
	ueDw==
Received: by 10.50.11.129 with SMTP id q1mr3775981igb.8.1342383844161; Sun, 15
	Jul 2012 13:24:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Sun, 15 Jul 2012 13:23:44 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <5002FC72.5000502@linux.intel.com>
References: <cover.1342115559.git.andrei@gherzan.ro>
	<5002FC72.5000502@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 15 Jul 2012 23:23:44 +0300
Message-ID: <CAK18fxEbrOG-__4moX-sKkicqbGH_Dcd9ioRarnegqrsfZCDrA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQk8T3gZ6l4Pmr47mW/l4kglcqu6ZZL/Zr/oQtz62T9lb/FlBHfRWKO5sjXfaSLR6d0315Fa
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Update connman to v1.3 and fix dependencies for some tests
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
X-List-Received-Date: Sun, 15 Jul 2012 20:35:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320c2ef76404c4e4189b

--e89a8f50320c2ef76404c4e4189b
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 15, 2012 at 8:22 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/12/2012 10:54 AM, andrei@gherzan.ro wrote:
>
>> From: Andrei Gherzan <andrei@gherzan.ro>
>>
>> Machine tested: qemux86
>>
>> Tests done on connman-gnome
>>         OnlineMode / OfflineMode
>>         Enable / Disable Wired Networks
>>         Set manual IP configuration
>>
>> Tests on connman v.1.3
>>         addr-test
>>         iptables-test
>>         polkit-test
>>         get-global-timeservers
>>         get-proxy-autoconfig
>>         get-services
>>         get-state
>>         list-services
>>         show-introspection
>>         test-clock
>>         test-connman
>>         test-counter
>>         test-manager
>>         test-session
>>
>> The following changes since commit 90ad663909c0c8a405b22a510c9f95**
>> 7007d02669:
>>
>>    upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/**poky-contrib<http://git.yoctoproject.org/poky-contrib>ag/connman
>>    http://git.yoctoproject.org/**cgit.cgi/poky-contrib/log/?h=**
>> ag/connman<http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman>
>>
>> Andrei Gherzan (2):
>>    connman: Update to version 1.3
>>    connman.inc: Add missing dependencies needed by some tests
>>
>>   meta/recipes-connectivity/**connman/connman.inc      |    4 ++--
>>   .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/recipes-connectivity/**connman/{connman_1.0.bb =>
>> connman_1.3.bb} (82%)
>>
>>
> I am seeing connman fail to start across the Autobuilder sanity tests, I
> know you are investigating a mips failure, but there might be something
> else going on also.
>
> I do not have anything more specific.
>
>
I wanted to investigate this on my build... unfortunately it crashed it
perf... sent email on this topic.

Anyway i will investigate this connman issue further more.

ag

--e89a8f50320c2ef76404c4e4189b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sun, Jul 15, 2012 at 8:22 PM, Saul Wold <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">s=
gw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

On 07/12/2012 10:54 AM, <a href=3D"mailto:andrei@gherzan.ro" target=3D"_bla=
nk">andrei@gherzan.ro</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_bl=
ank">andrei@gherzan.ro</a>&gt;<br>
<br>
Machine tested: qemux86<br>
<br>
Tests done on connman-gnome<br>
=A0 =A0 =A0 =A0 OnlineMode / OfflineMode<br>
=A0 =A0 =A0 =A0 Enable / Disable Wired Networks<br>
=A0 =A0 =A0 =A0 Set manual IP configuration<br>
<br>
Tests on connman v.1.3<br>
=A0 =A0 =A0 =A0 addr-test<br>
=A0 =A0 =A0 =A0 iptables-test<br>
=A0 =A0 =A0 =A0 polkit-test<br>
=A0 =A0 =A0 =A0 get-global-timeservers<br>
=A0 =A0 =A0 =A0 get-proxy-autoconfig<br>
=A0 =A0 =A0 =A0 get-services<br>
=A0 =A0 =A0 =A0 get-state<br>
=A0 =A0 =A0 =A0 list-services<br>
=A0 =A0 =A0 =A0 show-introspection<br>
=A0 =A0 =A0 =A0 test-clock<br>
=A0 =A0 =A0 =A0 test-connman<br>
=A0 =A0 =A0 =A0 test-counter<br>
=A0 =A0 =A0 =A0 test-manager<br>
=A0 =A0 =A0 =A0 test-session<br>
<br>
The following changes since commit 90ad663909c0c8a405b22a510c9f95<u></u>700=
7d02669:<br>
<br>
=A0 =A0upstream_tracking: update boost (2012-07-09 17:21:38 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=A0 =A0git://<a href=3D"http://git.yoctoproject.org/poky-contrib" target=3D=
"_blank">git.yoctoproject.org/<u></u>poky-contrib</a> ag/connman<br>
=A0 =A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dag/connman" target=3D"_blank">http://git.yoctoproject.org/<u></u>cgit.cg=
i/poky-contrib/log/?h=3D<u></u>ag/connman</a><br>
<br>
Andrei Gherzan (2):<br>
=A0 =A0connman: Update to version 1.3<br>
=A0 =A0connman.inc: Add missing dependencies needed by some tests<br>
<br>
=A0 meta/recipes-connectivity/<u></u>connman/connman.inc =A0 =A0 =A0| =A0 =
=A04 ++--<br>
=A0 .../connman/{<a href=3D"http://connman_1.0.bb" target=3D"_blank">connma=
n_1.0.bb</a> =3D&gt; <a href=3D"http://connman_1.3.bb" target=3D"_blank">co=
nnman_1.3.bb</a>} =A0 =A0 | =A0 =A04 ++--<br>
=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
=A0 rename meta/recipes-connectivity/<u></u>connman/{<a href=3D"http://conn=
man_1.0.bb" target=3D"_blank">connman_1.0.bb</a> =3D&gt; <a href=3D"http://=
connman_1.3.bb" target=3D"_blank">connman_1.3.bb</a>} (82%)<br>
<br>
</blockquote>
<br>
I am seeing connman fail to start across the Autobuilder sanity tests, I kn=
ow you are investigating a mips failure, but there might be something else =
going on also.<br>
<br>
I do not have anything more specific.<br><br></blockquote><div>=A0</div><di=
v>I wanted to investigate this on my build... unfortunately it crashed it p=
erf... sent email on this topic.=A0</div><div><br></div><div>Anyway i will =
investigate this connman issue further more.</div>

<div><br></div><div>ag=A0</div><div>=A0</div></div>

--e89a8f50320c2ef76404c4e4189b--
