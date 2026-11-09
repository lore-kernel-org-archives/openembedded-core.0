Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2685.1794216096539435244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 01:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VEuseRII;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6767d92cde6so606275d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 01:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216095; cv=none;
        d=google.com; s=arc-20260327;
        b=Nt4xcxJIndN6bUJ+U+ZWoJkKh5dgj5EimJJhd87ZOAPoagJC+cvZnW0MU+ZB11J2kO
         65FdECtlWlDHLq81iDPT3Zui/2EJvK0YCKiafnZoNjVtEW2T8aQYy2vYsetXWC4cW5Y5
         6iETegoP+aPSjNEVUdZMJc5+6vSfgqjrwl5sugkYgWHeweLjS/DdLNwXHTIpJemGCAjR
         mWPvPWJAfX3dqdVwUSyQlldhDDTOD3bQQ6o1X24PnC+X0S9MCpXTcNivqXckxKIzxgub
         4EcWuNFgGr+tGyVeAmFddyog3ftWJOpd6Z5hXrOtp5fwitGfgMmbi7eVymSN8zfmB3AO
         4SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BnCztSGgEkhMP2ILcMg9rpNnEhbGw3Uu4JSbL6L9ScA=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=KMNBJXVmLrUxE+LPD442cIVc+EMrjKk3LjpcRpD5UPIn+vtr0AbOQIsQ9b4zFL/+nZ
         XWuEEaNuehTB8gd9E+dr+HedJe2fdljmv1DiL+Rr1QZ9OT4mKdxLqE5SQ0Q3GsXA7yNg
         v1tnJaOropzDvp4N8fGRlr9a6hQ9gkM0DTYU0ToeLIMqD9xWOEYaBR6iLQAuolxVZulr
         x5x9QyD7yYW24v19spYf+EPTbRRJcPHCua3h7b00MUqKQWwqzo73oDMjKFXcw2YJCTZl
         OwLdjB9Kgb9NTYP/aRoy7pOpqBADKA0XMLRnd/JIQf1Id1NbkECe2ZSXRb1rWtyssVZz
         sHGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216095; x=1794820895; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BnCztSGgEkhMP2ILcMg9rpNnEhbGw3Uu4JSbL6L9ScA=;
        b=VEuseRIICSkJbocxM1lL0APc3Uj/RiY73kyUDWLWryOCOb3bQ7fqwJdnleUXgPuQsl
         q0owlp3QBORN17I5M3dHlBb0fXQaoXvA2O3aNuoHUMPv5g9ZvgmZyn8++13ZTe0I0A/h
         jab67P46JoJkNMbqQrtBRQz0f0Eay1ecQaNZtDapfHmusG4LYke2weSZO4znH+32i8A3
         r0sWZTxCvwI7Qp/edozYYOKuTEmL1aSYFFpx4Tm0MQzNhWtTG9768oGtXH0nUOV1C7ZV
         h8lT1rs8MoHBz2+ZsSFiaxlpE7Bnekx8/TV4GuMy8j6YubGr1rqQRWI6UBeXl8IcA3zz
         0fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216095; x=1794820895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnCztSGgEkhMP2ILcMg9rpNnEhbGw3Uu4JSbL6L9ScA=;
        b=sFrokyZgtGOl1TQeZQ6dO1RQLWiAsz1DgmMhUcOBS1La74GFGHB5fZldX41TF4UrK6
         UhsVGFM6vwDBlWy0u3ajbm6k4qJvnhnGuRyrPEI7fcm2r1hL4noaskQ4D1rAMHc0wLV/
         tT7khNk9N4XFJ6RNiEB66kg1LfiBG5rrLgfsKAto/qW9M6hPgIxA9x3YbeDwS7YMcF1W
         p3TBL+pj5Kj6C2nEycCQQcpt8mxQz9oTcepR191PXDL/F28b7ig+pyD2DLXadlyhX2+k
         Y5WzVJxaZxMVt2Fh7kpBTxq2Rw49ci+JQmVjoEkO+lneDlB6oewS6o3COt0flQV+tUnQ
         bWkQ==
X-Gm-Message-State: APuU4Z+LLxUGIeE94idf46F8LM/Vtbz3aby9kPHJ/6dKKDJek8HbEJLm
	6yGDLljuCEQ219zseBQv7xg9otf48CCMxhRYRZIQx/C3P+ZfoFv3prWjUbwQY9tatF85wIiCAJU
	5n8hohrjYuZbbhT9bcffSELaOLG1JOTZUhg==
X-Gm-Gg: AYBFou3lBfhcpdaKnPiJBnVYad4fvqykbfZvwu/O2tGDI+5LjMpI+Ij94ViioUeyQ3R
	pLzOucIoU35Rs4GYtWAeERDc13wDwWQ3sZVeQHelolX7QF8W5KBK5SSl421P7Os3BPdsbNLwDDC
	YjQ/BbbNnw2eDRUqYmez9a0mjSXiTyA6v+V6yFEJ9N9W8XgIijYfmP0YuBRwQnIYyIWNoreot1/
	KtRqywirtxCevngTKBJN6836L09DXYhJm0JHuROf60j5QGOZB16y2xm61W6Tc/szNLNzM57xZTf
	+cy6jv77LCKHNO0C+yS2EtgIRg3xyiciHpOMukqWorLSd1zUwvbCyMF3wgzdaTNoOkCxdFppQ8x
	LoXTu3qUI0fR/Lx0nsdjRtNJUKjHgIk+c2A2MxZ+B1I1HF9DRJTD+cixTHtwpYQzx/h64PZXLU9
	cnv5FlRHzlx/c=
X-Received: by 2002:a05:690e:1306:b0:679:a5fc:2f13 with SMTP id
 956f58d0204a3-67c3d7e7d78mr1987925d50.1.1794216095565; Mon, 09 Nov 2026
 01:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20261107154308.1110237-2-alex.kiernan@gmail.com> <DMPT3P3ALIT3.2L2FH1MY83IWG@bootlin.com>
In-Reply-To: <DMPT3P3ALIT3.2L2FH1MY83IWG@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 9 Nov 2026 09:21:24 +0000
X-Gm-Features: AclHuK_mBlrR-Lq7keC4mVyhknD0xbwaV_Y6UPHWniQQ5qnNTNtmoCLLBbJlcwI
Message-ID: <CAO5Uq5RSJeUfXw7-526aN4dsKfg7nzkTCTa-6_9cZWcbY=xqLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] eudev: upgrade 3.2.15 -> 3.3.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 09:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249798

On Sun, Nov 8, 2026 at 11:52=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sat Nov 7, 2026 at 4:43 PM CET, Alex Kiernan via openembedded-core wro=
te:
> > Release notes:
> >
> >   https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
> >
> > Drop 0001-udevd-keep-a-copy-of-the-event-devnode.patch, fixed
> > differently upstream.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
>
> Hi Alex,
>
> It looks like the test_devtool_deploy_target test is failing. It might
> be just a need to increase the roofs size, but I'm still a bit surprised
> by that.
>
> 2026-11-07 21:07:55,632 - oe-selftest - INFO - devtool.DevtoolDeployTarge=
tTests.test_devtool_deploy_target (subunit.RemotedTestCase)
> 2026-11-07 21:07:55,633 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-11-07 21:07:55,633 - oe-selftest - INFO - 9: 34/75 294/793 (208.99s)=
 (0 failed) (devtool.DevtoolDeployTargetTests.test_devtool_deploy_target)
> 2026-11-07 21:07:55,633 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2139, in test_d=
evtool_deploy_target
>     _deploy_and_check(extra_args, check_full_filelist=3Dnot filter_args, =
expected_files=3Dexpected_files)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2055, in _deplo=
y_and_check
>     result =3D runCmd(deploy_cmd)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'devtool deploy-target -c mdadm root@192.168.7.2 =
' returned non-zero exit status 1:
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 2105 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 1044 .bb files complete (1043 cached, 1 parsed). 2105 targets,=
 56 skipped, 0 masked, 0 errors.
> ERROR: insufficient space on target (available 4476, needed 5449)
> ERROR: Deploy failed - rerun with -s to get a complete error message
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5222
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5032
>
> Can you have a look at the issue?
>

Looks like it's mostly from renaming so that hwdb now goes in lib not
etc. which meant the base package exploded... but running through the
NEWS.md in detail, there's more bits to pick up, so I'm just rerunning
a bunch of the tests to check what I've got looks reasonable.

--=20
Alex Kiernan
