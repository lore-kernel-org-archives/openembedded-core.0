Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4218.1794379596170771057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GSdYTVUR;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2424411f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 22:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794379594; cv=none;
        d=google.com; s=arc-20260327;
        b=XwS6TIjnSdfUWxrJyMumYGQgSQKM6Q5F/mqA5oKFh/SjNqODKcrxCZbM4irDQmCD/6
         ra8CxCKeAP07PMUpghcgn6ds8XltxyzoYtYImkTbofw1cRxLVjBygCCMkpkQpzAWoo2V
         9u0U8vMmsVVFtVn7i5JM0KcOUyvUw73KImyxDWRiKKK4Or3d5aazfM2p2Zog2FTgVFsp
         JbeH+jhDGtD3+p54R9JraT9QUeo/xu7l4l2JNMn/D1rW1j08w+IMZIqU8yU1cKpfiRb5
         JlfvQTS/yWZla5zXD3s8uMhtHzgc9nVPhjttvFzNAAuymRiPoqb2NtY6GjRyNCDPzHGv
         9ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ilJui2iWwLloOCllC3/0WKL8odntM0FZeJzbcxXm2Os=;
        fh=hCw97YdChfln84upe/YmWq2cFG/m5eKrF4fwvs0Xp4Y=;
        b=WUwryDAgerux0I+ffd66d7K7g40ywnYv7GzmVbB96nJfK0vWYLzcql9ZtdJ5hZYTUA
         A1Mxj1rOxcqwgrDRSfFW5obe1acj+a/0gwybUUIdPGPttxNzRBqDDs3uLztxfY4xYJDw
         D9vIm0wrpTLjrpIfgNyHJUPGayJmKSeuzViUU3ATAWKs5L2pPSGAjQSGLb/81VAWMvsT
         iDl7EfB3Ehh9+jpYKpRlZJjCNDqXACgpVGC5I4sQSr8nqwF1O1mGDyhMpgw8zDfQ9jqw
         DtQExG0LbxbOzz3Vm2fxo2r9OBvDJHfV9Rg/mcX62LRnvfFRdw6ks5ZMTKyy18vBMsjw
         0/zQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794379594; x=1794984394; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilJui2iWwLloOCllC3/0WKL8odntM0FZeJzbcxXm2Os=;
        b=GSdYTVURTqvQczr5DgMP5M5BMhFAsN3Rx0NG1LPGAld3f/0DlqFv4XpLZ6yRrO3cdy
         2feIHW7waehFfLJhw9v6V7kZEnrwluohmpfvPUswK9M/C7fGLjgSX//gSq1Mm3umNtzA
         mn88vtx5orD8N4Q8pp3076OG48Ve7dc7Nj1cq2sKy0TwagIPpgJ/P2QnIIvIjIEAJila
         U6TDsFrxROj4ii7pY3/OTZJfVFZAqep5iMe42PTyps0EzaavFf6UNdGfYWXi5JBaHA5R
         RJtsn9HiUR+9eglWuIBPv2WjwQqxrhpBVUwMPkjlKQdLaS0iQwM3yjfP5zZcllvVt9t7
         3yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379594; x=1794984394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ilJui2iWwLloOCllC3/0WKL8odntM0FZeJzbcxXm2Os=;
        b=HvTqBFjGi4fTk9NmdAaZk8SqwwiEODw+GJ6zWgP5mPOrdL8QvWeuVqQ3rhhlZf7PbG
         XR4nidMxFf9zm2vE3PMiOJTM1jirHaIAb8GQLi/jfqKFMyHt9r6NNDfbq4JkF6luh58E
         /keGDJmPjB0AMCuCLlnP+FXvID9O47guMP7He7N7wSjDwZ1ztlEC+IU6zxd3v6EnEpNo
         di7/Tn7j++a92DvUBSzVYUZObscZU3y2dIjyGjSwFWO3UZFnrP50sfAQ6Zcj4vMEvLjo
         qZLU7Bqe0Zth3lIEuwUwKbRrJDeVcKEc+ePLKY+X9CeRG+atbQn677sCy/pE6wJVq7hT
         +6rQ==
X-Forwarded-Encrypted: i=1; AL+hErGQvdrWK9JYCRaokOY7rEitrVfufk+02i6vAkbFys8qsRQK6muP1j2vUVDqYb/X3c2kDBCqxS1EEiYsLUBXAUsV9g==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9X6AgKWSbXrlzUXWaJ7fDeYVlUkbTfPAECyeNloEHVT/DKYyW5
	YOW67VIfaQXIRpx8Nq1vLVdMutd1UoJhAbq4i7FPR59mL+nbWhivxWTWpMdKJ+9YJaNqDcp7Iew
	b21wf4ML6tM7J3w/2mC5NQMk5gTVBVZI=
X-Gm-Gg: AYBFou1qzZd1x5vdLkeNdDHBuFjDbXsnJZ9uBEt7d45x9bMp3YNk7+R2I13pMqaerkG
	gAgCb6gIkFzFU8iXBIGLBb4qIdd3yi1M0fdS0gTeVp1Y4ciVOjN9035fhaM9CRClM7qpMYvohwx
	v+Ff0eFuzyULZbwEFRhR4jugZF31Tc+nfiPQm8E1HP+781ANBh/C2rWkMKp1gx1c5xXjsBrbHQQ
	h19xmSZOMv3G1axXq08GSICcxupaTZL7rm8MCKFZrXAD7gBwKNZTrQOLn7yksLAo23LbF9Jikum
	2Ph8hDR1mGP0/AJSi3OXwk05ndEgVtIG4UkzIHAxT7IZlCA0twnnZZ1AV1N9CBE+3Rhwpl5Ez81
	Z/S2paTnwAl4P8uQJouX7oqJKVRMaamfFo8KM5aiz
X-Received: by 2002:a5d:5f46:0:b0:492:820d:5e6 with SMTP id
 ffacd0b85a97d-499c7ef353bmr1815737f8f.49.1794379593979; Tue, 10 Nov 2026
 22:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
 <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com>
In-Reply-To: <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Wed, 11 Nov 2026 07:46:22 +0100
X-Gm-Features: AclHuK--hraigbdBgJCsO7Fb_cIXNEWU1PtGKbXt2wHxh4BRwFkG9SMYF-VNzEw
Message-ID: <CAB3asfiNShsoU4MzCjkUieDaBqs36MiGLuV6oLb7K1tX3ufbTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/18] devtool: ide-sdk: add support for Rust recipes
To: mathieu.dubois-briand@bootlin.com
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000004a99e9065ffa8e37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249967

--0000000000004a99e9065ffa8e37
Content-Type: text/plain; charset="UTF-8"

Am Di., 10. Nov. 2026 um 13:25 Uhr schrieb Mathieu Dubois-Briand via
openembedded-core <mathieu.dubois-briand=bootlin.com@lists.openembedded.org
>:

> On Mon Nov 9, 2026 at 2:44 PM CET, Enguerrand de Ribaucourt via
> openembedded-core wrote:
> > Hello, this series introduces support for Rust ide-sdk VS Code
> > configuration against the Yocto cross-compilation toolchain:
> >
> >  - editor symbol resolution and linting
> >  - build task
> >  - deploy task
> >  - debugging
> >
> > It introduces a cargo-example recipe following the model used for
> > cmake and meson.
> >
> > The generated configurations can be portable to standalone SDK
> > installations by manually updating the paths.
> >
> > C/C++ IntelliSense could provide navigation for native code compiled
> > by Cargo build scripts, using the recipe compiler and sysroot. This
> > first series defers it because no mixed-language fixture is available
> > to validate that workflow.
> >
> > BitBake generates the Cargo configuration consumed by ide-sdk. This
> series
> > updates the parsed configuration and writes its supported TOML values
> > without adding a new dependency.
> >
> > I reproduced the selftest coverage expected from other recipe classes,
> > including configuration analysis up to actual debugging symbol
> resolution.
> >
> > I largely used AI generation to write this stack. After many iterations,
> > I am finally happy with the code and commit history quality of this
> series.
> > I also have a documentation commit ready for the manual if this gets
> > approved.
> >
> > Any feedback is appreciated. Hope this will help lots of Rust developers
> > working with Yocto distros :).
> >
> > Cheers,
> > Enguerrand de Ribaucourt
> >
> > Signed-off-by: Enguerrand de Ribaucourt <
> enguerrand.de-ribaucourt@savoirfairelinux.com>
> > ---
>
> Hi Enguerrand,
>
> Thanks for the v2.
>
> I can see one of the selftest is failing, but only in 1 of the 3
> selftest builds. So it might be something not fully deterministic with
> lldb-server installation:
>
> 2026-11-10 10:42:27,794 - oe-selftest - INFO -
> devtool.DevtoolIdeSdkRustTests.test_code_cargo_qemu_slirp
> (subunit.RemotedTestCase)
> 2026-11-10 10:42:27,795 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-11-10 10:42:27,795 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
> line 4503, in test_code_cargo_qemu_slirp
>     self._verify_rust_lldb_debugging(tempdir, expected_input=4)
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
> line 4545, in _verify_rust_lldb_debugging
>     runCmd(ssh_args, output_log=self._cmd_logger)
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded-core/meta/lib/oeqa/utils/commands.py",
> line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command '['ssh', '-p', '2222', '-o',
> 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no',
> 'root@localhost', "/bin/sh -c 'grep -q :04F2 /proc/net/tcp /proc/net/tcp6
> 2>/dev/null && exit 0; mkdir -p
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi; cd
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi; /usr/bin/lldb-server
> platform --server --listen *:1266 --gdbserver-port 1267 >
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.log 2>&1 &
> _lldb_server_pid=$!; echo $_lldb_server_pid >
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.pid; _w=0;
> while ! grep -q :04F2 /proc/net/tcp /proc/net/tcp6 2>/dev/null; do kill -0
> $_lldb_server_pid 2>/dev/null || { cat
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.log >&2; echo
> lldb-server exited before it started listening on port 1266 >&2; exit 1; };
> _w=$((_w+1)); [ $_w -lt 600 ] || { kill $_lldb_server_pid 2>/dev/null; echo
> lldb-server did not start on port 1266 after $_w retries >&2; cat
> /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.log >&2; exit
> 1; }; sleep 0.1; done;'"]' returned non-zero exit status 1:
> Warning: Permanently added '[localhost]:2222' (RSA) to the list of known
> hosts.
> /bin/sh: line 0: /usr/bin/lldb-server: not found
> lldb-server exited before it started listening on port 1266
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5043
>
> Can you have a look at the issue?
>
> I launched a rebuild of that build, out of curiosity. But in all cases,
> we should understand what happened here.
>

This can be tricky. The explanation could be that a test

   1. devtool ide-sdk adds the lldb-server to the image and builds it
   2. The test
      1. starts Qemu
      2. starts lldb-server in Qemu which goes wrong because lldb-server is
      not in the image

That can happen if one test instance tries to connect to the wrong runqemu
instance (e.g. one with gdb-server installed) respectively the port exposed
on the build machine. There is a patch series which tries to fix that. But
v1 was rejected because it used Qemu's human readable QMP API instead of
the machine readable JSON API. v2 is still WIP
https://git.openembedded.org/openembedded-core-contrib/log/?h=adrianf/runqemu-use-qmp-for-port-alloc.
It requires adding some APIs to Qemu upstream. Not a trivial quick fix. I
was also lowering the priority on that because it seemed like working.

Probably this issue is not directly introduced by this patch series. But
the more tests we add, the more likely it becomes that two of them run in
parallel and fail in that wy.

Regards,
Adrian


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249920):
> https://lists.openembedded.org/g/openembedded-core/message/249920
> Mute This Topic: https://lists.openembedded.org/mt/122173943/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004a99e9065ffa8e37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 10. Nov=
. 2026 um 13:25=C2=A0Uhr schrieb Mathieu Dubois-Briand via openembedded-cor=
e &lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@lists.openembed=
ded.org">bootlin.com@lists.openembedded.org</a>&gt;:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Mon Nov 9, 2026 at 2:44 PM CET, Eng=
uerrand de Ribaucourt via openembedded-core wrote:<br>
&gt; Hello, this series introduces support for Rust ide-sdk VS Code<br>
&gt; configuration against the Yocto cross-compilation toolchain:<br>
&gt;<br>
&gt;=C2=A0 - editor symbol resolution and linting<br>
&gt;=C2=A0 - build task<br>
&gt;=C2=A0 - deploy task<br>
&gt;=C2=A0 - debugging<br>
&gt;<br>
&gt; It introduces a cargo-example recipe following the model used for<br>
&gt; cmake and meson.<br>
&gt;<br>
&gt; The generated configurations can be portable to standalone SDK<br>
&gt; installations by manually updating the paths.<br>
&gt;<br>
&gt; C/C++ IntelliSense could provide navigation for native code compiled<b=
r>
&gt; by Cargo build scripts, using the recipe compiler and sysroot. This<br=
>
&gt; first series defers it because no mixed-language fixture is available<=
br>
&gt; to validate that workflow.<br>
&gt;<br>
&gt; BitBake generates the Cargo configuration consumed by ide-sdk. This se=
ries<br>
&gt; updates the parsed configuration and writes its supported TOML values<=
br>
&gt; without adding a new dependency.<br>
&gt;<br>
&gt; I reproduced the selftest coverage expected from other recipe classes,=
<br>
&gt; including configuration analysis up to actual debugging symbol resolut=
ion.<br>
&gt;<br>
&gt; I largely used AI generation to write this stack. After many iteration=
s,<br>
&gt; I am finally happy with the code and commit history quality of this se=
ries.<br>
&gt; I also have a documentation commit ready for the manual if this gets<b=
r>
&gt; approved.<br>
&gt;<br>
&gt; Any feedback is appreciated. Hope this will help lots of Rust develope=
rs<br>
&gt; working with Yocto distros :).<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Enguerrand de Ribaucourt<br>
&gt;<br>
&gt; Signed-off-by: Enguerrand de Ribaucourt &lt;<a href=3D"mailto:enguerra=
nd.de-ribaucourt@savoirfairelinux.com" target=3D"_blank">enguerrand.de-riba=
ucourt@savoirfairelinux.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Enguerrand,<br>
<br>
Thanks for the v2.<br>
<br>
I can see one of the selftest is failing, but only in 1 of the 3<br>
selftest builds. So it might be something not fully deterministic with<br>
lldb-server installation:<br>
<br>
2026-11-10 10:42:27,794 - oe-selftest - INFO - devtool.DevtoolIdeSdkRustTes=
ts.test_code_cargo_qemu_slirp (subunit.RemotedTestCase)<br>
2026-11-10 10:42:27,795 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
2026-11-10 10:42:27,795 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&quot;, line 45=
03, in test_code_cargo_qemu_slirp<br>
=C2=A0 =C2=A0 self._verify_rust_lldb_debugging(tempdir, expected_input=3D4)=
<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&quot;, line 45=
45, in _verify_rust_lldb_debugging<br>
=C2=A0 =C2=A0 runCmd(ssh_args, output_log=3Dself._cmd_logger)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/laye=
rs/openembedded-core/meta/lib/oeqa/utils/commands.py&quot;, line 214, in ru=
nCmd<br>
=C2=A0 =C2=A0 raise AssertionError(&quot;Command &#39;%s&#39; returned non-=
zero exit status %d:\n%s&quot; % (command, result.status, exc_output))<br>
AssertionError: Command &#39;[&#39;ssh&#39;, &#39;-p&#39;, &#39;2222&#39;, =
&#39;-o&#39;, &#39;UserKnownHostsFile=3D/dev/null&#39;, &#39;-o&#39;, &#39;=
StrictHostKeyChecking=3Dno&#39;, &#39;root@localhost&#39;, &quot;/bin/sh -c=
 &#39;grep -q :04F2 /proc/net/tcp /proc/net/tcp6 2&gt;/dev/null &amp;&amp; =
exit 0; mkdir -p /tmp/lldb_server_1266_usr-bin-cargo-example_multi; cd /tmp=
/lldb_server_1266_usr-bin-cargo-example_multi; /usr/bin/lldb-server platfor=
m --server --listen *:1266 --gdbserver-port 1267 &gt; /tmp/lldb_server_1266=
_usr-bin-cargo-example_multi/lldb_server.log 2&gt;&amp;1 &amp; _lldb_server=
_pid=3D$!; echo $_lldb_server_pid &gt; /tmp/lldb_server_1266_usr-bin-cargo-=
example_multi/lldb_server.pid; _w=3D0; while ! grep -q :04F2 /proc/net/tcp =
/proc/net/tcp6 2&gt;/dev/null; do kill -0 $_lldb_server_pid 2&gt;/dev/null =
|| { cat /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.log =
&gt;&amp;2; echo lldb-server exited before it started listening on port 126=
6 &gt;&amp;2; exit 1; }; _w=3D$((_w+1)); [ $_w -lt 600 ] || { kill $_lldb_s=
erver_pid 2&gt;/dev/null; echo lldb-server did not start on port 1266 after=
 $_w retries &gt;&amp;2; cat /tmp/lldb_server_1266_usr-bin-cargo-example_mu=
lti/lldb_server.log &gt;&amp;2; exit 1; }; sleep 0.1; done;&#39;&quot;]&#39=
; returned non-zero exit status 1:<br>
Warning: Permanently added &#39;[localhost]:2222&#39; (RSA) to the list of =
known hosts.<br>
/bin/sh: line 0: /usr/bin/lldb-server: not found<br>
lldb-server exited before it started listening on port 1266<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/5043" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/5043</a><br>
<br>
Can you have a look at the issue?<br>
<br>
I launched a rebuild of that build, out of curiosity. But in all cases,<br>
we should understand what happened here.<br></blockquote><div><br></div><di=
v>This can be tricky. The explanation could be that a test</div><div><ol><l=
i>devtool ide-sdk adds the lldb-server to the image and builds it</li><li>T=
he test</li><ol><li>starts Qemu</li><li>starts lldb-server in Qemu which go=
es wrong because lldb-server is not in the image</li></ol></ol><div>That ca=
n happen if one test instance tries to connect to the wrong runqemu instanc=
e (e.g. one with gdb-server installed) respectively the port exposed on the=
 build machine. There is a patch series which tries to fix that. But v1 was=
 rejected because it used Qemu&#39;s human readable QMP API instead of the =
machine readable JSON API. v2 is still WIP=C2=A0<a href=3D"https://git.open=
embedded.org/openembedded-core-contrib/log/?h=3Dadrianf/runqemu-use-qmp-for=
-port-alloc">https://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Dadrianf/runqemu-use-qmp-for-port-alloc</a>. It requires adding some APIs=
 to Qemu upstream. Not a trivial quick fix. I was also lowering the priorit=
y on that because it seemed like working.</div><div><br></div><div>Probably=
 this issue is not directly introduced by this patch series. But the more t=
ests we add, the more likely it becomes that two of them run in parallel an=
d fail in that wy.</div><div><br></div><div>Regards,</div><div>Adrian</div>=
<div><br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249920): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249920" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249920</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122173943/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122173943/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004a99e9065ffa8e37--
