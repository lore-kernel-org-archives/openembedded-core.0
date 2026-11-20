Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.271.1795194598279456406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 09:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=OCWNPHt8;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C44A03D8133F;
	Fri, 20 Nov 2026 12:09:56 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id rSJw4OAdUeGq; Fri, 20 Nov 2026 12:09:55 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A83DB3D815E2;
	Fri, 20 Nov 2026 12:09:55 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A83DB3D815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1795194595; bh=kziE4j6lu+aVT7oDcxyTPIltnB8ry82tsdbIwDJsj1w=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=OCWNPHt8NRjfF2xp+9psTvEre8TouWLEgAv8v+KxPGsgCVMSdRMEN5iXCrGGyrz5p
	 Rpy/CUvNY6RjlbXF7Nbu3gGKvpCkbD6tGNEfaXpOOLJP3e2QF7LR/Zb7nEtHEjk+OM
	 8+PD81i7vh6LaFv8ig9mi+TOnvG1gfqgbNR8WMdlgVzExWyZRUV8q++IgAjVViN40i
	 oc4+WyfDMkp3KkMkJ5h4gjmUyzDkeN6d5/KTIHEqyvCUC1fh0zsExNL9tA7CZO3NmM
	 g8qbvVj7XhWQqWj/ueCtVacSm8NdCD4ygP+rhAp2zeEXjbiEoGYMrWEqFl8nIVjSug
	 EcNKP1jOKTw+A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id V1XKw37beL1k; Fri, 20 Nov 2026 12:09:55 -0500 (EST)
Received: from [172.16.21.14] (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A6C073D8133F;
	Fri, 20 Nov 2026 12:09:54 -0500 (EST)
Message-ID: <72b94c28-8f93-4c2d-8423-d63f6c093552@savoirfairelinux.com>
Date: Fri, 20 Nov 2026 18:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: Re: [OE-core] [PATCH v2 00/18] devtool: ide-sdk: add support for Rust
 recipes
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org,
 Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
 <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com>
 <CAB3asfiNShsoU4MzCjkUieDaBqs36MiGLuV6oLb7K1tX3ufbTw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAB3asfiNShsoU4MzCjkUieDaBqs36MiGLuV6oLb7K1tX3ufbTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 17:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250818


On 11/11/26 07:46, Adrian Freihofer wrote:
>=20
>=20
> Am Di., 10. Nov. 2026 um 13:25=C2=A0Uhr schrieb Mathieu Dubois-Briand v=
ia=20
> openembedded-core <mathieu.dubois-=20
> briand=3Dbootlin.com@lists.openembedded.org=20
> <mailto:bootlin.com@lists.openembedded.org>>:
>     I can see one of the selftest is failing, but only in 1 of the 3
>     selftest builds. So it might be something not fully deterministic w=
ith
>     lldb-server installation:
>     Warning: Permanently added '[localhost]:2222' (RSA) to the list of
>     known hosts.
>     /bin/sh: line 0: /usr/bin/lldb-server: not found
>     lldb-server exited before it started listening on port 1266
>=20
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/
>     builds/5043 <https://autobuilder.yoctoproject.org/valkyrie/#/
>     builders/48/builds/5043>
>=20
>     Can you have a look at the issue?
>=20
> That can happen if one test instance tries to connect to the wrong=20
> runqemu instance (e.g. one with gdb-server installed) respectively the=20
> port exposed on the build machine. There is a patch series which tries=20
> to fix that. But v1 was rejected because it used Qemu's human readable=20
> QMP API instead of the machine readable JSON API. v2 is still WIP=20
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf=
/=20
> runqemu-use-qmp-for-port-alloc <https://git.openembedded.org/=20
> openembedded-core-contrib/log/?h=3Dadrianf/runqemu-use-qmp-for-port-=20
> alloc>. It requires adding some APIs to Qemu upstream. Not a trivial=20
> quick fix. I was also lowering the priority on that because it seemed=20
> like working.
>=20
> Probably this issue is not directly introduced by this patch series. Bu=
t=20
> the more tests we add, the more likely it becomes that two of them run=20
> in parallel and fail in that wy.

Hello,

Should I wait for that series to be merged?

Otherwise, I can provide a fix that would directly update the tasks.json=20
from the actual Qemu SSH Slirp port returned by
`qemu_cm =3D runqemu(testimage, runqemuparams=3Drunqemuparams,=20
launch_cmd=3Dlaunch_cmd)`. It's just a few lines, but it does look more=20
like a workaround than a solution. I can make that a separate commit=20
that would be easy to revert once Adrian's branch has been merged.

devtool ide-sdk also accepts an ssh port argument, but the current test=20
flow needs to execute qemu after ide-sdk has been run.

Please let me know how you want to proceed, or if you have any other=20
remarks on this stack.

Best Regards,
Enguerrand de Ribaucourt
