Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5989B7457E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:02:14 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id l10-v6so1487177oii.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 03:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G7zeHm6sIDFpsBEye+esS9sftG5NdZ5mB1EPDGtcaY8=;
	b=XmQlTbq/KzfPWzH+PejcgfNf/yaCOqzVwngdozK4r+LIi8gow1Ry8DtgS0EJ0Iy4yY
	qomWGotSij8qOk6ePw4BqoRAQurtMKGh3W07iM2uQu2bptBIL9XK958aJfH7f2J9AJvG
	OCbYXaHHorMj+jvrKf9XwTKTU1tGULv7ETkom8NxgN2Una6CfO04WsivKt3zQTxttcpO
	JpqKtg3ccV2zyRoXQ4cCygCa6tvzNJEyPRMsNdINO5C/UNB6XFDUnOebUzV18VBy9Ve4
	KG4DmEeEs0yyvsOf9sNmAU2cmsy65+n9AQ0JELGrrWmCIfnLbFwQccI9EgyHn7KihSZf
	XK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G7zeHm6sIDFpsBEye+esS9sftG5NdZ5mB1EPDGtcaY8=;
	b=QlpDXlH8SgB5Fz/Y51Y1kObR8mq51D9TPwtsMYfryFlhSj7v6OdZtKC+2LXbWFb19+
	xVwDW10p8k732JwsDByRAntTHT72iZWg8orFRxSAhDj/uUiBc/ZvpyoXeiUWZ97U9VCW
	pDNz7jGYHly12jW1NCrNicgE1NCiPZE9HMg6gi9XubIzR82NYUlzideYM2cyd6dqZol5
	HTCo1tiO5DbheJ40o+0v3To5s0WhdVKd43oTJWA4ZjiB4CvecsxwXitM2hhZcdUtdhQV
	FRWe9Mv8tcWyhYHCHJyXKo4d+q2xWeWkfR+T6n6wTLr1uBgpz3uq357H2GVRmSQtNQuT
	4mqA==
X-Gm-Message-State: APt69E10tJpqMYZZ+6wMgk5g5j0mzU4oWUZtiTD2idBADmB/Qg8hwkpP
	RZ+qlRmF1VSs0tzpM+SvaDsvGCR+2f6/kFAAVz8jTg==
X-Google-Smtp-Source: AAOMgpev9Asczupl6hlTBNCD466e0MugTxogYgEt8wpYf2KKzTjZ6risC9CdC2mbkCGSI39SF3bPUwqsmCNeX2yvl2g=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr33413229oib.115.1531303335261; 
	Wed, 11 Jul 2018 03:02:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 03:01:54
	-0700 (PDT)
In-Reply-To: <b1371780446f2631111d6df7952720d721584fd3.1531287598.git.Qi.Chen@windriver.com>
References: <cover.1531287598.git.Qi.Chen@windriver.com>
	<b1371780446f2631111d6df7952720d721584fd3.1531287598.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2018 11:01:54 +0100
Message-ID: <CAJTo0LYEjefNuJzNfwn-8crekwcEK_04SsG=9oEaxXMwd2zyEw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] oeqa/runtime/cases/rpm.py: workaround race condition
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
X-List-Received-Date: Wed, 11 Jul 2018 10:02:15 -0000
Content-Type: text/plain; charset="UTF-8"

Can we integrate the systemd fix, instead of working around it?

Ross

On 11 July 2018 at 09:05, Chen Qi <Qi.Chen@windriver.com> wrote:
> With the recent change in new systemd version, it's possible that
> a user is deleted before stopping user-runtime-dir@xxx.service.
> See link below.
>
>   https://github.com/systemd/systemd/issues/9541
>
> Workaround this issue by delay for 1 second before deleting user.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
> index 1e5e463..2f9dcad 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -87,6 +87,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>              self.assertEqual(status, 0, msg=msg)
>
>          def unset_up_test_user(u):
> +            # Due to recent change in systemd, we need to sleep for a while
> +            # to avoid unexpected failure of user-runtime-dir@1000.service
> +            # See https://github.com/systemd/systemd/issues/9541
> +            if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
> +                self.target.run('sleep 1')
> +
>              status, output = self.target.run('userdel -r %s' % u)
>              msg = 'Failed to erase user: %s' % output
>              self.assertTrue(status == 0, msg=msg)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

