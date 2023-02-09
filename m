Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0201C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 08:59:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9938.1675933131432577289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 00:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KcYvzRQq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id e3so1006521wrs.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 00:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J2upr7jL3IKdP7RQKF3/jTsxjLypPRbt20kif0d1APc=;
        b=KcYvzRQq4xyw7XK5x/q5vIfTkHcKufKilQZm/S0u7Af+sdIrHwnuZ06HXIQbOxN74G
         ang1espJZf9k6ET+4282pR3AwwvXkRsdqccqkQ3dL5cxoFzEGJpSAda7vUefU70tvpcd
         R0UEtlwdBMDWbwZLA9u6dJgjBRPPDx2xSfj0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2upr7jL3IKdP7RQKF3/jTsxjLypPRbt20kif0d1APc=;
        b=5m/h88gBvkyn656py12PDpuRFm6NPlJM3r6bgupBk4T42rFrxzgzpn1dlURgigWA8U
         X2AEkMBoRdeS1B2Wgqxgeefxj1x8T/lZ9zTgyOFdmJKeITK1jk4qrGBlVvOh2VmScexn
         +/WEmQzadcfwOPXJ4CZtdI2MwbpiAUhy4KvVMMRZmn87VqQhvHudh7u0sa3fL2314aZe
         21RbcutxJU2NAf66wPpFmoxQE3ujk7XsvROmFnNbBfNTzm0jXpjCCOxb8oIxQG1CSs8F
         UBDQooTHtD2hoItPx3f/lkxf1+aCx7lEPWQeIgAI8GJYyvDfhNeUpboeBAu1BIKvyIuk
         IBwA==
X-Gm-Message-State: AO0yUKVlI01Pr/h9rpGk1kGaZb6bkgR3tLz7A0qOQs8hIyavPaaMN7++
	xVb7FzEpZ55LmfizhhNo89h1Vg==
X-Google-Smtp-Source: AK7set+YSxtwdSU6wVD1xYxk6Q3JNqSDH8xorccdHOAqDB5FuLm8B5JsPkllpu+iVHIDhW3xjawoow==
X-Received: by 2002:a05:6000:110:b0:2c3:ea52:7d0e with SMTP id o16-20020a056000011000b002c3ea527d0emr9318998wrx.69.1675933129695;
        Thu, 09 Feb 2023 00:58:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4? ([2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4])
        by smtp.gmail.com with ESMTPSA id s6-20020adff806000000b002bfd524255esm702873wrp.43.2023.02.09.00.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:58:49 -0800 (PST)
Message-ID: <766c318c861eadd02c374d65617895c60c06ec46.camel@linuxfoundation.org>
Subject: Re: Qemu doesn't respond while logging in for the Rust Oe-Selftest
 implementation.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Shinde, Yash" <Yash.Shinde@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Gowda, Naveen"
	 <Naveen.Gowda@windriver.com>, "Kokkonda, Sundeep"
	 <Sundeep.Kokkonda@windriver.com>
Date: Thu, 09 Feb 2023 08:58:48 +0000
In-Reply-To: <SJ1PR11MB6129BF5151577F93D523A6F4EBD99@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: 
	<SJ1PR11MB6129BF5151577F93D523A6F4EBD99@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 08:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176929

On Thu, 2023-02-09 at 06:38 +0000, Shinde, Yash wrote:
> I got the following error while logging in to qemu for Rust Oe-
> Selftest forx86 target:
>=20
> 2023-02-07 04:09:21,688 - oe-selftest - INFO - Traceback (most recent
> call last):
>=20
> =C2=A0 File "/ala-lpggp31/yshinde/rust-
> oe/poky/meta/lib/oeqa/selftest/cases/rust.py", line 29, in test_rust
> =C2=A0=C2=A0=C2=A0 ssh.copy_to(builddir + "/" + "build/x86_64-unknown-lin=
ux-
> gnu/stage1-tools-bin/remote-test-server","~/")
> =C2=A0 File "/ala-lpggp31/yshinde/rust-
> oe/poky/meta/lib/oeqa/utils/sshcontrol.py", line 156, in copy_to
> =C2=A0 =C2=A0=C2=A0return self._internal_run(command, ignore_status=3DFal=
se)
> =C2=A0 File "/ala-lpggp31/yshinde/rust-
> oe/poky/meta/lib/oeqa/utils/sshcontrol.py", line 132, in
> _internal_run
> =C2=A0=C2=A0=C2=A0 raise AssertionError("Command '%s' returned non-zero e=
xit status
> %d:\n%s" % (command, status, output))
> AssertionError: Command '['scp', '-o',
> 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-
> o', 'LogLevel=3DERROR', '/ala-lpggp31/yshinde/rust-oe/poky/build-
> st/tmp/work/core2-32-poky-linux/rust/1.67.0-r0/rustc-1.67.0-
> src/build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-
> server', 'root@192.168.7.2:~/']' returned non-zero exit status 1:
> b'ssh: connect to host 192.168.7.2 port 22: Connection
> refused\r\nlost connection'
>=20
> runqemu - INFO - Host uptime: 4269209.76
>=20
> Waiting at most 1000 seconds for login banner (02/07/23 04:06:35)
> Connection from 127.0.0.1:55320
> Reached login banner in 46.25083827972412 seconds (02/07/23 04:07:21,
> 1675771641.4426777)
> Couldn't login into serial console as root using blank password
>=20
> The output:
> Poky (Yocto Project Reference Distro) 4.1+snapshot-
> edb60ef6fd49764174d140ccae04fca65db131e0 qemux86 /dev/ttyS1
> qemux86 login: <<< run_serial(): command timed out after 120 seconds
> without output >>>
>=20
>=20
> The Rust Oe-selftest terminates after this and it happens only with
> the x86 target. Any particular reason for this behaviour? I have
> attachedoe-selftest-results (complete log file) of the Rust oe-
> selftest.=20
> While analysing, I found a topic related to this in oe-core-
> https://lists.openembedded.org/g/openembedded-core/topic/82536316
> What is the final conclusion or fix here? (I am a bit confused here.)
>=20
> The patch for Rust Oe-Selftest implementation can be found here:
> https://lists.openembedded.org/g/openembedded-core/topic/93454351
>=20
> Let me know if I am missing anything.

This failure could have many causes. To try and help narrow it down,
does another oe-selftest that uses runqemu work ok? That would tell us
if this is specific to the rust test or a more general issue since the
other tests are known to work for others.

I assume you're just running "oe-selftest -r rust" with no other tests
active?

It is unlikely to be debug-tweaks related since the connection is
refused, which means it never gets as far as trying to authenticate and
therefore likely isn't user/privilege related.

Cheers,

Richard








