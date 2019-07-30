Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id 632B37F265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 14:46:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id q26so44949435lfc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=w099luuBFFObpBnNwGTR9rOiGEmnaOPx8+DKgPoPEkA=;
	b=lvHHBOcv0Qn9HbeuyNmEdik0U28B9geH6kK6CD1TsIL9KFok3UloRJUHMgKlbRGCj+
	fC3oXS35NCfROKwgBAxGLKw4wy/zkEju5LiBIsheEPchlOWD7WEW2K8alezYTAekZ4D9
	gRpT/R9Z2Qr59UCrhxyPPS6MsVU1Yen/dkOlF9OGYHzUOpM1X85co66g/+PmvVKjMG6m
	JTN8W2CEJ/5Z/y2c0VhFcquICGC0dH+qgcYPxQuaRbviHLqugjBVbIGOT1gcyAO9HAH1
	4NNP9W8D6MF1Tppkjh2R36vnR8c6/RBFrfP56/lj55x+Ox/lXcqpgAXYPLal9u6ZiDKX
	n3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=w099luuBFFObpBnNwGTR9rOiGEmnaOPx8+DKgPoPEkA=;
	b=GeTkXbb4Zm1O4EQatKpphZ9q6ldYZxeY7O1lTi5J79ezRH7evgq3EQa+i1w3ac/hjL
	QRmX9Ld80SJhSd7ObqIRTmeqYCbEQm0Qx3dwO3TC8fTSfeB29Wvl9SuVkofnj8Wi43uq
	E5rUWzsAXNpwMys1Ng6Vc32IXSgUGMbPDq4+2HQ176Xm5uF5w0N4KBlvxjuH97TBPrQB
	w7nG/3LFWq67KfNho7OrsP5BD2kTNcOGhQSFsgEvHfARc832DMJKHlZzkoT0lulTLKNb
	TYqSbNqTGN+vumVJDM4cfuh4j6Sd92sMhD/uCCfIQ7/V7XxWIX8zsS1DvvFxs4IC1HSY
	4rXw==
X-Gm-Message-State: APjAAAVMnJqJHL0zDFMxW384MkI7YOeWyj9SXYje3O44rkqFA/45pKK9
	y/MdSg4qGAdj4z1EDG/PzozbjUjE4Ku7Kc+dzM5UmQ==
X-Google-Smtp-Source: APXvYqxRbhny8bLatezLkpfn29BXWcOZIyXeosapu2oa7u5Jh0XbjNS9gin052O2rDFbBKJmpgdzbNruOBfLu5fyrUI=
X-Received: by 2002:ac2:43bb:: with SMTP id t27mr20415238lfl.187.1564497982765;
	Tue, 30 Jul 2019 07:46:22 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 30 Jul 2019 16:46:11 +0200
Message-ID: <CAP71WjyWeiJA+3ahU1cdDi5kh6qTVvTi7CCNo5qzOA9_ti2vCw@mail.gmail.com>
To: Yocto list discussion <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: LF Community Bridge Mentorship
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
X-List-Received-Date: Tue, 30 Jul 2019 14:46:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

The Community Bridge platform was launched earlier this year by the
Linux Foundation. It=E2=80=99s a set of services available to LF projects t=
o
help them build stronger ecosystems, and foster developers
relationship within their respective communities. See [1] and [2]. The
Yocto Project has joined the Community Bridge Funding and Mentorship
programs.

If you have any specific questions about these programs, please do not
hesitate to reach out to me.

Today, we would like to talk more about the mentorship program. We
have tried several initiatives in the past about interns and
mentorship, and we would like to do that again using the new LF
platform. A mentorship program for the Yocto Project is a good
opportunity for our overall community to reach out to new developers,
improve our developers diversity. It will help increase the pool of
available developers with appropriate skills about the Yocto Project
and Open Embedded technologies and as a consequence create a more
sustainable ecosystem around the Yocto Project. It also offers
existing senior developers the chance to become mentors, and share
their knowledge!

We would like to request feedback about how to best define the Yocto
Project Mentorship program.

The structure of the mentorship is flexible and we can adjust as
needed. Our initial thought is to set 12-week project, which is what
the Linux Kernel Mentorship program is using, see [4]. The overall
process involves:

1. Finding / defining work items for potential mentees.
2. Get appropriate funding for mentees=E2=80=99 stipends
3. Recruit mentors within our community
4. Review and select mentees=E2=80=99 applications

There has already been some work on the potential work items in the
form of the newcomer bugs, some of which could be turned into work
suitable for a mentorship programme.

=3D=3D=3D Call for ACTION =3D=3D=3D

* We need your help for any of the items above, and especially #1 to
get started. Whether you are a long time contributor to the project or
you recently joined our mailing list, your feedback will be greatly
appreciated.
* If you are interested to participate as a mentor, please let me know!
* You don=E2=80=99t need to be a project expert to be a mentor, you need to
know how the project works and be willing to help guide someone
through their task.

There is no specific timeline set yet, it will most likely depend on
how much feedback we receive about this initiative, but most likely
the internships will have to be tied to the Yocto Project release
timeline.

If you have any questions or any suggestions, please reach out to me!
cheers,
Nico

[1] https://www.linuxfoundation.org/press-release/2019/03/the-linux-foundat=
ion-launches-new-communitybridge-platform-to-help-sustain-open-source-commu=
nities/
[2] https://communitybridge.org/
[3] https://people.communitybridge.org/
[4] https://wiki.linuxfoundation.org/lkmp

