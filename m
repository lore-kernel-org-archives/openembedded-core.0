Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 622E16012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:37:40 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id b1so4617513lbi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=0b3WiYmXoPYjmSfN58dvRzcgFX2w0eg69YZlcWMlYnY=;
	b=r7/Kae6nBdByveouZ7BrlbXZ+05F2y+YvFmSq8Cm28D5GeJW5bATt8s4kGyHvJV9nb
	lHWGMeZb8Fxi3NeqVnn4tpKwS0vJXjAx9stUnkNVOaQsiftmYYpSHmDfIK4B/UTcPbsB
	Iuh7hqmzn2BlUMqdO0xiN2quGdN12FEGLOSQHwv4B5wzoAhTIyjjahieOadRn4saJAXX
	W0PVdLucMw+l16yRR3qAPaw40xG6RgSLLGnGL7UlSTQ8W6g5dAAs2BPvEjFtF6BJzcZ1
	wcrgkq4hDlJJ85+rGdcHMKoKxKtiDM9O6zF69C0+DFNFa0n0Q0vxVjyVtqIoKUU8VAcg
	+lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=0b3WiYmXoPYjmSfN58dvRzcgFX2w0eg69YZlcWMlYnY=;
	b=aaKyek4+KIYWvuqQ5R2ZYsc1hFeNCYcv9OGE0mjSBeJhIdTpLph7335hlr/Q7jiDzE
	UtIDoWw9q1n3FvFCq5UJocuMazqL7cthDM3arnpeq4o6/z8UdrhAYvyamVAddmPwbQ0Z
	LttFzdQqfOzyZKsXVQOniHR7z6xuaMCPIK/zVukZerfRAprHFyIX7csQcXmo16wblh8K
	kX7YpGBS8oVRMJnvzIyz5a7BzbuGeNdaTr1ZY3UqHmQ0l7QtIxE3tuTp5PZprKJMqiuV
	LYenS36DrKQIcHNMIZ3d93kD7TaDA3txbrZ5W8WqoGDxekzp10hd6NW6Y7zB5+L3zqau
	jatg==
X-Gm-Message-State: AOPr4FW+xmCg8tsDUBHedf8YXj+kxNpcvLNHY+Q/jrRzJwEdTvMZT0iwfThVucvPwY3i/Q==
X-Received: by 10.112.73.72 with SMTP id j8mr3201389lbv.143.1461141460438;
	Wed, 20 Apr 2016 01:37:40 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	e185sm873238lfg.45.2016.04.20.01.37.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:37:39 -0700 (PDT)
Date: Wed, 20 Apr 2016 10:37:37 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160420083737.GD3520@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
	<571640FF.4040000@opendreambox.org> <57173D88.5040102@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <57173D88.5040102@iot.bzh>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Wed, 20 Apr 2016 08:37:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Just a comment on task ordering. Not sure that it really matters
though...

* Yannick GICQUEL <yannick.gicquel@iot.bzh> [160420 10:28]:
> Le 19/04/2016 16:30, Andreas Oberritter a =E9crit :
> >Hello Yannick,
> Hi Andreas,

> >On 19.04.2016 14:46, Yannick Gicquel wrote:
> >>+addtask assemble_dtb after do_deploy before do_install
> >The task do_deploy executes after do_install. Does it really work this
> >way? I think bitbake should try to detect this and error out.
> I confirm do_deploy is executed before do_install.
> It looks like it is schedule this way by the last line of the file:

> addtask deploy before do_build after do_compile

Well, if task do_deploy is scheduled before do_install, that's just by
luck.

The following line adds do_install:

addtask install after do_compile

Thus, the ordering between do_install and do_deploy isn't fixed. It
could be random, it could be based on alphabetical sorting, or the order
the tasks are added. However, it could easily change...

Cheers,
Anders

> (I attached the log.task_order for reference - FYI, behavior is the same =
on
> jethro or today's master branch)
--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

